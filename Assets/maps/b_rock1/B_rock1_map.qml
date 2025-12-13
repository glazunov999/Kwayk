import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_rock1sid_png_texture
        objectName: "images/rock1sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rock1sid.png"
    }
    Texture {
        id: images_rockettop_png_texture
        objectName: "images/rockettop.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rockettop.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: rock1sid_material
        objectName: "rock1sid"
        frameMaps: [
            { colorMap: images_rock1sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rock1sid_1_material
        objectName: "rock1sid 1"
        frameMaps: [
            { colorMap: images_rock1sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rockettop_material
        objectName: "rockettop"
        frameMaps: [
            { colorMap: images_rockettop_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_rock1
        objectName: "b_rock1"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                rock1sid_material,
                rock1sid_1_material,
                rockettop_material
            ]
        }
    }

    // Animations:
}
