import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images__0_box_top_png_texture
        objectName: "images/+0_box_top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_box_top.png"
    }
    Texture {
        id: images__0_box_top_glow_png_texture
        objectName: "images/+0_box_top_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_box_top_glow.png"
    }
    Texture {
        id: images__1_box_top_png_texture
        objectName: "images/+1_box_top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_box_top.png"
    }
    Texture {
        id: images__1_box_top_glow_png_texture
        objectName: "images/+1_box_top_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_box_top_glow.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: _0_box_top_material
        objectName: "+0_box_top"
        frameMaps: [
            { colorMap: images__0_box_top_png_texture, fullbrightColorMap: images__0_box_top_glow_png_texture },
            { colorMap: images__1_box_top_png_texture, fullbrightColorMap: images__1_box_top_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0_box_top_1_material
        objectName: "+0_box_top 1"
        frameMaps: [
            { colorMap: images__0_box_top_png_texture, fullbrightColorMap: images__0_box_top_glow_png_texture },
            { colorMap: images__1_box_top_png_texture, fullbrightColorMap: images__1_box_top_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0_box_top_2_material
        objectName: "+0_box_top 2"
        frameMaps: [
            { colorMap: images__0_box_top_png_texture, fullbrightColorMap: images__0_box_top_glow_png_texture },
            { colorMap: images__1_box_top_png_texture, fullbrightColorMap: images__1_box_top_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_exbox2
        objectName: "b_exbox2"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                _0_box_top_material,
                _0_box_top_1_material,
                _0_box_top_2_material
            ]
        }
    }

    // Animations:
}
