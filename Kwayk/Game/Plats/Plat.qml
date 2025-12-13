import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics
import QtQuick3D.SpatialAudio

import Kwayk.Core
import Kwayk.Game
import Backend

Pusher {
    id: root

    readonly property int platLowTrigger: 1

    property var trigger: null

    speed: 1.50
    classname: "func_plat"

    t_length: 0.8
    t_width: 0.1

    sounds: 2

    use: plat_trigger_use
    blocked: plat_crush

    __state: "UP"

    Component {
        id: triggerComponent
        Trigger {
            id: trig

            body: sensor

            Body {
                id: sensor
                shape: BoxShape {
                    extents: trig.size
                }
                isSensor: true
                objectLayer: Layers.Sensor
                motionType: Body.Static
                activation: Body.DontActivate
            }
        }
    }

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
        loops: SpatialSound.Infinite
    }

    Sound {
        id: noise1
        ent: parent
        attenuationType: Defs.attnNorm
    }

    Component.onCompleted: {
        switch (sounds) {
        case 1:
            noise.source = "qrc:/Assets/sounds/plats/plat1.wav";
            noise1.source = "qrc:/Assets/sounds/plats/plat2.wav";
            break;
        case 2:
            noise.source = "qrc:/Assets/sounds/plats/medplat1.wav";
            noise1.source = "qrc:/Assets/sounds/plats/medplat2.wav";
            break;
        }

        pos1 = root.position;
        pos2 = pos1;

        if (height)
            pos2.y = root.position.y - height;
        else
            pos2.y = root.position.y - size.y + 0.08;

        plat_spawn_inside_trigger();

        if (targetname !== "") {
            __state = "UP";
            use = plat_use;
        } else {
            root.position = pos2;
            __state = "BOTTOM";
        }
    }

    function plat_spawn_inside_trigger() {
        let tmins = absmin.plus(Qt.vector3d(0.25, 0, 0.25));
        let tmaxs = absmax.minus(Qt.vector3d(0.25, -0.08, 0.25));
        tmins.y = tmaxs.y - (pos1.y - pos2.y + 0.08);

        if (spawnflags & platLowTrigger)
            tmaxs.y = tmins.y + 0.08;

        if (Math.abs(size.x) <= 0.50) {
            tmins.x = (absmin.x + absmax.x) / 2;
            tmaxs.x = tmins.x + 0.01;
        }

        if (Math.abs(size.z) <= 0.50) {
            tmins.z = (absmin.z + absmax.z) / 2;
            tmaxs.z = tmins.z + 0.01;
        }

        const pos = tmaxs.plus(tmins).times(0.5);

        trigger = triggerComponent.createObject(world, { position: pos, mins: tmins, maxs: tmaxs });
        trigger.touch = plat_center_touch;
    }

    function plat_hit_top() {
        noise1.play();
        noise.stop();
        __state = "TOP";
        th.think = plat_go_down;
        th.nextthink = ltime + 3;
    }

    function plat_hit_bottom() {
        noise1.play();
        noise.stop();
        __state = "BOTTOM";
    }

    function plat_go_down() {
        noise.play();
        __state = "DOWN";
        calcMove(pos2, speed, plat_hit_bottom);
    }

    function plat_go_up() {
        noise.play();
        __state = "UP";
        calcMove(pos1, speed, plat_hit_top);
    }

    function plat_center_touch() {
        if (trigger.other.classname !== "player")
            return;

        if (trigger.other.health <= 0)
            return;

        if (__state === "BOTTOM")
            plat_go_up();
        else if (__state === "TOP")
            th.nextthink = ltime + 1;
    }

    function plat_trigger_use() {
        if (th.think)
            return;

        plat_go_down();
    }

    function plat_crush() {
        combat.t_damage(other, self, self, 1);

        if (__state === "UP")
            plat_go_down();
        else if (__state === "DOWN")
            plat_go_up();
        else
            console.log("plat_crush: bad ", __state);
    }

    function plat_use() {
        use = null;
        if (__state !== "UP")
            console.log("plat_use: not in up state");

        plat_go_down();
    }
}
