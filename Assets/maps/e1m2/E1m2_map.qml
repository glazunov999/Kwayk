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
    property alias model_40: solid_40
    property alias model_41: solid_41
    property alias model_42: solid_42
    property alias model_43: solid_43
    property alias model_44: solid_44
    property alias model_45: solid_45
    property alias model_46: solid_46
    property alias model_47: solid_47
    property alias model_48: solid_48
    property alias model_49: solid_49
    property alias model_50: solid_50
    property alias model_51: solid_51
    property alias model_52: solid_52
    property alias model_53: solid_53
    property alias model_54: solid_54
    property alias model_55: solid_55
    property alias model_56: solid_56
    property alias model_57: solid_57
    property alias model_58: solid_58
    property alias model_59: solid_59
    property alias model_60: solid_60
    property alias model_61: solid_61

    // Resources
    Texture {
        id: images_wizwood1_5_png_texture
        objectName: "images/wizwood1_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizwood1_5.png"
    }
    Texture {
        id: images_sliplite_png_texture
        objectName: "images/sliplite.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sliplite.png"
    }
    Texture {
        id: images_sliplite_glow_png_texture
        objectName: "images/sliplite_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sliplite_glow.png"
    }
    Texture {
        id: images_slipside_png_texture
        objectName: "images/slipside.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipside.png"
    }
    Texture {
        id: images_slipside_glow_png_texture
        objectName: "images/slipside_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipside_glow.png"
    }
    Texture {
        id: images_stone1_3_png_texture
        objectName: "images/stone1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/stone1_3.png"
    }
    Texture {
        id: images_wbrick1_5_png_texture
        objectName: "images/wbrick1_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wbrick1_5.png"
    }
    Texture {
        id: images_wenter01_png_texture
        objectName: "images/wenter01.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wenter01.png"
    }
    Texture {
        id: images_window03_png_texture
        objectName: "images/window03.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/window03.png"
    }
    Texture {
        id: images_wiz1_1_png_texture
        objectName: "images/wiz1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wiz1_1.png"
    }
    Texture {
        id: images__0floorsw_png_texture
        objectName: "images/+0floorsw.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0floorsw.png"
    }
    Texture {
        id: images__1floorsw_png_texture
        objectName: "images/+1floorsw.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1floorsw.png"
    }
    Texture {
        id: images__2floorsw_png_texture
        objectName: "images/+2floorsw.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2floorsw.png"
    }
    Texture {
        id: images__3floorsw_png_texture
        objectName: "images/+3floorsw.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3floorsw.png"
    }
    Texture {
        id: images__afloorsw_png_texture
        objectName: "images/+afloorsw.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+afloorsw.png"
    }
    Texture {
        id: images_wiz1_4_png_texture
        objectName: "images/wiz1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wiz1_4.png"
    }
    Texture {
        id: images_wizmet1_2_png_texture
        objectName: "images/wizmet1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizmet1_2.png"
    }
    Texture {
        id: images_wizmet1_7_png_texture
        objectName: "images/wizmet1_7.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizmet1_7.png"
    }
    Texture {
        id: images_metal5_6_png_texture
        objectName: "images/metal5_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal5_6.png"
    }
    Texture {
        id: images_wizwood1_4_png_texture
        objectName: "images/wizwood1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizwood1_4.png"
    }
    Texture {
        id: images_door04_1_png_texture
        objectName: "images/door04_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/door04_1.png"
    }
    Texture {
        id: images__0button_png_texture
        objectName: "images/+0button.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0button.png"
    }
    Texture {
        id: images__2button_png_texture
        objectName: "images/+2button.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2button.png"
    }
    Texture {
        id: images__3button_png_texture
        objectName: "images/+3button.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3button.png"
    }
    Texture {
        id: images__abutton_png_texture
        objectName: "images/+abutton.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+abutton.png"
    }
    Texture {
        id: images_wkey02_2_png_texture
        objectName: "images/wkey02_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wkey02_2.png"
    }
    Texture {
        id: images_wmet4_5_png_texture
        objectName: "images/wmet4_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wmet4_5.png"
    }
    Texture {
        id: images_woodflr1_4_png_texture
        objectName: "images/woodflr1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/woodflr1_4.png"
    }
    Texture {
        id: images_wswamp1_2_png_texture
        objectName: "images/wswamp1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wswamp1_2.png"
    }
    Texture {
        id: images_wswamp2_1_png_texture
        objectName: "images/wswamp2_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wswamp2_1.png"
    }
    Texture {
        id: images_adoor09_2_png_texture
        objectName: "images/adoor09_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/adoor09_2.png"
    }
    Texture {
        id: images_wswamp2_2_png_texture
        objectName: "images/wswamp2_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wswamp2_2.png"
    }
    Texture {
        id: images__teleport_png_texture
        objectName: "images/*teleport.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*teleport.png"
    }
    Texture {
        id: images_door05_3_png_texture
        objectName: "images/door05_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/door05_3.png"
    }
    Texture {
        id: images__04water1_png_texture
        objectName: "images/*04water1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*04water1.png"
    }
    Texture {
        id: images__1button_png_texture
        objectName: "images/+1button.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1button.png"
    }
    Texture {
        id: images_sky1_front_png_texture
        objectName: "images/sky1_front.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky1_front.png"
    }
    Texture {
        id: images_sky1_back_png_texture
        objectName: "images/sky1_back.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky1_back.png"
    }
    Texture {
        id: images_trigger_png_texture
        objectName: "images/trigger.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/trigger.png"
    }
    Texture {
        id: images_wmet4_3_png_texture
        objectName: "images/wmet4_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wmet4_3.png"
    }
    Texture {
        id: images_slipbotsd_png_texture
        objectName: "images/slipbotsd.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipbotsd.png"
    }
    Texture {
        id: images_altar1_7_png_texture
        objectName: "images/altar1_7.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/altar1_7.png"
    }
    Texture {
        id: images_black_png_texture
        objectName: "images/black.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/black.png"
    }
    Texture {
        id: images_altar1_6_png_texture
        objectName: "images/altar1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/altar1_6.png"
    }
    Texture {
        id: images_wmet2_1_png_texture
        objectName: "images/wmet2_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wmet2_1.png"
    }
    Texture {
        id: images_cop1_1_png_texture
        objectName: "images/cop1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop1_1.png"
    }
    Texture {
        id: images_altar1_3_png_texture
        objectName: "images/altar1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/altar1_3.png"
    }
    Texture {
        id: images_z_exit_png_texture
        objectName: "images/z_exit.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/z_exit.png"
    }
    Texture {
        id: images_z_exit_glow_png_texture
        objectName: "images/z_exit_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/z_exit_glow.png"
    }
    Texture {
        id: images_cop3_4_png_texture
        objectName: "images/cop3_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop3_4.png"
    }
    Texture {
        id: images_crate0_side_png_texture
        objectName: "images/crate0_side.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/crate0_side.png"
    }
    Texture {
        id: images__0slipbot_png_texture
        objectName: "images/+0slipbot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slipbot.png"
    }
    Texture {
        id: images_crate0_top_png_texture
        objectName: "images/crate0_top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/crate0_top.png"
    }
    Texture {
        id: images_crate1_side_png_texture
        objectName: "images/crate1_side.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/crate1_side.png"
    }
    Texture {
        id: images_crate1_top_png_texture
        objectName: "images/crate1_top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/crate1_top.png"
    }
    Texture {
        id: images_dem5_3_png_texture
        objectName: "images/dem5_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/dem5_3.png"
    }
    Texture {
        id: images_exit02_2_png_texture
        objectName: "images/exit02_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/exit02_2.png"
    }
    Texture {
        id: images__0shoot_png_texture
        objectName: "images/+0shoot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0shoot.png"
    }
    Texture {
        id: images__1shoot_png_texture
        objectName: "images/+1shoot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1shoot.png"
    }
    Texture {
        id: images__2shoot_png_texture
        objectName: "images/+2shoot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2shoot.png"
    }
    Texture {
        id: images__3shoot_png_texture
        objectName: "images/+3shoot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3shoot.png"
    }
    Texture {
        id: images__ashoot_png_texture
        objectName: "images/+ashoot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+ashoot.png"
    }
    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
    }
    BrushMaterial {
        id: trigger_10_material
        objectName: "trigger 10"
        frameMaps: [{ colorMap:  images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_6_material
        objectName: "wbrick1_5 6"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
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
    BrushMaterial {
        id: wswamp2_1_1_material
        objectName: "wswamp2_1 1"
        frameMaps: [{ colorMap: images_wswamp2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wkey02_2_2_material
        objectName: "wkey02_2 2"
        frameMaps: [{ colorMap: images_wkey02_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_7_material
        objectName: "door05_3 7"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door04_1_5_material
        objectName: "door04_1 5"
        frameMaps: [{ colorMap: images_door04_1_png_texture }]
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
        id: door04_1_4_material
        objectName: "door04_1 4"
        frameMaps: [{ colorMap: images_door04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wkey02_2_1_material
        objectName: "wkey02_2 1"
        frameMaps: [{ colorMap: images_wkey02_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_6_material
        objectName: "door05_3 6"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_6_material
        objectName: "metal5_6"
        frameMaps: [{ colorMap: images_metal5_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door04_1_2_material
        objectName: "door04_1 2"
        frameMaps: [{ colorMap: images_door04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_4_material
        objectName: "door05_3 4"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door04_1_3_material
        objectName: "door04_1 3"
        frameMaps: [{ colorMap: images_door04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_5_material
        objectName: "door05_3 5"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
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
        id: trigger_6_material
        objectName: "trigger 6"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet2_1_2_material
        objectName: "wmet2_1 2"
        frameMaps: [{ colorMap: images_wmet2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet2_1_4_material
        objectName: "wmet2_1 4"
        frameMaps: [{ colorMap: images_wmet2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_6_1_material
        objectName: "metal5_6 1"
        frameMaps: [{ colorMap: images_metal5_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet2_1_3_material
        objectName: "wmet2_1 3"
        frameMaps: [{ colorMap: images_wmet2_1_png_texture }]
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
        id: trigger_17_material
        objectName: "trigger 17"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_18_material
        objectName: "trigger 18"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_8_material
        objectName: "wbrick1_5 8"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_9_material
        objectName: "wbrick1_5 9"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0shoot_material
        objectName: "+0shoot"
        frameMaps: [
            { colorMap: images__0shoot_png_texture },
            { colorMap: images__1shoot_png_texture },
            { colorMap: images__2shoot_png_texture },
            { colorMap: images__3shoot_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__ashoot_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_1_1_material
        objectName: "cop1_1 1"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_19_material
        objectName: "trigger 19"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_10_material
        objectName: "wbrick1_5 10"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_11_material
        objectName: "wbrick1_5 11"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_20_material
        objectName: "trigger 20"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_5_4_material
        objectName: "wmet4_5 4"
        frameMaps: [{ colorMap: images_wmet4_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: z_exit_material
        objectName: "z_exit"
        frameMaps: [{ colorMap: images_z_exit_png_texture, fullbrightColorMap: images_z_exit_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0button_material
        objectName: "+0button"
        frameMaps: [
            { colorMap: images__0button_png_texture },
            { colorMap: images__1button_png_texture },
            { colorMap: images__2button_png_texture },
            { colorMap: images__3button_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abutton_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_7_material
        objectName: "wbrick1_5 7"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wswamp2_2_1_material
        objectName: "wswamp2_2 1"
        frameMaps: [{ colorMap: images_wswamp2_2_png_texture }]
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
        id: wmet4_5_3_material
        objectName: "wmet4_5 3"
        frameMaps: [{ colorMap: images_wmet4_5_png_texture }]
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
        id: trigger_12_material
        objectName: "trigger 12"
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
        id: wswamp2_2_2_material
        objectName: "wswamp2_2 2"
        frameMaps: [{ colorMap: images_wswamp2_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: adoor09_2_material
        objectName: "adoor09_2"
        frameMaps: [{ colorMap: images_adoor09_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_8_material
        objectName: "door05_3 8"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: adoor09_2_1_material
        objectName: "adoor09_2 1"
        frameMaps: [{ colorMap: images_adoor09_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_9_material
        objectName: "door05_3 9"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: black_1_material
        objectName: "black 1"
        frameMaps: [{ colorMap: images_black_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    TurbulentMaterial {
        id: _teleport_material
        colorMap: images__teleport_png_texture
    }
    BrushMaterial {
        id: wizmet1_7_material
        objectName: "wizmet1_7"
        frameMaps: [{ colorMap: images_wizmet1_7_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizwood1_4_material
        objectName: "wizwood1_4"
        frameMaps: [{ colorMap: images_wizwood1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizwood1_5_material
        objectName: "wizwood1_5"
        frameMaps: [{ colorMap: images_wizwood1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wkey02_2_material
        objectName: "wkey02_2"
        frameMaps: [{ colorMap: images_wkey02_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_5_material
        objectName: "wmet4_5"
        frameMaps: [{ colorMap: images_wmet4_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: woodflr1_4_material
        objectName: "woodflr1_4"
        frameMaps: [{ colorMap: images_woodflr1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wswamp1_2_material
        objectName: "wswamp1_2"
        frameMaps: [{ colorMap: images_wswamp1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wswamp2_1_material
        objectName: "wswamp2_1"
        frameMaps: [{ colorMap: images_wswamp2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wswamp2_2_material
        objectName: "wswamp2_2"
        frameMaps: [{ colorMap: images_wswamp2_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizmet1_2_material
        objectName: "wizmet1_2"
        frameMaps: [{ colorMap: images_wizmet1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    TurbulentMaterial {
        id: _04water1_material
        colorMap: images__04water1_png_texture
    }
    SkyLayerMaterial {
        id: sky1_material
        objectName: "sky1"
        alphaColorMap: images_sky1_front_png_texture
        solidColorMap: images_sky1_back_png_texture
    }
    BrushMaterial {
        id: trigger_material
        objectName: "trigger"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_3_material
        objectName: "wmet4_3"
        frameMaps: [{ colorMap: images_wmet4_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_3_1_material
        objectName: "wmet4_3 1"
        frameMaps: [{ colorMap: images_wmet4_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: dem5_3_material
        objectName: "dem5_3"
        frameMaps: [{ colorMap: images_dem5_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0slipbot_material
        objectName: "+0slipbot"
        frameMaps: [{ colorMap: images__0slipbot_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: altar1_3_material
        objectName: "altar1_3"
        frameMaps: [{ colorMap: images_altar1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: altar1_6_material
        objectName: "altar1_6"
        frameMaps: [{ colorMap: images_altar1_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: altar1_7_material
        objectName: "altar1_7"
        frameMaps: [{ colorMap: images_altar1_7_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: black_material
        objectName: "black"
        frameMaps: [{ colorMap: images_black_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_1_material
        objectName: "cop1_1"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
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
        id: crate0_side_material
        objectName: "crate0_side"
        frameMaps: [{ colorMap: images_crate0_side_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: crate0_top_material
        objectName: "crate0_top"
        frameMaps: [{ colorMap: images_crate0_top_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: crate1_side_material
        objectName: "crate1_side"
        frameMaps: [{ colorMap: images_crate1_side_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: crate1_top_material
        objectName: "crate1_top"
        frameMaps: [{ colorMap: images_crate1_top_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: exit02_2_material
        objectName: "exit02_2"
        frameMaps: [{ colorMap: images_exit02_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: slipbotsd_material
        objectName: "slipbotsd"
        frameMaps: [{ colorMap: images_slipbotsd_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: sliplite_material
        objectName: "sliplite"
        frameMaps: [{ colorMap: images_sliplite_png_texture, fullbrightColorMap: images_sliplite_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: slipside_material
        objectName: "slipside"
        frameMaps: [{ colorMap: images_slipside_png_texture, fullbrightColorMap: images_slipside_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: stone1_3_material
        objectName: "stone1_3"
        frameMaps: [{ colorMap: images_stone1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_material
        objectName: "wbrick1_5"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wenter01_material
        objectName: "wenter01"
        frameMaps: [{ colorMap: images_wenter01_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: window03_material
        objectName: "window03"
        frameMaps: [{ colorMap: images_window03_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wiz1_1_material
        objectName: "wiz1_1"
        frameMaps: [{ colorMap: images_wiz1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wiz1_4_material
        objectName: "wiz1_4"
        frameMaps: [{ colorMap: images_wiz1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_3_material
        objectName: "door05_3 3"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door04_1_material
        objectName: "door04_1"
        frameMaps: [{ colorMap: images_door04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_1_material
        objectName: "door05_3 1"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _1floorsw_material
        objectName: "+1floorsw"
        frameMaps: [
            { colorMap: images__0floorsw_png_texture },
            { colorMap: images__1floorsw_png_texture },
            { colorMap: images__2floorsw_png_texture },
            { colorMap: images__3floorsw_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__afloorsw_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_2_material
        objectName: "door05_3 2"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_5_1_material
        objectName: "wmet4_5 1"
        frameMaps: [{ colorMap: images_wmet4_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_5_2_material
        objectName: "wmet4_5 2"
        frameMaps: [{ colorMap: images_wmet4_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door04_1_1_material
        objectName: "door04_1 1"
        frameMaps: [{ colorMap: images_door04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_5_material
        objectName: "wbrick1_5 5"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
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
        id: trigger_5_material
        objectName: "trigger 5"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet2_1_material
        objectName: "wmet2_1"
        frameMaps: [{ colorMap: images_wmet2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_3_material
        objectName: "wbrick1_5 3"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
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
        id: wizmet1_2_1_material
        objectName: "wizmet1_2 1"
        frameMaps: [{ colorMap: images_wizmet1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizmet1_2_2_material
        objectName: "wizmet1_2 2"
        frameMaps: [{ colorMap: images_wizmet1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_1_material
        objectName: "wbrick1_5 1"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wbrick1_5_2_material
        objectName: "wbrick1_5 2"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet2_1_1_material
        objectName: "wmet2_1 1"
        frameMaps: [{ colorMap: images_wmet2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizwood1_5_1_material
        objectName: "wizwood1_5 1"
        frameMaps: [{ colorMap: images_wizwood1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _1button_material
        objectName: "+1button"
        frameMaps: [
            { colorMap: images__0button_png_texture },
            { colorMap: images__1button_png_texture },
            { colorMap: images__2button_png_texture },
            { colorMap: images__3button_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abutton_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door05_3_material
        objectName: "door05_3"
        frameMaps: [{ colorMap: images_door05_3_png_texture }]
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
        id: wbrick1_5_4_material
        objectName: "wbrick1_5 4"
        frameMaps: [{ colorMap: images_wbrick1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: e1m2
        objectName: "e1m2"
        Model {
            id: solid_0
            objectName: "solid_0"
            source: "meshes/solid_0_mesh.mesh"
            castsShadows: false
            usedInBakedLighting: true
            bakedLightmap: BakedLightmap {
                enabled: lightmapEnabled
                key: "solid_0"
                loadPrefix: "qrc:/Assets/maps/e1m2"
            }
            materials: [
                _0button_material,
                _0slipbot_material,
                altar1_3_material,
                altar1_6_material,
                altar1_7_material,
                black_material,
                cop1_1_material,
                cop3_4_material,
                crate0_side_material,
                crate0_top_material,
                crate1_side_material,
                crate1_top_material,
                dem5_3_material,
                exit02_2_material,
                slipbotsd_material,
                sliplite_material,
                slipside_material,
                stone1_3_material,
                wbrick1_5_material,
                wenter01_material,
                window03_material,
                wiz1_1_material,
                wiz1_4_material,
                wizmet1_2_material,
                wizmet1_7_material,
                wizwood1_4_material,
                wizwood1_5_material,
                wkey02_2_material,
                wmet4_5_material,
                woodflr1_4_material,
                wswamp1_2_material,
                wswamp2_1_material,
                wswamp2_2_material
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
            id: water
            objectName: "water"
            source: "meshes/water_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                _04water1_material
            ]
        }
        Model {
            id: sky
            objectName: "sky"
            source: "meshes/sky_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                sky1_material
            ]
        }
        Solid {
            id: solid_1
            objectName: "solid_1"
            shape: MeshShape {
                source: "meshes/solid_1_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                    wmet4_3_material
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
                    wmet4_3_1_material
                ]
            }
        }
        Solid {
            id: solid_4
            objectName: "solid_4"
            shape: MeshShape {
                source: "meshes/solid_4_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                    wizmet1_2_1_material
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
                    wizmet1_2_2_material
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
                    wbrick1_5_1_material
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
                    wbrick1_5_2_material
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
                    wbrick1_5_3_material
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
                    wizwood1_5_1_material
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
                    _1button_material,
                    door05_3_material
                ]
            }
        }
        Solid {
            id: solid_12
            objectName: "solid_12"
            shape: MeshShape {
                source: "meshes/solid_12_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                    wbrick1_5_4_material
                ]
            }
        }
        Solid {
            id: solid_14
            objectName: "solid_14"
            shape: MeshShape {
                source: "meshes/solid_14_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_14_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_5_material
                ]
            }
        }
        Solid {
            id: solid_15
            objectName: "solid_15"
            shape: MeshShape {
                source: "meshes/solid_15_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_15_mesh.mesh"
                castsShadows: false
                materials: [
                    door04_1_material,
                    door05_3_1_material
                ]
            }
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
                    _1floorsw_material,
                    door05_3_2_material
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
                    wmet4_5_1_material
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
                    wmet4_5_2_material
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
                    door04_1_1_material,
                    door05_3_3_material
                ]
            }
        }
        Solid {
            id: solid_20
            objectName: "solid_20"
            shape: MeshShape {
                source: "meshes/solid_20_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_21
            objectName: "solid_21"
            shape: MeshShape {
                source: "meshes/solid_21_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_22
            objectName: "solid_22"
            shape: MeshShape {
                source: "meshes/solid_22_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                    wmet2_1_material
                ]
            }
        }
        Solid {
            id: solid_24
            objectName: "solid_24"
            shape: MeshShape {
                source: "meshes/solid_24_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_24_mesh.mesh"
                castsShadows: false
                materials: [
                    wmet2_1_1_material
                ]
            }
        }
        Solid {
            id: solid_25
            objectName: "solid_25"
            shape: MeshShape {
                source: "meshes/solid_25_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_25_mesh.mesh"
                castsShadows: false
                materials: [
                    wmet2_1_2_material
                ]
            }
        }
        Solid {
            id: solid_26
            objectName: "solid_26"
            shape: MeshShape {
                source: "meshes/solid_26_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_26_mesh.mesh"
                castsShadows: false
                materials: [
                    wmet2_1_3_material
                ]
            }
        }
        Solid {
            id: solid_27
            objectName: "solid_27"
            shape: MeshShape {
                source: "meshes/solid_27_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_27_mesh.mesh"
                castsShadows: false
                materials: [
                    wmet2_1_4_material
                ]
            }
        }
        Solid {
            id: solid_28
            objectName: "solid_28"
            shape: MeshShape {
                source: "meshes/solid_28_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_29
            objectName: "solid_29"
            shape: MeshShape {
                source: "meshes/solid_29_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_30
            objectName: "solid_30"
            shape: MeshShape {
                source: "meshes/solid_30_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_31
            objectName: "solid_31"
            shape: MeshShape {
                source: "meshes/solid_31_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_31_mesh.mesh"
                castsShadows: false
                materials: [
                    door04_1_2_material,
                    door05_3_4_material
                ]
            }
        }
        Solid {
            id: solid_32
            objectName: "solid_32"
            shape: MeshShape {
                source: "meshes/solid_32_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_32_mesh.mesh"
                castsShadows: false
                materials: [
                    door04_1_3_material,
                    door05_3_5_material
                ]
            }
        }
        Solid {
            id: solid_33
            objectName: "solid_33"
            shape: MeshShape {
                source: "meshes/solid_33_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_33_mesh.mesh"
                castsShadows: false
                materials: [
                    metal5_6_material
                ]
            }
        }
        Solid {
            id: solid_34
            objectName: "solid_34"
            shape: MeshShape {
                source: "meshes/solid_34_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_34_mesh.mesh"
                castsShadows: false
                materials: [
                    metal5_6_1_material
                ]
            }
        }
        Solid {
            id: solid_35
            objectName: "solid_35"
            shape: MeshShape {
                source: "meshes/solid_35_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_36
            objectName: "solid_36"
            shape: MeshShape {
                source: "meshes/solid_36_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_37
            objectName: "solid_37"
            shape: MeshShape {
                source: "meshes/solid_37_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_37_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_6_material,
                    wswamp2_1_1_material
                ]
            }
        }
        Solid {
            id: solid_38
            objectName: "solid_38"
            shape: MeshShape {
                source: "meshes/solid_38_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                    door04_1_4_material,
                    door05_3_6_material,
                    wkey02_2_1_material
                ]
            }
        }
        Solid {
            id: solid_40
            objectName: "solid_40"
            shape: MeshShape {
                source: "meshes/solid_40_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_40_mesh.mesh"
                castsShadows: false
                materials: [
                    door04_1_5_material,
                    door05_3_7_material,
                    wkey02_2_2_material
                ]
            }
        }
        Solid {
            id: solid_41
            objectName: "solid_41"
            shape: MeshShape {
                source: "meshes/solid_41_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_42
            objectName: "solid_42"
            shape: MeshShape {
                source: "meshes/solid_42_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_42_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_7_material,
                    wswamp2_2_1_material
                ]
            }
        }
        Solid {
            id: solid_43
            objectName: "solid_43"
            shape: MeshShape {
                source: "meshes/solid_43_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_44
            objectName: "solid_44"
            shape: MeshShape {
                source: "meshes/solid_44_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_44_mesh.mesh"
                castsShadows: false
                materials: [
                    wmet4_5_3_material
                ]
            }
        }
        Solid {
            id: solid_45
            objectName: "solid_45"
            shape: MeshShape {
                source: "meshes/solid_45_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_46
            objectName: "solid_46"
            shape: MeshShape {
                source: "meshes/solid_46_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_47
            objectName: "solid_47"
            shape: MeshShape {
                source: "meshes/solid_47_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_48
            objectName: "solid_48"
            shape: MeshShape {
                source: "meshes/solid_48_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_48_mesh.mesh"
                castsShadows: false
                materials: [
                    wswamp2_2_2_material
                ]
            }
        }
        Solid {
            id: solid_49
            objectName: "solid_49"
            shape: MeshShape {
                source: "meshes/solid_49_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_49_mesh.mesh"
                castsShadows: false
                materials: [
                    adoor09_2_material,
                    door05_3_8_material
                ]
            }
        }
        Solid {
            id: solid_50
            objectName: "solid_50"
            shape: MeshShape {
                source: "meshes/solid_50_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_50_mesh.mesh"
                castsShadows: false
                materials: [
                    adoor09_2_1_material,
                    door05_3_9_material
                ]
            }
        }
        Solid {
            id: solid_51
            objectName: "solid_51"
            shape: MeshShape {
                source: "meshes/solid_51_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_51_mesh.mesh"
                castsShadows: false
                materials: [
                    black_1_material,
                    cop1_1_1_material
                ]
            }
        }
        Solid {
            id: solid_52
            objectName: "solid_52"
            shape: MeshShape {
                source: "meshes/solid_52_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_53
            objectName: "solid_53"
            shape: MeshShape {
                source: "meshes/solid_53_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_54
            objectName: "solid_54"
            shape: MeshShape {
                source: "meshes/solid_54_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_54_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_8_material
                ]
            }
        }
        Solid {
            id: solid_55
            objectName: "solid_55"
            shape: MeshShape {
                source: "meshes/solid_55_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_55_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_9_material
                ]
            }
        }
        Solid {
            id: solid_56
            objectName: "solid_56"
            shape: MeshShape {
                source: "meshes/solid_56_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_56_mesh.mesh"
                castsShadows: false
                materials: [
                    _0shoot_material
                ]
            }
        }
        Solid {
            id: solid_57
            objectName: "solid_57"
            shape: MeshShape {
                source: "meshes/solid_57_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_58
            objectName: "solid_58"
            shape: MeshShape {
                source: "meshes/solid_58_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_58_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_10_material
                ]
            }
        }
        Solid {
            id: solid_59
            objectName: "solid_59"
            shape: MeshShape {
                source: "meshes/solid_59_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_59_mesh.mesh"
                castsShadows: false
                materials: [
                    wbrick1_5_11_material
                ]
            }
        }
        Solid {
            id: solid_60
            objectName: "solid_60"
            shape: MeshShape {
                source: "meshes/solid_60_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_61
            objectName: "solid_61"
            shape: MeshShape {
                source: "meshes/solid_61_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_61_mesh.mesh"
                castsShadows: false
                materials: [
                    wmet4_5_4_material,
                    z_exit_material
                ]
            }
        }
    }

    // Animations:
}
