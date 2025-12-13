import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Core
import Kwayk.Game
import Backend

Pusher {
    id: root

    classname: "func_train"

    speed: 1.0
    dmg: 2

    use: train_use
    blocked: train_blocked

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: noise1
        ent: parent
        attenuationType: Defs.attnNorm
        loops: SpatialSound.Infinite
    }

    Component.onCompleted: {
        if (sounds === 0) {
            // no sound
        } else if (sounds === 1) {
            noise.source = "qrc:/Assets/sounds/plats/train2.wav";
            noise1.source = "qrc:/Assets/sounds/plats/train1.wav";
        }

        th.think = func_train_find;
        th.nextthink = ltime + 0.1;
    }

    function train_blocked() {
        if (time < attack_finished)
            return;

        attack_finished = time + 0.5;
        combat.t_damage(other, self, self, dmg);
    }

    function train_use() {
        if (th.think !== func_train_find)
            return; // already activated

        train_next();
    }

    function train_wait() {
        if (wait) {
            th.nextthink = ltime + wait;
            noise.play();
            noise1.stop();
        } else {
            th.nextthink = ltime + 0.1;
        }

        th.think = train_next;
    }

    function train_next() {
        const targets = world.find("targetname", target);
        if (targets.length === 0) {
            console.log("train_next: no next target", target);
            return;
        }

        const targ = targets[0];
        target = targ.target;

        if (!target) {
            console.log("train_next: no next target");
            return;
        }

        if (targ.wait)
            wait = targ.wait;
        else
            wait = 0;

        noise1.play();
        calcMove(targ.position.minus(mins.times(Qt.vector3d(1, 1, -1))), speed, train_wait);
    }

    function func_train_find() {
        const targets = world.find("targetname", target);
        if (targets.length === 0) {
            console.log("func_train_find: no target", target);
            return;
        }

        const targ = targets[0];
        target = targ.target;
        root.position = targ.position.minus(mins.times(Qt.vector3d(1, 1, -1)));

        if (!targetname) {
            // not triggered, so start immediately
            th.nextthink = ltime + 0.1;
            th.think = train_next;
        }
    }
}

