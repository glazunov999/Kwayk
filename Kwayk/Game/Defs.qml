pragma Singleton

import QtQuick
import QtQuick3D

QtObject {
    id: defs

    readonly property string version: "0.00"

    readonly property int contentsEmpty: -1
    readonly property int contentsSolid: -2
    readonly property int contentsWater: -3
    readonly property int contentsSlime: -4
    readonly property int contentsLava: -5
    readonly property int contentsSky: -6

    readonly property int damageNo: 0
    readonly property int damageYes: 1
    readonly property int damageAim: 2
    readonly property int damageDead: 3

    readonly property int itShotgun: 1
    readonly property int itSuperShotgun: 2
    readonly property int itNailgun: 4
    readonly property int itSuperNailgun: 8
    readonly property int itGrenadeLauncher: 16
    readonly property int itRocketLauncher: 32
    readonly property int itLightning: 64
    readonly property int itSuperLightning: 128
    readonly property int itShells: 256
    readonly property int itNails: 512
    readonly property int itRockets: 1024
    readonly property int itCells: 2048
    readonly property int itAxe: 4096
    readonly property int itArmor1: 8192
    readonly property int itArmor2: 16384
    readonly property int itArmor3: 32768
    readonly property int itSuperHealth: 65536
    readonly property int itKey1: 131072
    readonly property int itKey2: 262144
    readonly property int itInvisibility: 524288
    readonly property int itInvulnerability: 1048576
    readonly property int itSuit: 2097152
    readonly property int itQuad: 4194304
    readonly property int itSigil1: (1 << 28)
    readonly property int itSigil2: (1 << 29)
    readonly property int itSigil3: (1 << 30)
    readonly property int itSigil4: (1 << 31)

    readonly property int efBrightfield: 1
    readonly property int efMuzzleflash: 2
    readonly property int efBrightlight: 4
    readonly property int efDimlight: 8

    readonly property int deadNo: 0
    readonly property int deadDying: 1
    readonly property int deadDead: 2
    readonly property int deadRespawnable: 3

    readonly property int rangeMelee: 0
    readonly property int rangeNear: 1
    readonly property int rangeMid: 2
    readonly property int rangeFar: 3

    readonly property int asStraight: 1
    readonly property int asSliding: 2
    readonly property int asMelee: 3
    readonly property int asMissile: 4

    readonly property int rocket: 1
    readonly property int grenade: 2
    readonly property int gib: 4
    readonly property int tracer: 16
    readonly property int zomgib: 32
    readonly property int tracer2: 64
    readonly property int tracer3: 128

    readonly property int attnNone: 0
    readonly property int attnNorm: 1
    readonly property int attnIdle: 2
    readonly property int attnStatic: 3
}
