import QtQuick
import QtQuick3D

import Kwayk.Game

import "../../js/easing.js" as E

Item {
    id: root

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.32, 0.16)

    classname: "item_artifact_envirosuit"
    items: Defs.itSuit

    touch: powerup_touch

    noise.source: "qrc:/Assets/sounds/items/suit.wav"

    netname: "Biosuit"

    model: Alias {
        mdl.source: "qrc:/Assets/progs/suit.mdl"
        skin.source: "qrc:/Assets/progs/skins/suit.png"
        active: false
        eulerRotation.y: time * 100
        y: E.inOutQuad((time % 2) < 1 ? time % 1 : 1 - (time % 1)) * 0.1
    }
}
