import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Fly {
    id: root

    flags: Defs.rocket

    bodyComponent: Component {
        Body {
            shape: SphereShape {
                diameter: 0.01
            }

            objectLayer: Layers.Toss
            motionType: Body.Dynamic
            motionQuality: Body.LinearCast

            gravityFactor: 0

            Alias {
                id: missile
                mdl.source: "qrc:/Assets/progs/missile.mdl"
                skin.source: "qrc:/Assets/progs/skins/missile.png"
            }

            PointLight {
                color: Qt.rgba(0.8, 0.6, 0.2, 1.0)
                brightness: 1.5
                constantFade: 0.2
                linearFade: 10
                quadraticFade: 2500
                castsShadow: false
            }

            Think {
                think: () => remove();
                Component.onCompleted: nextthink = time + 5;
            }

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                const other = body.ent;
                let damg = 100 + Math.random() * 20;

                if (other.health) {
                    if (other.classname === "monster_shambler")
                        damg *= 0.5; // mostly immune
                    combat.t_damage(other, self, owner, damg);
                }

                combat.t_radiusDamage(self, owner, 120, other);
                const org = position.minus(velocity.normalized().times(0.08));
                th.nextthink = time + 1;
                combat.becomeExplosion(org);
                decals.spawnExplosionDecal(org, worldSpaceNormal);
            }
        }
    }

    th.think: () => { remove(); }

    Component.onCompleted: {
        initFly();
    }
}
