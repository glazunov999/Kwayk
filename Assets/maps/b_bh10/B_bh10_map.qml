import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_med3_0_png_texture
        objectName: "images/med3_0.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/med3_0.png"
    }
    Texture {
        id: images_med3_0_glow_png_texture
        objectName: "images/med3_0_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/med3_0_glow.png"
    }
    Texture {
        id: images_med3_1_png_texture
        objectName: "images/med3_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/med3_1.png"
    }
    Texture {
        id: images_med3_1_glow_png_texture
        objectName: "images/med3_1_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/med3_1_glow.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: med3_0_material
        objectName: "med3_0"
        frameMaps: [
            { colorMap: images_med3_0_png_texture, fullbrightColorMap: images_med3_0_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: med3_1_material
        objectName: "med3_1"
        frameMaps: [
            { colorMap: images_med3_1_png_texture, fullbrightColorMap: images_med3_1_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: med3_1_1_material
        objectName: "med3_1 1"
        frameMaps: [
            { colorMap: images_med3_1_png_texture, fullbrightColorMap: images_med3_1_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_bh10
        objectName: "b_bh10"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                med3_0_material,
                med3_1_material,
                med3_1_1_material
            ]
        }
    }

    // Animations:
}
