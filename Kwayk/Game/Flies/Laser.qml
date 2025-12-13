import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Fly {
    id: root

    Combat { id: combat }

    Sound {
        id: enfstopSound
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/enforcer/enfstop.wav"
    }

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
                id: mis
                mdl.source: "qrc:/Assets/progs/laser.mdl"
                skin.source: "qrc:/Assets/progs/skins/laser.png"
            }

            Think {
                think: () => remove();
                Component.onCompleted: nextthink = time + 5;
            }

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                const other = body.ent;

                enfstopSound.play();

                if (other.health) {
                    const org = position.minus(velocity.normalized().times(0.08));
                    combat.spawnBlood(org, velocity.times(0.2), 15);
                    combat.t_damage(other, self, owner, 15);
                }

                remove();
            }
        }
    }

    Component.onCompleted: {
        initFly();
    }
}
