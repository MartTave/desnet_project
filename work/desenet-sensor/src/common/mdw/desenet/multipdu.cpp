#include "multipdu.h"
#include <cstring>

using namespace desenet;

MultiPdu::MultiPdu() : Frame(Frame::Mtu)
{
    // Set destination to Gateway
    setDestination(GATEWAY_ADDRESS);

    // Set type MPDU (sets bit 7 of byte 5)
    setType(FrameType::MPDU);
    // Ensure the byte 5 (MPDU header - Type) is just the type bit (0x80) - Node ID will be OR'd in later
    buffer()[HEADER_SIZE] = 0x80;

    // Initialize byte 6 (MPDU header - Count) to 0
    buffer()[HEADER_SIZE + 1] = 0;

    // Length covers the Frame header (5) + MPDU header (2 bytes: Type + Count)
    setLength(HEADER_SIZE + 2);
}

void MultiPdu::setNodeId(uint8_t id)
{
    buffer()[HEADER_SIZE] = 0x80 | (id & 0x7F);
}

void MultiPdu::commitPdu(size_t length)
{
    setLength(this->length() + length);
}

uint8_t* MultiPdu::pduBuffer()
{
    return buffer() + length();
}

size_t MultiPdu::remainingLength() const
{
    return reservedLength() - length();
}

uint8_t MultiPdu::ePduCount() const
{
    return buffer()[HEADER_SIZE + 1];
}

void MultiPdu::incrementePduCount()
{
    buffer()[HEADER_SIZE + 1]++;
}

bool MultiPdu::addEvent(EvId id, const SharedByteBuffer & data)
{
    // Check space: 1 byte header + data length
    if (remainingLength() < (1 + data.length()))
    {
        return false;
    }

    uint8_t* pHeader = pduBuffer();

    // Copy data
    memcpy(pHeader + 1, data.data(), data.length());

    // Construct ePDU header: [ Event ID (5 bits) | Length (3 bits) ]
    // Using 5th bit (0x10) to distinguish Events from SV groups.
    uint8_t groupField = static_cast<uint8_t>(id) | 0x10;
    *pHeader = (groupField << 3) | (static_cast<uint8_t>(data.length()) & 0x07);

    commitPdu(1 + data.length());
    incrementePduCount();

    return true;
}

SharedByteBuffer MultiPdu::getBufferForSv()
{
    // Ensure space for at least header (1 byte)
    if (remainingLength() < 1)
    {
        return SharedByteBuffer::proxy(static_cast<uint8_t*>(nullptr), 0);
    }
    
    // Return proxy skipping the header byte
    return SharedByteBuffer::proxy(pduBuffer() + 1, remainingLength() - 1);
}

bool MultiPdu::commitSv(SvGroup group, size_t length)
{
    if (length == 0)
    {
        return false; 
    }

    // Construct ePDU header: [ Group (5 bits) | Length (3 bits) ]
    uint8_t* pHeader = pduBuffer();
    *pHeader = (static_cast<uint8_t>(group) << 3) | (static_cast<uint8_t>(length) & 0x07);

    commitPdu(1 + length); // Commit header + data
    incrementePduCount();
    
    return true;
}