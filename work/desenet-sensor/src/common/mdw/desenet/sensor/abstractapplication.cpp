#include "desenet/sensor/net.h"
#include "abstractapplication.h"

using desenet::sensor::AbstractApplication;

void AbstractApplication::svSyncRequest()
{
    NetworkEntity::instance().svSyncRequest(this);
}

bool AbstractApplication::svPublishRequest(SvGroup group)
{
    return NetworkEntity::instance().svPublishRequest(this, group);
}

void AbstractApplication::evPublishRequest(EvId id, const SharedByteBuffer & evData)
{
    NetworkEntity::instance().evPublishRequest(id, evData);
}

/**
 * Default callback method for syncs
 */
void AbstractApplication::svSyncIndication(desenet::NetworkTime)
{
}

/**
 * Default callback method for SV publishes
 */
SharedByteBuffer::sizeType AbstractApplication::svPublishIndication(SvGroup, SharedByteBuffer &)
{
	return 0;
}
