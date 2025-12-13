import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

Body {
    id: root

    property var ent: world

    activation: Body.DontActivate
}
