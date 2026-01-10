#include <assert.h>
#include <array>
#include <list>
#include <map>
#include <vector>
#include <utility>
#include "platform-config.h"
#include "board/ledcontroller.h"
#include "desenet/frame.h"
#include "desenet/beacon.h"
#include "desenet/multipdu.h"
#include "desenet/timeslotmanager.h"
#include "abstractapplication.h"
#include "networkentity.h"
#include "trace/trace.h"

using std::array;
using std::list;
using std::map;
using std::make_pair;
using std::bind;
using std::pair;
using std::vector;

using desenet::sensor::NetworkEntity;

NetworkEntity * NetworkEntity::_pInstance(nullptr);		// Instantiation of static attribute

NetworkEntity::NetworkEntity()
 : _pTimeSlotManager(nullptr),
   _pTransceiver(nullptr)
{
	assert(!_pInstance);		// Only one instance allowed
	_pInstance = this;
    _publishers.fill(nullptr);
}

NetworkEntity::~NetworkEntity()
{
}

void NetworkEntity::initialize()
{
}

void NetworkEntity::initializeRelations(ITimeSlotManager & timeSlotManager, NetworkInterfaceDriver & transceiver)
{
	_pTimeSlotManager = &timeSlotManager;
    _pTransceiver = &transceiver;

    // Register observer
    _pTimeSlotManager->initializeRelations(*this);

     // Set the receive callback between transceiver and network. Bind this pointer to member function
    transceiver.setReceptionHandler(std::bind(&NetworkEntity::onReceive, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3, std::placeholders::_4));
}

/**
 * This method does not automatically create an instance if there is none created so far.
 * It is up the the developer to create an instance of this class prior to access the instance() method.
 */
//static
NetworkEntity & NetworkEntity::instance()
{
	assert(_pInstance);
    return *_pInstance;
}

SlotNumber NetworkEntity::slotNumber() const
{
    return timeSlotManager().slotNumber();
}

/**
 * Called by the NetworkInterfaceDriver (layer below) after reception of a new frame
 */
void NetworkEntity::onReceive(NetworkInterfaceDriver & driver, const uint32_t receptionTime, const uint8_t * const buffer, size_t length)
{
    (void)(driver);
    (void)(receptionTime);
	Frame frame = Frame::useBuffer(buffer, length);

    if (frame.type() == FrameType::Beacon)
    {
        Beacon beacon(frame);

        // Notify TimeSlotManager
        timeSlotManager().onBeaconReceived(beacon.slotDuration());

        // Store mask
        _svGroupMask = beacon.svGroupMask();

        // Notify applications
        for (auto app : _syncList)
        {
            app->svSyncIndication(beacon.networkTime());
        }
    }
}

void NetworkEntity::onTimeSlotSignal(const ITimeSlotManager & timeSlotManager, const ITimeSlotManager::SIG & signal)
{
    (void)(timeSlotManager);

    if (signal == ITimeSlotManager::SIG::OWN_SLOT_START)
    {
        MultiPdu mpdu;
        mpdu.setNodeId(slotNumber());

        // Iterate publishers
        for (size_t i = 0; i < _publishers.size(); ++i)
        {
            if (_publishers[i])
            {
                if (_svGroupMask.test(i))
                {
                    // Ensure space for header + data (at least 1 byte header)
                    if (mpdu.remainingLength() < 1) break;

                    uint8_t* pHeader = mpdu.pduBuffer();

                    // Create proxy buffer for remaining space, skipping the header byte
                    SharedByteBuffer buffer = SharedByteBuffer::proxy(pHeader + 1, mpdu.remainingLength() - 1);

                    size_t written = _publishers[i]->svPublishIndication(static_cast<SvGroup>(i), buffer);
                    if (written > 0)
                    {
                        // Construct ePDU header: [ Group (5 bits) | Length (3 bits) ]
                        *pHeader = (static_cast<uint8_t>(i) << 3) | (static_cast<uint8_t>(written) & 0x07);
                        Trace::outln("Writing ePDU: Group %d, Len %d, Header %x", i, written, *pHeader);

                        mpdu.commitPdu(1 + written); // Commit header + data
                        mpdu.incrementePduCount();
                    }
                }
                else
                {
                    Trace::outln("NetworkEntity: Group %d skipped (not in mask)", i);
                }
            }
        }

        // Iterate events
        auto it = _events.begin();
        while (it != _events.end())
        {
             // Check space: 1 byte header + data length
             if (mpdu.remainingLength() < (1 + it->data.length())) break; // No more space

             uint8_t* pHeader = mpdu.pduBuffer();

             // Copy data
             memcpy(pHeader + 1, it->data.data(), it->data.length());

             // Construct ePDU header: [ Event ID (5 bits) | Length (3 bits) ]
             // Using 5th bit (0x10) to distinguish Events from SV groups.
             uint8_t groupField = static_cast<uint8_t>(it->id) | 0x10;
             *pHeader = (groupField << 3) | (static_cast<uint8_t>(it->data.length()) & 0x07);

             Trace::outln("Writing Event ePDU: Id %d, Len %d, Header %x", it->id, it->data.length(), *pHeader);

             mpdu.commitPdu(1 + it->data.length());
             mpdu.incrementePduCount();

             it = _events.erase(it);
        }

        if (mpdu.ePduCount() > 0)
        {
            transceiver() << mpdu;
        }
    }
}

void NetworkEntity::svSyncRequest(AbstractApplication * app)
{
    _syncList.push_back(app);
}

bool NetworkEntity::svPublishRequest(AbstractApplication * app, SvGroup group)
{
    if (group < _publishers.size() && _publishers[group] == nullptr)
    {
        _publishers[group] = app;
        return true;
    }
    return false;
}

void NetworkEntity::evPublishRequest(EvId id, const SharedByteBuffer & evData)
{
    _events.emplace_back(id, evData);
}

board::LedController & NetworkEntity::ledController() const
{
    return board::LedController::instance();
}
