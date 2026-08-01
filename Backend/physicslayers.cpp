#include "physicslayers.h"

using namespace Layers;

bool ObjectLayerPairFilter::shouldCollide(quint16 obj1, quint16 obj2) const
{
    switch (obj1) {
    case ObjectLayers::Solid:
        return obj2 == ObjectLayers::Walker || obj2 == ObjectLayers::Item || obj2 == ObjectLayers::Toss;
    case ObjectLayers::NonSolid:
        return false;
    case ObjectLayers::Walker:
    case ObjectLayers::Monster:
        return obj2 == ObjectLayers::Solid || obj2 == ObjectLayers::Walker || obj2 == ObjectLayers::Monster
               || obj2 == ObjectLayers::Sensor;
    case ObjectLayers::Toss:
        return obj2 == ObjectLayers::Solid || obj2 == ObjectLayers::Walker || obj2 == ObjectLayers::Monster
               || obj2 == ObjectLayers::Dead;
    case ObjectLayers::Item:
        return obj2 == ObjectLayers::Solid;
    case ObjectLayers::Pushed:
    case ObjectLayers::Dead:
        return false;
    case ObjectLayers::Sensor:
        return obj2 == ObjectLayers::Walker;
    case ObjectLayers::Normal:
        return obj2 == ObjectLayers::Solid || obj2 == ObjectLayers::Walker || obj2 == ObjectLayers::Monster
               || obj2 == ObjectLayers::Dead;
    case ObjectLayers::NoMonsters:
        return obj2 == ObjectLayers::Solid || obj2 == ObjectLayers::Walker;
    default:
        Q_ASSERT(false);
        return false;
    }
}

BroadPhaseLayer::BroadPhaseLayer()
{
    m_objectToBroadPhase[0] = BroadPhaseLayers::BP_Solid;     // Solid
    m_objectToBroadPhase[1] = BroadPhaseLayers::BP_NonSolid;  // NonSolid
    m_objectToBroadPhase[2] = BroadPhaseLayers::BP_Moving;    // Walker
    m_objectToBroadPhase[3] = BroadPhaseLayers::BP_Moving;    // Monster
    m_objectToBroadPhase[4] = BroadPhaseLayers::BP_Moving;    // Toss
    m_objectToBroadPhase[5] = BroadPhaseLayers::BP_Moving;    // Item
    m_objectToBroadPhase[6] = BroadPhaseLayers::BP_NonMoving; // Pushed
    m_objectToBroadPhase[7] = BroadPhaseLayers::BP_NonMoving; // Dead
    m_objectToBroadPhase[8] = BroadPhaseLayers::BP_Sensor;    // Sensor
    m_objectToBroadPhase[9] = BroadPhaseLayers::BP_NonMoving; // Bone (unused)
}

unsigned int BroadPhaseLayer::getNumBroadPhaseLayers() const
{
    return 5;
}

quint8 BroadPhaseLayer::getBroadPhaseLayer(quint16 layer) const
{
    Q_ASSERT(layer < sizeof(m_objectToBroadPhase) / sizeof(m_objectToBroadPhase[0]));
    return m_objectToBroadPhase[layer];
}

bool ObjectVsBroadPhaseLayerFilter::shouldCollide(quint16 layer1, quint8 layer2) const
{
    switch (layer1) {
    case ObjectLayers::Solid:
        return layer2 == BroadPhaseLayers::BP_Moving || layer2 == BroadPhaseLayers::BP_NonMoving;
    case ObjectLayers::NonSolid:
        return false;
    case ObjectLayers::Walker:
    case ObjectLayers::Monster:
        return layer2 == BroadPhaseLayers::BP_Solid || layer2 == BroadPhaseLayers::BP_Moving
               || layer2 == BroadPhaseLayers::BP_Sensor;
    case ObjectLayers::Toss:
        return layer2 == BroadPhaseLayers::BP_Solid || layer2 == BroadPhaseLayers::BP_Moving
               || layer2 == BroadPhaseLayers::BP_NonMoving;
    case ObjectLayers::Item:
        return layer2 == BroadPhaseLayers::BP_Solid;
    case ObjectLayers::Pushed:
    case ObjectLayers::Dead:
        return false;
    case ObjectLayers::Sensor:
        return layer2 == BroadPhaseLayers::BP_Moving;
    case ObjectLayers::Normal:
        return layer2 == BroadPhaseLayers::BP_Solid || layer2 == BroadPhaseLayers::BP_Moving
               || layer2 == BroadPhaseLayers::BP_NonMoving;
    case ObjectLayers::NoMonsters:
        return layer2 == BroadPhaseLayers::BP_Solid;
    default:
        Q_ASSERT(false);
        return false;
    }
}
