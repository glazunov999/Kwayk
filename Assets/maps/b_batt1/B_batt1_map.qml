import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_batt0sid_png_texture
        objectName: "images/batt0sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/batt0sid.png"
    }
    Texture {
        id: images_batt1top_png_texture
        objectName: "images/batt1top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/batt1top.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: batt0sid_material
        objectName: "batt0sid"
        frameMaps: [
            { colorMap: images_batt0sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: batt0sid_1_material
        objectName: "batt0sid 1"
        frameMaps: [
            { colorMap: images_batt0sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: batt1top_material
        objectName: "batt1top"
        frameMaps: [
            { colorMap: images_batt1top_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_batt1
        objectName: "b_batt1"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                batt0sid_material,
                batt0sid_1_material,
                batt1top_material
            ]
        }
    }

    // Animations:
}
