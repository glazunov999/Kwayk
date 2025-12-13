import QtQuick
import QtQuick3D

import Kwayk.Core

Node {
    id: node

    // Resources
    Texture {
        id: images__0_med100_png_texture
        objectName: "images/+0_med100.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_med100.png"
    }
    Texture {
        id: images__0_med100_glow_png_texture
        objectName: "images/+0_med100_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0_med100_glow.png"
    }
    Texture {
        id: images__1_med100_png_texture
        objectName: "images/+1_med100.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_med100.png"
    }
    Texture {
        id: images__1_med100_glow_png_texture
        objectName: "images/+1_med100_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1_med100_glow.png"
    }
    Texture {
        id: images__2_med100_png_texture
        objectName: "images/+2_med100.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2_med100.png"
    }
    Texture {
        id: images__2_med100_glow_png_texture
        objectName: "images/+2_med100_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2_med100_glow.png"
    }
    Texture {
        id: images__3_med100_png_texture
        objectName: "images/+3_med100.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3_med100.png"
    }
    Texture {
        id: images__3_med100_glow_png_texture
        objectName: "images/+3_med100_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3_med100_glow.png"
    }
    Texture {
        id: images_med100_png_texture
        objectName: "images/med100.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/med100.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: _3_med100_material
        objectName: "+3_med100"
        frameMaps: [
            { colorMap: images__0_med100_png_texture, fullbrightColorMap: images__0_med100_glow_png_texture },
            { colorMap: images__1_med100_png_texture, fullbrightColorMap: images__1_med100_glow_png_texture },
            { colorMap: images__2_med100_png_texture, fullbrightColorMap: images__2_med100_glow_png_texture },
            { colorMap: images__3_med100_png_texture, fullbrightColorMap: images__3_med100_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _3_med100_1_material
        objectName: "+3_med100 1"
        frameMaps: [
            { colorMap: images__0_med100_png_texture, fullbrightColorMap: images__0_med100_glow_png_texture },
            { colorMap: images__1_med100_png_texture, fullbrightColorMap: images__1_med100_glow_png_texture },
            { colorMap: images__2_med100_png_texture, fullbrightColorMap: images__2_med100_glow_png_texture },
            { colorMap: images__3_med100_png_texture, fullbrightColorMap: images__3_med100_glow_png_texture },
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: med100_material
        objectName: "med100"
        frameMaps: [
            { colorMap: images_med100_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: b_bh100
        objectName: "b_bh100"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            materials: [
                _3_med100_material,
                _3_med100_1_material,
                med100_material
            ]
        }
    }

    // Animations:
}
