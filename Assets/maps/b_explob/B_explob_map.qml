import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images__0_box_side_png_texture
        objectName: "images/+0_box_side.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_box_side.png"
    }
    Texture {
        id: images__0_box_side_glow_png_texture
        objectName: "images/+0_box_side_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_box_side_glow.png"
    }
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
        id: images__1_box_side_png_texture
        objectName: "images/+1_box_side.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_box_side.png"
    }
    Texture {
        id: images__1_box_side_glow_png_texture
        objectName: "images/+1_box_side_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_box_side_glow.png"
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
        id: _0_box_side_material
        objectName: "+0_box_side"
        frameMaps: [
            { colorMap: images__0_box_side_png_texture, fullbrightColorMap: images__0_box_side_glow_png_texture },
            { colorMap: images__1_box_side_png_texture, fullbrightColorMap: images__1_box_side_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0_box_side_1_material
        objectName: "+0_box_side 1"
        frameMaps: [
            { colorMap: images__0_box_side_png_texture, fullbrightColorMap: images__0_box_side_glow_png_texture },
            { colorMap: images__1_box_side_png_texture, fullbrightColorMap: images__1_box_side_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
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

    // Nodes:
    Node {
        id: b_explob
        objectName: "b_explob"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                _0_box_side_material,
                _0_box_side_1_material,
                _0_box_top_material
            ]
        }
    }

    // Animations:
}
