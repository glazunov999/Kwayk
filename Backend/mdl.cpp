#include <QQmlContext>
#include <QQmlFile>
#include <QFile>
#include <QMatrix4x4>
#include <QDebug>

#include "mdl.h"
#include "mdlcache.h"

const float avNormals[162][3] = {
    { -0.525731f,  0.000000f,  0.850651f },
    { -0.442863f,  0.238856f,  0.864188f },
    { -0.295242f,  0.000000f,  0.955423f },
    { -0.309017f,  0.500000f,  0.809017f },
    { -0.162460f,  0.262866f,  0.951056f },
    {  0.000000f,  0.000000f,  1.000000f },
    {  0.000000f,  0.850651f,  0.525731f },
    { -0.147621f,  0.716567f,  0.681718f },
    {  0.147621f,  0.716567f,  0.681718f },
    {  0.000000f,  0.525731f,  0.850651f },
    {  0.309017f,  0.500000f,  0.809017f },
    {  0.525731f,  0.000000f,  0.850651f },
    {  0.295242f,  0.000000f,  0.955423f },
    {  0.442863f,  0.238856f,  0.864188f },
    {  0.162460f,  0.262866f,  0.951056f },
    { -0.681718f,  0.147621f,  0.716567f },
    { -0.809017f,  0.309017f,  0.500000f },
    { -0.587785f,  0.425325f,  0.688191f },
    { -0.850651f,  0.525731f,  0.000000f },
    { -0.864188f,  0.442863f,  0.238856f },
    { -0.716567f,  0.681718f,  0.147621f },
    { -0.688191f,  0.587785f,  0.425325f },
    { -0.500000f,  0.809017f,  0.309017f },
    { -0.238856f,  0.864188f,  0.442863f },
    { -0.425325f,  0.688191f,  0.587785f },
    { -0.716567f,  0.681718f, -0.147621f },
    { -0.500000f,  0.809017f, -0.309017f },
    { -0.525731f,  0.850651f,  0.000000f },
    {  0.000000f,  0.850651f, -0.525731f },
    { -0.238856f,  0.864188f, -0.442863f },
    {  0.000000f,  0.955423f, -0.295242f },
    { -0.262866f,  0.951056f, -0.162460f },
    {  0.000000f,  1.000000f,  0.000000f },
    {  0.000000f,  0.955423f,  0.295242f },
    { -0.262866f,  0.951056f,  0.162460f },
    {  0.238856f,  0.864188f,  0.442863f },
    {  0.262866f,  0.951056f,  0.162460f },
    {  0.500000f,  0.809017f,  0.309017f },
    {  0.238856f,  0.864188f, -0.442863f },
    {  0.262866f,  0.951056f, -0.162460f },
    {  0.500000f,  0.809017f, -0.309017f },
    {  0.850651f,  0.525731f,  0.000000f },
    {  0.716567f,  0.681718f,  0.147621f },
    {  0.716567f,  0.681718f, -0.147621f },
    {  0.525731f,  0.850651f,  0.000000f },
    {  0.425325f,  0.688191f,  0.587785f },
    {  0.864188f,  0.442863f,  0.238856f },
    {  0.688191f,  0.587785f,  0.425325f },
    {  0.809017f,  0.309017f,  0.500000f },
    {  0.681718f,  0.147621f,  0.716567f },
    {  0.587785f,  0.425325f,  0.688191f },
    {  0.955423f,  0.295242f,  0.000000f },
    {  1.000000f,  0.000000f,  0.000000f },
    {  0.951056f,  0.162460f,  0.262866f },
    {  0.850651f, -0.525731f,  0.000000f },
    {  0.955423f, -0.295242f,  0.000000f },
    {  0.864188f, -0.442863f,  0.238856f },
    {  0.951056f, -0.162460f,  0.262866f },
    {  0.809017f, -0.309017f,  0.500000f },
    {  0.681718f, -0.147621f,  0.716567f },
    {  0.850651f,  0.000000f,  0.525731f },
    {  0.864188f,  0.442863f, -0.238856f },
    {  0.809017f,  0.309017f, -0.500000f },
    {  0.951056f,  0.162460f, -0.262866f },
    {  0.525731f,  0.000000f, -0.850651f },
    {  0.681718f,  0.147621f, -0.716567f },
    {  0.681718f, -0.147621f, -0.716567f },
    {  0.850651f,  0.000000f, -0.525731f },
    {  0.809017f, -0.309017f, -0.500000f },
    {  0.864188f, -0.442863f, -0.238856f },
    {  0.951056f, -0.162460f, -0.262866f },
    {  0.147621f,  0.716567f, -0.681718f },
    {  0.309017f,  0.500000f, -0.809017f },
    {  0.425325f,  0.688191f, -0.587785f },
    {  0.442863f,  0.238856f, -0.864188f },
    {  0.587785f,  0.425325f, -0.688191f },
    {  0.688191f,  0.587785f, -0.425325f },
    { -0.147621f,  0.716567f, -0.681718f },
    { -0.309017f,  0.500000f, -0.809017f },
    {  0.000000f,  0.525731f, -0.850651f },
    { -0.525731f,  0.000000f, -0.850651f },
    { -0.442863f,  0.238856f, -0.864188f },
    { -0.295242f,  0.000000f, -0.955423f },
    { -0.162460f,  0.262866f, -0.951056f },
    {  0.000000f,  0.000000f, -1.000000f },
    {  0.295242f,  0.000000f, -0.955423f },
    {  0.162460f,  0.262866f, -0.951056f },
    { -0.442863f, -0.238856f, -0.864188f },
    { -0.309017f, -0.500000f, -0.809017f },
    { -0.162460f, -0.262866f, -0.951056f },
    {  0.000000f, -0.850651f, -0.525731f },
    { -0.147621f, -0.716567f, -0.681718f },
    {  0.147621f, -0.716567f, -0.681718f },
    {  0.000000f, -0.525731f, -0.850651f },
    {  0.309017f, -0.500000f, -0.809017f },
    {  0.442863f, -0.238856f, -0.864188f },
    {  0.162460f, -0.262866f, -0.951056f },
    {  0.238856f, -0.864188f, -0.442863f },
    {  0.500000f, -0.809017f, -0.309017f },
    {  0.425325f, -0.688191f, -0.587785f },
    {  0.716567f, -0.681718f, -0.147621f },
    {  0.688191f, -0.587785f, -0.425325f },
    {  0.587785f, -0.425325f, -0.688191f },
    {  0.000000f, -0.955423f, -0.295242f },
    {  0.000000f, -1.000000f,  0.000000f },
    {  0.262866f, -0.951056f, -0.162460f },
    {  0.000000f, -0.850651f,  0.525731f },
    {  0.000000f, -0.955423f,  0.295242f },
    {  0.238856f, -0.864188f,  0.442863f },
    {  0.262866f, -0.951056f,  0.162460f },
    {  0.500000f, -0.809017f,  0.309017f },
    {  0.716567f, -0.681718f,  0.147621f },
    {  0.525731f, -0.850651f,  0.000000f },
    { -0.238856f, -0.864188f, -0.442863f },
    { -0.500000f, -0.809017f, -0.309017f },
    { -0.262866f, -0.951056f, -0.162460f },
    { -0.850651f, -0.525731f,  0.000000f },
    { -0.716567f, -0.681718f, -0.147621f },
    { -0.716567f, -0.681718f,  0.147621f },
    { -0.525731f, -0.850651f,  0.000000f },
    { -0.500000f, -0.809017f,  0.309017f },
    { -0.238856f, -0.864188f,  0.442863f },
    { -0.262866f, -0.951056f,  0.162460f },
    { -0.864188f, -0.442863f,  0.238856f },
    { -0.809017f, -0.309017f,  0.500000f },
    { -0.688191f, -0.587785f,  0.425325f },
    { -0.681718f, -0.147621f,  0.716567f },
    { -0.442863f, -0.238856f,  0.864188f },
    { -0.587785f, -0.425325f,  0.688191f },
    { -0.309017f, -0.500000f,  0.809017f },
    { -0.147621f, -0.716567f,  0.681718f },
    { -0.425325f, -0.688191f,  0.587785f },
    { -0.162460f, -0.262866f,  0.951056f },
    {  0.442863f, -0.238856f,  0.864188f },
    {  0.162460f, -0.262866f,  0.951056f },
    {  0.309017f, -0.500000f,  0.809017f },
    {  0.147621f, -0.716567f,  0.681718f },
    {  0.000000f, -0.525731f,  0.850651f },
    {  0.425325f, -0.688191f,  0.587785f },
    {  0.587785f, -0.425325f,  0.688191f },
    {  0.688191f, -0.587785f,  0.425325f },
    { -0.955423f,  0.295242f,  0.000000f },
    { -0.951056f,  0.162460f,  0.262866f },
    { -1.000000f,  0.000000f,  0.000000f },
    { -0.850651f,  0.000000f,  0.525731f },
    { -0.955423f, -0.295242f,  0.000000f },
    { -0.951056f, -0.162460f,  0.262866f },
    { -0.864188f,  0.442863f, -0.238856f },
    { -0.951056f,  0.162460f, -0.262866f },
    { -0.809017f,  0.309017f, -0.500000f },
    { -0.864188f, -0.442863f, -0.238856f },
    { -0.951056f, -0.162460f, -0.262866f },
    { -0.809017f, -0.309017f, -0.500000f },
    { -0.681718f,  0.147621f, -0.716567f },
    { -0.681718f, -0.147621f, -0.716567f },
    { -0.850651f,  0.000000f, -0.525731f },
    { -0.688191f,  0.587785f, -0.425325f },
    { -0.587785f,  0.425325f, -0.688191f },
    { -0.425325f,  0.688191f, -0.587785f },
    { -0.425325f, -0.688191f, -0.587785f },
    { -0.587785f, -0.425325f, -0.688191f },
    { -0.688191f, -0.587785f, -0.425325f }
};

