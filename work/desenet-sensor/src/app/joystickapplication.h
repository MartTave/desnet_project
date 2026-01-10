#ifndef JOYSTICKAPPLICATION_H
#define JOYSTICKAPPLICATION_H

#include "platform-config.h"
#include "xf/xfreactive.h"
#include "xf/xfevent.h"
#include "desenet/sensor/abstractapplication.h"
#include "board/interfaces/ijoystickobserver.h"

// Forward declaration of class(es) in namespace board
namespace board {
    class Joystick;
}

namespace app
{

class JoystickApplication : public XFReactive,
                            public desenet::sensor::AbstractApplication,
                            public IJoystickObserver
{
public:
    JoystickApplication();
    virtual ~JoystickApplication();

    void initialize();
    void start();

    // XFReactive implementation
protected:
    EventStatus processEvent() override;

    typedef enum
    {
        EV_UNKNOWN = 0x00,
        EV_POSITION = 0xBB
    } evIds;

    class evPosition : public XFEvent
    {
    public:
        evPosition(IJoystick::Position position) :
            XFEvent(EV_POSITION),
            actualPosition(1)
        {
            memcpy(actualPosition.data(), &position, 1);
        }

        SharedByteBuffer actualPosition;
    };

    // IJoystickObserver implementation
protected:
    void onPositionChange(IJoystick::Position position) override;

protected:
    board::Joystick & joystick() const;
};

} // namespace app
#endif // JOYSTICKAPPLICATION_H
