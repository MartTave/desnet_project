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

    MultiPdu();

    /**
     * @brief Sets the Node ID in the MPDU header (7 bits).
     */
    void setNodeId(uint8_t id);

    /**
     * @brief Commits a PDU of the given length to the frame.
     *        Updates the frame length.
     */
    void commitPdu(size_t length);

    /**
     * @brief Returns a pointer to the start of the payload area for the next PDU.
     */
    uint8_t* pduBuffer();

    /**
     * @brief Returns the remaining space in the frame buffer.
     */
    size_t remainingLength() const;

    /**
     * @brief Returns the number of embedded PDUs.
     */
    uint8_t ePduCount() const;

    /**
     * @brief Increments the number of embedded PDUs.
     */
    void incrementePduCount();
};

} // namespace desenet

#endif // DESENET_MULTIPDU_H