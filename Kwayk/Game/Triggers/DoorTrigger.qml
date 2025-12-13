import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Backend

Trigger {
    id: root

    touch: door_trigger_touch

    body: linkDoor

    Body {
        id: linkDoor
        shape: BoxShape {
            extents: root.size
        }
        isSensor: true
        objectLayer: Layers.Sensor
        motionType: Body.Static
        activation: Body.DontActivate
    }

    Component.onCompleted: linkDoors()

    function door_trigger_touch() {
        if (other.health <= 0)
            return;

        if (time < attack_finished)
            return;

        attack_finished = time + 1;

        activator = other;

        owner.door_use();
    }

    function linkDoors() {
        if (!owner)
            return;

        let cmins = owner.absmin;
        let cmaxs = owner.absmax;
        let door = owner.enemy;

        while (door && door !== owner) {
            cmins = Qt.vector3d(
                Math.min(cmins.x, door.absmin.x),
                Math.min(cmins.y, door.absmin.y),
                Math.min(cmins.z, door.absmin.z)
            );
            cmaxs = Qt.vector3d(
                Math.max(cmaxs.x, door.absmax.x),
                Math.max(cmaxs.y, door.absmax.y),
                Math.max(cmaxs.z, door.absmax.z)
            );
            door = door.enemy;
        }

        const expand = Qt.vector3d(0.60, 0.08, 0.60);
        cmins = cmins.minus(expand);
        cmaxs = cmaxs.plus(expand);

        position = cmins.plus(cmaxs).times(0.5);
        mins = cmins.minus(position);
        maxs = cmaxs.minus(position);
    }
}
