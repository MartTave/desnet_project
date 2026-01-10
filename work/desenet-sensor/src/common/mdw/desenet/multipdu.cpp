#include "multipdu.h"

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
