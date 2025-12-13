import QtQuick
import QtQuick3D

import Kwayk.Game

Item {
    id: root

    mins: Qt.vector3d(0, 0, -0.32)
    maxs: Qt.vector3d(0.32, 0.56, 0)

    touch: ammo_touch

    noise.source: "qrc:/Assets/sounds/weapons/lock4.wav"

    netname: "shells"

    model: Loader3D {
        source: (root.spawnflags & weaponBig2) ? "qrc:/Assets/maps/b_shell1/B_shell1_map.qml"
                                               : "qrc:/Assets/maps/b_shell0/B_shell0_map.qml"
    }

    weapon: 1
    aflag: (root.spawnflags & weaponBig2) ? 40 : 20
}
