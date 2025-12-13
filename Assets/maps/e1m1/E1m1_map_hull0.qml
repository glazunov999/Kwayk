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
        id: e1m1
        objectName: "e1m1"
        Solid {
            objectName: "water_hull0"
            shape: MeshShape {
                source: "meshes/water_hull0_mesh.mesh"
            }
            objectLayer: Layers.NonSolid
            motionType: Body.Static
        }
        Solid {
            objectName: "slime_hull0"
            shape: MeshShape {
                source: "meshes/slime_hull0_mesh.mesh"
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
