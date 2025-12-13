import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Core
import Kwayk.Game

Node {
    id: node

    property alias model_1: solid_1
    property alias model_2: solid_2
    property alias model_3: solid_3
    property alias model_4: solid_4
    property alias model_5: solid_5
    property alias model_6: solid_6
    property alias model_7: solid_7
    property alias model_8: solid_8
    property alias model_9: solid_9
    property alias model_10: solid_10
    property alias model_11: solid_11
    property alias model_12: solid_12
    property alias model_13: solid_13
    property alias model_14: solid_14
    property alias model_15: solid_15
    property alias model_16: solid_16
    property alias model_17: solid_17
    property alias model_18: solid_18
    property alias model_19: solid_19
    property alias model_20: solid_20
    property alias model_21: solid_21
    property alias model_22: solid_22
    property alias model_23: solid_23
    property alias model_24: solid_24
    property alias model_25: solid_25
    property alias model_26: solid_26
    property alias model_27: solid_27
    property alias model_28: solid_28
    property alias model_29: solid_29
    property alias model_30: solid_30
    property alias model_31: solid_31
    property alias model_32: solid_32
    property alias model_33: solid_33
    property alias model_34: solid_34
    property alias model_35: solid_35
    property alias model_36: solid_36
    property alias model_37: solid_37
    property alias model_38: solid_38
    property alias model_39: solid_39

    // Resources
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    Texture {
        id: images_sky4_front_png_texture
        objectName: "images/sky4_front.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky4_front.png"
    }
    Texture {
        id: images_sky4_back_png_texture
        objectName: "images/sky4_back.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky4_back.png"
    }
    Texture {
        id: images_rune_a_glow_png_texture
        objectName: "images/rune_a_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rune_a_glow.png"
    }
    Texture {
        id: images_metal6_3_glow_png_texture
        objectName: "images/metal6_3_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal6_3_glow.png"
    }
    Texture {
        id: images_metal6_4_png_texture
        objectName: "images/metal6_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal6_4.png"
    }
    Texture {
        id: images_sky4_png_texture
        objectName: "images/sky4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky4.png"
    }
    Texture {
        id: images_metal2_2_png_texture
        objectName: "images/metal2_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal2_2.png"
    }
    Texture {
        id: images_metal4_4_png_texture
        objectName: "images/metal4_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal4_4.png"
    }
    Texture {
        id: images_metal4_5_png_texture
        objectName: "images/metal4_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal4_5.png"
    }
    Texture {
        id: images_metal4_6_png_texture
        objectName: "images/metal4_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal4_6.png"
    }
    Texture {
        id: images__teleport_png_texture
        objectName: "images/*teleport.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*teleport.png"
    }
    Texture {
        id: images_metal5_2_png_texture
        objectName: "images/metal5_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal5_2.png"
    }
    Texture {
        id: images_metal6_2_png_texture
        objectName: "images/metal6_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal6_2.png"
    }
    Texture {
        id: images_cop1_8_png_texture
        objectName: "images/cop1_8.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop1_8.png"
    }
    Texture {
        id: images__lava1_png_texture
        objectName: "images/*lava1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*lava1.png"
    }
    Texture {
        id: images_metalt2_3_png_texture
        objectName: "images/metalt2_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metalt2_3.png"
    }
    Texture {
        id: images_metalt2_8_png_texture
        objectName: "images/metalt2_8.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metalt2_8.png"
    }
    Texture {
        id: images_mmetal1_2_png_texture
        objectName: "images/mmetal1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/mmetal1_2.png"
    }
    Texture {
        id: images_nmetal2_1_png_texture
        objectName: "images/nmetal2_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/nmetal2_1.png"
    }
    Texture {
        id: images_rune_a_png_texture
        objectName: "images/rune_a.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rune_a.png"
    }
    Texture {
        id: images_rune1_6_png_texture
        objectName: "images/rune1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rune1_6.png"
    }
    Texture {
        id: images_rune1_7_png_texture
        objectName: "images/rune1_7.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rune1_7.png"
    }
    Texture {
        id: images_lgmetal3_png_texture
        objectName: "images/lgmetal3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lgmetal3.png"
    }
    Texture {
        id: images_cop1_6_png_texture
        objectName: "images/cop1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop1_6.png"
    }
    Texture {
        id: images_cop2_3_png_texture
        objectName: "images/cop2_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop2_3.png"
    }
    Texture {
        id: images__3butn_png_texture
        objectName: "images/+3butn.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3butn.png"
    }
    Texture {
        id: images_cop3_4_png_texture
        objectName: "images/cop3_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop3_4.png"
    }
    Texture {
        id: images_plat_top1_png_texture
        objectName: "images/plat_top1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/plat_top1.png"
    }
    Texture {
        id: images_dr07_1_png_texture
        objectName: "images/dr07_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/dr07_1.png"
    }
    Texture {
        id: images__0butnn_png_texture
        objectName: "images/+0butnn.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0butnn.png"
    }
    Texture {
        id: images_metal1_3_png_texture
        objectName: "images/metal1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal1_3.png"
    }
    Texture {
        id: images_trigger_png_texture
        objectName: "images/trigger.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/trigger.png"
    }
    Texture {
        id: images_met5_2_png_texture
        objectName: "images/met5_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/met5_2.png"
    }
    Texture {
        id: images_metal1_2_png_texture
        objectName: "images/metal1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal1_2.png"
    }
    Texture {
        id: images_met5_1_png_texture
        objectName: "images/met5_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/met5_1.png"
    }
    BrushMaterial {
        id: met5_1_16_material
        objectName: "met5_1 16"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_6_material
        objectName: "nmetal2_1 6"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _3butn_material
        objectName: "+3butn"
        frameMaps: [{ colorMap: images__3butn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_17_material
        objectName: "met5_1 17"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0butnn_4_material
        objectName: "+0butnn 4"
        frameMaps: [{ colorMap: images__0butnn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_14_material
        objectName: "met5_1 14"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_15_material
        objectName: "met5_1 15"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_7_material
        objectName: "nmetal2_1 7"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0butnn_5_material
        objectName: "+0butnn 5"
        frameMaps: [{ colorMap: images__0butnn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_10_material
        objectName: "met5_1 10"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_9_material
        objectName: "nmetal2_1 9"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_9_material
        objectName: "met5_1 9"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_material
        objectName: "trigger"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_1_material
        objectName: "trigger 1"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0butnn_2_material
        objectName: "+0butnn 2"
        frameMaps: [{ colorMap: images__0butnn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_13_material
        objectName: "met5_1 13"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0butnn_3_material
        objectName: "+0butnn 3"
        frameMaps: [{ colorMap: images__0butnn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_11_material
        objectName: "met5_1 11"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_12_material
        objectName: "met5_1 12"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_5_material
        objectName: "nmetal2_1 5"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_10_material
        objectName: "trigger 10"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_11_material
        objectName: "trigger 11"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_12_material
        objectName: "trigger 12"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_13_material
        objectName: "trigger 13"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_9_material
        objectName: "trigger 9"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_14_material
        objectName: "trigger 14"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_15_material
        objectName: "trigger 15"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_16_material
        objectName: "trigger 16"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_6_material
        objectName: "cop1_6"
        frameMaps: [{ colorMap: images_cop1_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_5_material
        objectName: "trigger 5"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_2_material
        objectName: "trigger 2"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_3_material
        objectName: "trigger 3"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_4_material
        objectName: "trigger 4"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_8_material
        objectName: "nmetal2_1 8"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_6_material
        objectName: "trigger 6"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_7_material
        objectName: "trigger 7"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_8_material
        objectName: "trigger 8"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    TurbulentMaterial {
        id: _lava1_material
        colorMap: images__lava1_png_texture
        emissiveIntensity: 5
        emissiveColor: "#ff2200"
    }
    BrushMaterial {
        id: metalt2_8_material
        objectName: "metalt2_8"
        frameMaps: [{ colorMap: images_metalt2_8_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: mmetal1_2_material
        objectName: "mmetal1_2"
        frameMaps: [{ colorMap: images_mmetal1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_material
        objectName: "nmetal2_1"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rune1_6_material
        objectName: "rune1_6"
        frameMaps: [{ colorMap: images_rune1_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rune1_7_material
        objectName: "rune1_7"
        frameMaps: [{ colorMap: images_rune1_7_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rune_a_material
        objectName: "rune_a"
        frameMaps: [{ colorMap: images_rune_a_png_texture, fullbrightColorMap: images_rune_a_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metalt2_3_material
        objectName: "metalt2_3"
        frameMaps: [{ colorMap: images_metalt2_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    TurbulentMaterial {
        id: _teleport_material
        colorMap: images__teleport_png_texture
    }
    SkyLayerMaterial {
        id: sky4_material
        objectName: "sky4"
        alphaColorMap: images_sky4_front_png_texture
        solidColorMap: images_sky4_back_png_texture
    }
    BrushMaterial {
        id: met5_1_1_material
        objectName: "met5_1 1"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal1_3_1_material
        objectName: "metal1_3 1"
        frameMaps: [{ colorMap: images_metal1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_top1_material
        objectName: "plat_top1"
        frameMaps: [{ colorMap: images_plat_top1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal6_4_material
        objectName: "metal6_4"
        frameMaps: [{ colorMap: images_metal6_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal6_2_material
        objectName: "metal6_2"
        frameMaps: [{ colorMap: images_metal6_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_2_material
        objectName: "metal5_2"
        frameMaps: [{ colorMap: images_metal5_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal4_6_material
        objectName: "metal4_6"
        frameMaps: [{ colorMap: images_metal4_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal4_5_material
        objectName: "metal4_5"
        frameMaps: [{ colorMap: images_metal4_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal4_4_material
        objectName: "metal4_4"
        frameMaps: [{ colorMap: images_metal4_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal2_2_material
        objectName: "metal2_2"
        frameMaps: [{ colorMap: images_metal2_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal1_3_material
        objectName: "metal1_3"
        frameMaps: [{ colorMap: images_metal1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal1_2_material
        objectName: "metal1_2"
        frameMaps: [{ colorMap: images_metal1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_2_material
        objectName: "met5_2"
        frameMaps: [{ colorMap: images_met5_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_material
        objectName: "met5_1"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: lgmetal3_material
        objectName: "lgmetal3"
        frameMaps: [{ colorMap: images_lgmetal3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: dr07_1_material
        objectName: "dr07_1"
        frameMaps: [{ colorMap: images_dr07_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop3_4_material
        objectName: "cop3_4"
        frameMaps: [{ colorMap: images_cop3_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop2_3_material
        objectName: "cop2_3"
        frameMaps: [{ colorMap: images_cop2_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop3_4_2_material
        objectName: "cop3_4 2"
        frameMaps: [{ colorMap: images_cop3_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_8_material
        objectName: "met5_1 8"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0butnn_material
        objectName: "+0butnn"
        frameMaps: [{ colorMap: images__0butnn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_7_material
        objectName: "met5_1 7"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_8_1_material
        objectName: "cop1_8 1"
        frameMaps: [{ colorMap: images_cop1_8_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_6_material
        objectName: "met5_1 6"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_8_material
        objectName: "cop1_8"
        frameMaps: [{ colorMap: images_cop1_8_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_2_2_material
        objectName: "metal5_2 2"
        frameMaps: [{ colorMap: images_metal5_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal4_4_2_material
        objectName: "metal4_4 2"
        frameMaps: [{ colorMap: images_metal4_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_2_1_material
        objectName: "metal5_2 1"
        frameMaps: [{ colorMap: images_metal5_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal4_4_1_material
        objectName: "metal4_4 1"
        frameMaps: [{ colorMap: images_metal4_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0butnn_1_material
        objectName: "+0butnn 1"
        frameMaps: [{ colorMap: images__0butnn_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop3_4_1_material
        objectName: "cop3_4 1"
        frameMaps: [{ colorMap: images_cop3_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_4_material
        objectName: "nmetal2_1 4"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_5_material
        objectName: "met5_1 5"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_3_material
        objectName: "nmetal2_1 3"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_4_material
        objectName: "met5_1 4"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_2_material
        objectName: "nmetal2_1 2"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_3_material
        objectName: "met5_1 3"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: nmetal2_1_1_material
        objectName: "nmetal2_1 1"
        frameMaps: [{ colorMap: images_nmetal2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_2_material
        objectName: "met5_1 2"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: e1m7
        objectName: "e1m7"
        Solid {
            id: solid_0
            objectName: "solid_0"
            shape: MeshShape {
                source: "meshes/solid_0_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_0_mesh.mesh"
                castsShadows: false
                usedInBakedLighting: true
                bakedLightmap: BakedLightmap {
                    enabled: lightmapEnabled
                    key: "solid_0"
                    loadPrefix: "qrc:/Assets/maps/e1m7"
                }
                materials: [
                    cop1_6_material,
                    cop2_3_material,
                    cop3_4_material,
                    dr07_1_material,
                    lgmetal3_material,
                    met5_1_material,
                    met5_2_material,
                    metal1_2_material,
                    metal1_3_material,
                    metal2_2_material,
                    metal4_4_material,
                    metal4_5_material,
                    metal4_6_material,
                    metal5_2_material,
                    metal6_2_material,
                    metal6_4_material,
                    metalt2_3_material,
                    metalt2_8_material,
                    mmetal1_2_material,
                    nmetal2_1_material,
                    rune1_6_material,
                    rune1_7_material,
                    rune_a_material
                ]
            }
        }
        Model {
            id: lava
            objectName: "lava"
            source: "meshes/lava_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                _lava1_material
            ]
        }
        Model {
            id: tele
            objectName: "tele"
            source: "meshes/tele_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                _teleport_material
            ]
        }
        Model {
            id: sky
            objectName: "sky"
            source: "meshes/sky_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                sky4_material
            ]
        }
        Solid {
            id: solid_1
            objectName: "solid_1"
            shape: MeshShape {
                source: "meshes/solid_1_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_1_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_1_material,
                    metal1_3_1_material,
                    plat_top1_material
                ]
            }
        }
        Solid {
            id: solid_2
            objectName: "solid_2"
            shape: MeshShape {
                source: "meshes/solid_2_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_2_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_2_material,
                    nmetal2_1_1_material
                ]
            }
        }
        Solid {
            id: solid_3
            objectName: "solid_3"
            shape: MeshShape {
                source: "meshes/solid_3_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_3_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_3_material,
                    nmetal2_1_2_material
                ]
            }
        }
        Solid {
            id: solid_4
            objectName: "solid_4"
            shape: MeshShape {
                source: "meshes/solid_4_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_4_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_4_material,
                    nmetal2_1_3_material
                ]
            }
        }
        Solid {
            id: solid_5
            objectName: "solid_5"
            shape: MeshShape {
                source: "meshes/solid_5_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_5_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_5_material,
                    nmetal2_1_4_material
                ]
            }
        }
        Solid {
            id: solid_6
            objectName: "solid_6"
            shape: MeshShape {
                source: "meshes/solid_6_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_6_mesh.mesh"
                castsShadows: false
                materials: [
                    cop3_4_1_material
                ]
            }
        }
        Solid {
            id: solid_7
            objectName: "solid_7"
            shape: MeshShape {
                source: "meshes/solid_7_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_7_mesh.mesh"
                castsShadows: false
                materials: [
                    cop3_4_2_material
                ]
            }
        }
        Solid {
            id: solid_8
            objectName: "solid_8"
            shape: MeshShape {
                source: "meshes/solid_8_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_8_mesh.mesh"
                castsShadows: false
                materials: [
                    metal4_4_1_material,
                    metal5_2_1_material
                ]
            }
        }
        Solid {
            id: solid_9
            objectName: "solid_9"
            shape: MeshShape {
                source: "meshes/solid_9_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_9_mesh.mesh"
                castsShadows: false
                materials: [
                    metal4_4_2_material,
                    metal5_2_2_material
                ]
            }
        }
        Solid {
            id: solid_10
            objectName: "solid_10"
            shape: MeshShape {
                source: "meshes/solid_10_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_10_mesh.mesh"
                castsShadows: false
                materials: [
                    cop1_8_material,
                    met5_1_6_material
                ]
            }
        }
        Solid {
            id: solid_11
            objectName: "solid_11"
            shape: MeshShape {
                source: "meshes/solid_11_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_11_mesh.mesh"
                castsShadows: false
                materials: [
                    cop1_8_1_material,
                    met5_1_7_material
                ]
            }
        }
        Solid {
            id: solid_12
            objectName: "solid_12"
            shape: MeshShape {
                source: "meshes/solid_12_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_12_mesh.mesh"
                castsShadows: false
                materials: [
                    _0butnn_material,
                    met5_1_8_material
                ]
            }
        }
        Solid {
            id: solid_13
            objectName: "solid_13"
            shape: MeshShape {
                source: "meshes/solid_13_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_13_mesh.mesh"
                castsShadows: false
                materials: [
                    _0butnn_1_material,
                    _3butn_material,
                    met5_1_9_material
                ]
            }
        }
        Solid {
            id: solid_14
            objectName: "solid_14"
            shape: MeshShape {
                source: "meshes/solid_14_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_15
            objectName: "solid_15"
            shape: MeshShape {
                source: "meshes/solid_15_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_16
            objectName: "solid_16"
            shape: MeshShape {
                source: "meshes/solid_16_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_16_mesh.mesh"
                castsShadows: false
                materials: [
                    _0butnn_2_material,
                    met5_1_10_material
                ]
            }
        }
        Solid {
            id: solid_17
            objectName: "solid_17"
            shape: MeshShape {
                source: "meshes/solid_17_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_17_mesh.mesh"
                castsShadows: false
                materials: [
                    _0butnn_3_material,
                    met5_1_11_material
                ]
            }
        }
        Solid {
            id: solid_18
            objectName: "solid_18"
            shape: MeshShape {
                source: "meshes/solid_18_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_18_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_12_material,
                    nmetal2_1_5_material
                ]
            }
        }
        Solid {
            id: solid_19
            objectName: "solid_19"
            shape: MeshShape {
                source: "meshes/solid_19_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_19_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_13_material,
                    nmetal2_1_6_material
                ]
            }
        }
        Solid {
            id: solid_20
            objectName: "solid_20"
            shape: MeshShape {
                source: "meshes/solid_20_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_20_mesh.mesh"
                castsShadows: false
                materials: [
                    _0butnn_4_material,
                    met5_1_14_material
                ]
            }
        }
        Solid {
            id: solid_21
            objectName: "solid_21"
            shape: MeshShape {
                source: "meshes/solid_21_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_21_mesh.mesh"
                castsShadows: false
                materials: [
                    _0butnn_5_material,
                    met5_1_15_material
                ]
            }
        }
        Solid {
            id: solid_22
            objectName: "solid_22"
            shape: MeshShape {
                source: "meshes/solid_22_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_22_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_16_material,
                    nmetal2_1_7_material
                ]
            }
        }
        Solid {
            id: solid_23
            objectName: "solid_23"
            shape: MeshShape {
                source: "meshes/solid_23_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_23_mesh.mesh"
                castsShadows: false
                materials: [
                    met5_1_17_material,
                    nmetal2_1_8_material
                ]
            }
        }
        Solid {
            id: solid_24
            objectName: "solid_24"
            shape: MeshShape {
                source: "meshes/solid_24_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_25
            objectName: "solid_25"
            shape: MeshShape {
                source: "meshes/solid_25_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_26
            objectName: "solid_26"
            shape: MeshShape {
                source: "meshes/solid_26_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_27
            objectName: "solid_27"
            shape: MeshShape {
                source: "meshes/solid_27_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_28
            objectName: "solid_28"
            shape: MeshShape {
                source: "meshes/solid_28_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_29
            objectName: "solid_29"
            shape: MeshShape {
                source: "meshes/solid_29_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_30
            objectName: "solid_30"
            shape: MeshShape {
                source: "meshes/solid_30_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_31
            objectName: "solid_31"
            shape: MeshShape {
                source: "meshes/solid_31_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_32
            objectName: "solid_32"
            shape: MeshShape {
                source: "meshes/solid_32_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_33
            objectName: "solid_33"
            shape: MeshShape {
                source: "meshes/solid_33_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_34
            objectName: "solid_34"
            shape: MeshShape {
                source: "meshes/solid_34_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_35
            objectName: "solid_35"
            shape: MeshShape {
                source: "meshes/solid_35_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_36
            objectName: "solid_36"
            shape: MeshShape {
                source: "meshes/solid_36_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_37
            objectName: "solid_37"
            shape: MeshShape {
                source: "meshes/solid_37_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_38
            objectName: "solid_38"
            shape: MeshShape {
                source: "meshes/solid_38_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
        }
        Solid {
            id: solid_39
            objectName: "solid_39"
            shape: MeshShape {
                source: "meshes/solid_39_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_39_mesh.mesh"
                castsShadows: false
                materials: [
                    nmetal2_1_9_material
                ]
            }
        }
    }
    // Animations:
}
