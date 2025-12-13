import QtQuick
import QtQuick3D

import Kwayk.Core
import Kwayk.Game

Pusher {
    id: root

    readonly property real secretOpenOnce: 1
    readonly property real secretFirstLeft: 2
    readonly property real secretFirstDown: 4
    readonly property real secretNoShoot: 8
    readonly property real secretYesShoot: 16

    property vector3d oldorigin: null

    speed: 0.5
    wait: 5
    dmg: 2

    sounds: 3

    Sound {
        id: noise1
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: noise2
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: noise3
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        switch (sounds) {
        case 1:
            noise1.source = "qrc:/Assets/sounds/doors/latch2.wav";
            noise2.source = "qrc:/Assets/sounds/doors/winch2.wav";
            noise3.source = "qrc:/Assets/sounds/doors/drclos4.wav";
            break;
        case 2:
            noise2.source = "qrc:/Assets/sounds/doors/airdoor1.wav";
            noise1.source = "qrc:/Assets/sounds/doors/airdoor2.wav";
            noise3.source = "qrc:/Assets/sounds/doors/airdoor2.wav";
            break;
        case 3:
            noise2.source = "qrc:/Assets/sounds/doors/basesec1.wav";
            noise1.source = "qrc:/Assets/sounds/doors/basesec2.wav";
            noise3.source = "qrc:/Assets/sounds/doors/basesec2.wav";
            break;
        }

        blocked = secret_blocked;
        touch = secret_touch;
        use = secret_use;

        if (!targetname || (spawnflags & secretYesShoot)) {
            health = 10000;
            takedamage = Defs.damageYes;
            th_pain = secret_use;
            th_die = secret_use;
        }

        oldorigin = Qt.vector3d(position.x, position.y, position.z);
    }

    function secret_blocked() {
        if (time < attack_finished)
            return;

        attack_finished = time + 0.5;
        combat.t_damage(other, self, self, dmg);
    }

    function secret_use() {
        health = 10000;

        // exit if still moving arount...
        if (!position.fuzzyEquals(oldorigin))
            return;

        useTargets();

        if (!(spawnflags & secretNoShoot)) {
            th_pain = null;
            takedamage = Defs.damageNo;
        }

        velocity = Qt.vector3d(0, 0, 0);
        th.nextthink = ltime + 0.1;

        const temp = 1 - (spawnflags & secretFirstLeft); // 1 or -1

        if (!t_width) {
            if (spawnflags & secretFirstDown)
                t_width = Math.abs(up.dotProduct(root.size));
            else
                t_width = Math.abs(right.dotProduct(root.size));
        }

        if (!t_length)
            t_length = Math.abs(forward.dotProduct(root.size));

        if (spawnflags & secretFirstDown)
            dest1 = root.position.minus(up.times(t_width));
        else
            dest1 = root.position.plus(right.times(t_width).times(temp));

        dest2 = dest1.plus(forward.times(t_length));
        calcMove(dest1, speed, secret_move1);
        noise2.play();
    }

    function secret_move1() {
        th.nextthink = ltime + 1.0;
        th.think = secret_move2;
        noise3.play();
    }

    function secret_move2() {
        noise2.play();
        calcMove(dest2, speed, secret_move3);
    }

    function secret_move3() {
        noise3.play();
        if (!(spawnflags & secretOpenOnce)) {
            th.nextthink = ltime + wait;
            th.think = secret_move4;
        }
    }

    function secret_move4() {
        noise2.play();
        calcMove(dest1, speed, secret_move5);
    }

    function secret_move5() {
        th.nextthink = ltime + 1.0;
        th.think = secret_move6;
        noise3.play();
    }

    function secret_move6() {
        noise2.play();
        calcMove(oldorigin, speed, secret_done);
    }

    function secret_done() {
        if (!targetname || (spawnflags & secretYesShoot)) {
            health = 10000;
            takedamage = Defs.damageYes
            th_pain = secret_use;
            th_die = secret_use;
        }
        noise3.play();
    }

    function secret_touch() {
        if (other.classname !== "player")
            return;

        if (touch_finished > time)
            return;

        touch_finished = time + 2;

        if (message) {
            ui.centerprint(message);
            talkSound.play();
        }
    }
}
