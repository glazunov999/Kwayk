import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Node {
    id: node

    // Nodes:
    Node {
        id: start
        objectName: "start"
        Solid {
            id: water_hull0
            objectName: "water_hull0"
            shape: MeshShape {
                source: "meshes/water_hull0_mesh.mesh"
            }
            objectLayer: Layers.NonSolid
            motionType: Body.Static
        }
        Solid {
            id: lava_hull0
            objectName: "lava_hull0"
            shape: MeshShape {
                source: "meshes/lava_hull0_mesh.mesh"
            }
            objectLayer: Layers.NonSolid
            motionType: Body.Static
        }
        Solid {
            id: solid_0_hull0
            objectName: "solid_0_hull0"
            shape: MeshShape {
                source: "meshes/solid_0_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Static
        }
    }

    // Animations:
}
