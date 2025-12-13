import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Backend

Gib {
    id: root

    Alias {
        mdl.source: "qrc:/Assets/progs/zom_gib.mdl"
        skin.source: "qrc:/Assets/progs/skins/zom_gib.png"
        active: false
        alpha: root.alpha
    }
}
