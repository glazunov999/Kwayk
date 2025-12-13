#ifndef MDLGEOMETRY_H
#define MDLGEOMETRY_H

#include <QQuick3DGeometry>
#include <QAbstractAnimation>
#include <QByteArray>

#include "mdl.h"

class MdlGeometryUpdate;

class MdlGeometry : public QQuick3DGeometry
{
    Q_OBJECT
    Q_PROPERTY(Mdl *mdl READ mdl WRITE setMdl NOTIFY mdlChanged)
    Q_PROPERTY(int time READ time WRITE setTime NOTIFY timeChanged)
    Q_PROPERTY(bool active READ active WRITE setActive NOTIFY activeChanged)
    Q_PROPERTY(int frameIndex READ frameIndex WRITE setFrameIndex NOTIFY frameIndexChanged)
    Q_PROPERTY(bool interpolate READ interpolate WRITE setInterpolate NOTIFY interpolateChanged)
    QML_ELEMENT

public:
    explicit MdlGeometry(QQuick3DObject *parent = nullptr);
    ~MdlGeometry() override;

    Mdl *mdl() const;
    void setMdl(Mdl *mdl);
    int time() const;
    bool active() const;
    void setActive(bool active);
    void setTime(int time);
    int frameIndex() const;
    void setFrameIndex(int frameIndex);
    bool interpolate() const;
    void setInterpolate(bool interpolate);

Q_SIGNALS:
    void mdlChanged();
    void timeChanged();
    void activeChanged();
    void frameIndexChanged();
    void interpolateChanged();

private:
    friend class MdlGeometryUpdate;

    void componentComplete() override;

    QSSGRenderGraphObject *updateSpatialNode(QSSGRenderGraphObject *node) override;

    void updateCurrentTime(int currentTime);

    Mdl *m_mdl = nullptr;
    int m_time = 0;
    bool m_active = true;
    int m_frameIndex = 0;
    bool m_interpolate = true;
    int m_currentFrame = 0;
    int m_previousFrame = 0;
    float m_startTime = 0;
    float m_blend = 0;
    QByteArray m_vertexBuffer;
    MdlGeometryUpdate *m_updateAnimation = nullptr;
};

class MdlGeometryUpdate : public QAbstractAnimation
{
    Q_OBJECT

public:
    MdlGeometryUpdate(MdlGeometry *geometry)
        : QAbstractAnimation(static_cast<QObject *>(geometry)), m_geometry{geometry}
    {}

    void setDirty(bool dirty)
    {
        m_dirty = dirty;
    }

protected:
    void updateCurrentTime(int t) override
    {
        Q_UNUSED(t)
        if (m_dirty && m_geometry->active())
            m_geometry->updateCurrentTime(m_geometry->m_time);
    }

    int duration() const override
    {
        return -1;
    }

private:
    MdlGeometry *m_geometry;
    bool m_dirty = false;
};

#endif // MDLGEOMETRY_H
