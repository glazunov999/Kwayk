import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Fly {
    id: root

    avelocity: Qt.vector3d(3, 3, 3)

    flags: Defs.grenade

    property real damage: 120

    th.onPhysics: {
        checkWaterTransition();
    }

    Sound {
        id: bounceSound
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/weapons/bounce.wav"
    }

    bodyComponent: Component {
        Body {
            shape: BoxShape {
                extents: Qt.vector3d(0.06, 0.06, 0.16)
            }

            objectLayer: Layers.Toss
            motionQuality: Body.LinearCast
            motionType: Body.Dynamic

            restitution: 0.6
            friction: 0.8

            Alias {
                id: grenade
                mdl.source: "qrc:/Assets/progs/grenade.mdl"
                skin.source: "qrc:/Assets/progs/skins/grenade.png"
            }

            Think {
                think: () => explode();
                Component.onCompleted: nextthink = time + 2.5;
            }

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                const other = body.ent;

                if (other.takedamage === Defs.damageAim) {
                    explode();
                    return;
                }

                bounceSound.play();

                const velocity = root.body.getLinearVelocity();
                if (velocity === Qt.vector3d(0, 0, 0))
                    root.body.setAngularVelocity(Qt.vector3d(0, 0, 0));
            }
        }
    }

    Component {
        id: sphereComponent
        SphereShape { diameter: 0.2 }
    }

    th.think: () => { remove(); }

    Component.onCompleted: {
        initFly();
        body.setAngularVelocity(avelocity);
    }

    function explode() {
        weapons.t_radiusDamage(self, owner, damage, world);
        th.nextthink = time + 1;
        combat.becomeExplosion(position);

        const shape = sphereComponent.createObject(null);
        const trans = Qt.matrix4x4();

        trans.translate(position);
        const results = physicsSystem.collideShape(shape,
                                                   trans,
                                                   Qt.vector3d(0, 0, 0),
                                                   Layers.BP_Solid,
                                                   Layers.Solid,
                                                   []);

        shape.destroy();

        if (results.length) {
            const result = results[0];
            decals.spawnExplosionDecal(position, result.surfaceNormal);
        }
    }
}
