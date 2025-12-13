import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Core
import Kwayk.Game
import Backend

Entity {
    id: root

    property real alpha: 1.0

    flags: Defs.gib

    th.onPhysics: {
        checkWaterTransition();
    }

    FlyTrail {
        target: root
    }

    Component {
        id: bodyComponent

        Body {
            shape: BoxShape {
                extents: Qt.vector3d(0.05, 0.05, 0.05)
            }

            objectLayer: Layers.Toss
            motionType: Body.Dynamic
            motionQuality: Body.LinearCast

            restitution: 0.6
            friction: 0.8

            onBodyContact: (body, baseOffset, contactPoints, worldSpaceNormal, penetrationDepth) => {
                if (contactPoints.length) {
                    const org = baseOffset.plus(contactPoints[0]);
                    decals.spawnBloodDecal(org, worldSpaceNormal);
                }
            }

            Think {
                think: () => hide.enabled = true;
                Component.onCompleted: nextthink = time + (10 + Math.random() * 10);
            }

            Think {
                id: hide
                enabled: false
                property real startTime: 0
                think: () => {
                    const t = (time - startTime) / 1.0;
                    alpha = 1.0 - t;
                    if (t >= 1.0)
                        root.remove()
                    else
                        nextthink = time + 0.016;
                }
                onEnabledChanged: {
                    startTime = time;
                    nextthink = time + 0.016;
                }
            }
        }
    }

    function remove() {
        destroy()
        body.destroy();
    }

    Component.onCompleted: {
        body = bodyComponent.createObject(world, { position: root.position, eulerRotation: root.eulerRotation });
        position = Qt.binding(function() { return body.position });
        eulerRotation = Qt.binding(function() { return body.eulerRotation });
        body.setLinearVelocity(velocity);
        body.setAngularVelocity(avelocity);
    }
}
