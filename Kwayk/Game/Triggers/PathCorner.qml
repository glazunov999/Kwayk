import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Backend
import "../../js/vec.js" as Vec

Trigger {
    id: root

    touch: t_movetarget

    body: sensor

    classname: "path_corner"

    Body {
        id: sensor
        shape: BoxShape {
            extents: Qt.vector3d(0.16, 0.16, 0.16)
        }
        isSensor: true
        objectLayer: Layers.Sensor
        motionType: Body.Static
        activation: Body.DontActivate
    }

    function t_movetarget() {
        if (other?.movetarget !== root)
            return;

        if (other.enemy)
            return; // fighting, not following a path

        // Find next path_corner
        const targets = world.find("targetname", target);
        if (targets.length === 0) {
            other.pausetime = time + 999999;
            if (other.th_stand)
                other.th_stand();
            return;
        }

        const nextCorner = targets[0];
        other.goalentity = nextCorner;
        other.movetarget = nextCorner;

        const dir = nextCorner.position.minus(other.position);
        other.ideal_yaw = Vec.vectoyaw(dir);
    }
}