static constexpr int AliasVersion = 6;
static constexpr int AliasOnseam = 0x0020;
static constexpr int MaxLbmHeight = 480;
static constexpr int MaxAliasVerts = 2000;
static constexpr int MaxAliasTris = 4096;
static constexpr int MaxSkins = 32;
static constexpr int MaxAliasFrames = 1024;

class MdlData
{
public:
    struct AliasHeader {
        int ident;
        int version;
        float scale[3];
        float scaleOrigin[3];
        float boundingradius;
        float eyeposition[3];
        int numskins;
        int skinwidth;
        int skinheight;
        int numverts;
        int numtris;
        int numframes;
        int synctype;
        int flags;
        float size;
    };

    MdlData(const QUrl &s) : source(s), inCache(false) {}

    void addref();
    void release(MdlCache *cache = nullptr);
    void addToCache();
    void removeFromCache(MdlCache *cache = nullptr);

    uint refCount = 1;
    bool inCache:1;

    QUrl source;
    AliasHeader header;
    QVector<Mdl::AliasFrame> frames;
    int poseNum = 0;
    QVector<Vertex> poseVertexes;

private:
    Q_DISABLE_COPY(MdlData)
};

void MdlData::addref()
{
    ++refCount;
}

void MdlData::release(MdlCache *store)
{
    Q_ASSERT(refCount > 0);
    --refCount;
    if (refCount == 0) {
        removeFromCache(store);
        delete this;
    }
}

