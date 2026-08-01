import QtQuick
import QtQuick3D

import QtQuick.Timeline

Node {
    id: node

    property alias skin: skin
    property alias hips: mixamorig_Hips
    property alias spine: mixamorig_Spine
    property alias spine1: mixamorig_Spine1
    property alias spine2: mixamorig_Spine2
    property alias neck: mixamorig_Neck
    property alias head: mixamorig_Head
    property alias leftShoulder: mixamorig_LeftShoulder
    property alias leftArm: mixamorig_LeftArm
    property alias leftForeArm: mixamorig_LeftForeArm
    property alias rightShoulder: mixamorig_RightShoulder
    property alias rightArm: mixamorig_RightArm
    property alias rightForeArm: mixamorig_RightForeArm
    property alias rootNode: rootNode
    property alias walkTimeline: walkTimeline
    property alias walkAnimation: walkAnimation
    property alias idleTimeline: idleTimeline
    property alias idleAnimation: idleAnimation
    property alias standUpFaceUpTimeline: standUpFaceUpTimeline
    property alias standUpFaceUpAnimation: standUpFaceUpAnimation
    property alias standUpFaceDownTimeline: standUpFaceDownTimeline
    property alias standUpFaceDownAnimation: standUpFaceDownAnimation
    property alias painLeftTimeline: painLeftTimeline
    property alias painLeftAnimation: painLeftAnimation
    property alias painMidTimeline: painMidTimeline
    property alias painMidAnimation: painMidAnimation
    property alias painRightTimeline: painRightTimeline
    property alias painRightAnimation: painRightAnimation
    property alias attackLeftTimeline: attackLeftTimeline
    property alias attackLeftAnimation: attackLeftAnimation
    property alias attackRightTimeline: attackRightTimeline
    property alias attackRightAnimation: attackRightAnimation

    // Resources

    Texture {
        id: eyes_baseColor
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_eyes_baseColor.png"
    }
    Texture {
        id: eyes_normal
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_eyes_normal.png"
    }
    Texture {
        id: eyes_metallicRoughness
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_eyes_metallicRoughness.png"
    }
    Texture {
        id: head_baseColor
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_head_baseColor.png"
    }
    Texture {
        id: head_normal
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_head_normal.png"
    }
    Texture {
        id: arms_baseColor
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_arms_baseColor.png"
    }
    Texture {
        id: arms_normal
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_arms_normal.png"
    }
    Texture {
        id: torso_baseColor
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_torso_baseColor.png"
    }
    Texture {
        id: torso_normal
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_torso_normal.png"
    }
    Texture {
        id: legs_baseColor
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_legs_baseColor.png"
    }
    Texture {
        id: legs_normal
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: "qrc:/Assets/models/zombie/maps/zombie_tier1_legs_normal.png"
    }

    PrincipledMaterial {
        id: zombie_tier1_eyes_002_material
        baseColorMap: eyes_baseColor
        metalness: 1
        roughness: 1
        metalnessMap: eyes_metallicRoughness
        metalnessChannel: Material.B
        roughnessMap: eyes_metallicRoughness
        roughnessChannel: Material.G
        normalMap: eyes_normal
        emissiveMap: eyes_baseColor
        emissiveFactor: Qt.vector3d(1, 1, 1)
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: zombie_tier1_head_002_material
        baseColorMap: head_baseColor
        roughness: 0.5
        normalMap: head_normal
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: zombie_tier1_arms_002_material
        baseColorMap: arms_baseColor
        roughness: 0.5
        normalMap: arms_normal
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: zombie_tier1_torso_002_material
        baseColorMap: torso_baseColor
        roughness: 0.5
        normalMap: torso_normal
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    PrincipledMaterial {
        id: zombie_tier1_legs_002_material
        baseColorMap: legs_baseColor
        roughness: 0.5
        normalMap: legs_normal
        cullMode: PrincipledMaterial.NoCulling
        alphaMode: PrincipledMaterial.Opaque
    }
    Skin {
        id: skin
        joints: [
            mixamorig_Hips,
            mixamorig_Spine,
            mixamorig_Spine1,
            mixamorig_Spine2,
            mixamorig_Neck,
            mixamorig_Head,
            mixamorig_HeadTop_End,
            mixamorig_LeftShoulder,
            mixamorig_LeftArm,
            mixamorig_LeftForeArm,
            mixamorig_LeftHand,
            mixamorig_LeftHandThumb1,
            mixamorig_LeftHandThumb2,
            mixamorig_LeftHandThumb3,
            mixamorig_LeftHandThumb4,
            mixamorig_LeftHandIndex1,
            mixamorig_LeftHandIndex2,
            mixamorig_LeftHandIndex3,
            mixamorig_LeftHandIndex4,
            mixamorig_LeftHandMiddle1,
            mixamorig_LeftHandMiddle2,
            mixamorig_LeftHandMiddle3,
            mixamorig_LeftHandMiddle4,
            mixamorig_LeftHandRing1,
            mixamorig_LeftHandRing2,
            mixamorig_LeftHandRing3,
            mixamorig_LeftHandRing4,
            mixamorig_LeftHandPinky1,
            mixamorig_LeftHandPinky2,
            mixamorig_LeftHandPinky3,
            mixamorig_LeftHandPinky4,
            mixamorig_RightShoulder,
            mixamorig_RightArm,
            mixamorig_RightForeArm,
            mixamorig_RightHand,
            mixamorig_RightHandThumb1,
            mixamorig_RightHandThumb2,
            mixamorig_RightHandThumb3,
            mixamorig_RightHandThumb4,
            mixamorig_RightHandIndex1,
            mixamorig_RightHandIndex2,
            mixamorig_RightHandIndex3,
            mixamorig_RightHandIndex4,
            mixamorig_RightHandMiddle1,
            mixamorig_RightHandMiddle2,
            mixamorig_RightHandMiddle3,
            mixamorig_RightHandMiddle4,
            mixamorig_RightHandRing1,
            mixamorig_RightHandRing2,
            mixamorig_RightHandRing3,
            mixamorig_RightHandRing4,
            mixamorig_RightHandPinky1,
            mixamorig_RightHandPinky2,
            mixamorig_RightHandPinky3,
            mixamorig_RightHandPinky4,
            mixamorig_LeftUpLeg,
            mixamorig_LeftLeg,
            mixamorig_LeftFoot,
            mixamorig_LeftToeBase,
            mixamorig_LeftToe_End,
            mixamorig_RightUpLeg,
            mixamorig_RightLeg,
            mixamorig_RightFoot,
            mixamorig_RightToeBase,
            mixamorig_RightToe_End
        ]
        inverseBindPoses: [
            Qt.matrix4x4(1, 1.50996e-07, 0, -2.094e-09, 0, 0, 1, -0.00777569, 1.50996e-07, -1, 0, -2.7036e-05, 0, 0, 0, 1),
            Qt.matrix4x4(1, 6.00337e-08, -2.04479e-09, -2.08053e-09, 0, 0.0340411, 0.99942, -0.0789427, 6.00685e-08, -0.99942, 0.0340411, -0.000291706, 0, 0, 0, 1),
            Qt.matrix4x4(1, 6.00337e-08, -2.04479e-09, -2.0805e-09, 2.22045e-16, 0.0340411, 0.99942, -0.161977, 6.00685e-08, -0.99942, 0.0340411, -0.000291706, 0, 0, 0, 1),
            Qt.matrix4x4(1, 6.00337e-08, -2.0448e-09, -2.08048e-09, 0, 0.0340411, 0.99942, -0.256874, 6.00685e-08, -0.99942, 0.0340411, -0.000291706, 0, 0, 0, 1),
            Qt.matrix4x4(1, -1.50996e-07, -1.69935e-14, -2.72922e-10, 4.44387e-16, -1.11759e-07, 1, -0.363431, -1.50996e-07, -1, -1.15484e-07, 0.0120869, 0, 0, 0, 1),
            Qt.matrix4x4(1, 8.74228e-08, 7.4874e-15, -7.64901e-10, 2.37768e-15, -9.89551e-08, 1, -0.444549, 8.74228e-08, -1, -1.0268e-07, -0.0152489, 0, 0, 0, 1),
            Qt.matrix4x4(1, -1.50996e-07, -2.00461e-14, -1.14154e-08, 1.56372e-15, -1.24562e-07, 1, -0.58241, -1.50996e-07, -1, -1.28288e-07, -0.0617061, 0, 0, 0, 1),
            Qt.matrix4x4(-0.00527103, 0.999397, -0.0343088, 0.000360658, 0.969165, -0.0033466, -0.246389, 0.0339741, -0.246356, -0.0345496, -0.968563, 0.351314, 0, 0, 0, 1),
            Qt.matrix4x4(0.0242203, 0.998833, -0.0417898, -0.00216688, 0.997699, -0.0267978, -0.0622679, -0.146445, -0.0633152, -0.0401855, -0.997184, 0.329955, 0, 0, 0, 1),
            Qt.matrix4x4(0.0185684, 0.998968, -0.0414364, -0.000406596, 0.999785, -0.0181702, 0.00995986, -0.333856, 0.00919658, -0.0416124, -0.999091, 0.306556, 0, 0, 0, 1),
            Qt.matrix4x4(-0.355153, 0.933856, -0.0421747, 0.214485, 0.929418, 0.357584, 0.091192, -0.562823, 0.100241, -0.0068107, -0.99494, 0.252916, 0, 0, 0, 1),
            Qt.matrix4x4(0.810056, 0.58119, 0.0776351, -0.476604, 0.571018, -0.751845, -0.329647, -0.245137, -0.133218, 0.311363, -0.940907, 0.36919, 0, 0, 0, 1),
            Qt.matrix4x4(0.810057, 0.581189, 0.0776348, -0.465337, 0.570439, -0.750501, -0.333686, -0.261377, -0.13567, 0.314591, -0.939482, 0.370317, 0, 0, 0, 1),
            Qt.matrix4x4(0.810056, 0.58119, 0.0776353, -0.469489, 0.585312, -0.793614, -0.166091, -0.346278, -0.034918, 0.179984, -0.98305, 0.315153, 0, 0, 0, 1),
            Qt.matrix4x4(0.810056, 0.58119, 0.0776353, -0.476604, 0.585311, -0.793614, -0.166091, -0.368603, -0.034918, 0.179984, -0.98305, 0.315153, 0, 0, 0, 1),
            Qt.matrix4x4(0.189427, 0.981817, 0.0123639, -0.103055, 0.980858, -0.188633, -0.0483175, -0.583131, -0.0451068, 0.0212799, -0.998755, 0.341838, 0, 0, 0, 1),
            Qt.matrix4x4(0.189426, 0.981817, 0.0123635, -0.103086, 0.975021, -0.186598, -0.120472, -0.585118, -0.115975, 0.0348753, -0.99264, 0.385194, 0, 0, 0, 1),
            Qt.matrix4x4(0.189427, 0.981817, 0.0123638, -0.103042, 0.979582, -0.188102, -0.0709561, -0.629367, -0.0673403, 0.0255523, -0.997403, 0.354332, 0, 0, 0, 1),
            Qt.matrix4x4(0.189426, 0.981817, 0.0123636, -0.103055, 0.979582, -0.188102, -0.0709561, -0.651671, -0.0673403, 0.0255522, -0.997403, 0.354332, 0, 0, 0, 1),
            Qt.matrix4x4(0.00824075, 0.999948, -0.006015, -0.0070057, 0.9998, -0.00834865, -0.0181805, -0.599241, -0.0182299, -0.00586394, -0.999817, 0.328876, 0, 0, 0, 1),
            Qt.matrix4x4(0.00824073, 0.999948, -0.00601491, -0.00701891, 0.999587, -0.00840273, -0.0274655, -0.627556, -0.0275147, -0.00578606, -0.999605, 0.334719, 0, 0, 0, 1),
            Qt.matrix4x4(0.00824073, 0.999948, -0.00601504, -0.00702638, 0.995154, -0.00879004, -0.0979275, -0.632822, -0.0979753, -0.00517888, -0.995175, 0.380317, 0, 0, 0, 1),
            Qt.matrix4x4(0.00824073, 0.999948, -0.00601504, -0.00700567, 0.995154, -0.00879004, -0.0979275, -0.65915, -0.0979753, -0.00517888, -0.995175, 0.380317, 0, 0, 0, 1),
            Qt.matrix4x4(-0.191549, 0.981138, -0.026015, 0.100543, 0.980644, 0.190222, -0.0463945, -0.582896, -0.0405709, -0.0343983, -0.998584, 0.34358, 0, 0, 0, 1),
            Qt.matrix4x4(-0.191549, 0.981138, -0.026015, 0.100549, 0.976551, 0.187866, -0.105141, -0.589927, -0.0982702, -0.0455445, -0.994117, 0.378991, 0, 0, 0, 1),
            Qt.matrix4x4(-0.191549, 0.981138, -0.0260151, 0.100549, 0.972621, 0.186199, -0.139061, -0.603282, -0.131594, -0.0519398, -0.989942, 0.399846, 0, 0, 0, 1),
            Qt.matrix4x4(-0.191549, 0.981138, -0.0260151, 0.100543, 0.972621, 0.186199, -0.139061, -0.627174, -0.131594, -0.0519398, -0.989942, 0.399846, 0, 0, 0, 1),
            Qt.matrix4x4(-0.400461, 0.915127, -0.0466113, 0.212994, 0.908404, 0.389822, -0.151132, -0.513373, -0.120135, -0.102864, -0.987414, 0.386793, 0, 0, 0, 1),
            Qt.matrix4x4(-0.400461, 0.915127, -0.0466112, 0.212944, 0.909709, 0.390964, -0.139913, -0.541844, -0.109815, -0.0984322, -0.989066, 0.380666, 0, 0, 0, 1),
            Qt.matrix4x4(-0.400461, 0.915127, -0.0466112, 0.21292, 0.916101, 0.400946, 0.00115754, -0.609316, 0.0197477, -0.0422369, -0.998912, 0.297606, 0, 0, 0, 1),
            Qt.matrix4x4(-0.400461, 0.915127, -0.0466113, 0.212994, 0.9161, 0.400946, 0.00115756, -0.625871, 0.0197478, -0.0422371, -0.998912, 0.297606, 0, 0, 0, 1),
            Qt.matrix4x4(-0.0122242, -0.99933, 0.0345086, -0.000412519, -0.969165, 0.00334688, -0.246389, 0.0338933, 0.246109, -0.0364564, -0.968556, 0.351336, 0, 0, 0, 1),
            Qt.matrix4x4(0.0269701, -0.998648, 0.0444424, 0.00294932, -0.997618, -0.0297132, -0.0622629, -0.146364, 0.0634991, -0.0426573, -0.99707, 0.330028, 0, 0, 0, 1),
            Qt.matrix4x4(0.0295195, -0.998569, 0.0446011, 0.00374332, -0.999527, -0.0291031, 0.0099571, -0.333672, -0.00864491, -0.044874, -0.998955, 0.306751, 0, 0, 0, 1),
            Qt.matrix4x4(-0.409371, -0.911156, 0.0470191, -0.248962, -0.90663, 0.412027, 0.0908684, -0.548981, -0.102169, -0.00543004, -0.994752, 0.251736, 0, 0, 0, 1),
            Qt.matrix4x4(0.810078, -0.580835, -0.0800313, 0.476836, -0.569346, -0.746652, -0.34403, -0.240448, 0.140069, 0.324257, -0.935542, 0.372051, 0, 0, 0, 1),
            Qt.matrix4x4(0.810078, -0.580834, -0.0800309, 0.466059, -0.571878, -0.752614, -0.326387, -0.264647, 0.129345, 0.310167, -0.941842, 0.367142, 0, 0, 0, 1),
            Qt.matrix4x4(0.810078, -0.580835, -0.0800312, 0.470352, -0.551606, -0.708708, -0.439846, -0.241969, 0.198759, 0.400455, -0.8945, 0.39997, 0, 0, 0, 1),
            Qt.matrix4x4(0.810078, -0.580835, -0.0800311, 0.476836, -0.551606, -0.708708, -0.439846, -0.263714, 0.198759, 0.400455, -0.8945, 0.39997, 0, 0, 0, 1),
            Qt.matrix4x4(0.199306, -0.979821, -0.015122, 0.110021, -0.978922, -0.198373, -0.0485804, -0.580744, 0.0446002, 0.0244856, -0.998705, 0.341635, 0, 0, 0, 1),
            Qt.matrix4x4(0.199306, -0.979821, -0.0151219, 0.110028, -0.973818, -0.196316, -0.114621, -0.585527, 0.10934, 0.0375707, -0.993294, 0.381254, 0, 0, 0, 1),
            Qt.matrix4x4(0.199306, -0.979821, -0.015122, 0.109966, -0.979876, -0.199442, 0.00806787, -0.65391, -0.0109211, 0.0132097, -0.999853, 0.303344, 0, 0, 0, 1),
            Qt.matrix4x4(0.199306, -0.979821, -0.015122, 0.110021, -0.979877, -0.199442, 0.00806789, -0.677488, -0.0109211, 0.0132097, -0.999853, 0.303344, 0, 0, 0, 1),
            Qt.matrix4x4(0.0361222, -0.999346, 0.00174501, 0.0260643, -0.999054, -0.0360694, 0.0242801, -0.613375, -0.0242014, -0.00262042, -0.999704, 0.302116, 0, 0, 0, 1),
            Qt.matrix4x4(0.0361221, -0.999346, 0.0017448, 0.026102, -0.99821, -0.0361645, -0.0476339, -0.622043, 0.0476658, -2.10381e-05, -0.998863, 0.347723, 0, 0, 0, 1),
            Qt.matrix4x4(0.0361222, -0.999346, 0.00174482, 0.0260978, -0.992966, -0.0360886, -0.112771, -0.627295, 0.11276, 0.00234099, -0.99362, 0.389525, 0, 0, 0, 1),
            Qt.matrix4x4(0.0361222, -0.999346, 0.00174482, 0.0260644, -0.992966, -0.0360886, -0.112771, -0.652987, 0.11276, 0.002341, -0.99362, 0.389525, 0, 0, 0, 1),
            Qt.matrix4x4(-0.160001, -0.986876, 0.0218203, -0.0791001, -0.986168, 0.15884, -0.0473586, -0.587363, 0.043271, -0.0290959, -0.99864, 0.344941, 0, 0, 0, 1),
            Qt.matrix4x4(-0.160002, -0.986876, 0.0218203, -0.0790983, -0.980844, 0.156458, -0.116046, -0.590045, 0.111109, -0.0399699, -0.993004, 0.38651, 0, 0, 0, 1),
            Qt.matrix4x4(-0.160002, -0.986876, 0.0218202, -0.0790857, -0.986456, 0.160664, 0.0330455, -0.6669, -0.0361176, -0.0162373, -0.999216, 0.290484, 0, 0, 0, 1),
            Qt.matrix4x4(-0.160002, -0.986876, 0.0218202, -0.0791001, -0.986456, 0.160664, 0.0330455, -0.689168, -0.0361176, -0.0162373, -0.999216, 0.290484, 0, 0, 0, 1),
            Qt.matrix4x4(-0.430783, -0.901116, 0.0491638, -0.23341, -0.896433, 0.420989, -0.13848, -0.509417, 0.104089, -0.103727, -0.989144, 0.377478, 0, 0, 0, 1),
            Qt.matrix4x4(-0.430783, -0.901116, 0.0491634, -0.233348, -0.894697, 0.419318, -0.153912, -0.528498, 0.118078, -0.110289, -0.986861, 0.38578, 0, 0, 0, 1),
            Qt.matrix4x4(-0.430783, -0.901115, 0.0491636, -0.233291, -0.897149, 0.433513, 0.084795, -0.624454, -0.0977232, -0.00757882, -0.995185, 0.24451, 0, 0, 0, 1),
            Qt.matrix4x4(-0.430783, -0.901115, 0.0491636, -0.23341, -0.897149, 0.433513, 0.084795, -0.6416, -0.0977232, -0.00757883, -0.995185, 0.24451, 0, 0, 0, 1),
            Qt.matrix4x4(-0.999703, 6.86283e-05, -0.0243564, 0.0564827, 0.0243565, 0.00282302, -0.999699, -0.0332204, 1.16619e-07, -0.999996, -0.00282385, -0.00360574, 0, 0, 0, 1),
            Qt.matrix4x4(-0.999947, -2.92225e-05, 0.0103348, 0.0694891, -0.0103337, 0.0174941, -0.999794, -0.373666, -0.000151616, -0.999847, -0.0174935, -0.00908867, 0, 0, 0, 1),
            Qt.matrix4x4(-0.990202, 0.139062, 0.012668, 0.0700779, -0.117757, -0.782838, -0.610981, -0.40462, -0.0750473, -0.606487, 0.791544, 0.542892, 0, 0, 0, 1),
            Qt.matrix4x4(-0.992756, 0.107578, 0.0535006, 0.0980017, -0.107595, -0.994191, 0.00256455, -0.0966304, 0.0534657, -0.0032104, 0.998565, 0.757381, 0, 0, 0, 1),
            Qt.matrix4x4(-0.992756, 0.107578, 0.0535006, 0.0980017, -0.107595, -0.994192, 0.00256453, -0.149482, 0.0534657, -0.00321042, 0.998565, 0.757381, 0, 0, 0, 1),
            Qt.matrix4x4(-0.999703, -0.000181147, 0.0243552, -0.0564834, -0.0243559, 0.00743278, -0.999676, -0.033194, 5.46279e-08, -0.999972, -0.00743499, -0.00501056, 0, 0, 0, 1),
            Qt.matrix4x4(-0.999947, 7.68556e-05, -0.0103347, -0.069489, 0.0103349, 0.00870718, -0.999909, -0.373734, 1.31302e-05, -0.999962, -0.00870751, -0.0054862, 0, 0, 0, 1),
            Qt.matrix4x4(-0.989843, -0.1417, -0.011465, -0.0695649, 0.118655, -0.779047, -0.615636, -0.409556, 0.078304, -0.610743, 0.787947, 0.539237, 0, 0, 0, 1),
            Qt.matrix4x4(-0.992681, -0.107107, -0.0557873, -0.0997994, 0.107132, -0.994242, 0.00255797, -0.0976777, -0.05574, -0.00343723, 0.998439, 0.757152, 0, 0, 0, 1),
            Qt.matrix4x4(-0.992681, -0.107107, -0.0557873, -0.0997994, 0.107132, -0.994242, 0.00255789, -0.150758, -0.05574, -0.00343731, 0.998439, 0.757152, 0, 0, 0, 1)
        ]
    }

    // Nodes:
    Node {
        id: rootNode
        objectName: "RootNode"
        Model {
            id: zombie_smd
            objectName: "zombie.smd"
            source: "qrc:/Assets/models/zombie/zombie.mesh"
            skin: skin
            materials: [
                zombie_tier1_eyes_002_material,
                zombie_tier1_head_002_material,
                zombie_tier1_arms_002_material,
                zombie_tier1_torso_002_material,
                zombie_tier1_legs_002_material
            ]
        }
        Node {
            id: mixamorig_Hips
            objectName: "mixamorig:Hips"
            position: Qt.vector3d(2.09808e-09, -2.7036e-05, 0.00777569)
            rotation: Qt.quaternion(0.707107, 0.707107, 5.33851e-08, 5.33851e-08)
            scale: Qt.vector3d(1, 1, 1)
            Node {
                id: mixamorig_Spine
                objectName: "mixamorig:Spine"
                position: Qt.vector3d(3.65803e-10, 0.0711312, -0.00242279)
                rotation: Qt.quaternion(0.999855, -0.017023, -4.54571e-08, -1.79647e-09)
                Node {
                    id: mixamorig_Spine1
                    objectName: "mixamorig:Spine1"
                    position: Qt.vector3d(-2.81164e-14, 0.0830344, 2.9104e-11)
                    rotation: Qt.quaternion(1, 1.86265e-09, 1.78156e-15, -3.68461e-17)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: mixamorig_Spine2
                        objectName: "mixamorig:Spine2"
                        position: Qt.vector3d(-2.82552e-14, 0.0948965, -4.36557e-10)
                        rotation: Qt.quaternion(1, -1.86265e-09, -1.77636e-15, -5.82519e-17)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: mixamorig_Neck
                            objectName: "mixamorig:Neck"
                            position: Qt.vector3d(1.05471e-15, 0.106758, -1.20781e-08)
                            rotation: Qt.quaternion(0.999855, 0.0170231, -1.05517e-07, -7.7393e-10)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: mixamorig_Head
                                objectName: "mixamorig:Head"
                                position: Qt.vector3d(4.12759e-09, 0.0811181, 0.0273358)
                                rotation: Qt.quaternion(1, -6.40181e-09, 1.19209e-07, -7.63155e-16)
                                Node {
                                    id: mixamorig_HeadTop_End
                                    objectName: "mixamorig:HeadTop_End"
                                    position: Qt.vector3d(-4.06143e-09, 0.137861, 0.0464573)
                                    rotation: Qt.quaternion(1, 1.28036e-08, -1.19209e-07, -5.29396e-22)
                                }
                            }
                        }
                        Node {
                            id: mixamorig_LeftShoulder
                            objectName: "mixamorig:LeftShoulder"
                            position: Qt.vector3d(0.0536236, 0.0919823, -0.000307319)
                            rotation: Qt.quaternion(-0.432992, -0.556671, -0.43513, 0.55973)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: mixamorig_LeftArm
                                objectName: "mixamorig:LeftArm"
                                position: Qt.vector3d(-4.94765e-10, 0.117037, -2.18919e-07)
                                rotation: Qt.quaternion(0.995581, -0.0926645, -0.00141008, 0.0151498)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: mixamorig_LeftForeArm
                                    objectName: "mixamorig:LeftForeArm"
                                    position: Qt.vector3d(-7.21775e-09, 0.164299, 6.82776e-08)
                                    rotation: Qt.quaternion(0.999338, -0.0362753, 0.000102725, -0.00283042)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: mixamorig_LeftHand
                                        objectName: "mixamorig:LeftHand"
                                        position: Qt.vector3d(5.26779e-09, 0.242999, -2.31135e-07)
                                        rotation: Qt.quaternion(0.980678, -0.0478943, 0.00924725, -0.189451)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: mixamorig_LeftHandThumb1
                                            objectName: "mixamorig:LeftHandThumb1"
                                            position: Qt.vector3d(-0.0234034, -0.00846454, 0.00869924)
                                            rotation: Qt.quaternion(0.775283, 0.157561, 0.121815, 0.599393)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_LeftHandThumb2
                                                objectName: "mixamorig:LeftHandThumb2"
                                                position: Qt.vector3d(-0.0112675, 0.017829, -1.89058e-07)
                                                rotation: Qt.quaternion(0.999998, 0.00214817, 1.11759e-08, 4.67525e-07)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: mixamorig_LeftHandThumb3
                                                    objectName: "mixamorig:LeftHandThumb3"
                                                    position: Qt.vector3d(0.00415286, 0.0251443, 1.9744e-07)
                                                    rotation: Qt.quaternion(0.996222, -0.0868448, -1.86971e-09, -9.49579e-07)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_LeftHandThumb4
                                                        objectName: "mixamorig:LeftHandThumb4"
                                                        position: Qt.vector3d(0.0071147, 0.0223256, 9.31323e-09)
                                                        rotation: Qt.quaternion(1, -3.25963e-09, 4.65661e-10, 7.07805e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_LeftHandIndex1
                                            objectName: "mixamorig:LeftHandIndex1"
                                            position: Qt.vector3d(-0.0293519, 0.0241768, 0.000942724)
                                            rotation: Qt.quaternion(0.95889, 0.0711949, 0.0203397, 0.273947)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_LeftHandIndex2
                                                objectName: "mixamorig:LeftHandIndex2"
                                                position: Qt.vector3d(3.05516e-05, 0.0283302, 1.62981e-07)
                                                rotation: Qt.quaternion(0.999344, 0.0362096, -2.1318e-07, -1.1904e-07)
                                                Node {
                                                    id: mixamorig_LeftHandIndex3
                                                    objectName: "mixamorig:LeftHandIndex3"
                                                    position: Qt.vector3d(-4.40876e-05, 0.025848, 5.3551e-09)
                                                    rotation: Qt.quaternion(0.999691, -0.0248744, 1.70019e-07, 9.38889e-09)
                                                    Node {
                                                        id: mixamorig_LeftHandIndex4
                                                        objectName: "mixamorig:LeftHandIndex4"
                                                        position: Qt.vector3d(1.35174e-05, 0.0223034, 4.35975e-08)
                                                        rotation: Qt.quaternion(1, 4.65661e-09, -7.82311e-08, -4.95784e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_LeftHandMiddle1
                                            objectName: "mixamorig:LeftHandMiddle1"
                                            position: Qt.vector3d(-0.0101805, 0.0300306, -0.00271806)
                                            rotation: Qt.quaternion(0.980904, 0.0582579, 0.0110013, 0.185234)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_LeftHandMiddle2
                                                objectName: "mixamorig:LeftHandMiddle2"
                                                position: Qt.vector3d(1.31989e-05, 0.0313962, -7.42184e-08)
                                                rotation: Qt.quaternion(0.999989, 0.00464377, 4.3056e-08, -8.94589e-09)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: mixamorig_LeftHandMiddle3
                                                    objectName: "mixamorig:LeftHandMiddle3"
                                                    position: Qt.vector3d(7.50867e-06, 0.0305233, -5.56975e-09)
                                                    rotation: Qt.quaternion(0.999377, 0.0353012, -6.31874e-08, -2.18415e-10)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_LeftHandMiddle4
                                                        objectName: "mixamorig:LeftHandMiddle4"
                                                        position: Qt.vector3d(-2.07074e-05, 0.0263279, 2.25446e-08)
                                                        rotation: Qt.quaternion(1, -3.43516e-09, 1.30967e-10, 1.01863e-10)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_LeftHandRing1
                                            objectName: "mixamorig:LeftHandRing1"
                                            position: Qt.vector3d(0.00870512, 0.03696, -0.00367471)
                                            rotation: Qt.quaternion(0.993766, 0.0715046, 0.00613845, 0.0853118)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_LeftHandRing2
                                                objectName: "mixamorig:LeftHandRing2"
                                                position: Qt.vector3d(-5.81611e-06, 0.0283335, 2.08383e-08)
                                                rotation: Qt.quaternion(0.999566, 0.0294678, 1.03655e-08, 4.26556e-08)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: mixamorig_LeftHandRing3
                                                    objectName: "mixamorig:LeftHandRing3"
                                                    position: Qt.vector3d(-1.94646e-07, 0.02667, -1.80444e-08)
                                                    rotation: Qt.quaternion(0.999854, 0.017094, -3.49297e-08, 6.46199e-08)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_LeftHandRing4
                                                        objectName: "mixamorig:LeftHandRing4"
                                                        position: Qt.vector3d(5.97816e-06, 0.0238924, -4.09782e-08)
                                                        rotation: Qt.quaternion(1, -1.16415e-08, 9.31323e-10, -2.1304e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_LeftHandPinky1
                                            objectName: "mixamorig:LeftHandPinky1"
                                            position: Qt.vector3d(0.0308273, 0.0378223, -0.000110663)
                                            rotation: Qt.quaternion(0.992442, 0.120222, -0.00295995, -0.0244348)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_LeftHandPinky2
                                                objectName: "mixamorig:LeftHandPinky2"
                                                position: Qt.vector3d(4.9822e-05, 0.0241148, 1.63913e-07)
                                                rotation: Qt.quaternion(0.999984, -0.00567639, 3.63222e-08, 7.93965e-08)
                                                Node {
                                                    id: mixamorig_LeftHandPinky3
                                                    objectName: "mixamorig:LeftHandPinky3"
                                                    position: Qt.vector3d(2.3948e-05, 0.0193401, -2.01166e-07)
                                                    rotation: Qt.quaternion(0.997492, -0.0707836, 3.40787e-08, 1.32795e-07)
                                                    Node {
                                                        id: mixamorig_LeftHandPinky4
                                                        objectName: "mixamorig:LeftHandPinky4"
                                                        position: Qt.vector3d(-7.37552e-05, 0.0165557, -2.07219e-08)
                                                        rotation: Qt.quaternion(1, -1.33587e-08, -9.0804e-08, -9.03356e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Node {
                            id: mixamorig_RightShoulder
                            objectName: "mixamorig:RightShoulder"
                            position: Qt.vector3d(-0.0536236, 0.0919959, -0.000698807)
                            rotation: Qt.quaternion(0.431598, 0.554627, -0.436643, 0.561654)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: mixamorig_RightArm
                                objectName: "mixamorig:RightArm"
                                position: Qt.vector3d(-3.60887e-09, 0.117037, 1.72382e-07)
                                rotation: Qt.quaternion(0.995513, -0.0924442, 0.0018697, -0.020133)
                                scale: Qt.vector3d(1, 1, 1)
                                Node {
                                    id: mixamorig_RightForeArm
                                    objectName: "mixamorig:RightForeArm"
                                    position: Qt.vector3d(-3.49246e-09, 0.164313, 5.61122e-08)
                                    rotation: Qt.quaternion(0.999347, -0.0361013, 4.60201e-05, -0.00127691)
                                    scale: Qt.vector3d(1, 1, 1)
                                    Node {
                                        id: mixamorig_RightHand
                                        objectName: "mixamorig:RightHand"
                                        position: Qt.vector3d(4.07454e-10, 0.243062, -8.05012e-08)
                                        rotation: Qt.quaternion(0.973373, -0.049775, -0.0101238, 0.22353)
                                        scale: Qt.vector3d(1, 1, 1)
                                        Node {
                                            id: mixamorig_RightHandThumb1
                                            objectName: "mixamorig:RightHandThumb1"
                                            position: Qt.vector3d(0.0219598, -0.00939289, 0.00872192)
                                            rotation: Qt.quaternion(0.755925, 0.159688, -0.131223, -0.621175)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_RightHandThumb2
                                                objectName: "mixamorig:RightHandThumb2"
                                                position: Qt.vector3d(0.0107773, 0.0172519, -4.65661e-09)
                                                rotation: Qt.quaternion(0.999956, -0.0093971, 3.53918e-08, -4.22374e-07)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: mixamorig_RightHandThumb3
                                                    objectName: "mixamorig:RightHandThumb3"
                                                    position: Qt.vector3d(-0.0042934, 0.0247177, 2.75671e-07)
                                                    rotation: Qt.quaternion(0.998097, 0.0616674, 2.23944e-08, 4.14762e-07)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_RightHandThumb4
                                                        objectName: "mixamorig:RightHandThumb4"
                                                        position: Qt.vector3d(-0.0064838, 0.0217448, -5.58794e-09)
                                                        rotation: Qt.quaternion(1, -5.21541e-08, -3.72529e-09, -1.95578e-08)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_RightHandIndex1
                                            objectName: "mixamorig:RightHandIndex1"
                                            position: Qt.vector3d(0.0281425, 0.0222299, 0.000709445)
                                            rotation: Qt.quaternion(0.948764, 0.071281, -0.0230634, -0.306976)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_RightHandIndex2
                                                objectName: "mixamorig:RightHandIndex2"
                                                position: Qt.vector3d(-6.89598e-06, 0.0287494, 3.79514e-08)
                                                rotation: Qt.quaternion(0.999451, 0.0331349, 6.89557e-08, -7.56387e-08)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: mixamorig_RightHandIndex3
                                                    objectName: "mixamorig:RightHandIndex3"
                                                    position: Qt.vector3d(6.15409e-05, 0.0262417, 8.21892e-08)
                                                    rotation: Qt.quaternion(0.998111, -0.0614393, -6.30999e-08, 5.90122e-08)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_RightHandIndex4
                                                        objectName: "mixamorig:RightHandIndex4"
                                                        position: Qt.vector3d(-5.46318e-05, 0.0235782, 7.71252e-09)
                                                        rotation: Qt.quaternion(1, -7.85804e-09, 3.16068e-08, 5.63814e-08)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_RightHandMiddle1
                                            objectName: "mixamorig:RightHandMiddle1"
                                            position: Qt.vector3d(0.0098937, 0.0315585, -0.00154257)
                                            rotation: Qt.quaternion(0.972871, 0.038056, -0.00891956, -0.22802)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_RightHandMiddle2
                                                objectName: "mixamorig:RightHandMiddle2"
                                                position: Qt.vector3d(-3.76494e-05, 0.0320508, -1.94167e-07)
                                                rotation: Qt.quaternion(0.999353, 0.0359595, -1.031e-07, 2.21651e-08)
                                                scale: Qt.vector3d(1, 1, 1)
                                                Node {
                                                    id: mixamorig_RightHandMiddle3
                                                    objectName: "mixamorig:RightHandMiddle3"
                                                    position: Qt.vector3d(4.18111e-06, 0.0293538, -4.81507e-09)
                                                    rotation: Qt.quaternion(0.999466, 0.0326739, 9.38144e-09, -1.71167e-08)
                                                    Node {
                                                        id: mixamorig_RightHandMiddle4
                                                        objectName: "mixamorig:RightHandMiddle4"
                                                        position: Qt.vector3d(3.34717e-05, 0.0256927, 2.49745e-08)
                                                        rotation: Qt.quaternion(1, 3.70528e-09, -8.73115e-11, -1.08776e-09)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_RightHandRing1
                                            objectName: "mixamorig:RightHandRing1"
                                            position: Qt.vector3d(-0.00860308, 0.0405237, -0.00311318)
                                            rotation: Qt.quaternion(0.988697, 0.0730676, -0.00964861, -0.130558)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_RightHandRing2
                                                objectName: "mixamorig:RightHandRing2"
                                                position: Qt.vector3d(-1.93669e-06, 0.0279091, -1.65543e-07)
                                                rotation: Qt.quaternion(0.999406, 0.0344675, -4.5429e-09, 9.2314e-08)
                                                Node {
                                                    id: mixamorig_RightHandRing3
                                                    objectName: "mixamorig:RightHandRing3"
                                                    position: Qt.vector3d(-1.24909e-05, 0.0261906, -6.04196e-08)
                                                    rotation: Qt.quaternion(0.997211, -0.0746284, -5.46347e-08, -6.31714e-08)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_RightHandRing4
                                                        objectName: "mixamorig:RightHandRing4"
                                                        position: Qt.vector3d(1.43992e-05, 0.0222676, -1.74041e-08)
                                                        rotation: Qt.quaternion(1, 4.30737e-09, 4.65661e-10, -3.79805e-09)
                                                        scale: Qt.vector3d(1, 1, 1)
                                                    }
                                                }
                                            }
                                        }
                                        Node {
                                            id: mixamorig_RightHandPinky1
                                            objectName: "mixamorig:RightHandPinky1"
                                            position: Qt.vector3d(-0.0294331, 0.0382181, -0.000217323)
                                            rotation: Qt.quaternion(0.993379, 0.114268, 0.00135694, 0.0117953)
                                            scale: Qt.vector3d(1, 1, 1)
                                            Node {
                                                id: mixamorig_RightHandPinky2
                                                objectName: "mixamorig:RightHandPinky2"
                                                position: Qt.vector3d(-6.20587e-05, 0.0250411, 9.31323e-10)
                                                rotation: Qt.quaternion(0.999969, 0.00780957, -1.88133e-07, 1.23404e-07)
                                                Node {
                                                    id: mixamorig_RightHandPinky3
                                                    objectName: "mixamorig:RightHandPinky3"
                                                    position: Qt.vector3d(-5.69625e-05, 0.0200481, -1.08965e-07)
                                                    rotation: Qt.quaternion(0.992826, -0.119571, 1.16436e-07, 6.15597e-08)
                                                    scale: Qt.vector3d(1, 1, 1)
                                                    Node {
                                                        id: mixamorig_RightHandPinky4
                                                        objectName: "mixamorig:RightHandPinky4"
                                                        position: Qt.vector3d(0.000119035, 0.017145, 2.39816e-08)
                                                        rotation: Qt.quaternion(1, 4.59841e-09, 4.19095e-09, 4.65661e-10)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Node {
                id: mixamorig_LeftUpLeg
                objectName: "mixamorig:LeftUpLeg"
                position: Qt.vector3d(0.0572751, -0.0396206, 0.00348879)
                rotation: Qt.quaternion(-0.0121791, -1.72047e-05, -0.00141182, 0.999925)
                scale: Qt.vector3d(1, 1, 1)
                Node {
                    id: mixamorig_LeftLeg
                    objectName: "mixamorig:LeftLeg"
                    position: Qt.vector3d(9.51628e-09, 0.342724, 2.02271e-10)
                    rotation: Qt.quaternion(0.999823, -0.00733447, 0.0001273, -0.0173456)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: mixamorig_LeftFoot
                        objectName: "mixamorig:LeftFoot"
                        position: Qt.vector3d(-6.60771e-09, 0.303422, 1.42245e-09)
                        rotation: Qt.quaternion(0.891798, 0.44703, 0.0623331, -0.0312456)
                        scale: Qt.vector3d(1, 1, 1)
                        Node {
                            id: mixamorig_LeftToeBase
                            objectName: "mixamorig:LeftToeBase"
                            position: Qt.vector3d(-1.11759e-08, 0.136606, -9.59262e-08)
                            rotation: Qt.quaternion(0.945569, 0.324396, -0.0244154, 0.00837617)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: mixamorig_LeftToe_End
                                objectName: "mixamorig:LeftToe_End"
                                position: Qt.vector3d(1.86265e-09, 0.0528516, 2.73576e-08)
                                rotation: Qt.quaternion(1, -1.05356e-08, -1.44282e-08, -5.66433e-09)
                                scale: Qt.vector3d(1, 1, 1)
                            }
                        }
                    }
                }
            }
            Node {
                id: mixamorig_RightUpLeg
                objectName: "mixamorig:RightUpLeg"
                position: Qt.vector3d(-0.0572751, -0.0396205, 0.00474689)
                rotation: Qt.quaternion(0.0121788, 4.52287e-05, -0.00371725, 0.999919)
                scale: Qt.vector3d(1, 1, 1)
                Node {
                    id: mixamorig_RightLeg
                    objectName: "mixamorig:RightLeg"
                    position: Qt.vector3d(-2.73596e-09, 0.342732, 3.73294e-10)
                    rotation: Qt.quaternion(0.999849, -0.000636219, -1.09989e-05, 0.0173458)
                    scale: Qt.vector3d(1, 1, 1)
                    Node {
                        id: mixamorig_RightFoot
                        objectName: "mixamorig:RightFoot"
                        position: Qt.vector3d(5.36524e-09, 0.303387, 3.47598e-10)
                        rotation: Qt.quaternion(0.894955, 0.440459, -0.0637662, 0.0313831)
                        Node {
                            id: mixamorig_RightToeBase
                            objectName: "mixamorig:RightToeBase"
                            position: Qt.vector3d(9.31323e-10, 0.135572, 3.05008e-08)
                            rotation: Qt.quaternion(0.944532, 0.32721, 0.0265971, -0.00921391)
                            scale: Qt.vector3d(1, 1, 1)
                            Node {
                                id: mixamorig_RightToe_End
                                objectName: "mixamorig:RightToe_End"
                                position: Qt.vector3d(-5.58794e-09, 0.0530801, -2.50875e-08)
                                rotation: Qt.quaternion(1, -3.79514e-08, 1.43991e-08, -1.38607e-09)
                            }
                        }
                    }
                }
            }
        }
    }

    // Animations:

    Timeline {
        id: walkTimeline
        objectName: "walkTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 2459
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: walkAnimation
            duration: 2459
            from: 0
            to: 2459
            running: false
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.944351, 0.327987, 0.0111062, -0.02242)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.976607, 0.169468, 0.0243724, 0.130099)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.984323, 0.103998, 0.0166356, 0.141476)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.986358, 0.0729784, 0.0150233, 0.146786)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.998123, -0.0236845, -0.0153182, 0.0543542)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.95801, 0.274178, 0.0389268, 0.0743456)
            }
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-1.1512e-08, 0.137861, 0.0464573)
            }
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.984012, 0.0203524, -0.0376069, 0.172891)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandThumb1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.919978, -0.119223, 0.202742, 0.313564)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandThumb1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.924373, -0.13547, -0.209152, -0.288857)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.973458, 0.0791128, 0.0422529, -0.210562)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.998169, -0.017271, -0.0186038, -0.0549066)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987189, 0.0792369, -0.020283, -0.136996)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.982558, 0.132593, -0.020974, -0.128685)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.968101, 0.221452, -0.032045, -0.112749)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.927885, 0.361477, -0.0394612, -0.0824983)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.921006, 0.383924, 0.00100181, 0.0659506)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.92066, 0.383942, -0.00101365, 0.0705218)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/walk/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

    Timeline {
        id: idleTimeline
        objectName: "idleTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 4334
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: idleAnimation
            duration: 4334
            from: 0
            to: 4334
            running: false
            loops: Animation.Infinite
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.972352, 0.229391, -0.00582193, -0.0433349)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.948748, 0.312191, -0.00331162, -0.0490138)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.975144, 0.218784, -0.00670746, -0.0344038)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00870511, 0.03696, -0.00367483)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.979122, -0.189349, -0.0448167, 0.0588169)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.987805, 0.15378, -0.00543934, -0.0237296)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.89018, 0.450599, -0.0105073, -0.0665586)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.982397, -0.0387781, -0.0135634, 0.182232)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.938767, 0.341075, -0.00131045, -0.0488122)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.983869, 0.176751, -0.00311954, -0.0274044)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.964481, 0.0811808, -0.0695298, 0.24156)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.954025, 0.025697, -0.130774, -0.268466)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_HeadTop_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.932306, 0.0424141, 0.0256223, 0.358261)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.0234034, -0.0084645, 0.00869915)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.972998, 0.0695171, 0.198097, 0.0959123)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.885583, 0.456201, -0.00167118, -0.0872939)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.0219598, -0.00939289, 0.00872179)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.935292, -0.0916147, -0.140505, -0.311598)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.99662, 0.0564581, 0.0466065, 0.0372709)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.960693, -0.0573226, -0.0183032, -0.271012)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.971411, -0.205092, 0.0144749, -0.11869)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.92424, 0.378188, 0.00270098, 0.0524141)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.980673, -0.148255, 0.0249297, -0.125216)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.865811, 0.495219, 0.00999266, 0.0709262)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.924876, 0.376075, 0.00490917, 0.0561094)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.990678, 0.110766, -0.00286643, -0.0792459)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.998291, 0.0572912, 0.00673408, 0.00935762)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.998765, 0.0488743, 0.00338857, 0.0082138)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.882641, 0.462239, 0.00639938, 0.0850801)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            Keyframe {
                frame: 0
                value: Qt.quaternion(0.929042, 0.362931, 0.00163721, 0.071829)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/idle/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

        Timeline {
        id: standUpFaceUpTimeline
        startFrame: 0
        endFrame: 2042
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: standUpFaceUpAnimation
            duration: 2042
            from: 0
            to: 2042
            running: false
            loops: 1
        }

        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightToe_End_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightToe_End_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightToeBase_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightToeBase_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightFoot_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightFoot_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightLeg_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightUpLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftToe_End_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftToe_End_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00870514, 0.0369601, -0.00367483)
            }
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandRing1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.0293519, 0.0241767, 0.000942677)
            }
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandIndex1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Spine2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Spine2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Head_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Head_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_HeadTop_End_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_HeadTop_End_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftShoulder_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftShoulder_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Neck_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Neck_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Spine_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Spine_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftForeArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftForeArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Spine1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Spine1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHand_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHand_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Hips_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_Hips_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandThumb1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftHandPinky4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightShoulder_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightShoulder_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightForeArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightForeArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHand_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHand_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandThumb4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandIndex4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandMiddle4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandRing4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_RightHandPinky4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftUpLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftLeg_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftFoot_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftFoot_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftToeBase_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceUp/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

    Timeline {
        id: standUpFaceDownTimeline
        startFrame: 0
        endFrame: 2459
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: standUpFaceDownAnimation
            duration: 2459
            from: 0
            to: 2459
            running: false
            loops: 1
        }


        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightToe_End_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightToe_End_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightToeBase_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightToeBase_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightFoot_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightFoot_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightLeg_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightUpLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftToe_End_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftToe_End_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.00870515, 0.03696, -0.00367484)
            }
        }

        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandRing1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.0101805, 0.0300305, -0.00271803)
            }
        }

        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandIndex1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Spine2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Spine2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Head_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Head_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_HeadTop_End_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_HeadTop_End_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftShoulder_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Neck_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Neck_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Spine_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Spine_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftForeArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftForeArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Spine1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Spine1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHand_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHand_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Hips_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_Hips_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandThumb1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftHandPinky4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightShoulder_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightForeArm_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightForeArm_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHand_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHand_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandThumb4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandIndex4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandMiddle4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandRing4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky1_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky1_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky2_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky2_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky3_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky3_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky4_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_RightHandPinky4_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftUpLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftLeg_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftLeg_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftFoot_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftFoot_rotation_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftToeBase_position_0.qad"
        }

        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/standUpFaceDown/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

    Timeline {
        id: painLeftTimeline
        objectName: "painLeftTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1334
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: painLeftAnimation
            duration: 1334
            from: 0
            to: 1334
            running: false
            loops: 1
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.0101805, 0.0300306, -0.00271796)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.0308273, 0.0378223, -0.000110825)
            }
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_HeadTop_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(-0.00860307, 0.0405236, -0.00311328)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painLeft/mixamorig_LeftToeBase_position_0.qad"
        }
    }

    Timeline {
        id: painMidTimeline
        objectName: "painMidTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1250
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: painMidAnimation
            duration: 1250
            from: 0
            to: 1250
            running: false
            loops: 1
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_HeadTop_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.0219598, -0.00939285, 0.00872173)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            Keyframe {
                frame: 0
                value: Qt.vector3d(0.000119087, 0.017145, 3.14321e-08)
            }
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painMid/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

    Timeline {
        id: painRightTimeline
        objectName: "painRightTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1459
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: painRightAnimation
            duration: 1459
            from: 0
            to: 1459
            running: false
            loops: 1
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_HeadTop_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/painRight/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

    Timeline {
        id: attackLeftTimeline
        objectName: "attackLeftTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1750
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: attackLeftAnimation
            duration: 1750
            from: 0
            to: 1750
            running: false
            loops: 1
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_HeadTop_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackLeft/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }

    Timeline {
        id: attackRightTimeline
        objectName: "attackRightTimeline"
        property real framesPerSecond: 1000
        startFrame: 0
        endFrame: 1750
        currentFrame: 0
        enabled: false
        animations: TimelineAnimation {
            id: attackRightAnimation
            duration: 1750
            from: 0
            to: 1750
            running: false
            loops: 1
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightToeBase_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftToe_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToe_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftToe_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandThumb4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Spine2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Spine2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Head_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Head
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Head_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_HeadTop_End_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_HeadTop_End
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_HeadTop_End_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Neck_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Neck
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Neck_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Spine_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Spine_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Spine1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Spine1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Spine1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Hips_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_Hips
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_Hips_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightShoulder_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightShoulder
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightShoulder_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightForeArm_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightForeArm
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightForeArm_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHand_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHand
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHand_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandThumb1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandThumb2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandThumb2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandThumb3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandThumb3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandThumb4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandThumb4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandIndex4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandIndex4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandMiddle4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandMiddle4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandRing4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandRing4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky1_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky1
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky1_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky2_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky2
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky2_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky3_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky3
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky3_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky4_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_RightHandPinky4
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_RightHandPinky4_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftUpLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftUpLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftLeg_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftLeg
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftLeg_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftFoot_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftFoot
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftFoot_rotation_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "position"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftToeBase_position_0.qad"
        }
        KeyframeGroup {
            target: mixamorig_LeftToeBase
            property: "rotation"
            keyframeSource: "qrc:/Assets/models/zombie/anims/attackRight/mixamorig_LeftToeBase_rotation_0.qad"
        }
    }
}
