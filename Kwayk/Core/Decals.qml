import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core

import "../js/clipper.js" as C

Node {
    id: root

    readonly property var bulletDecals: [
        "qrc:/Assets/decals/bullet_0.png",
        "qrc:/Assets/decals/bullet_1.png",
        "qrc:/Assets/decals/bullet_2.png",
        "qrc:/Assets/decals/bullet_3.png",
        "qrc:/Assets/decals/bullet_4.png",
        "qrc:/Assets/decals/bullet_5.png",
        "qrc:/Assets/decals/bullet_6.png",
        "qrc:/Assets/decals/bullet_7.png"
    ]

    readonly property var bloodDecals: [
        "qrc:/Assets/decals/blood_0.png",
        "qrc:/Assets/decals/blood_1.png",
        "qrc:/Assets/decals/blood_2.png",
        "qrc:/Assets/decals/blood_3.png",
        "qrc:/Assets/decals/blood_4.png",
        "qrc:/Assets/decals/blood_5.png",
        "qrc:/Assets/decals/blood_6.png",
        "qrc:/Assets/decals/blood_7.png"
    ]

    property var decals: []

    Component {
        id: decalComponent

        Model {
            id: decal

            property var triangles: []
            property vector3d dimensions: Qt.vector3d(0, 0, 0)
            property real spawnTime: 0
            property real fadeStartTime: 0
            property real deathTime: 0
            property int lifeSpan: 0
            property int fadeDuration: 2000

            property alias source: decalTexture.source
            property alias bias: decalMaterial.depthBias
            property alias alpha: decalMaterial.alpha

            readonly property var cubePlanes: [
                { n: Qt.vector3d( 1,  0,  0), d: 0 },
                { n: Qt.vector3d(-1,  0,  0), d: 0 },
                { n: Qt.vector3d( 0,  1,  0), d: 0 },
                { n: Qt.vector3d( 0, -1,  0), d: 0 },
                { n: Qt.vector3d( 0,  0,  1), d: 0 },
                { n: Qt.vector3d( 0,  0, -1), d: 0 },
            ]

            geometry: DecalGeometry {
                id: decalGeometry
            }

            materials: DecalMaterial {
                id: decalMaterial
                depthBias: 0.001
                alpha: 0.8

                colorMap: Texture {
                    id: decalTexture
                    generateMipmaps: true
                    mipFilter: Texture.Linear
                }
            }

            Component.onCompleted: {
                calculateDecal();

                if (lifeSpan > 0) {
                    spawnTime = main.time;
                    fadeStartTime = spawnTime + lifeSpan / 1000.0;
                    deathTime = fadeStartTime + fadeDuration / 1000.0;
                }
            }

            Connections {
                target: main
                function onTimeChanged() {
                    if (deathTime > 0) {
                        if (main.time >= deathTime) {
                            const index = decals.indexOf(decal);
                            decals.splice(index, 1);
                            decal.destroy();
                        } else if (main.time >= fadeStartTime) {
                            const fadeProgress = (main.time - fadeStartTime) / (fadeDuration / 1000.0);
                            decal.alpha = 0.8 * (1.0 - Math.min(1.0, fadeProgress));
                        }
                    }
                }
            }

            function calculateCubePlanes() {
                for (const plane of cubePlanes)
                    plane.d = -Math.abs(dimensions.dotProduct(plane.n)) / 2;
            }

            function calculateFade(z) {
                const fade = 1.0 - Math.abs(z) / (dimensions.z / 2);
                return Math.max(0.0, Math.min(1.0, fade));
            }

            function calculateDecal() {
                calculateCubePlanes();

                const vertices = [];
                const texCoords = [];
                const fades = [];

                for (const triangle of triangles) {
                    if (triangle.body !== parent)
                        continue;

                    const v0 = decal.mapPositionFromScene(triangle.vertex0);
                    const v1 = decal.mapPositionFromScene(triangle.vertex1);
                    const v2 = decal.mapPositionFromScene(triangle.vertex2);

                    let verts = [v0, v1, v2];
                    for (let i = 0; i < 6; ++i)
                        verts = C.clipFace(verts, cubePlanes[i]);

                    for (let j = 0; j < verts.length; j+= 3) {
                        const v0 = verts[j + 0];
                        const v1 = verts[j + 1];
                        const v2 = verts[j + 2];

                        texCoords.push(Qt.vector2d(v0.x / dimensions.x + 0.5, v0.y / dimensions.y + 0.5),
                                       Qt.vector2d(v1.x / dimensions.x + 0.5, v1.y / dimensions.y + 0.5),
                                       Qt.vector2d(v2.x / dimensions.x + 0.5, v2.y / dimensions.y + 0.5));

                        fades.push(calculateFade(v0.z), calculateFade(v1.z), calculateFade(v2.z));

                        vertices.push(v0, v1, v2);
                    }
                }

                decalGeometry.setTriangles(vertices, texCoords, fades);
            }
        }
    }

    function clear() {
        decals.forEach(decal => decal.destroy());
        decals = [];
    }

    function spawnDecalsForBodies(org, normal, dimensions, source, lifeSpan, lifeSpanVariation) {
        const rotation = Quaternion.lookAt(Qt.vector3d(0, 0, 0), normal).toEulerAngles();
        rotation.z = Math.random() * 360;
        lifeSpan = lifeSpan + (Math.random() - 0.5) * 2 * lifeSpanVariation;

        const triangles = physicsSystem.getTriangles(org, dimensions, org, Layers.BP_Solid, Layers.Solid, []);
        const bodyTriangles = new Map()
        for (const triangle of triangles) {
            let list = bodyTriangles.get(triangle.body);
            if (!list) {
                list = [];
                bodyTriangles.set(triangle.body, list);
            }
            list.push(triangle);
        }

        for (const [body, triangles] of bodyTriangles) {
            const decal = decalComponent.createObject(body, {
                source,
                position: body.mapPositionFromScene(org),
                eulerRotation: rotation,
                triangles,
                dimensions,
                lifeSpan
            });
            decals.push(decal);
        }
    }

    function spawnBulletHole(org, normal) {
        if (!vars.r_decals.value)
            return;

        const source = bulletDecals[Math.floor(Math.random() * 8)];
        spawnDecalsForBodies(org, normal, Qt.vector3d(0.06, 0.06, 0.06), source, 25000, 5000);
    }

    function spawnExplosionDecal(org, normal) {
        if (!vars.r_decals.value)
            return;

        const source = bulletDecals[Math.floor(Math.random() * 8)];
        spawnDecalsForBodies(org, normal, Qt.vector3d(1.02, 1.02, 1.02), source, 25000, 5000);
    }

    function spawnBloodDecal(org, normal) {
        if (!vars.r_decals.value)
            return;

        const source = bloodDecals[Math.floor(Math.random() * 8)];
        const scale = 0.32 + Math.random() * 0.16;
        spawnDecalsForBodies(org, normal, Qt.vector3d(scale, scale, scale), source, 25000, 5000);
    }
}
