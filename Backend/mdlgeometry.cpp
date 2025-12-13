#include <QVector3D>
#include <QDateTime>
#include <QDebug>

#include "mdlgeometry.h"

MdlGeometry::MdlGeometry(QQuick3DObject *parent)
    : QQuick3DGeometry(parent)
    , m_updateAnimation{new MdlGeometryUpdate(this)}
{
    addAttribute(QQuick3DGeometry::Attribute::PositionSemantic, 0,
                 QQuick3DGeometry::Attribute::F32Type);

    addAttribute(QQuick3DGeometry::Attribute::NormalSemantic, 3 * sizeof(float),
                 QQuick3DGeometry::Attribute::F32Type);

    addAttribute(QQuick3DGeometry::Attribute::TexCoordSemantic, 6 * sizeof(float),
                 QQuick3DGeometry::Attribute::F32Type);

    m_updateAnimation->start();
}

MdlGeometry::~MdlGeometry()
{
    m_updateAnimation->stop();
}

Mdl *MdlGeometry::mdl() const
{
    return m_mdl;
}

void MdlGeometry::setMdl(Mdl *alias)
{
    if (m_mdl == alias)
        return;

    m_mdl = alias;
    Q_EMIT mdlChanged();
}

int MdlGeometry::time() const
{
    return m_time;
}

void MdlGeometry::setTime(int time)
{
    if (m_time == time)
        return;

    m_time = time;
    m_updateAnimation->setDirty(true);
    emit timeChanged();
}

bool MdlGeometry::active() const
{
    return m_active;
}

void MdlGeometry::setActive(bool active)
{
    if (m_active == active)
        return;

    m_active = active;
    Q_EMIT activeChanged();
}

int MdlGeometry::frameIndex() const
{
    return m_frameIndex;
}

void MdlGeometry::setFrameIndex(int frameIndex)
{
    if (m_frameIndex == frameIndex)
        return;

    m_frameIndex = std::max(0, frameIndex);
    Q_EMIT frameIndexChanged();
}

bool MdlGeometry::interpolate() const
{
    return m_interpolate;
}

void MdlGeometry::setInterpolate(bool interpolate)
{
    if (m_interpolate == interpolate)
        return;

    m_interpolate = interpolate;
    Q_EMIT interpolateChanged();
}

QSSGRenderGraphObject *MdlGeometry::updateSpatialNode(QSSGRenderGraphObject *node)
{
    if (m_mdl) {
        m_vertexBuffer.resize(m_mdl->vertexesCount() * sizeof(Vertex));
        auto *vertexes = reinterpret_cast<float *>(m_vertexBuffer.data());
        const auto offset1 = m_previousFrame * m_mdl->vertexesCount();
        const auto offset2 = m_currentFrame * m_mdl->vertexesCount();
        const auto &poseVertexes = m_mdl->poseVertexes();

        for (int i = 0; i < m_mdl->vertexesCount(); ++i) {
            const auto &vertex1 = poseVertexes[offset1 + i];
            const auto &vertex2 = poseVertexes[offset2 + i];
            const auto position = (vertex1.position * (1.0f - m_blend)) + (vertex2.position * m_blend);
            *vertexes++ = position.x();
            *vertexes++ = position.y();
            *vertexes++ = position.z();
            *vertexes++ = vertex1.normal.x();
            *vertexes++ = vertex1.normal.y();
            *vertexes++ = vertex1.normal.z();
            *vertexes++ = vertex1.texCoord.x();
            *vertexes++ = vertex1.texCoord.y();
        }

        setVertexData(m_vertexBuffer);
        setStride(sizeof(Vertex));
        setPrimitiveType(QQuick3DGeometry::PrimitiveType::Triangles);
    }

    m_updateAnimation->setDirty(false);

    node = QQuick3DGeometry::updateSpatialNode(node);
    return node;
}

void MdlGeometry::componentComplete()
{
    QQuick3DGeometry::componentComplete();

    m_currentFrame = m_previousFrame = m_frameIndex;

    m_time = 0;
}

void MdlGeometry::updateCurrentTime(int currentTime)
{
    if (!m_mdl || m_frameIndex >= m_mdl->frames().size())
        return;

    const auto &frames = m_mdl->frames();
    const auto &frame = frames[m_frameIndex];

    auto posenum = frame.firstpose;
    auto numposes = frame.numposes;

    const auto timeS = static_cast<float>(currentTime / 1000.0);

    float interval = 0.1;
    if (numposes > 1) {
        interval = frame.interval;
        posenum += static_cast<int>(timeS / interval) % numposes;
    }

    if (posenum != m_currentFrame) {
        m_startTime = timeS;
        m_previousFrame = m_currentFrame;
        m_currentFrame = posenum;
        update();
    }

    if (!m_interpolate) {
        m_blend = 1.0;
        return;
    }

    float blend = std::clamp((double)(timeS - m_startTime) / interval, 0.0,  1.0);
    if (!qFuzzyCompare(blend, m_blend)) {
        m_blend = blend;
        update();
    }
}
