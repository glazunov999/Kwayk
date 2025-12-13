#ifndef PHYSICSLAYERS_H
#define PHYSICSLAYERS_H

#include <QtQuick3DJoltPhysics/physicslayers.h>
#include <QQmlEngine>

namespace Layers
{
    Q_NAMESPACE
    QML_NAMED_ELEMENT(Layers)

    enum ObjectLayers {
        Solid = 0,
        NonSolid,
        Walker,
        Monster,
        Toss,
        Item,
        Pushed,
        Dead,
        Sensor,
        Normal,
        NoMonsters
    };

    enum BroadPhaseLayers {
        BP_Solid = 0,
        BP_NonSolid,
        BP_Moving,
        BP_NonMoving,
        BP_Sensor,
    };

    Q_ENUM_NS(ObjectLayers)
    Q_ENUM_NS(BroadPhaseLayers)
}

class ObjectLayerPairFilter : public AbstractObjectLayerPairFilter
{
    Q_OBJECT
    QML_ELEMENT
public:
    ObjectLayerPairFilter() = default;

    bool shouldCollide(quint16 obj1, quint16 obj2) const override;
};

class BroadPhaseLayer : public AbstractBroadPhaseLayer
{
    Q_OBJECT
    QML_ELEMENT
public:
    BroadPhaseLayer();

    unsigned int getNumBroadPhaseLayers() const override;
    quint8 getBroadPhaseLayer(quint16 layer) const override;

private:
    quint8 m_objectToBroadPhase[9];
};

class ObjectVsBroadPhaseLayerFilter : public AbstractObjectVsBroadPhaseLayerFilter
{
    Q_OBJECT
    QML_ELEMENT
public:
    ObjectVsBroadPhaseLayerFilter() = default;

    bool shouldCollide(quint16 layer1, quint8 layer2) const override;
};

#endif // PHYSICSLAYERS_H
