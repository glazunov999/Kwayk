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

    Texture {
        id: maps_lightmap_png_texture
        objectName: "maps/lightmap.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/lightmap.png"
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

    // Resources
    Texture {
        id: images_skill2_png_texture
        objectName: "images/skill2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/skill2.png"
    }
    Texture {
        id: images_tech01_1_png_texture
        objectName: "images/tech01_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech01_1.png"
    }
    Texture {
        id: images_switch_1_png_texture
        objectName: "images/switch_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/switch_1.png"
    }
    Texture {
        id: images_switch_1_glow_png_texture
        objectName: "images/switch_1_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/switch_1_glow.png"
    }
    Texture {
        id: images_sliptopsd_png_texture
        objectName: "images/sliptopsd.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sliptopsd.png"
    }
    Texture {
        id: images__lava1_png_texture
        objectName: "images/*lava1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*lava1.png"
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
        id: images_slipbotsd_png_texture
        objectName: "images/slipbotsd.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipbotsd.png"
    }
    Texture {
        id: images__teleport_png_texture
        objectName: "images/*teleport.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*teleport.png"
    }
    Texture {
        id: images_slip1_png_texture
        objectName: "images/slip1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slip1.png"
    }
    Texture {
        id: images_slip1_glow_png_texture
        objectName: "images/slip1_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slip1_glow.png"
    }
    Texture {
        id: images_skill3_png_texture
        objectName: "images/skill3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/skill3.png"
    }
    Texture {
        id: images__water1_png_texture
        objectName: "images/*water1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*water1.png"
    }
    Texture {
        id: images_tech01_6_png_texture
        objectName: "images/tech01_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech01_6.png"
    }
    Texture {
        id: images_skill1_png_texture
        objectName: "images/skill1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/skill1.png"
    }
    Texture {
        id: images__water2_png_texture
        objectName: "images/*water2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*water2.png"
    }
    Texture {
        id: images_skill0_png_texture
        objectName: "images/skill0.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/skill0.png"
    }
    Texture {
        id: images_sfloor4_5_png_texture
        objectName: "images/sfloor4_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sfloor4_5.png"
    }
    Texture {
        id: images_sfloor4_2_png_texture
        objectName: "images/sfloor4_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sfloor4_2.png"
    }
    Texture {
        id: images_rune2_3_png_texture
        objectName: "images/rune2_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rune2_3.png"
    }
    Texture {
        id: images_rune2_3_glow_png_texture
        objectName: "images/rune2_3_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rune2_3_glow.png"
    }
    Texture {
        id: images_sky1_png_texture
        objectName: "images/sky1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky1.png"
    }
    Texture {
        id: images_rock4_1_png_texture
        objectName: "images/rock4_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/rock4_1.png"
    }
    Texture {
        id: images_quake_png_texture
        objectName: "images/quake.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/quake.png"
    }
    Texture {
        id: images_metalt1_1_png_texture
        objectName: "images/metalt1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metalt1_1.png"
    }
    Texture {
        id: images_trigger_png_texture
        objectName: "images/trigger.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/trigger.png"
    }
    Texture {
        id: images_tlight08_png_texture
        objectName: "images/tlight08.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight08.png"
    }
    Texture {
        id: images_wizmet1_3_png_texture
        objectName: "images/wizmet1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizmet1_3.png"
    }
    Texture {
        id: images_wizmet1_2_png_texture
        objectName: "images/wizmet1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizmet1_2.png"
    }
    Texture {
        id: images_wizmet1_1_png_texture
        objectName: "images/wizmet1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizmet1_1.png"
    }
    Texture {
        id: images_wizmet1_8_png_texture
        objectName: "images/wizmet1_8.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizmet1_8.png"
    }
    Texture {
        id: images_wiz1_4_png_texture
        objectName: "images/wiz1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wiz1_4.png"
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
        id: images_window02_1_png_texture
        objectName: "images/window02_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/window02_1.png"
    }
    Texture {
        id: images_wizwood1_3_png_texture
        objectName: "images/wizwood1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizwood1_3.png"
    }
    Texture {
        id: images_wbrick1_5_png_texture
        objectName: "images/wbrick1_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wbrick1_5.png"
    }
    Texture {
        id: images_wall9_8_png_texture
        objectName: "images/wall9_8.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wall9_8.png"
    }
    Texture {
        id: images_wizwood1_5_png_texture
        objectName: "images/wizwood1_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizwood1_5.png"
    }
    Texture {
        id: images__0light01_png_texture
        objectName: "images/+0light01.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0light01.png"
    }
    Texture {
        id: images_tlight07_png_texture
        objectName: "images/tlight07.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight07.png"
    }
    Texture {
        id: images_tlight07_glow_png_texture
        objectName: "images/tlight07_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight07_glow.png"
    }
    Texture {
        id: images_wizwood1_8_png_texture
        objectName: "images/wizwood1_8.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wizwood1_8.png"
    }
    Texture {
        id: images_tlight02_png_texture
        objectName: "images/tlight02.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight02.png"
    }
    Texture {
        id: images_tlight02_glow_png_texture
        objectName: "images/tlight02_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight02_glow.png"
    }
    Texture {
        id: images_tech11_2_png_texture
        objectName: "images/tech11_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech11_2.png"
    }
    Texture {
        id: images_wmet3_1_png_texture
        objectName: "images/wmet3_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wmet3_1.png"
    }
    Texture {
        id: images_tech10_1_png_texture
        objectName: "images/tech10_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech10_1.png"
    }
    Texture {
        id: images_tech09_3_png_texture
        objectName: "images/tech09_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech09_3.png"
    }
    Texture {
        id: images_wmet4_4_png_texture
        objectName: "images/wmet4_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wmet4_4.png"
    }
    Texture {
        id: images_tech08_1_png_texture
        objectName: "images/tech08_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech08_1.png"
    }
    Texture {
        id: images_tech04_3_png_texture
        objectName: "images/tech04_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech04_3.png"
    }
    Texture {
        id: images_wood1_1_png_texture
        objectName: "images/wood1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/wood1_1.png"
    }
    Texture {
        id: images_bricka2_1_png_texture
        objectName: "images/bricka2_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/bricka2_1.png"
    }
    Texture {
        id: images_dem4_1_png_texture
        objectName: "images/dem4_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/dem4_1.png"
    }
    Texture {
        id: images_church1_2_png_texture
        objectName: "images/church1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/church1_2.png"
    }
    Texture {
        id: images_cop3_4_png_texture
        objectName: "images/cop3_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop3_4.png"
    }
    Texture {
        id: images_ceiling1_3_png_texture
        objectName: "images/ceiling1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/ceiling1_3.png"
    }
    Texture {
        id: images_m5_3_png_texture
        objectName: "images/m5_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/m5_3.png"
    }
    Texture {
        id: images_m5_5_png_texture
        objectName: "images/m5_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/m5_5.png"
    }
    Texture {
        id: images_city1_4_png_texture
        objectName: "images/city1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/city1_4.png"
    }
    Texture {
        id: images_bricka2_2_png_texture
        objectName: "images/bricka2_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/bricka2_2.png"
    }
    Texture {
        id: images_m5_8_png_texture
        objectName: "images/m5_8.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/m5_8.png"
    }
    Texture {
        id: images_metal6_4_png_texture
        objectName: "images/metal6_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal6_4.png"
    }
    Texture {
        id: images_cop1_6_png_texture
        objectName: "images/cop1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop1_6.png"
    }
    Texture {
        id: images_met5_1_png_texture
        objectName: "images/met5_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/met5_1.png"
    }
    Texture {
        id: images_metal1_4_png_texture
        objectName: "images/metal1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal1_4.png"
    }
    Texture {
        id: images__0sliptop_png_texture
        objectName: "images/+0sliptop.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0sliptop.png"
    }
    Texture {
        id: images_door04_2_png_texture
        objectName: "images/door04_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/door04_2.png"
    }
    Texture {
        id: images_metal5_1_png_texture
        objectName: "images/metal5_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal5_1.png"
    }
    Texture {
        id: images__0slipbot_png_texture
        objectName: "images/+0slipbot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slipbot.png"
    }
    Texture {
        id: images_cop1_1_png_texture
        objectName: "images/cop1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/cop1_1.png"
    }
    Texture {
        id: images_metal5_3_png_texture
        objectName: "images/metal5_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal5_3.png"
    }
    Texture {
        id: images__0slip_png_texture
        objectName: "images/+0slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slip.png"
    }
    Texture {
        id: images__0slip_glow_png_texture
        objectName: "images/+0slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slip_glow.png"
    }
    Texture {
        id: images__1slip_png_texture
        objectName: "images/+1slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1slip.png"
    }
    Texture {
        id: images__1slip_glow_png_texture
        objectName: "images/+1slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1slip_glow.png"
    }
    Texture {
        id: images__2slip_png_texture
        objectName: "images/+2slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2slip.png"
    }
    Texture {
        id: images__2slip_glow_png_texture
        objectName: "images/+2slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+2slip_glow.png"
    }
    Texture {
        id: images__3slip_png_texture
        objectName: "images/+3slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3slip.png"
    }
    Texture {
        id: images__3slip_glow_png_texture
        objectName: "images/+3slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+3slip_glow.png"
    }
    Texture {
        id: images__4slip_png_texture
        objectName: "images/+4slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+4slip.png"
    }
    Texture {
        id: images__4slip_glow_png_texture
        objectName: "images/+4slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+4slip_glow.png"
    }
    Texture {
        id: images__5slip_png_texture
        objectName: "images/+5slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+5slip.png"
    }
    Texture {
        id: images__5slip_glow_png_texture
        objectName: "images/+5slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+5slip_glow.png"
    }
    Texture {
        id: images__6slip_png_texture
        objectName: "images/+6slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+6slip.png"
    }
    Texture {
        id: images__6slip_glow_png_texture
        objectName: "images/+6slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+6slip_glow.png"
    }
    Texture {
        id: images_metal5_4_png_texture
        objectName: "images/metal5_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/metal5_4.png"
    }
    Texture {
        id: images_city4_6_png_texture
        objectName: "images/city4_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/city4_6.png"
    }
    Texture {
        id: images_city4_7_png_texture
        objectName: "images/city4_7.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/city4_7.png"
    }

    // Materials
    BrushMaterial {
        id: trigger_9_material
        objectName: "trigger 9"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: church1_2_1_material
        objectName: "church1_2 1"
        frameMaps: [{ colorMap: images_church1_2_png_texture }]
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
        id: met5_1_6_material
        objectName: "met5_1 6"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
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
        id: trigger_7_material
        objectName: "trigger 7"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
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
        id: trigger_6_material
        objectName: "trigger 6"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_32_material
        objectName: "trigger 32"
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
        id: trigger_15_material
        objectName: "trigger 15"
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
        id: trigger_16_material
        objectName: "trigger 16"
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
        id: trigger_17_material
        objectName: "trigger 17"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    SkyLayerMaterial {
        id: sky1_1_material
        objectName: "sky1 1"
        alphaColorMap: images_sky1_front_png_texture
        solidColorMap: images_sky1_back_png_texture
    }
    BrushMaterial {
        id: trigger_18_material
        objectName: "trigger 18"
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
        id: cop1_1_1_material
        objectName: "cop1_1 1"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
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
        id: trigger_10_material
        objectName: "trigger 10"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
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
        id: cop1_1_4_material
        objectName: "cop1_1 4"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop3_4_3_material
        objectName: "cop3_4 3"
        frameMaps: [{ colorMap: images_cop3_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_1_5_material
        objectName: "cop1_1 5"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop3_4_4_material
        objectName: "cop3_4 4"
        frameMaps: [{ colorMap: images_cop3_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_27_material
        objectName: "trigger 27"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
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
        id: z_exit_4_material
        objectName: "z_exit 4"
        frameMaps: [{ colorMap: images_z_exit_png_texture, fullbrightColorMap: images_z_exit_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rock4_1_1_material
        objectName: "rock4_1 1"
        frameMaps: [{ colorMap: images_rock4_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rock4_1_2_material
        objectName: "rock4_1 2"
        frameMaps: [{ colorMap: images_rock4_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_28_material
        objectName: "trigger 28"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_29_material
        objectName: "trigger 29"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_30_material
        objectName: "trigger 30"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_31_material
        objectName: "trigger 31"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
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
        id: _0light01_material
        objectName: "+0light01"
        frameMaps: [{ colorMap: images__0light01_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_23_material
        objectName: "trigger 23"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: z_exit_1_material
        objectName: "z_exit 1"
        frameMaps: [{ colorMap: images_z_exit_png_texture, fullbrightColorMap: images_z_exit_glow_png_texture }]
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
        id: z_exit_2_material
        objectName: "z_exit 2"
        frameMaps: [{ colorMap: images_z_exit_png_texture, fullbrightColorMap: images_z_exit_glow_png_texture }]
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
        id: z_exit_3_material
        objectName: "z_exit 3"
        frameMaps: [{ colorMap: images_z_exit_png_texture, fullbrightColorMap: images_z_exit_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_21_material
        objectName: "trigger 21"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_22_material
        objectName: "trigger 22"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
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
        id: trigger_24_material
        objectName: "trigger 24"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: city4_7_1_material
        objectName: "city4_7 1"
        frameMaps: [{ colorMap: images_city4_7_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_25_material
        objectName: "trigger 25"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: trigger_26_material
        objectName: "trigger 26"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: cop1_1_2_material
        objectName: "cop1_1 2"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
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
        id: cop1_1_3_material
        objectName: "cop1_1 3"
        frameMaps: [{ colorMap: images_cop1_1_png_texture }]
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
        id: slipside_material
        objectName: "slipside"
        frameMaps: [{ colorMap: images_slipside_png_texture, fullbrightColorMap: images_slipside_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: quake_material
        objectName: "quake"
        frameMaps: [{ colorMap: images_quake_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rock4_1_material
        objectName: "rock4_1"
        frameMaps: [{ colorMap: images_rock4_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: rune2_3_material
        objectName: "rune2_3"
        frameMaps: [{ colorMap: images_rune2_3_png_texture, fullbrightColorMap: images_rune2_3_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: sfloor4_2_material
        objectName: "sfloor4_2"
        frameMaps: [{ colorMap: images_sfloor4_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: sfloor4_5_material
        objectName: "sfloor4_5"
        frameMaps: [{ colorMap: images_sfloor4_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: skill0_material
        objectName: "skill0"
        frameMaps: [{ colorMap: images_skill0_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: skill1_material
        objectName: "skill1"
        frameMaps: [{ colorMap: images_skill1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: skill2_material
        objectName: "skill2"
        frameMaps: [{ colorMap: images_skill2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: skill3_material
        objectName: "skill3"
        frameMaps: [{ colorMap: images_skill3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: slip1_material
        objectName: "slip1"
        frameMaps: [{ colorMap: images_slip1_png_texture, fullbrightColorMap: images_slip1_glow_png_texture }]
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
        id: metalt1_1_material
        objectName: "metalt1_1"
        frameMaps: [{ colorMap: images_metalt1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: sliptopsd_material
        objectName: "sliptopsd"
        frameMaps: [{ colorMap: images_sliptopsd_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: switch_1_material
        objectName: "switch_1"
        frameMaps: [{ colorMap: images_switch_1_png_texture, fullbrightColorMap: images_switch_1_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech01_1_material
        objectName: "tech01_1"
        frameMaps: [{ colorMap: images_tech01_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech01_6_material
        objectName: "tech01_6"
        frameMaps: [{ colorMap: images_tech01_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_3_material
        objectName: "tech04_3"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech08_1_material
        objectName: "tech08_1"
        frameMaps: [{ colorMap: images_tech08_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech09_3_material
        objectName: "tech09_3"
        frameMaps: [{ colorMap: images_tech09_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech10_1_material
        objectName: "tech10_1"
        frameMaps: [{ colorMap: images_tech10_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech11_2_material
        objectName: "tech11_2"
        frameMaps: [{ colorMap: images_tech11_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tlight02_material
        objectName: "tlight02"
        frameMaps: [{ colorMap: images_tlight02_png_texture, fullbrightColorMap: images_tlight02_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tlight07_material
        objectName: "tlight07"
        frameMaps: [{ colorMap: images_tlight07_png_texture, fullbrightColorMap: images_tlight07_glow_png_texture }]
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
        id: _0slip_material
        objectName: "+0slip"
        frameMaps: [
            { colorMap: images__0slip_png_texture, fullbrightColorMap: images__0slip_glow_png_texture },
            { colorMap: images__1slip_png_texture, fullbrightColorMap: images__1slip_glow_png_texture },
            { colorMap: images__2slip_png_texture, fullbrightColorMap: images__2slip_glow_png_texture },
            { colorMap: images__3slip_png_texture, fullbrightColorMap: images__3slip_glow_png_texture },
            { colorMap: images__4slip_png_texture, fullbrightColorMap: images__4slip_glow_png_texture },
            { colorMap: images__5slip_png_texture, fullbrightColorMap: images__5slip_glow_png_texture },
            { colorMap: images__6slip_png_texture, fullbrightColorMap: images__6slip_glow_png_texture }
        ]
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
        id: _0sliptop_material
        objectName: "+0sliptop"
        frameMaps: [{ colorMap: images__0sliptop_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: bricka2_1_material
        objectName: "bricka2_1"
        frameMaps: [{ colorMap: images_bricka2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: bricka2_2_material
        objectName: "bricka2_2"
        frameMaps: [{ colorMap: images_bricka2_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: ceiling1_3_material
        objectName: "ceiling1_3"
        frameMaps: [{ colorMap: images_ceiling1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: church1_2_material
        objectName: "church1_2"
        frameMaps: [{ colorMap: images_church1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: city1_4_material
        objectName: "city1_4"
        frameMaps: [{ colorMap: images_city1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: city4_6_material
        objectName: "city4_6"
        frameMaps: [{ colorMap: images_city4_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: city4_7_material
        objectName: "city4_7"
        frameMaps: [{ colorMap: images_city4_7_png_texture }]
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
        id: tlight08_material
        objectName: "tlight08"
        frameMaps: [{ colorMap: images_tlight08_png_texture }]
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
        id: dem4_1_material
        objectName: "dem4_1"
        frameMaps: [{ colorMap: images_dem4_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: m5_3_material
        objectName: "m5_3"
        frameMaps: [{ colorMap: images_m5_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: m5_5_material
        objectName: "m5_5"
        frameMaps: [{ colorMap: images_m5_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: m5_8_material
        objectName: "m5_8"
        frameMaps: [{ colorMap: images_m5_8_png_texture }]
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
        id: metal1_4_material
        objectName: "metal1_4"
        frameMaps: [{ colorMap: images_metal1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_1_material
        objectName: "metal5_1"
        frameMaps: [{ colorMap: images_metal5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_3_material
        objectName: "metal5_3"
        frameMaps: [{ colorMap: images_metal5_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: metal5_4_material
        objectName: "metal5_4"
        frameMaps: [{ colorMap: images_metal5_4_png_texture }]
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
        id: door04_2_material
        objectName: "door04_2"
        frameMaps: [{ colorMap: images_door04_2_png_texture }]
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
        id: trigger_2_material
        objectName: "trigger 2"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: met5_1_1_material
        objectName: "met5_1 1"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizmet1_8_1_material
        objectName: "wizmet1_8 1"
        frameMaps: [{ colorMap: images_wizmet1_8_png_texture }]
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
    BrushMaterial {
        id: wizmet1_8_2_material
        objectName: "wizmet1_8 2"
        frameMaps: [{ colorMap: images_wizmet1_8_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    SkyLayerMaterial {
        id: sky1_material
        objectName: "sky1"
        alphaColorMap: images_sky1_front_png_texture
        solidColorMap: images_sky1_back_png_texture
    }
    BrushMaterial {
        id: met5_1_3_material
        objectName: "met5_1 3"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door04_2_1_material
        objectName: "door04_2 1"
        frameMaps: [{ colorMap: images_door04_2_png_texture }]
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
        id: met5_1_5_material
        objectName: "met5_1 5"
        frameMaps: [{ colorMap: images_met5_1_png_texture }]
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
        id: wmet3_1_material
        objectName: "wmet3_1"
        frameMaps: [{ colorMap: images_wmet3_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wall9_8_material
        objectName: "wall9_8"
        frameMaps: [{ colorMap: images_wall9_8_png_texture }]
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
        id: window02_1_material
        objectName: "window02_1"
        frameMaps: [{ colorMap: images_window02_1_png_texture }]
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
        id: wizmet1_1_material
        objectName: "wizmet1_1"
        frameMaps: [{ colorMap: images_wizmet1_1_png_texture }]
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
    BrushMaterial {
        id: wizmet1_3_material
        objectName: "wizmet1_3"
        frameMaps: [{ colorMap: images_wizmet1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizmet1_8_material
        objectName: "wizmet1_8"
        frameMaps: [{ colorMap: images_wizmet1_8_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wizwood1_3_material
        objectName: "wizwood1_3"
        frameMaps: [{ colorMap: images_wizwood1_3_png_texture }]
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
        id: wizwood1_8_material
        objectName: "wizwood1_8"
        frameMaps: [{ colorMap: images_wizwood1_8_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wmet4_4_material
        objectName: "wmet4_4"
        frameMaps: [{ colorMap: images_wmet4_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: wood1_1_material
        objectName: "wood1_1"
        frameMaps: [{ colorMap: images_wood1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    TurbulentMaterial {
        id: _lava1_material
        colorMap: images__lava1_png_texture
        emissiveIntensity: 5
        emissiveColor: "#ff2200"
    }
    TurbulentMaterial {
        id: _teleport_material
        colorMap: images__teleport_png_texture
    }
    TurbulentMaterial {
        id: _water1_material
        colorMap: images__water1_png_texture
    }
    TurbulentMaterial {
        id: _water2_material
        colorMap: images__water2_png_texture
    }

    // Nodes:
    Node {
        id: start
        objectName: "start"
        Model {
            source: "meshes/solid_0_mesh.mesh"
            usedInBakedLighting: true
            bakedLightmap: BakedLightmap {
                enabled: lightmapEnabled
                key: "solid_0"
                loadPrefix: "qrc:/Assets/maps/start"
            }
            materials: [
                _0light01_material,
                _0slip_material,
                _0slipbot_material,
                _0sliptop_material,
                bricka2_1_material,
                bricka2_2_material,
                ceiling1_3_material,
                church1_2_material,
                city1_4_material,
                city4_6_material,
                city4_7_material,
                cop1_1_material,
                cop1_6_material,
                cop3_4_material,
                dem4_1_material,
                m5_3_material,
                m5_5_material,
                m5_8_material,
                met5_1_material,
                metal1_4_material,
                metal5_1_material,
                metal5_3_material,
                metal5_4_material,
                metal6_4_material,
                metalt1_1_material,
                quake_material,
                rock4_1_material,
                rune2_3_material,
                sfloor4_2_material,
                sfloor4_5_material,
                skill0_material,
                skill1_material,
                skill2_material,
                skill3_material,
                slip1_material,
                slipbotsd_material,
                sliplite_material,
                slipside_material,
                sliptopsd_material,
                switch_1_material,
                tech01_1_material,
                tech01_6_material,
                tech04_3_material,
                tech08_1_material,
                tech09_3_material,
                tech10_1_material,
                tech11_2_material,
                tlight02_material,
                tlight07_material,
                tlight08_material,
                wall9_8_material,
                wbrick1_5_material,
                window02_1_material,
                wiz1_4_material,
                wizmet1_1_material,
                wizmet1_2_material,
                wizmet1_3_material,
                wizmet1_8_material,
                wizwood1_3_material,
                wizwood1_5_material,
                wizwood1_8_material,
                wmet3_1_material,
                wmet4_4_material,
                wood1_1_material
            ]
            castsShadows: false
        }
        Model {
            id: water
            objectName: "water"
            source: "meshes/water_mesh.mesh"
            materials: [
                _water1_material,
                _water2_material
            ]
            castsShadows: false
            receivesShadows: false
        }
        Model {
            id: sky
            source: "meshes/sky_mesh.mesh"
            materials: [
                sky1_material
            ]
            castsShadows: false
            receivesShadows: false
        }
        Model {
            id: lava
            objectName: "lava"
            source: "meshes/lava_mesh.mesh"
            materials: [
                _lava1_material
            ]
            castsShadows: false
            receivesShadows: false
        }
        Model {
            id: tele
            objectName: "tele"
            source: "meshes/tele_mesh.mesh"
            materials: [
                _teleport_material
            ]
            castsShadows: false
            receivesShadows: false
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
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_3
            objectName: "solid_3"
            shape: MeshShape {
                source: "meshes/solid_3_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                materials: [
                    met5_1_1_material,
                    wizmet1_8_1_material
                ]
                castsShadows: false
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
                materials: [
                    met5_1_2_material,
                    wizmet1_8_2_material
                ]
                castsShadows: false
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
                materials: [
                    door04_2_material,
                    met5_1_3_material
                ]
                castsShadows: false
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
                materials: [
                    door04_2_1_material,
                    met5_1_4_material
                ]
                castsShadows: false
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
                materials: [
                    met5_1_5_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_9
            objectName: "solid_9"
            shape: MeshShape {
                source: "meshes/solid_9_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_10
            objectName: "solid_10"
            shape: MeshShape {
                source: "meshes/solid_10_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_11
            objectName: "solid_11"
            shape: MeshShape {
                source: "meshes/solid_11_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_14
            objectName: "solid_14"
            shape: MeshShape {
                source: "meshes/solid_14_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_15
            objectName: "solid_15"
            shape: MeshShape {
                source: "meshes/solid_15_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_16
            objectName: "solid_16"
            shape: MeshShape {
                source: "meshes/solid_16_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_17
            objectName: "solid_17"
            shape: MeshShape {
                source: "meshes/solid_17_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_18
            objectName: "solid_18"
            shape: MeshShape {
                source: "meshes/solid_18_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_19
            objectName: "solid_19"
            shape: MeshShape {
                source: "meshes/solid_19_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Static
            isSensor: true
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
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_24
            objectName: "solid_24"
            shape: MeshShape {
                source: "meshes/solid_24_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_25
            objectName: "solid_25"
            shape: MeshShape {
                source: "meshes/solid_25_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
                materials: [
                    cop1_1_1_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_27
            objectName: "solid_27"
            shape: MeshShape {
                source: "meshes/solid_27_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_29_mesh.mesh"
                materials: [
                    church1_2_1_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_30
            objectName: "solid_30"
            shape: MeshShape {
                source: "meshes/solid_30_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_30_mesh.mesh"
                materials: [
                    met5_1_6_material,
                    z_exit_material
                ]
                castsShadows: false
            }
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
                materials: [
                    met5_1_7_material,
                    z_exit_1_material
                ]
                castsShadows: false
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
                materials: [
                    met5_1_8_material,
                    z_exit_2_material
                ]
                castsShadows: false
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
                materials: [
                    met5_1_9_material,
                    z_exit_3_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_34
            objectName: "solid_34"
            shape: MeshShape {
                source: "meshes/solid_34_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_38
            objectName: "solid_38"
            shape: MeshShape {
                source: "meshes/solid_38_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_38_mesh.mesh"
                materials: [
                    city4_7_1_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_39
            objectName: "solid_39"
            shape: MeshShape {
                source: "meshes/solid_39_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_40
            objectName: "solid_40"
            shape: MeshShape {
                source: "meshes/solid_40_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_41
            objectName: "solid_41"
            shape: MeshShape {
                source: "meshes/solid_41_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_41_mesh.mesh"
                materials: [
                    cop1_1_2_material,
                    cop3_4_1_material
                ]
                castsShadows: false
            }
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
                materials: [
                    cop1_1_3_material,
                    cop3_4_2_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_43
            objectName: "solid_43"
            shape: MeshShape {
                source: "meshes/solid_43_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_43_mesh.mesh"
                materials: [
                    cop1_1_4_material,
                    cop3_4_3_material
                ]
                castsShadows: false
            }
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
                materials: [
                    cop1_1_5_material,
                    cop3_4_4_material
                ]
                castsShadows: false
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
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_46_mesh.mesh"
                materials: [
                    met5_1_10_material,
                    z_exit_4_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_47
            objectName: "solid_47"
            shape: MeshShape {
                source: "meshes/solid_47_hull0_mesh.mesh"
            }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_47_mesh.mesh"
                materials: [
                    rock4_1_1_material
                ]
                castsShadows: false
            }
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
                materials: [
                    rock4_1_2_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_49
            objectName: "solid_49"
            shape: MeshShape {
                source: "meshes/solid_49_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_50
            objectName: "solid_50"
            shape: MeshShape {
                source: "meshes/solid_50_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_51
            objectName: "solid_51"
            shape: MeshShape {
                source: "meshes/solid_51_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
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
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_53_mesh.mesh"
                materials: [
                    met5_1_11_material
                ]
                castsShadows: false
            }
        }
        Solid {
            id: solid_54
            objectName: "solid_54"
            shape: MeshShape {
                source: "meshes/solid_54_hull0_mesh.mesh"
            }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
    }

    // Animations:
}
