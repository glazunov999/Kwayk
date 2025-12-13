import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Core
import Kwayk.Game
import Backend

Entity {
    id: root

    classname: "event_lightning"

    property real lightning_end: 0
    property var le1: null
    property var le2: null

    readonly property var shaftComponent: Qt.createComponent("../Weapons/Shaft.qml")

    property var shaft: null

    use: lightning_use

    Sound {
        id: powerSound
        ent: parent
        source: "qrc:/Assets/sounds/misc/power.wav"
        attenuationType: Defs.attnNorm
    }

    function lightning_fire() {
        if (time >= lightning_end) {
            // done here, put the terminals back up
            le1.door_go_down();
            le2.door_go_down();
            shaft?.destroy();
            shaft = null;
            return;
        }

        let p1 = le1.mins.plus(le1.maxs).times(0.5).plus(le1.position);
        p1.y = le1.absmin.y - 0.16;

        let p2 = le2.mins.plus(le2.maxs).times(0.5).plus(le2.position);
        p2.y = le2.absmin.y - 0.16;

        // compensate for length of bolt
        p2 = p2.minus(p2.minus(p1).normalized().times(1.0));

        th.nextthink = time + 0.1;
        th.think = lightning_fire;

        if (!shaft)
            shaft = shaftComponent.createObject(world, { type: 3, position: p1, endpos: p2 });

        shaft.fire();
    }

    function lightning_use() {
        if (lightning_end >= (time + 1))
            return;

        const targets = world.find("target", "lightning");
        le1 = targets[0];
        le2 = targets[1];

        if (!le1 || !le2) {
            console.log("missing lightning targets");
            return;
        }

        if ((le1.__state !== "TOP" && le1.__state !== "BOTTOM")
                || (le2.__state !== "TOP" && le2.__state !== "BOTTOM")
                || (le1.__state !== le2.__state)) {
            return;
        }

        le1.th.nextthink = -1;
        le2.th.nextthink = -1;
        lightning_end = time + 1;

        powerSound.play();
        lightning_fire();

        const bosses = world.find("classname", "monster_boss");
        const boss = bosses[0];
        if (!boss)
            return;

        boss.enemy = activator;

        if (le1.__state === "TOP")
            boss.boss_pain_lightning();
    }
}

