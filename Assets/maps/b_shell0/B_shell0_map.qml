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
        id: images_shot0sid_png_texture
        objectName: "images/shot0sid.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/shot0sid.png"
    }
    Texture {
        id: images_shot0top_png_texture
        objectName: "images/shot0top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/shot0top.png"
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
        id: shot0sid_material
        objectName: "shot0sid"
        frameMaps: [
            { colorMap: images_shot0sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: shot0sid_1_material
        objectName: "shot0sid 1"
        frameMaps: [
            { colorMap: images_shot0sid_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: shot0top_material
        objectName: "shot0top"
        frameMaps: [
            { colorMap: images_shot0top_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_shell0
        objectName: "b_shell0"
        Model {
            id: solid_0
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                rockettop_material,
                shot0sid_material,
                shot0sid_1_material,
                shot0top_material
            ]
        }
    }

    // Animations:
}
