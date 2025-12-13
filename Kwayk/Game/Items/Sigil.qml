import QtQuick
import QtQuick3D

import Kwayk.Game

import "../../js/easing.js" as E

Item {
    id: root

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.32, 0.16)

    classname: "item_sigil"

    touch: sigil_touch

    noise.source: "qrc:/Assets/sounds/misc/runekey.wav"

    model: Alias {
        id: mod
        mdl.source: "qrc:/Assets/progs/end1.mdl"
        skin.source: "qrc:/Assets/progs/skins/end1.png"
        active: false
        eulerRotation.y: time * 100
        y: E.inOutQuad((time % 2) < 1 ? time % 1 : 1 - (time % 1)) * 0.1
    }

    function sigil_touch() {
        if (other.classname !== "player")
            return;
        if (other.health <= 0)
            return;

        ui.centerprint("You got the rune!");

        noise.play();
        game.stuffcmd("bf\n");
        solid = false;
        visible = false;
        serverflags = serverflags | (spawnflags & 15);
        classname = "";

        activator = other;
        useTargets();
    }

    Component.onCompleted: {
        if (spawnflags & 1) {
            mod.mdl.source = "qrc:/Assets/progs/end1.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/end1.png";
        }
        if (spawnflags & 2) {
            mod.mdl.source = "qrc:/Assets/progs/end2.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/end2.png";
        }
        if (spawnflags & 4) {
            mod.mdl.source = "qrc:/Assets/progs/end3.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/end3.png";
        }
        if (spawnflags & 8) {
            mod.mdl.source = "qrc:/Assets/progs/end4.mdl";
            mod.skin.source = "qrc:/Assets/progs/skins/end4.png";
        }
    }
}
