import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Core
import Kwayk.Game
import Backend

Entity {
    id: root

    readonly property alias noise: noise
    property var others: []

    Connections {
        target: body
        function onBodyEntered(body) {
            const ent = body.ent ? body.ent : null;
            if (ent && others.indexOf(ent) === -1)
                others = others.concat([ent]);
        }
        function onBodyExited(body) {
            const ent = body.ent ? body.ent : null;
            if (ent)
                others = others.filter(e => e !== ent);
        }
    }

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
    }

    th.onPhysics: {
        if (touch !== null && solid) {
            for (let i = 0; i < others.length; i++) {
                other = others[i];
                touch();
            }
        }
    }

    Component.onCompleted: {
        if (body) {
            body.objectLayer = Qt.binding(function() {
                return health ? Layers.Monster : Layers.Sensor
            })
            body.isSensor = Qt.binding(function() {
                return health <= 0;
            })
        }
    }

    function multi_wait() {
        if (max_health) {
            health = max_health;
            takedamage = Defs.damageYes;
        }
    }

    function multi_trigger() {
        if (th.nextthink > time)
            return;

        if (classname === "trigger_secret") {
            if (enemy.classname !== "player")
                return;

            found_secrets++;
        }

        noise.play();

        takedamage = Defs.damageNo;

        activator = enemy;

        useTargets();

        if (wait > 0) {
            th.think = multi_wait;
            th.nextthink = time + wait;
        } else {
            touch = null;
            solid = false;
        }
    }
}
