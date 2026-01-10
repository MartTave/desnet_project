#include "joystickapplication.h"
#include "board/factory.h"
#include "trace/trace.h"

namespace app {

JoystickApplication::JoystickApplication()
{
}

JoystickApplication::~JoystickApplication()
{
}

void JoystickApplication::initialize()
{
    Trace::outln("JoystickApplication::initialize");
    // Joystick is initialized in board::Factory::initialize()
    
    if (joystick().setObserver(this))
    {
        Trace::outln("Joystick observer set");
    }
    else
    {
        Trace::outln("Error: Failed to set joystick observer!");
    }
}

void JoystickApplication::start()
{
    Trace::outln("JoystickApplication::start");
    startBehavior();    // Start XF state machine
    joystick().start(); // Start joystick state machine
}

EventStatus JoystickApplication::processEvent()
{
    if (getCurrentEvent()->getEventType() == IXFEvent::Event &&
        getCurrentEvent()->getId() == EV_POSITION)
    {
        evPosition * pEvent = static_cast<evPosition *>(getCurrentEvent());
        
        Trace::outln("JoystickApplication::processEvent: EV_POSITION");

        // Publish event to network
        // EVID_JOYSTICK is defined in platform-config.h (included via header)
        evPublishRequest(EVID_JOYSTICK, pEvent->actualPosition);
        
        return EventStatus::Consumed;
    }

    return EventStatus::Unknown;
}

void JoystickApplication::onPositionChange(IJoystick::Position position)
{
    Trace::outln("JoystickApplication::onPositionChange pos: %02X", position.position);
    // Create and push event to state machine
    GEN(evPosition(position));
}

board::Joystick & JoystickApplication::joystick() const
{
    return board::Factory::joystick();
}

} // namespace app
