import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_rockettop_png_texture
        objectName: "images/rockettop.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rockettop.png"
    }
    Texture {
        id: images_shot1sid_png_texture
        objectName: "images/shot1sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/shot1sid.png"
    }
    Texture {
        id: images_shot1sid_glow_png_texture
        objectName: "images/shot1sid_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/shot1sid_glow.png"
    }
    Texture {
        id: images_shot1top_png_texture
        objectName: "images/shot1top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/shot1top.png"
    }
    Texture {
        id: images_shot1top_glow_png_texture
        objectName: "images/shot1top_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/shot1top_glow.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
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
    BrushMaterial {
        id: shot1sid_material
        objectName: "shot1sid"
        frameMaps: [
            { colorMap: images_shot1sid_png_texture, fullbrightColorMap: images_shot1sid_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: shot1sid_1_material
        objectName: "shot1sid 1"
        frameMaps: [
            { colorMap: images_shot1sid_png_texture, fullbrightColorMap: images_shot1sid_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: shot1top_material
        objectName: "shot1top"
        frameMaps: [
            { colorMap: images_shot1top_png_texture, fullbrightColorMap: images_shot1top_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_shell1
        objectName: "b_shell1"
        Model {
            id: solid_0
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                rockettop_material,
                shot1sid_material,
                shot1sid_1_material,
                shot1top_material
            ]
        }
    }

    // Animations:
}