void MdlData::addToCache()
{
    if (!inCache) {
        MdlCache::instance()->m_cache.insert(source, this);
        inCache = true;
    }
}

void MdlData::removeFromCache(MdlCache *store)
{
    if (inCache) {
        if (!store)
            store = MdlCache::instance();
        store->m_cache.remove(source);
        inCache = false;
    }
}

void MdlCache::destroyCache()
{
    int leakedMdls = 0;
    const auto cache = m_cache;
    for (auto *mdl : cache) {
        auto currRefCount = mdl->refCount;
        if (currRefCount) {
            leakedMdls++;
            qDebug() << "leaked mdl: refCount" << mdl->refCount << mdl->source;
            while (currRefCount > 0) {
                mdl->release(this);
                currRefCount--;
            }
        }
    }

    qDebug() << "Number of leaked mdls:" << leakedMdls;
}

enum AliasFrameType : int {
    Single = 0,
    Group
};

enum AliasSkinTypes : int {
    AliasSkinSingle = 0,
    AliasSkinGroup
};

Mdl::Mdl(QObject *parent) : QObject(parent)
{
}

Mdl::~Mdl()
{
    if (d) {
        d->release();
        d = nullptr;
    }
}

QUrl Mdl::source() const
{
    return m_source;
}

void Mdl::setSource(const QUrl &source)
{
    if (m_source == source)
        return;

    m_source = source;
    Q_EMIT sourceChanged();

    if (m_complete)
        loadFromSource();
}

QVector<Mdl::AliasFrame> Mdl::frames() const
{
    if (d)
        return d->frames;
    else
        return QVector<Mdl::AliasFrame>();
}

QVector<Vertex> Mdl::poseVertexes() const
{
    if (d)
        return d->poseVertexes;
    else
        return QVector<Vertex>();
}

int Mdl::vertexesCount() const
{
    if (d)
        return d->header.numtris * 3;
    else
        return 0;
}

void Mdl::classBegin()
{
    m_complete = false;
}

void Mdl::componentComplete()
{
    m_complete = true;
    if (m_source.isValid())
        loadFromSource();
}

