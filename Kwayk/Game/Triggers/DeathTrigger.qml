import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Core
import Kwayk.Game
import Backend

Trigger {
    id: root

    classname: "teledeath"

    touch: tdeath_touch

    body: sensor

    Body {
        id: sensor
        shape: BoxShape {
            extents: owner.size.plus(Qt.vector3d(0.02, 0.02, 0.02))
        }
        isSensor: true
        objectLayer: Layers.Sensor
        motionType: Body.Static
        activation: Body.DontActivate
    }

    Combat {
        id: combat
    }

    function tdeath_touch() {
        if (other === owner)
            return;

        // frag anyone who teleports in on top of an invincible player
        if (other.classname === "player") {
            if (other.invincible_finished > time)
                classname = "teledeath2";
            if (owner.classname !== "player") {
                combat.t_damage(owner, self, self, 50000);
                return;
            }
        }

        if (other.health)
            combat.t_damage(other, self, self, 50000);
    }
}
