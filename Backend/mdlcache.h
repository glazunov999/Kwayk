#ifndef MDLCACHE_H
#define MDLCACHE_H

#include <QObject>
#include <QUrl>
#include <QHash>

class MdlData;

class MdlCache : public QObject
{
    Q_OBJECT

public:
    static MdlCache *instance();
    ~MdlCache() override;

private:
    MdlCache() = default;
    Q_DISABLE_COPY(MdlCache)

private:
    void destroyCache(); // implemened in mdl.cpp

    QHash<QUrl, MdlData *> m_cache;

    friend class Mdl;
    friend class MdlData;
};

#endif // MDLCACHE_H
