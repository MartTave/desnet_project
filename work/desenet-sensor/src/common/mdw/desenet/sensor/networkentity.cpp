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
  Trace::outln("Beacon received !");
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
                    // Get buffer for SV
                    SharedByteBuffer buffer = mpdu.getBufferForSv();

                    if (buffer.length() == 0) break; // No space left

                    size_t written = _publishers[i]->svPublishIndication(static_cast<SvGroup>(i), buffer);
                    if (written > 0)
                    {
                        if (mpdu.commitSv(static_cast<SvGroup>(i), written))
                        {
                            Trace::outln("Writing ePDU: Group %d, Len %d", i, written);
                        }
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
             if (mpdu.addEvent(it->id, it->data))
             {
                 Trace::outln("Writing Event ePDU: Id %d, Len %d", it->id, it->data.length());
                 it = _events.erase(it);
             }
             else
             {
                 break; // No more space
             }
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
