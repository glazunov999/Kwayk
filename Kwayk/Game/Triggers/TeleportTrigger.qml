import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core
import Backend

Trigger {
    id: root

    readonly property int playerOnly: 1
    readonly property int silent: 2

    touch: teleport_touch
    use: teleport_use

    Sound {
        id: noise
        ent: parent
        volume: 0.5
        attenuationType: Defs.attnStatic
        source: "qrc:/Assets/sounds/ambience/hum1.wav"
        loops: SpatialSound.Infinite
    }

    Component.onCompleted: {
        if (!(spawnflags & silent))
            noise.play();
    }

    readonly property var tfogComponent: Qt.createComponent("../Misc/Tfog.qml")
    readonly property var tdeathComponent: Qt.createComponent("./DeathTrigger.qml")

    function spawn_tfog(org) {
        tfogComponent.createObject(world, { position: org });
        particles.teleportSplash(org);
    }

    function spawn_tdeath(org, death_owner) {
        tdeathComponent.createObject(world, { position: org, owner: death_owner });
    }

    function teleport_touch() {
        if (targetname) {
            if (th.nextthink < time)
                return; // not fired yet
        }

        if (spawnflags & playerOnly) {
            if (other.classname !== "player")
                return;
        }

        // only teleport living creatures
        if (other.health <= 0 || (other.th.movetype !== "walk" && other.th.movetype !== "step"))
            return;

        useTargets();

        spawn_tfog(other.position);

        const targets = world.find("targetname", target);
        if (!targets.length) {
            console.log("couldn't find target");
            return;
        }

        const t = targets[0];
        const org = t.position.plus(t.forward.times(0.32));
        spawn_tfog(org);
        spawn_tdeath(t.position, other);

        other.body.teleport(t.position, Layers.Walker, []);
        if (!other.health) {
            other.velocity = forward.times(other.velocity.x).plus(forward.times(other.velocity.z));
            return;
        }

        const angles = Qt.vector3d(t.eulerRotation.x, t.eulerRotation.y, t.eulerRotation.z);
        if (other.classname === "player") {
            // TODO: teleport_time
            playerController.playerRotation = angles;
            other.velocity = t.forward.times(3);
            teleportEffect.start();
        } else {
            other.eulerRotation = angles;
        }

        other.onGround = false;
    }

    function teleport_use() {
        th.nextthink = time + 0.2;
        th.think = null;
    }
}
