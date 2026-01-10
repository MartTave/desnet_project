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

    /**
     * @brief Adds an event to the MPDU.
     * 
     * @param id The event ID.
     * @param data The event data.
     * @return True if the event was added, false if there was not enough space.
     */
    bool addEvent(EvId id, const SharedByteBuffer & data);

    /**
     * @brief Returns a buffer that can be used to write a Sampled Value (SV).
     * 
     * The buffer points to the payload area where the SV data should be written.
     * The size of the buffer is the remaining space in the MPDU minus the header byte.
     * 
     * @return A SharedByteBuffer proxy to the writable area.
     */
    SharedByteBuffer getBufferForSv();

    /**
     * @brief Commits a Sampled Value (SV) that has been written to the buffer provided by `getBufferForSv`.
     * 
     * @param group The SV group.
     * @param length The length of the data written.
     * @return True if the SV was committed, false if the length was invalid.
     */
    bool commitSv(SvGroup group, size_t length);
};

} // namespace desenet

#endif // DESENET_MULTIPDU_H