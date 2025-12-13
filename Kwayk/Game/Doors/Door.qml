import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core

Pusher {
    id: root

    readonly property int doorStartOpen: 1
    readonly property int doorDontLink: 4
    readonly property int doorGoldKey: 8
    readonly property int doorSilverKey: 16
    readonly property int doorToggle: 32

    property vector3d offset: Qt.vector3d(0, 0, 0)

    speed: 1
    wait: 3
    lip: 0.08
    dmg: 2

    blocked: door_blocked
    use: door_use

    classname: "door"

    Sound {
        id: noise1
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: noise2
        ent: parent
        attenuationType: Defs.attnNorm
        loops: SpatialSound.Infinite
    }

    Sound {
        id: noise3
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: noise4
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        switch (world.worldtype) {
        case 0:
            noise3.source = "qrc:/Assets/sounds/doors/medtry.wav";
            noise4.source = "qrc:/Assets/sounds/doors/meduse.wav";
            break;
        case 1:
            noise3.source = "qrc:/Assets/sounds/doors/runetry.wav";
            noise4.source = "qrc:/Assets/sounds/doors/runeuse.wav";
            break;
        case 2:
            noise3.source = "qrc:/Assets/sounds/doors/basetry.wav";
            noise4.source = "qrc:/Assets/sounds/doors/baseuse.wav";
            break;
        default:
            console.log("no worldtype set!");
        }

        switch (sounds) {
        case 1:
            noise1.source = "qrc:/Assets/sounds/doors/drclos4.wav";
            noise2.source = "qrc:/Assets/sounds/doors/doormv1.wav";
            break;
        case 2:
            noise2.source = "qrc:/Assets/sounds/doors/hydro1.wav";
            noise1.source = "qrc:/Assets/sounds/doors/hydro2.wav";
            break;
        case 3:
            noise2.source = "qrc:/Assets/sounds/doors/stndr1.wav";
            noise1.source = "qrc:/Assets/sounds/doors/stndr2.wav";
            break;
        case 4:
            noise1.source = "qrc:/Assets/sounds/doors/ddoor2.wav";
            noise2.source = "qrc:/Assets/sounds/doors/ddoor1.wav";
            break;
        }

        if (spawnflags & doorDontLink)
            owner = enemy = root;

        max_health = health;

        if (spawnflags & doorSilverKey)
            items = Defs.itKey1;
        if (spawnflags & doorGoldKey)
            items = Defs.itKey2;

        pos1 = root.position;
        const movedirFabs = Qt.vector3d(Math.abs(movedir.x), Math.abs(movedir.y), Math.abs(movedir.z));
        pos2 = pos1.plus(movedir.times(movedirFabs.dotProduct(size) - lip));

        pos2 = pos2.plus(offset);

        if (spawnflags & doorStartOpen) {
            root.position = pos2;
            pos2 = pos1;
            pos1 = root.position;
        }

        __state = "BOTTOM";

        if (health) {
            takedamage = Defs.damageYes;
            th_die = door_killed;
        }

        if (items)
            wait = -1;

        touch = door_touch;
    }

    function door_blocked() {
        combat.t_damage(other, self, self, dmg);

        if (wait >= 0) {
            if (__state === "DOWN")
                door_go_up();
            else
                door_go_down();
        }
    }

    function door_hit_top() {
        noise1.play();
        noise2.stop();

        __state = "TOP";
        if (spawnflags & doorToggle)
            return;

        th.think = door_go_down;
        th.nextthink = ltime + wait;
    }

    function door_hit_bottom() {
        noise1.play();
        noise2.stop();

        __state = "BOTTOM";
    }

    function door_go_down() {
        noise2.play();

        if (max_health) {
            takedamage = Defs.damageYes;
            health = max_health;
        }

        __state = "DOWN";
        calcMove(pos1, speed, door_hit_bottom);
    }

    function door_go_up() {
        if (__state === "UP")
            return;

        if (__state === "TOP") {
            th.nextthink = ltime + wait;
            return;
        }

        noise2.play();

        __state = "UP";
        calcMove(pos2, speed, door_hit_top);

        useTargets();
    }

    function door_fire() {
        if (owner !== root)
            return;

        if (items)
            noise4.play();

        if (spawnflags & doorToggle) {
            if (__state === "UP" || __state === "TOP") {
                let next = self;
                do {
                    next.door_go_down();
                    next = next.enemy;
                } while (next !== self && next !== world);
                return;
            }
        }

        // trigger all paired doors
        let next = self;
        do {
            next.door_go_up();
            next = next.enemy;
        } while (next !== self && next != world);
    }

    function door_use() {
        message = ""; // door message are for touch only
        owner.message = "";
        enemy.message = "";
        owner.door_fire();
    }

    function door_killed() {
        health = max_health;
        takedamage = Defs.damageNo;
        door_use()
    }

    function door_touch() {
        if (other.classname !== "player")
            return;

        if (owner.touch_finished > time)
            return;

        owner.touch_finished = time + 2;

        if (owner.message !== "") {
            ui.centerprint(owner.message);
            talkSound.play();
        }

        if (!items)
            return;

        if ((items & other.items) !== items) {
            if (owner.items === Defs.itKey1) {
                if (world.worldtype === 2) {
                    ui.centerprint("You need the silver keycard");
                    noise3.play();
                } else if (world.worldtype === 1) {
                    ui.centerprint("You need the silver runekey");
                    noise3.play();
                } else if (world.worldtype === 0) {
                    ui.centerprint("You need the silver key");
                    noise3.play();
                }
            } else {
                if (world.worldtype === 2) {
                    ui.centerprint("You need the gold keycard");
                    noise3.play();
                } else if (world.worldtype === 1) {
                    ui.centerprint("You need the gold runekey");
                    noise3.play();
                } else if (world.worldtype === 0) {
                    ui.centerprint("You need the gold key");
                    noise3.play();
                }
            }
            return;
        }

        other.items -= items;
        touch = null;
        if (enemy)
            enemy.touch = null; // get paired door
        door_use();
    }
}
