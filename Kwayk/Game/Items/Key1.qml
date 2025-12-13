import QtQuick
import QtQuick3D

import Kwayk.Game

import "../../js/easing.js" as E

Item {
    id: root

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.32, 0.16)

    classname: "item_key1"
    items: Defs.itKey1

    touch: key_touch

    model: Alias {
        id: mod
        active: false
        eulerRotation.y: time * 100
        y: E.inOutQuad((time % 2) < 1 ? time % 1 : 1 - (time % 1)) * 0.1
    }

    Component.onCompleted: {
        switch (world.worldtype) {
        case 0:
            mod.mdl.source = "qrc:/Assets/progs/w_s_key.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/w_s_key.png";
            netname = "silver key";
            break;
        case 1:
            mod.mdl.source = "qrc:/Assets/progs/m_s_key.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/m_s_key.png";
            netname = "silver runekey";
            break;
        case 2:
            mod.mdl.source = "qrc:/Assets/progs/b_s_key.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/b_s_key.png";
            netname = "silver keycard";
            break;
        }
        key_setsounds();
    }
}
