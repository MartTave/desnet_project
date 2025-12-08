#ifndef DESENET_MULTIPDU_H
#define DESENET_MULTIPDU_H

#include "frame.h"

namespace desenet {

/**
 * @brief Frame for sending multiple PDUs (Sampled Values).
 */
class MultiPdu : public Frame
{
public:
    static const uint8_t HEADER_SIZE = Frame::HEADER_SIZE;

    MultiPdu() : Frame(Frame::Mtu)
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

    /**
     * @brief Sets the Node ID in the MPDU header (7 bits).
     */
    void setNodeId(uint8_t id)
    {
        buffer()[HEADER_SIZE] = 0x80 | (id & 0x7F);
    }

    /**
     * @brief Commits a PDU of the given length to the frame.
     *        Updates the frame length.
     */
    void commitPdu(size_t length)
    {
        setLength(this->length() + length);
    }

    /**
     * @brief Returns a pointer to the start of the payload area for the next PDU.
     */
    uint8_t* pduBuffer()
    {
        return buffer() + length();
    }

    /**
     * @brief Returns the remaining space in the frame buffer.
     */
    size_t remainingLength() const
    {
        return reservedLength() - length();
    }

    /**
     * @brief Returns the number of embedded PDUs.
     */
    uint8_t ePduCount() const
    {
        return buffer()[HEADER_SIZE + 1];
    }

    /**
     * @brief Increments the number of embedded PDUs.
     */
    void incrementePduCount()
    {
        buffer()[HEADER_SIZE + 1]++;
    }
};

} // namespace desenet

#endif // DESENET_MULTIPDU_H
