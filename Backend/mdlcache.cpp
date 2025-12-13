#include "mdlcache.h"

MdlCache *MdlCache::instance()
{
    static MdlCache self;
    return &self;
}

MdlCache::~MdlCache()
{
    destroyCache();
}

