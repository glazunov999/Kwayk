import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images_nail1sid_png_texture
        objectName: "images/nail1sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nail1sid.png"
    }
    Texture {
        id: images_nail1sid_glow_png_texture
        objectName: "images/nail1sid_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nail1sid_glow.png"
    }
    Texture {
        id: images_nail1top_png_texture
        objectName: "images/nail1top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nail1top.png"
    }
    Texture {
        id: images_nail1top_glow_png_texture
        objectName: "images/nail1top_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nail1top_glow.png"
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
        id: nail1sid_material
        objectName: "nail1sid"
        frameMaps: [
            { colorMap: images_nail1sid_png_texture, fullbrightColorMap: images_nail1sid_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nail1sid_1_material
        objectName: "nail1sid 1"
        frameMaps: [
            { colorMap: images_nail1sid_png_texture, fullbrightColorMap: images_nail1sid_glow_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nail1top_material
        objectName: "nail1top"
        frameMaps: [
            { colorMap: images_nail1top_png_texture, fullbrightColorMap: images_nail1top_glow_png_texture }
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
        id: b_nail1
        objectName: "b_nail1"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                nail1sid_material,
                nail1sid_1_material,
                nail1top_material,
                rockettop_material
            ]
        }
    }

    // Animations:
}
