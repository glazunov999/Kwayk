import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_batt0top_png_texture
        objectName: "images/batt0top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/batt0top.png"
    }
    Texture {
        id: images_batt1sid_png_texture
        objectName: "images/batt1sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/batt1sid.png"
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
        id: batt0top_material
        objectName: "batt0top"
        frameMaps: [
            { colorMap: images_batt0top_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: batt1sid_material
        objectName: "batt1sid"
        frameMaps: [
            { colorMap: images_batt1sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: batt1sid_1_material
        objectName: "batt1sid 1"
        frameMaps: [
            { colorMap: images_batt1sid_png_texture }
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
        id: b_batt0
        objectName: "b_batt0"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                batt0top_material,
                batt1sid_material,
                batt1sid_1_material,
                rockettop_material
            ]
        }
    }

    // Animations:
}
