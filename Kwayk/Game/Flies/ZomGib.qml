import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Fly {
    id: root

    avelocity: Qt.vector3d(30, 10, 20)

    flags: Defs.zomgib

    Combat { id: combat }

    Sound {
        id: hitSound
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/zombie/z_hit.wav"
    }

    Sound {
        id: missSound
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/zombie/z_miss.wav"
    }

    bodyComponent: Component {
        Body {
            shape: SphereShape {
                diameter: 0.01
            }

            objectLayer: Layers.Toss
            motionQuality: Body.LinearCast
            motionType: Body.Dynamic

            Alias {
                id: grenade
                mdl.source: "qrc:/Assets/progs/zom_gib.mdl"
                skin.source: "qrc:/Assets/progs/skins/zom_gib.png"
            }

            Think {
                think: () => remove();
                Component.onCompleted: nextthink = time + 2.5;
            }

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                const other = body.ent;

                if (other.takedamage === Defs.damageAim) {
                    combat.t_damage(other, self, owner, 10);
                    hitSound.play();
                    root.remove();
                    return;
                }

                missSound.play();

                root.body.setLinearVelocity(Qt.vector3d(0, 0, 0));
                root.body.setAngularVelocity(Qt.vector3d(0, 0, 0));

                remove();
            }
        }
    }

    Component.onCompleted: {
        initFly();
        body.setAngularVelocity(avelocity);
    }
}
