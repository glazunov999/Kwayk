import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Fly {
    id: root

    property real flytime: 0.1

    flags: Defs.tracer3

    Combat { id: combat }

    bodyComponent: Component {
        Body {
            shape: SphereShape {
                diameter: 0.01
            }

            objectLayer: Layers.Toss
            motionQuality: Body.LinearCast
            motionType: Body.Dynamic

            gravityFactor: 0

            Alias {
                id: missile
                mdl.source: "qrc:/Assets/progs/v_spike.mdl"
                skin.source: "qrc:/Assets/progs/skins/v_spike.png"
            }

            Think {
                think: () => remove();
                Component.onCompleted: nextthink = time + 5;
            }

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                const other = body.ent;

                if (other && other.classname === "monster_zombie")
                    combat.t_damage(other, self, self, 110);

                combat.t_radiusDamage(self, owner, 40, world);
                combat.becomeExplosion(position);
            }
        }
    }

    th.think: () => { remove(); }

    Component.onCompleted: {
        initFly();
        th.nextthink = flytime + time;
        th.think = shalHome;
    }

    function shalHome() {
        if (enemy.health < 1) {
            destroy();
            return;
        }

        const vtemp = enemy.position.plus(Qt.vector3d(0, 0.1, 0));
        const dir = vtemp.minus(position).normalized();

        let vel;
        if (vars.skill.value === 3)
            vel = dir.times(3.5);
        else
            vel = dir.times(2.5);

        body.setLinearVelocity(vel);

        th.nextthink = time + 0.2;
        th.think = shalHome;
    }

    function becomeExplosion() {
        particles.particleExplosion(position);
        th.nextthink = time + 1;
        velocity = Qt.vector3d(0, 0, 0);
        solid = false;
        visible = false;
    }
}
