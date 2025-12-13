import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core

import "../../js/easing.js" as E

Item {
    id: root

    property int ammo_shells: 0
    property int ammo_nails: 0
    property int ammo_rockets: 0
    property int ammo_cells: 0

    mins: Qt.vector3d(-0.16, 0, -0.16)
    maxs: Qt.vector3d(0.16, 0.56, 0.16)

    touch: backpackTouch

    model: Alias {
        id: als
        mdl.source: "qrc:/Assets/progs/backpack.mdl"
        skin.source: "qrc:/Assets/progs/skins/backpack.png"
        active: false
        eulerRotation.y: time * 100
        y: (E.inOutQuad((time % 2) < 1 ? time % 1 : 1 - (time % 1))) * 0.1
    }

    Sound {
        id: lock4Sound
        ent: parent
        source: "qrc:/Assets/sounds/weapons/lock4.wav"
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        th.nextthink = time + 10;
    }

    th.think: () => hide.enabled = true;

    Think {
        id: hide
        enabled: false
        property real startTime: 0
        think: () => {
            const t = (time - startTime) / 1.0;
            als.alpha = 1.0 - t;
            if (t >= 1.0)
                root.destroy()
            else
                nextthink = time + 0.016;
        }
        onEnabledChanged: {
            startTime = time;
            nextthink = time + 0.016;
        }
    }

    function backpackTouch() {
        if (other.classname !== "player")
            return;
        if (other.health <= 0)
            return;

        let acount = false;
        ui.conPrint("You get ");

        if (items) {
            if ((other.items & items) === 0) {
                acount = true;
                ui.conPrint("the ");
            }
        }

        const best = other.bestWeapon();

        // change weapons
        other.ammo_shells += ammo_shells;
        other.ammo_nails += ammo_nails;
        other.ammo_rockets += ammo_rockets;
        other.ammo_cells += ammo_cells;

        let new_ = items;
        if (!new_)
            new_ = other.weapon;
        const old = other.items;
        other.items = other.items | new_;

        bound_other_ammo();
        if (ammo_shells) {
            if (acount)
                ui.conPrint(", ");
            acount = true;
            ui.conPrint(ammo_shells.toString());
            ui.conPrint(" shells");
        }
        if (ammo_nails) {
            if (acount)
                ui.conPrint(", ");
            acount = true;
            ui.conPrint(ammo_nails.toString());
            ui.conPrint(" nails");
        }
        if (ammo_rockets) {
            if (acount)
                ui.conPrint(", ");
            acount = true;
            ui.conPrint(ammo_rockets.toString());
            ui.conPrint(" rockets");
        }
        if (ammo_cells) {
            if (acount)
                ui.conPrint(", ");
            acount = true;
            ui.conPrint(ammo_cells.toString());
            ui.conPrint(" cells");
        }

        ui.conPrint("\n");

        lock4Sound.play();
        game.stuffcmd("bf\n");

        solid = false;
        visible = false;

        other.weapon = new_;

        if (other.weapon === best)
            other.weapon = other.bestWeapon();

        other.setCurrentAmmo();
    }
}
