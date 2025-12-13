import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core

Pusher {
    id: root

    speed: 0.4
    wait: 1
    lip: 0.04

    use: button_use

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        switch (sounds) {
        case 0:
            noise.source = "qrc:/Assets/sounds/buttons/airbut1.wav";
            break;
        case 1:
            noise.source = "qrc:/Assets/sounds/buttons/switch21.wav";
            break;
        case 2:
            noise.source = "qrc:/Assets/sounds/buttons/switch02.wav";
            break;
        case 3:
            noise.source = "qrc:/Assets/sounds/buttons/switch04.wav";
            break;
        }

        if (health) {
            max_health = health;
            th_die = button_killed;
            takedamage = Defs.damageYes;
        } else {
            touch = button_touch;
        }

        __state = "BOTTOM";

        pos1 = root.position;
        const movedirFabs = Qt.vector3d(Math.abs(movedir.x), Math.abs(movedir.y), Math.abs(movedir.z));
        pos2 = pos1.plus(movedir.times(movedirFabs.dotProduct(size) - lip));
    }

    function button_touch() {
        if (other.classname !== "player")
            return;

        enemy = other;
        button_fire();
    }

    function button_wait() {
        __state = "TOP";
        th.nextthink = ltime + wait;
        th.think = button_return;
        activator = enemy;
        useTargets();
        th.frame = 1;
    }

    function button_done() {
        __state = "BOTTOM";
    }

    function button_return() {
        __state = "DOWN";
        calcMove(pos1, speed, button_done);
        th.frame = 0;
        if (health)
            takedamage = Defs.damageYes;
    }

    function button_fire() {
        if (__state === "UP" || __state === "TOP")
            return;

        noise.play();

        __state = "UP";
        calcMove(pos2, speed, button_wait);
    }

    function button_use() {
        enemy = activator;
        button_fire();
    }

    function button_killed() {
        enemy = damage_attacker;
        health = max_health;
        takedamage = Defs.damageNo;
        button_fire();
    }
}