void Mdl::loadFromSource()
{
    if (!m_complete)
        return;

    if (d) {
        d->release();
        d = nullptr;
    }

    const QQmlContext *context = qmlContext(this);
    const auto localPath = QQmlFile::urlToLocalFileOrQrc(context ? context->resolvedUrl(m_source) : m_source);
    if (localPath.isEmpty())
        return;

    QFile file(localPath);
    if (!file.open(QIODevice::ReadOnly)) {
        m_errorString = QStringLiteral("Unable to open file: %1").arg(localPath);
        Q_EMIT error(m_errorString);
        return;
    }

    QDataStream stream;
    stream.setDevice(&file);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream.setFloatingPointPrecision(QDataStream::SinglePrecision);

    int version;
    stream >> version;

    QHash<QUrl, MdlData *>::Iterator iter = MdlCache::instance()->m_cache.find(m_source);

    if (iter == MdlCache::instance()->m_cache.end()) {
        d = new MdlData(m_source);
        bool ok = loadAliasModel(stream);
        if (ok)
            d->addToCache();
    } else {
        d = *iter;
        d->addref();
    }

    Q_EMIT loaded();
}

bool Mdl::loadAliasModel(QDataStream &stream)
{
    stream >> d->header.version
           >> d->header.scale[0]
           >> d->header.scale[1]
           >> d->header.scale[2]
           >> d->header.scaleOrigin[0]
           >> d->header.scaleOrigin[1]
           >> d->header.scaleOrigin[2]
           >> d->header.boundingradius
           >> d->header.eyeposition[0]
           >> d->header.eyeposition[1]
           >> d->header.eyeposition[2]
           >> d->header.numskins
           >> d->header.skinwidth
           >> d->header.skinheight
           >> d->header.numverts
           >> d->header.numtris
           >> d->header.numframes
           >> d->header.synctype
           >> d->header.flags
           >> d->header.size;

    if (d->header.version != AliasVersion) {
        qWarning() << QStringLiteral("model %1 has wrong version number (%2 should be %3)").arg(m_source.toString()).arg(d->header.version).arg(AliasVersion);
        return false;
    }

    if (d->header.skinheight > MaxLbmHeight) {
        qWarning() << QStringLiteral("model %1 has a skink taller than %2").arg(m_source.toString()).arg(MaxLbmHeight);
        return false;
    }

    if (d->header.numverts <= 0) {
        qWarning() << QStringLiteral("model %1 has no vertices").arg(m_source.toString());
        return false;
    }

    if (d->header.numverts > MaxAliasVerts) {
        qWarning() << QStringLiteral("model %1 has too many vertices (%2; max = %3)").arg(m_source.toString()).arg(d->header.numverts).arg(MaxAliasVerts);
        return false;
    }

    if (d->header.numtris <= 0) {
        qWarning() << QStringLiteral("model %1 has no tringles").arg(m_source.toString());
        return false;
    }

    if (d->header.numtris > MaxAliasTris) {
        qWarning() << QStringLiteral("model %1 has too many triangles (%2; max = %3)").arg(m_source.toString()).arg(d->header.numtris).arg(MaxAliasTris);
        return false;
    }

    if (d->header.numframes < 1) {
        qWarning() << QStringLiteral("model %1 has invalid # of frames: %1").arg(m_source.toString()).arg(d->header.numframes);
        return false;
    }

    if (!skipAllSkins(stream))
        return false;

    struct AliasEdge {
        int onseam;
        int s;
        int t;
    };

    QVector<AliasEdge> edges;
    edges.resize(d->header.numverts);
    for (int i = 0; i < edges.size(); ++i) {
        AliasEdge edge;
        stream >> edge.onseam >> edge.s >> edge.t;
        edges[i] = edge;
    }

    struct Face
    {
        int facesfront;
        int vertindex[3];
    };

    QVector<Face> faces;
    faces.resize(d->header.numtris);
    for (int i = 0; i < faces.size(); ++i) {
        Face face;
        stream >> face.facesfront >> face.vertindex[0] >> face.vertindex[1] >> face.vertindex[2];
        faces[i] = face;
    }

    d->frames.resize(d->header.numframes);

    for (int i = 0; i < d->frames.size(); ++i) {
        AliasFrameType type;
        stream >> type;

        QVector<AliasVertex> verts;

        if (type == AliasFrameType::Single)
            loadAliasFrame(stream, d->frames[i], verts);
        else
            loadAliasGroup(stream, d->frames[i], verts);

        const auto frame = d->frames[i];
        for (int p = 0; p < frame.numposes; ++p) {
            QVector<Vertex> poseVertexes;
            for (int j = 0; j < d->header.numtris; ++j) {
                for (int c = 0; c < 3; ++c) {
                    const auto face = faces[j];
                    auto index = face.vertindex[c];
                    if (index >= d->header.numverts) {
                        index = d->header.numverts - 1;
                        qWarning() << QStringLiteral("Index overflow in MDL vertex list %1").arg(i);
                    }

                    Vertex vert;
                    const auto offset = p * d->header.numverts + index;
                    vert.position.setX(static_cast<float>(verts[offset].v[0] * d->header.scale[0]));
                    vert.position.setX((vert.position.x() + d->header.scaleOrigin[0]) / 100.0f);
                    vert.position.setY(static_cast<float>(verts[offset].v[1] * d->header.scale[1]));
                    vert.position.setY((vert.position.y() + d->header.scaleOrigin[1]) / 100.0f);
                    vert.position.setZ(static_cast<float>(verts[offset].v[2] * d->header.scale[2]));
                    vert.position.setZ((vert.position.z() + d->header.scaleOrigin[2]) / 100.0f);
                    vert.normal.setX(avNormals[verts[offset].lightnormalindex][0]);
                    vert.normal.setY(avNormals[verts[offset].lightnormalindex][1]);
                    vert.normal.setZ(avNormals[verts[offset].lightnormalindex][2]);

                    float u = static_cast<float>(edges[index].s);
                    float v = static_cast<float>(edges[index].t);

                    if (!face.facesfront && edges[index].onseam)
                        u += d->header.skinwidth * 0.5f;

                    vert.texCoord.setX((u + 0.5f) / d->header.skinwidth);
                    vert.texCoord.setY((v + 0.5f) / d->header.skinheight);

                    poseVertexes.push_back(vert);
                }
            }

            // Rotate, flip winding order
            QMatrix4x4 rot;
            rot.rotate(-90, 1, 0, 0);

            QVector<Vertex> flippedVertexes;
            for (int i = poseVertexes.size() - 1; i >= 0; --i) {
                auto vertex = poseVertexes[i];
                vertex.position = rot.map(vertex.position);
                flippedVertexes.push_back(vertex);
            }

            d->poseVertexes.append(flippedVertexes);
        }
    }

    return true;
}

