import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images__0_med25_png_texture
        objectName: "images/+0_med25.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_med25.png"
    }
    Texture {
        id: images__0_med25_glow_png_texture
        objectName: "images/+0_med25_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_med25_glow.png"
    }
    Texture {
        id: images__1_med25_png_texture
        objectName: "images/+1_med25.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_med25.png"
    }
    Texture {
        id: images__1_med25_glow_png_texture
        objectName: "images/+1_med25_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_med25_glow.png"
    }
    Texture {
        id: images__2_med25_png_texture
        objectName: "images/+2_med25.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2_med25.png"
    }
    Texture {
        id: images__2_med25_glow_png_texture
        objectName: "images/+2_med25_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2_med25_glow.png"
    }
    Texture {
        id: images__3_med25_png_texture
        objectName: "images/+3_med25.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3_med25.png"
    }
    Texture {
        id: images__3_med25_glow_png_texture
        objectName: "images/+3_med25_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3_med25_glow.png"
    }
    Texture {
        id: images__0_med25s_png_texture
        objectName: "images/+0_med25s.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_med25s.png"
    }
    Texture {
        id: images__0_med25s_glow_png_texture
        objectName: "images/+0_med25s_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_med25s_glow.png"
    }
    Texture {
        id: images__1_med25s_png_texture
        objectName: "images/+1_med25s.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_med25s.png"
    }
    Texture {
        id: images__1_med25s_glow_png_texture
        objectName: "images/+1_med25s_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_med25s_glow.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: _0_med25_material
        objectName: "+0_med25"
        frameMaps: [
            { colorMap: images__0_med25_png_texture, fullbrightColorMap: images__0_med25_glow_png_texture },
            { colorMap: images__1_med25_png_texture, fullbrightColorMap: images__1_med25_glow_png_texture },
            { colorMap: images__2_med25_png_texture, fullbrightColorMap: images__2_med25_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0_med25s_material
        objectName: "+0_med25s"
        frameMaps: [
            { colorMap: images__0_med25s_png_texture, fullbrightColorMap: images__0_med25s_glow_png_texture },
            { colorMap: images__1_med25s_png_texture, fullbrightColorMap: images__1_med25s_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0_med25s_1_material
        objectName: "+0_med25s 1"
        frameMaps: [
            { colorMap: images__0_med25s_png_texture, fullbrightColorMap: images__0_med25s_glow_png_texture },
            { colorMap: images__1_med25s_png_texture, fullbrightColorMap: images__1_med25s_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_bh25
        objectName: "b_bh25"
        Model {
            id: solid_0
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                _0_med25_material,
                _0_med25s_material,
                _0_med25s_1_material
            ]
        }
    }

    // Animations:
}
