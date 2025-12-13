import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Backend

Entity {
    id: root

    speed: 10.0
    classname: "fireball"

    flags: Defs.rocket

    FlyTrail {
        target: root
    }

    Component {
        id: bodyComponent

        Body {
            shape: SphereShape {
                diameter: 0.01
            }

            objectLayer: Layers.Toss
            motionType: Body.Dynamic
            motionQuality: Body.LinearCast

            Alias {
                mdl.source: "qrc:/Assets/progs/lavaball.mdl"
                skin.source: "qrc:/Assets/progs/skins/lavaball.png"
                emissiveIntensity: 5
                emissiveColor: "#ff2200"
            }

            PointLight {
                color: Qt.rgba(1.0, 0.4, 0.4, 1.0)
                brightness: 1.5
                constantFade: 0.2
                linearFade: 10
                quadraticFade: 2500
                castsShadow: false
            }

            Think {
                id: timer
                think: remove
                Component.onCompleted: nextthink = time + 5;
            }

            onBodyContact: remove();
        }
    }

    property vector3d origin: Qt.vector3d(0, 0, 0)

    Component.onCompleted: {
        origin = Qt.vector3d(position.x, position.y, position.z);
        misc_fireball();
    }

    function remove() {
        body?.destroy();
        position = Qt.vector3d(position.x, position.y, position.z);
        velocity = Qt.vector3d(0, 0, 0);
    }

    function misc_fireball() {
        th.think = fire_fly;
        th.nextthink = time + (Math.random() * 5)
    }

    function fire_fly() {
        remove();
        body = bodyComponent.createObject(world, { position: root.origin });
        position = Qt.binding(function() { return body.position });
        velocity = Qt.vector3d((Math.random() * 1) - 0.5, root.speed + (Math.random() * 2), (Math.random() * 1) - 0.5);
        body.setLinearVelocity(velocity);
        th.nextthink = time + (Math.random() * 5) + 3;
        th.think = fire_fly;
    }
}
