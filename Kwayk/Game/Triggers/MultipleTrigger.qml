import QtQuick
import QtQuick3D

import Kwayk.Core
import Kwayk.Game

Trigger {
    id: root

    readonly property int noTouch: 1

    classname: "trigger_mutiple"

    wait: 0.2

    use: multi_use

    Component.onCompleted: {
        switch (sounds) {
        case 1:
            noise.source = "qrc:/Assets/sounds/misc/secret.wav";
            break;
        case 2:
            noise.source = "qrc:/Assets/sounds/misc/talk.wav";
            break;
        case 3:
            noise.source = "qrc:/Assets/sounds/misc/trigger1.wav";
            break;
        }

        if (health) {
            if (spawnflags & noTouch)
                console.log("health and notouch don't make sense");

            max_health = health;
            th_die = multi_killed;
            takedamage = Defs.damageYes;
        } else if (!(spawnflags & noTouch)) {
            touch = multi_touch;
        }
    }

    function multi_use() {
        enemy = activator;
        multi_trigger();
    }

    function multi_killed() {
        multi_trigger();
    }

    function multi_touch() {
        if (other.classname !== "player")
            return;

        enemy = other;
        multi_trigger();
    }
}
