import QtQuick
import QtQuick3D

import Kwayk.Game

import "../../js/easing.js" as E

Item {
    id: root

    mins: Qt.vector3d(-0.16, 0, -0.16)
    maxs: Qt.vector3d(0.16, 0.56, 0.16)

    classname: "weapon_supershotgun"

    touch: weapon_touch

    noise.source: "qrc:/Assets/sounds/weapons/pkup.wav"

    netname: "Double-barrelled Shotgun"

    model: Alias {
        mdl.source: "qrc:/Assets/progs/g_shot.mdl"
        skin.source: "qrc:/Assets/progs/skins/g_shot.png"
        active: false
        eulerRotation.y: time * 100
        y: E.inOutQuad((time % 2) < 1 ? time % 1 : 1 - (time % 1)) * 0.1
    }
}
