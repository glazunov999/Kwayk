import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

import Kwayk.Game
import Kwayk.Core
import Backend

Node {
    id: root

    readonly property alias mdl: mdl
    readonly property alias skin: skin
    readonly property alias model: model

    property alias active: geometry.active
    property alias interpolate: geometry.interpolate
    property alias castsShadows: model.castsShadows
    property alias receivesShadows: model.receivesShadows
    property alias frame: geometry.frameIndex
    property alias alpha: material.alpha
    property alias emissiveIntensity: material.emissiveIntensity
    property alias emissiveColor: material.emissiveColor

    ResourceLoader {
        geometries: [
            geometry
        ]
        textures:  [
            skin
        ]
    }

    Model {
        id: model
        eulerRotation.y: 90
        geometry: MdlGeometry {
            id: geometry
            time: main.time * 1000
        }
        materials: AliasMaterial {
            id: material
            colorMap: Texture {
                id: skin
            }
        }
    }

    Mdl {
        id: mdl
        onLoaded: {
            geometry.mdl = mdl;
        }
        onError: (err) => {
            console.log("Error:", err);
            // TODO: print to console
        }
    }
}
