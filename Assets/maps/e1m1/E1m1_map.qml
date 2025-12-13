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

    // Glow textures
    Texture {
        id: images_switch_1_glow_png_texture
        objectName: "images/switch_1_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/switch_1_glow.png"
    }
    Texture {
        id: images_tlight01_glow_png_texture
        objectName: "images/tlight01_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight01_glow.png"
    }
    Texture {
        id: images_tlight02_glow_png_texture
        objectName: "images/tlight02_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight02_glow.png"
    }
    Texture {
        id: images_tlight07_glow_png_texture
        objectName: "images/tlight07_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight07_glow.png"
    }
    Texture {
        id: images_tlight11_glow_png_texture
        objectName: "images/tlight11_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight11_glow.png"
    }
    Texture {
        id: images__0basebtn_glow_png_texture
        objectName: "images/+0basebtn_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0basebtn_glow.png"
    }
    Texture {
        id: images__1basebtn_png_texture
        objectName: "images/+1basebtn.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+1basebtn.png"
    }
    Texture {
        id: images__abasebtn_png_texture
        objectName: "images/+abasebtn.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+abasebtn.png"
    }
    Texture {
        id: images_basebutn3_glow_png_texture
        objectName: "images/basebutn3_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/basebutn3_glow.png"
    }
    Texture {
        id: images_slipside_glow_png_texture
        objectName: "images/slipside_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipside_glow.png"
    }
    Texture {
        id: images_sliplite_glow_png_texture
        objectName: "images/sliplite_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sliplite_glow.png"
    }
    Texture {
        id: images_slip1_glow_png_texture
        objectName: "images/slip1_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slip1_glow.png"
    }
    Texture {
        id: images__0slip_glow_png_texture
        objectName: "images/+0slip_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slip_glow.png"
    }
    Texture {
        id: images_comp1_6_glow_png_texture
        objectName: "images/comp1_6_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_6_glow.png"
    }
    Texture {
        id: images_z_exit_glow_png_texture
        objectName: "images/z_exit_glow.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/z_exit_glow.png"
    }

    // Resources
    Texture {
        id: images_tech07_2_png_texture
        objectName: "images/tech07_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech07_2.png"
    }
    Texture {
        id: images_tlight11_png_texture
        objectName: "images/tlight11.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight11.png"
    }
    Texture {
        id: images_tlight10_png_texture
        objectName: "images/tlight10.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight10.png"
    }
    Texture {
        id: images_tlight08_png_texture
        objectName: "images/tlight08.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight08.png"
    }
    Texture {
        id: images_tlight07_png_texture
        objectName: "images/tlight07.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight07.png"
    }
    Texture {
        id: images_tlight02_png_texture
        objectName: "images/tlight02.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight02.png"
    }
    Texture {
        id: images_tlight01_png_texture
        objectName: "images/tlight01.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tlight01.png"
    }
    Texture {
        id: images_tech11_2_png_texture
        objectName: "images/tech11_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech11_2.png"
    }
    Texture {
        id: images_tech10_3_png_texture
        objectName: "images/tech10_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech10_3.png"
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
        id: images_tech08_1_png_texture
        objectName: "images/tech08_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech08_1.png"
    }
    Texture {
        id: images_twall1_1_png_texture
        objectName: "images/twall1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall1_1.png"
    }
    Texture {
        id: images_tech04_3_png_texture
        objectName: "images/tech04_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech04_3.png"
    }
    Texture {
        id: images_tech04_2_png_texture
        objectName: "images/tech04_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech04_2.png"
    }
    Texture {
        id: images_tech04_1_png_texture
        objectName: "images/tech04_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech04_1.png"
    }
    Texture {
        id: images_tech01_9_png_texture
        objectName: "images/tech01_9.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech01_9.png"
    }
    Texture {
        id: images_tech01_7_png_texture
        objectName: "images/tech01_7.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech01_7.png"
    }
    Texture {
        id: images_tech01_6_png_texture
        objectName: "images/tech01_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/tech01_6.png"
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
        id: images_sliptopsd_png_texture
        objectName: "images/sliptopsd.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sliptopsd.png"
    }
    Texture {
        id: images_slipside_png_texture
        objectName: "images/slipside.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipside.png"
    }
    Texture {
        id: images__slime0_png_texture
        objectName: "images/*slime0.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*slime0.png"
    }
    Texture {
        id: images_trigger_png_texture
        objectName: "images/trigger.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/trigger.png"
    }
    Texture {
        id: images__0basebtn_png_texture
        objectName: "images/+0basebtn.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0basebtn.png"
    }
    Texture {
        id: images_plat_top1_png_texture
        objectName: "images/plat_top1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/plat_top1.png"
    }
    Texture {
        id: images_plat_stem_png_texture
        objectName: "images/plat_stem.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/plat_stem.png"
    }
    Texture {
        id: images_plat_side1_png_texture
        objectName: "images/plat_side1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/plat_side1.png"
    }
    Texture {
        id: images_key01_3_png_texture
        objectName: "images/key01_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/key01_3.png"
    }
    Texture {
        id: images_edoor01_1_png_texture
        objectName: "images/edoor01_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/edoor01_1.png"
    }
    Texture {
        id: images_door02_1_png_texture
        objectName: "images/door02_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/door02_1.png"
    }
    Texture {
        id: images_sky4_png_texture
        objectName: "images/sky4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sky4.png"
    }
    Texture {
        id: images__water0_png_texture
        objectName: "images/*water0.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*water0.png"
    }
    Texture {
        id: images__teleport_png_texture
        objectName: "images/*teleport.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/*teleport.png"
    }
    Texture {
        id: images__0planet_png_texture
        objectName: "images/+0planet.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0planet.png"
    }
    Texture {
        id: images_z_exit_png_texture
        objectName: "images/z_exit.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/z_exit.png"
    }
    Texture {
        id: images_uwall1_2_png_texture
        objectName: "images/uwall1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/uwall1_2.png"
    }
    Texture {
        id: images_twall5_3_png_texture
        objectName: "images/twall5_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall5_3.png"
    }
    Texture {
        id: images_twall5_1_png_texture
        objectName: "images/twall5_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall5_1.png"
    }
    Texture {
        id: images_twall3_1_png_texture
        objectName: "images/twall3_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall3_1.png"
    }
    Texture {
        id: images_twall2_6_png_texture
        objectName: "images/twall2_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall2_6.png"
    }
    Texture {
        id: images_twall2_5_png_texture
        objectName: "images/twall2_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall2_5.png"
    }
    Texture {
        id: images_twall2_3_png_texture
        objectName: "images/twall2_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall2_3.png"
    }
    Texture {
        id: images_twall2_2_png_texture
        objectName: "images/twall2_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall2_2.png"
    }
    Texture {
        id: images_twall2_1_png_texture
        objectName: "images/twall2_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/twall2_1.png"
    }
    Texture {
        id: images_comp1_6_png_texture
        objectName: "images/comp1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_6.png"
    }
    Texture {
        id: images_ground1_6_png_texture
        objectName: "images/ground1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/ground1_6.png"
    }
    Texture {
        id: images_ground1_2_png_texture
        objectName: "images/ground1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/ground1_2.png"
    }
    Texture {
        id: images_ecop1_6_png_texture
        objectName: "images/ecop1_6.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/ecop1_6.png"
    }
    Texture {
        id: images_ecop1_4_png_texture
        objectName: "images/ecop1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/ecop1_4.png"
    }
    Texture {
        id: images_ecop1_1_png_texture
        objectName: "images/ecop1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/ecop1_1.png"
    }
    Texture {
        id: images_crate0_top_png_texture
        objectName: "images/crate0_top.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/crate0_top.png"
    }
    Texture {
        id: images_crate0_side_png_texture
        objectName: "images/crate0_side.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/crate0_side.png"
    }
    Texture {
        id: images__0slip_png_texture
        objectName: "images/+0slip.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slip.png"
    }
    Texture {
        id: images_sliplite_png_texture
        objectName: "images/sliplite.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sliplite.png"
    }
    Texture {
        id: images_comp1_5_png_texture
        objectName: "images/comp1_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_5.png"
    }
    Texture {
        id: images__0slipbot_png_texture
        objectName: "images/+0slipbot.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0slipbot.png"
    }
    Texture {
        id: images_comp1_4_png_texture
        objectName: "images/comp1_4.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_4.png"
    }
    Texture {
        id: images_comp1_3_png_texture
        objectName: "images/comp1_3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_3.png"
    }
    Texture {
        id: images__0sliptop_png_texture
        objectName: "images/+0sliptop.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/+0sliptop.png"
    }
    Texture {
        id: images_comp1_2_png_texture
        objectName: "images/comp1_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_2.png"
    }
    Texture {
        id: images_basebutn3_png_texture
        objectName: "images/basebutn3.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/basebutn3.png"
    }
    Texture {
        id: images_comp1_1_png_texture
        objectName: "images/comp1_1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/comp1_1.png"
    }
    Texture {
        id: images_sfloor4_2_png_texture
        objectName: "images/sfloor4_2.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sfloor4_2.png"
    }
    Texture {
        id: images_slip1_png_texture
        objectName: "images/slip1.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slip1.png"
    }
    Texture {
        id: images_sfloor4_5_png_texture
        objectName: "images/sfloor4_5.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/sfloor4_5.png"
    }
    Texture {
        id: images_slipbotsd_png_texture
        objectName: "images/slipbotsd.png"
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "maps/slipbotsd.png"
    }
    BrushMaterial {
        id: tech04_1_4_material
        objectName: "tech04_1 4"
        frameMaps: [{ colorMap: images_tech04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0basebtn_5_material
        objectName: "+0basebtn 5"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
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
        id: door02_1_9_material
        objectName: "door02_1 9"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
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
        id: _0basebtn_6_material
        objectName: "+0basebtn 6"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: key01_3_material
        objectName: "key01_3"
        frameMaps: [{ colorMap: images_key01_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech08_1_2_material
        objectName: "tech08_1 2"
        frameMaps: [{ colorMap: images_tech08_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_3_2_material
        objectName: "tech04_3 2"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_3_5_material
        objectName: "tech04_3 5"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_1_3_material
        objectName: "tech04_1 3"
        frameMaps: [{ colorMap: images_tech04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: sfloor4_2_1_material
        objectName: "sfloor4_2 1"
        frameMaps: [{ colorMap: images_sfloor4_2_png_texture }]
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
        id: tech04_3_4_material
        objectName: "tech04_3 4"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
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
        id: tech04_3_3_material
        objectName: "tech04_3 3"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech08_1_3_material
        objectName: "tech08_1 3"
        frameMaps: [{ colorMap: images_tech08_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0basebtn_2_material
        objectName: "+0basebtn 2"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech09_3_1_material
        objectName: "tech09_3 1"
        frameMaps: [{ colorMap: images_tech09_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_side1_2_material
        objectName: "plat_side1 2"
        frameMaps: [{ colorMap: images_plat_side1_png_texture }]
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
        id: plat_top1_2_material
        objectName: "plat_top1 2"
        frameMaps: [{ colorMap: images_plat_top1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_8_material
        objectName: "door02_1 8"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech08_1_4_material
        objectName: "tech08_1 4"
        frameMaps: [{ colorMap: images_tech08_1_png_texture }]
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
        id: _0basebtn_3_material
        objectName: "+0basebtn 3"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_7_material
        objectName: "door02_1 7"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0basebtn_4_material
        objectName: "+0basebtn 4"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0planet_material
        objectName: "+0planet"
        frameMaps: [{ colorMap: images__0planet_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_6_material
        objectName: "door02_1 6"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
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
        id: trigger_20_material
        objectName: "trigger 20"
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
        id: trigger_11_material
        objectName: "trigger 11"
        frameMaps: [{ colorMap: images_trigger_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_3_6_material
        objectName: "tech04_3 6"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
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
        id: tech08_1_5_material
        objectName: "tech08_1 5"
        frameMaps: [{ colorMap: images_tech08_1_png_texture }]
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
        id: comp1_4_1_material
        objectName: "comp1_4 1"
        frameMaps: [{ colorMap: images_comp1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_6_1_material
        objectName: "comp1_6 1"
        frameMaps: [{ colorMap: images_comp1_6_png_texture, fullbrightColorMap: images_comp1_6_glow_png_texture }]
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
        id: trigger_13_material
        objectName: "trigger 13"
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
        id: trigger_15_material
        objectName: "trigger 15"
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
    BrushMaterial {
        id: trigger_24_material
        objectName: "trigger 24"
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
        id: sfloor4_2_2_material
        objectName: "sfloor4_2 2"
        frameMaps: [{ colorMap: images_sfloor4_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tlight11_1_material
        objectName: "tlight11 1"
        frameMaps: [{ colorMap: images_tlight11_png_texture, fullbrightColorMap: images_tlight11_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: sfloor4_2_3_material
        objectName: "sfloor4_2 3"
        frameMaps: [{ colorMap: images_sfloor4_2_png_texture }]
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
        id: tlight11_2_material
        objectName: "tlight11 2"
        frameMaps: [{ colorMap: images_tlight11_png_texture, fullbrightColorMap: images_tlight11_glow_png_texture }]
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
        id: sfloor4_2_4_material
        objectName: "sfloor4_2 4"
        frameMaps: [{ colorMap: images_sfloor4_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tlight11_3_material
        objectName: "tlight11 3"
        frameMaps: [{ colorMap: images_tlight11_png_texture, fullbrightColorMap: images_tlight11_glow_png_texture }]
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
        id: sfloor4_2_5_material
        objectName: "sfloor4_2 5"
        frameMaps: [{ colorMap: images_sfloor4_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tlight11_4_material
        objectName: "tlight11 4"
        frameMaps: [{ colorMap: images_tlight11_png_texture, fullbrightColorMap: images_tlight11_glow_png_texture }]
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
        id: key01_3_1_material
        objectName: "key01_3 1"
        frameMaps: [{ colorMap: images_key01_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_1_2_material
        objectName: "tech04_1 2"
        frameMaps: [{ colorMap: images_tech04_1_png_texture }]
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
        id: tech01_7_material
        objectName: "tech01_7"
        frameMaps: [{ colorMap: images_tech01_7_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech01_9_material
        objectName: "tech01_9"
        frameMaps: [{ colorMap: images_tech01_9_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_1_material
        objectName: "tech04_1"
        frameMaps: [{ colorMap: images_tech04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_2_material
        objectName: "tech04_2"
        frameMaps: [{ colorMap: images_tech04_2_png_texture }]
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
        id: tech07_2_material
        objectName: "tech07_2"
        frameMaps: [{ colorMap: images_tech07_2_png_texture }]
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
        id: tech10_3_material
        objectName: "tech10_3"
        frameMaps: [{ colorMap: images_tech10_3_png_texture }]
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
        id: tlight01_material
        objectName: "tlight01"
        frameMaps: [{ colorMap: images_tlight01_png_texture, fullbrightColorMap: images_tlight01_glow_png_texture }]
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
        id: tech01_6_material
        objectName: "tech01_6"
        frameMaps: [{ colorMap: images_tech01_6_png_texture }]
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
        id: tlight10_material
        objectName: "tlight10"
        frameMaps: [{ colorMap: images_tlight10_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tlight11_material
        objectName: "tlight11"
        frameMaps: [{ colorMap: images_tlight11_png_texture, fullbrightColorMap: images_tlight11_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall1_1_material
        objectName: "twall1_1"
        frameMaps: [{ colorMap: images_twall1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_1_material
        objectName: "twall2_1"
        frameMaps: [{ colorMap: images_twall2_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_2_material
        objectName: "twall2_2"
        frameMaps: [{ colorMap: images_twall2_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_3_material
        objectName: "twall2_3"
        frameMaps: [{ colorMap: images_twall2_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_5_material
        objectName: "twall2_5"
        frameMaps: [{ colorMap: images_twall2_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_6_material
        objectName: "twall2_6"
        frameMaps: [{ colorMap: images_twall2_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall3_1_material
        objectName: "twall3_1"
        frameMaps: [{ colorMap: images_twall3_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall5_1_material
        objectName: "twall5_1"
        frameMaps: [{ colorMap: images_twall5_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall5_3_material
        objectName: "twall5_3"
        frameMaps: [{ colorMap: images_twall5_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: ecop1_4_material
        objectName: "ecop1_4"
        frameMaps: [{ colorMap: images_ecop1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0slip_material
        objectName: "+0slip"
        frameMaps: [{ colorMap: images__0slip_png_texture, fullbrightColorMap: images__0slip_glow_png_texture }]
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
        id: basebutn3_material
        objectName: "basebutn3"
        frameMaps: [{ colorMap: images_basebutn3_png_texture, fullbrightColorMap: images_basebutn3_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_1_material
        objectName: "comp1_1"
        frameMaps: [{ colorMap: images_comp1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_2_material
        objectName: "comp1_2"
        frameMaps: [{ colorMap: images_comp1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_3_material
        objectName: "comp1_3"
        frameMaps: [{ colorMap: images_comp1_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_4_material
        objectName: "comp1_4"
        frameMaps: [{ colorMap: images_comp1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_5_material
        objectName: "comp1_5"
        frameMaps: [{ colorMap: images_comp1_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: comp1_6_material
        objectName: "comp1_6"
        frameMaps: [{ colorMap: images_comp1_6_png_texture, fullbrightColorMap: images_comp1_6_glow_png_texture }]
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
        id: ecop1_1_material
        objectName: "ecop1_1"
        frameMaps: [{ colorMap: images_ecop1_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: uwall1_2_material
        objectName: "uwall1_2"
        frameMaps: [{ colorMap: images_uwall1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: ecop1_6_material
        objectName: "ecop1_6"
        frameMaps: [{ colorMap: images_ecop1_6_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: ground1_2_material
        objectName: "ground1_2"
        frameMaps: [{ colorMap: images_ground1_2_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: ground1_6_material
        objectName: "ground1_6"
        frameMaps: [{ colorMap: images_ground1_6_png_texture }]
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
        id: slipside_material
        objectName: "slipside"
        frameMaps: [{ colorMap: images_slipside_png_texture, fullbrightColorMap: images_slipside_glow_png_texture }]
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
        id: tech04_3_1_material
        objectName: "tech04_3 1"
        frameMaps: [{ colorMap: images_tech04_3_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_4_material
        objectName: "door02_1 4"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: edoor01_1_3_material
        objectName: "edoor01_1 3"
        frameMaps: [{ colorMap: images_edoor01_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_side1_1_material
        objectName: "plat_side1 1"
        frameMaps: [{ colorMap: images_plat_side1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_stem_1_material
        objectName: "plat_stem 1"
        frameMaps: [{ colorMap: images_plat_stem_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_top1_1_material
        objectName: "plat_top1 1"
        frameMaps: [{ colorMap: images_plat_top1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: ecop1_4_1_material
        objectName: "ecop1_4 1"
        frameMaps: [{ colorMap: images_ecop1_4_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech04_1_1_material
        objectName: "tech04_1 1"
        frameMaps: [{ colorMap: images_tech04_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0basebtn_1_material
        objectName: "+0basebtn 1"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_5_material
        objectName: "door02_1 5"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: tech08_1_1_material
        objectName: "tech08_1 1"
        frameMaps: [{ colorMap: images_tech08_1_png_texture }]
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
        id: basebutn3_1_material
        objectName: "basebutn3 1"
        frameMaps: [{ colorMap: images_basebutn3_png_texture, fullbrightColorMap: images_basebutn3_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_5_1_material
        objectName: "twall2_5 1"
        frameMaps: [{ colorMap: images_twall2_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: _0planet_1_material
        objectName: "+0planet 1"
        frameMaps: [{ colorMap: images__0planet_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: basebutn3_2_material
        objectName: "basebutn3 2"
        frameMaps: [{ colorMap: images_basebutn3_png_texture, fullbrightColorMap: images_basebutn3_glow_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_2_1_material
        objectName: "twall2_2 1"
        frameMaps: [{ colorMap: images_twall2_2_png_texture }]
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
    TurbulentMaterial {
        id: _slime0_material
        colorMap: images__slime0_png_texture
    }
    TurbulentMaterial {
        id: _teleport_material
        colorMap: images__teleport_png_texture
    }
    TurbulentMaterial {
        id: _water0_material
        colorMap: images__water0_png_texture
    }
    SkyLayerMaterial {
        id: sky4_material
        objectName: "sky4"
        alphaColorMap: images_sky4_front_png_texture
        solidColorMap: images_sky4_back_png_texture
    }
    BrushMaterial {
        id: door02_1_material
        objectName: "door02_1"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: edoor01_1_material
        objectName: "edoor01_1"
        frameMaps: [{ colorMap: images_edoor01_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: twall2_5_2_material
        objectName: "twall2_5 2"
        frameMaps: [{ colorMap: images_twall2_5_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_1_material
        objectName: "door02_1 1"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: edoor01_1_1_material
        objectName: "edoor01_1 1"
        frameMaps: [{ colorMap: images_edoor01_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_side1_material
        objectName: "plat_side1"
        frameMaps: [{ colorMap: images_plat_side1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: plat_stem_material
        objectName: "plat_stem"
        frameMaps: [{ colorMap: images_plat_stem_png_texture }]
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
        id: _0basebtn_material
        objectName: "+0basebtn"
        frameMaps: [
            { colorMap: images__0basebtn_png_texture, fullbrightColorMap: images__0basebtn_glow_png_texture },
            { colorMap: images__1basebtn_png_texture }
        ]
        alternateFrameMaps: [
            { colorMap: images__abasebtn_png_texture }
        ]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_2_material
        objectName: "door02_1 2"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: door02_1_3_material
        objectName: "door02_1 3"
        frameMaps: [{ colorMap: images_door02_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }
    BrushMaterial {
        id: edoor01_1_2_material
        objectName: "edoor01_1 2"
        frameMaps: [{ colorMap: images_edoor01_1_png_texture }]
        lightmapColorMap: maps_lightmap_png_texture
        lightStyleColorMap: lightStyleTexture
    }

    // Nodes:
    Node {
        id: e1m1
        objectName: "e1m1"
        Model {
            id: solid_0
            source: "meshes/solid_0_mesh.mesh"
            castsShadows: false
            usedInBakedLighting: true
            bakedLightmap: BakedLightmap {
                enabled: lightmapEnabled
                key: "solid_0"
                loadPrefix: "qrc:/Assets/maps/e1m1"
            }
            materials: [
                _0planet_material,
                _0slip_material,
                _0slipbot_material,
                _0sliptop_material,
                basebutn3_material,
                comp1_1_material,
                comp1_2_material,
                comp1_3_material,
                comp1_4_material,
                comp1_5_material,
                comp1_6_material,
                crate0_side_material,
                crate0_top_material,
                ecop1_1_material,
                ecop1_4_material,
                ecop1_6_material,
                ground1_2_material,
                ground1_6_material,
                sfloor4_2_material,
                sfloor4_5_material,
                slip1_material,
                slipbotsd_material,
                sliplite_material,
                slipside_material,
                sliptopsd_material,
                switch_1_material,
                tech01_1_material,
                tech01_6_material,
                tech01_7_material,
                tech01_9_material,
                tech04_1_material,
                tech04_2_material,
                tech04_3_material,
                tech07_2_material,
                tech08_1_material,
                tech09_3_material,
                tech10_1_material,
                tech10_3_material,
                tech11_2_material,
                tlight01_material,
                tlight02_material,
                tlight07_material,
                tlight08_material,
                tlight10_material,
                tlight11_material,
                twall1_1_material,
                twall2_1_material,
                twall2_2_material,
                twall2_3_material,
                twall2_5_material,
                twall2_6_material,
                twall3_1_material,
                twall5_1_material,
                twall5_3_material,
                uwall1_2_material,
                z_exit_material
            ]
        }
        Model {
            id: water
            objectName: "water"
            source: "meshes/water_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                _water0_material
            ]
        }
        Model {
            id: slime
            objectName: "slime"
            source: "meshes/slime_mesh.mesh"
            castsShadows: false
            receivesShadows: false
            materials: [
                _slime0_material
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
        Solid {
            id: solid_1
            objectName: "solid_1"
            shape: MeshShape { source: "meshes/solid_1_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_1_mesh.mesh"
                castsShadows: false
                materials: [door02_1_material, edoor01_1_material]
            }
        }
        Solid {
            id: solid_2
            objectName: "solid_2"
            shape: MeshShape { source: "meshes/solid_2_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_2_mesh.mesh"
                castsShadows: false
                materials: [door02_1_1_material, edoor01_1_1_material]
            }
        }
        Solid {
            id: solid_3
            objectName: "solid_3"
            shape: MeshShape { source: "meshes/solid_3_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_3_mesh.mesh"
                castsShadows: false
                materials: [plat_side1_material, plat_stem_material, plat_top1_material]
            }
        }
        Solid {
            id: solid_4
            objectName: "solid_4"
            shape: MeshShape { source: "meshes/solid_4_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_4_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_material, door02_1_2_material]
            }
        }
        Solid {
            id: solid_5
            objectName: "solid_5"
            shape: MeshShape { source: "meshes/solid_5_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_5_mesh.mesh"
                castsShadows: false
                materials: [door02_1_3_material, edoor01_1_2_material]
            }
        }
        Solid {
            id: solid_6
            objectName: "solid_6"
            shape: MeshShape { source: "meshes/solid_6_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_6_mesh.mesh"
                castsShadows: false
                materials: [door02_1_4_material, edoor01_1_3_material]
            }
        }
        Solid {
            id: solid_7
            objectName: "solid_7"
            shape: MeshShape { source: "meshes/solid_7_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_7_mesh.mesh"
                castsShadows: false
                materials: [plat_side1_1_material, plat_stem_1_material, plat_top1_1_material]
            }
        }
        Solid {
            id: solid_8
            objectName: "solid_8"
            shape: MeshShape { source: "meshes/solid_8_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_8_mesh.mesh"
                castsShadows: false
                materials: [ecop1_4_1_material, tech04_1_1_material]
            }
        }
        Solid {
            id: solid_9
            objectName: "solid_9"
            shape: MeshShape { source: "meshes/solid_9_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_9_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_1_material, door02_1_5_material]
            }
        }
        Solid {
            id: solid_10
            objectName: "solid_10"
            shape: MeshShape { source: "meshes/solid_10_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_10_mesh.mesh"
                castsShadows: false
                materials: [tech04_3_1_material, tech08_1_1_material]
            }
        }
        Solid {
            id: solid_11
            objectName: "solid_11"
            shape: MeshShape { source: "meshes/solid_11_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_12
            objectName: "solid_12"
            shape: MeshShape { source: "meshes/solid_12_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_13
            objectName: "solid_13"
            shape: MeshShape { source: "meshes/solid_13_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_13_mesh.mesh"
                castsShadows: false
                materials: [basebutn3_1_material, twall2_5_1_material]
            }
        }
        Solid {
            id: solid_14
            objectName: "solid_14"
            shape: MeshShape { source: "meshes/solid_14_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_14_mesh.mesh"
                castsShadows: false
                materials: [_0planet_1_material, basebutn3_2_material, twall2_2_1_material, twall2_5_2_material]
            }
        }
        Solid {
            id: solid_15
            objectName: "solid_15"
            shape: MeshShape { source: "meshes/solid_15_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_15_mesh.mesh"
                castsShadows: false
                materials: [sfloor4_2_1_material, tech04_3_2_material]
            }
        }
        Solid {
            id: solid_16
            objectName: "solid_16"
            shape: MeshShape { source: "meshes/solid_16_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_17
            objectName: "solid_17"
            shape: MeshShape { source: "meshes/solid_17_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_17_mesh.mesh"
                castsShadows: false
                materials: [tech08_1_2_material]
            }
        }
        Solid {
            id: solid_18
            objectName: "solid_18"
            shape: MeshShape { source: "meshes/solid_18_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_19
            objectName: "solid_19"
            shape: MeshShape { source: "meshes/solid_19_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_19_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_2_material, door02_1_6_material]
            }
        }
        Solid {
            id: solid_20
            objectName: "solid_20"
            shape: MeshShape { source: "meshes/solid_20_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_21
            objectName: "solid_21"
            shape: MeshShape { source: "meshes/solid_21_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_21_mesh.mesh"
                castsShadows: false
                materials: [tech04_3_3_material, tech08_1_3_material, tech09_3_1_material]
            }
        }
        Solid {
            id: solid_22
            objectName: "solid_22"
            shape: MeshShape { source: "meshes/solid_22_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_22_mesh.mesh"
                castsShadows: false
                materials: [plat_side1_2_material, plat_top1_2_material]
            }
        }
        Solid {
            id: solid_23
            objectName: "solid_23"
            shape: MeshShape { source: "meshes/solid_23_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_23_mesh.mesh"
                castsShadows: false
                materials: [tech04_3_4_material, tech08_1_4_material]
            }
        }
        Solid {
            id: solid_24
            objectName: "solid_24"
            shape: MeshShape { source: "meshes/solid_24_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_25
            objectName: "solid_25"
            shape: MeshShape { source: "meshes/solid_25_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_25_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_3_material, door02_1_7_material]
            }
        }
        Solid {
            id: solid_26
            objectName: "solid_26"
            shape: MeshShape { source: "meshes/solid_26_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_26_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_4_material, door02_1_8_material]
            }
        }
        Solid {
            id: solid_27
            objectName: "solid_27"
            shape: MeshShape { source: "meshes/solid_27_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_27_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_5_material, door02_1_9_material]
            }
        }
        Solid {
            id: solid_28
            objectName: "solid_28"
            shape: MeshShape { source: "meshes/solid_28_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_28_mesh.mesh"
                castsShadows: false
                materials: [_0basebtn_6_material]
            }
        }
        Solid {
            id: solid_29
            objectName: "solid_29"
            shape: MeshShape { source: "meshes/solid_29_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_29_mesh.mesh"
                castsShadows: false
                materials: [key01_3_material, tech04_3_5_material]
            }
        }
        Solid {
            id: solid_30
            objectName: "solid_30"
            shape: MeshShape { source: "meshes/solid_30_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_31
            objectName: "solid_31"
            shape: MeshShape { source: "meshes/solid_31_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_32
            objectName: "solid_32"
            shape: MeshShape { source: "meshes/solid_32_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_33
            objectName: "solid_33"
            shape: MeshShape { source: "meshes/solid_33_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_34
            objectName: "solid_34"
            shape: MeshShape { source: "meshes/solid_34_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_34_mesh.mesh"
                castsShadows: false
                materials: [sfloor4_2_2_material, tlight11_1_material]
            }
        }
        Solid {
            id: solid_35
            objectName: "solid_35"
            shape: MeshShape { source: "meshes/solid_35_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_35_mesh.mesh"
                castsShadows: false
                materials: [sfloor4_2_3_material, tlight11_2_material]
            }
        }
        Solid {
            id: solid_36
            objectName: "solid_36"
            shape: MeshShape { source: "meshes/solid_36_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_36_mesh.mesh"
                castsShadows: false
                materials: [sfloor4_2_4_material, tlight11_3_material]
            }
        }
        Solid {
            id: solid_37
            objectName: "solid_37"
            shape: MeshShape { source: "meshes/solid_37_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_37_mesh.mesh"
                castsShadows: false
                materials: [sfloor4_2_5_material, tlight11_4_material]
            }
        }
        Solid {
            id: solid_38
            objectName: "solid_38"
            shape: MeshShape { source: "meshes/solid_38_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_38_mesh.mesh"
                castsShadows: false
                materials: [key01_3_1_material, tech04_1_2_material]
            }
        }
        Solid {
            id: solid_39
            objectName: "solid_39"
            shape: MeshShape { source: "meshes/solid_39_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_40
            objectName: "solid_40"
            shape: MeshShape { source: "meshes/solid_40_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_41
            objectName: "solid_41"
            shape: MeshShape { source: "meshes/solid_41_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_41_mesh.mesh"
                castsShadows: false
                materials: [tech04_3_6_material, tech08_1_5_material]
            }
        }
        Solid {
            id: solid_42
            objectName: "solid_42"
            shape: MeshShape { source: "meshes/solid_42_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_43
            objectName: "solid_43"
            shape: MeshShape { source: "meshes/solid_43_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_43_mesh.mesh"
                castsShadows: false
                materials: [comp1_4_1_material, comp1_6_1_material]
            }
        }
        Solid {
            id: solid_44
            objectName: "solid_44"
            shape: MeshShape { source: "meshes/solid_44_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_45
            objectName: "solid_45"
            shape: MeshShape { source: "meshes/solid_45_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_46
            objectName: "solid_46"
            shape: MeshShape { source: "meshes/solid_46_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_47
            objectName: "solid_47"
            shape: MeshShape { source: "meshes/solid_47_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_48
            objectName: "solid_48"
            shape: MeshShape { source: "meshes/solid_48_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_49
            objectName: "solid_49"
            shape: MeshShape { source: "meshes/solid_49_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_50
            objectName: "solid_50"
            shape: MeshShape { source: "meshes/solid_50_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_51
            objectName: "solid_51"
            shape: MeshShape { source: "meshes/solid_51_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_52
            objectName: "solid_52"
            shape: MeshShape { source: "meshes/solid_52_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_53
            objectName: "solid_53"
            shape: MeshShape { source: "meshes/solid_53_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_54
            objectName: "solid_54"
            shape: MeshShape { source: "meshes/solid_54_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_55
            objectName: "solid_55"
            shape: MeshShape { source: "meshes/solid_55_hull0_mesh.mesh" }
            objectLayer: Layers.Sensor
            motionType: Body.Static
            isSensor: true
        }
        Solid {
            id: solid_56
            objectName: "solid_56"
            shape: MeshShape { source: "meshes/solid_56_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_56_mesh.mesh"
                castsShadows: false
                materials: [tech04_1_3_material]
            }
        }
        Solid {
            id: solid_57
            objectName: "solid_57"
            shape: MeshShape { source: "meshes/solid_57_hull0_mesh.mesh" }
            objectLayer: Layers.Solid
            motionType: Body.Kinematic
            Model {
                source: "meshes/solid_57_mesh.mesh"
                castsShadows: false
                materials: [tech04_1_4_material, z_exit_1_material]
            }
        }
    }

    // Animations:
}
