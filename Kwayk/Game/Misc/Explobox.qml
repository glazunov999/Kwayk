import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Kwayk.Core
import Backend
import Assets.maps.b_exbox2
import Assets.maps.b_explob

Entity {
    id: root

    mins: Qt.vector3d(0, 0, -0.32)
    maxs: !small ? Qt.vector3d(0.32, 0.64, 0) : Qt.vector3d(0.32, 0.32, 0)

    takedamage: Defs.damageAim
    health: 20

    th_die: explode

    classname: "misc_explobox"

    body: item

    property bool small: false

    Combat {
        id: combat
    }

    Solid {
        id: item

        shape: BoxShape {
            extents: root.size
        }

        ent: root
        objectLayer: Layers.Monster
        motionQuality: Body.LinearCast
        motionType: Body.Dynamic
        position: Qt.vector3d(0, 0.2, 0)
        allowedDOFs: Body.TranslationX | Body.TranslationY | Body.TranslationZ
        activation: Body.Activate

        restitution: 0
        friction: 1

        Loader3D {
            id: content
            source: !small ? "qrc:/Assets/maps/b_explob/B_explob_map.qml"
                           : "qrc:/Assets/maps/b_exbox2/B_exbox2_map.qml"
            position: root.center.times(-1)
        }
    }

    function explode() {
        combat.barrel_explode(mapPositionToScene(item.position));
    }
}
