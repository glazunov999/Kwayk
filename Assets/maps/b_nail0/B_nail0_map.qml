import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_nail0sid_png_texture
        objectName: "images/nail0sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nail0sid.png"
    }
    Texture {
        id: images_nail0top_png_texture
        objectName: "images/nail0top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nail0top.png"
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
        id: nail0sid_material
        objectName: "nail0sid"
        frameMaps: [
            { colorMap: images_nail0sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nail0sid_1_material
        objectName: "nail0sid 1"
        frameMaps: [
            { colorMap: images_nail0sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nail0top_material
        objectName: "nail0top"
        frameMaps: [
            { colorMap: images_nail0top_png_texture }
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
        id: b_nail0
        objectName: "b_nail0"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                nail0sid_material,
                nail0sid_1_material,
                nail0top_material,
                rockettop_material
            ]
        }
    }
    // Animations:
}
