import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core

import "../../js/easing.js" as E

Item {
    id: root

    property int skin: 0
    property real armorvalue: 100

    mins: Qt.vector3d(-0.16, 0, -0.16)
    maxs: Qt.vector3d(0.16, 0.56, 0.16)

    touch: armor_touch

    classname: "item_armor" + (root.skin <= 1 ? root.skin + 1 : "Inv");

    model: Alias {
        mdl.source: "qrc:/Assets/progs/armor.mdl"
        skin.source: !root.skin ? "qrc:/Assets/progs/skins/armor.png" : "qrc:/Assets/progs/skins/armor_" + root.skin + ".png"
        active: false
        eulerRotation.y: time * 100
        y: E.inOutQuad((time % 2) < 1 ? time % 1 : 1 - (time % 1)) * 0.1
    }

    Sound {
        id: armorSound
        ent: parent
        source: "qrc:/Assets/sounds/items/armor1.wav"
        attenuationType: Defs.attnNorm
    }

    function armor_touch() {
        if (other.health <= 0)
            return;
        if (other.classname !== "player")
            return;
        let type;
        let value;
        let bit;
        if (classname === "item_armor1") {
            type = 0.3;
            value = 100;
            bit = Defs.itArmor1;
        } else if (classname === "item_armor2") {
            type = 0.6;
            value = 150;
            bit = Defs.itArmor2;
        } else if (classname === "item_armorInv") {
            type = 0.8;
            value = 200;
            bit = Defs.itArmor3;
        } else {
            console.log("armor_touch: unknown classname");
        }

        if ((other.armortype * other.armorvalue) >= (type * value))
            return;

        other.armortype = type;
        other.armorvalue = value;
        other.items = other.items - (other.items & (Defs.itArmor1 | Defs.itArmor2 | Defs.itArmor3)) + bit;

        solid = false;
        visible = false;

        ui.conPrint("You got armor\n");

        armorSound.play();
        game.stuffcmd("bf\n");

        activator = other;
        useTargets();
    }
}
