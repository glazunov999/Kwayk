import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.b_bh100

Item {
    id: root

    readonly property int hRotten: 1
    readonly property int hMega: 2

    property int healtype: 1
    property int healamount: 25

    mins: Qt.vector3d(0, 0, -0.32)
    maxs: Qt.vector3d(0.32, 0.56, 0)

    classname: "item_health"

    touch: health_touch

    model: Loader3D {
        id: loader
    }

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Think {
        id: rotTimer
        running: true
    }

    Component.onCompleted: {
        if (spawnflags & hRotten) {
            loader.source = "qrc:/Assets/maps/b_bh10/B_bh10_map.qml";
            noise.source = "qrc:/Assets/sounds/items/r_item1.wav";
            healamount = 15;
            healtype = 0;
        } else if (spawnflags & hMega) {
            loader.source = "qrc:/Assets/maps/b_bh100/B_bh100_map.qml";
            noise.source = "qrc:/Assets/sounds/items/r_item2.wav";
            healamount = 100;
            healtype = 2;
        } else {
            loader.source = "qrc:/Assets/maps/b_bh25/B_bh25_map.qml";
            noise.source = "qrc:/Assets/sounds/items/health1.wav";
            healamount = 25;
            healtype = 1;
        }
    }

    function t_heal(e, healamount, ignore) {
        if (e.health <= 0)
            return false;
        if (!ignore && e.health >= other.max_health)
            return false;

        healamount = Math.ceil(healamount);

        e.health += healamount;
        if (!ignore && e.health >= other.max_health)
            e.health = other.max_health;

        if (e.health > 250)
            e.health = 250;

        return true;
    }

    function item_megahealth_rot() {
        const other = owner;

        if (other.health > other.max_health) {
            other.health--;
            rotTimer.nextthink = time + 1;
            return;
        }

        other.items = other.items - (other.items & Defs.itSuperHealth);
    }

    function health_touch() {
        if (other.classname !== "player")
            return;

        if (healtype === 2) { // Megahealth? Ignore max_health...
            if (other.health >= 250)
                return;
            if (!t_heal(other, healamount, true))
                return;
        } else {
            if (!t_heal(other, healamount, false))
                return;
        }
        ui.conPrint(`You receive ${healamount}\n`);

        noise.play();

        game.stuffcmd("bf\n");

        solid = false;
        visible = false;

        if (healtype === 2) {
            other.items |= Defs.itSuperHealth;
            rotTimer.nextthink = time + 5;
            rotTimer.think = item_megahealth_rot;
            owner = other;
        }

        activator = other;
        useTargets();
    }
}