bool Mdl::skipAllSkins(QDataStream &stream)
{
    if (d->header.numskins < 1 || d->header.numskins > MaxSkins) {
        qWarning() << QStringLiteral("model %1 has invalid # of skins %2").arg(m_source.toString()).arg(d->header.numskins);
        return false;
    }

    const auto size = d->header.skinwidth * d->header.skinheight;
    for (int i = 0; i < d->header.numskins; ++i) {
        AliasSkinTypes skinType;
        stream >> skinType;
        if (skinType == AliasSkinSingle)
            stream.skipRawData(size);
    }

    return true;
}

void Mdl::loadAliasFrame(QDataStream &stream, AliasFrame &frame, QVector<AliasVertex> &verts)
{
    stream >> frame.bboxmin.lightnormalindex
        >> frame.bboxmin.v[0]
        >> frame.bboxmin.v[1]
        >> frame.bboxmin.v[2]
        >> frame.bboxmax.lightnormalindex
        >> frame.bboxmax.v[0]
        >> frame.bboxmax.v[1]
        >> frame.bboxmax.v[2];

    stream.readRawData(frame.name, sizeof(frame.name));
    frame.firstpose = d->poseNum;
    frame.numposes = 1;

    for (int i = 0; i < d->header.numverts; ++i) {
        AliasVertex v;
        stream >> v.v[0] >> v.v[1] >> v.v[2] >> v.lightnormalindex;
        verts.push_back(v);
    }

    d->poseNum++;
}

void Mdl::loadAliasGroup(QDataStream &stream, AliasFrame &frame, QVector<AliasVertex> &verts)
{
    int numFrames = 0;

    stream >> numFrames
        >> frame.bboxmin.v[0]
        >> frame.bboxmin.v[1]
        >> frame.bboxmin.v[2]
        >> frame.bboxmin.lightnormalindex
        >> frame.bboxmax.v[0]
        >> frame.bboxmax.v[1]
        >> frame.bboxmax.v[2]
        >> frame.bboxmax.lightnormalindex;

    frame.firstpose = d->poseNum;
    frame.numposes = numFrames;

    stream >> frame.interval;

    // skip interlvals
    stream.device()->skip(sizeof(float) * (numFrames - 1));

    for (int i = 0; i < numFrames; ++i) {
        // skip daliasframe_t
        stream.device()->skip(sizeof(AliasVertex) + sizeof(AliasVertex) + sizeof(char) * 16);
        for (int j = 0; j < d->header.numverts; ++j) {
            AliasVertex v;
            stream >> v.v[0] >> v.v[1] >> v.v[2] >> v.lightnormalindex;
            verts.push_back(v);
        }
        d->poseNum++;
    }
}
