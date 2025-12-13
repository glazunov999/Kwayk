import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Game

Fly {
    id: root

    property int type: 0
    readonly property var spikes: [ "spike", "s_spike", "w_spike", "k_spike" ]

    flags: type < 2 ? 0 : type === 2 ? Defs.tracer : Defs.tracer2

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
                id: spike
                mdl.source:  "qrc:/Assets/progs/" + spikes[type] + ".mdl";
                skin.source: "qrc:/Assets/progs/skins/" + spikes[type] + ".png"
            }

            Think {
                think: () => remove();
                Component.onCompleted: nextthink = time + 6;
            }

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                const other = body.ent;

                if (other.takedamage) {
                    const normal = worldSpaceNormal.times(-1);
                    combat.spawn_touchblood(position, velocity, normal, type === 0 ? 9 : 18);
                    combat.t_damage(other, self, owner, type === 0 ? 9 : 18);

                    const dir = velocity.normalized();
                    const bloodTrace = physicsSystem.castRay(position, dir.times(1.2), Layers.BP_Solid, Layers.Solid, []);
                    if (bloodTrace.fraction < 1.0)
                        decals.spawnBloodDecal(bloodTrace.position, bloodTrace.normal);
                } else {
                    switch (type) {
                    case 0:
                        particles.runParticleEffect(position, Qt.vector3d(0, 0, 0), 0, 10);
                        break;
                    case 1:
                        particles.runParticleEffect(position, Qt.vector3d(0, 0, 0), 0, 20);
                        break;
                    case 2:
                        particles.runParticleEffect(position, Qt.vector3d(0, 0, 0), 20, 20);
                        break;
                    }

                    decals.spawnBulletHole(position, worldSpaceNormal);
                }

                root.remove();
            }
        }
    }

    Component.onCompleted: {
        initFly();
    }
}
