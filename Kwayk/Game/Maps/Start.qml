import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Kwayk.Game
import Kwayk.Core
import Assets.maps.start
import Backend

World {
    id: root

    displayName: "Introduction"
    worldtype: 0

    readonly property alias player: player

    Start_map {
        id: map
    }

    Start_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(5.44, 0.32, -2.88)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportTrigger {
        target: "t1"
        position: Qt.vector3d(2.32, 0.48, -13.76)
        mins: Qt.vector3d(-0.24, -0.48, -0.08)
        maxs: Qt.vector3d(0.24, 0.48, 0.08)
        body: map.model_1
    }

    TeleportTrigger {
        target: "t1"
        position: Qt.vector3d(5.44, 0.48, -13.76)
        mins: Qt.vector3d(-0.24, -0.48, -0.08)
        maxs: Qt.vector3d(0.24, 0.48, 0.08)
        body: map.model_2
    }

    TeleportTrigger {
        target: "t1"
        position: Qt.vector3d(8.64, 0.48, -13.76)
        mins: Qt.vector3d(-0.24, -0.48, -0.08)
        maxs: Qt.vector3d(0.24, 0.48, 0.08)
        body: map.model_3
    }

    Door {
        id: door_4
        position: Qt.vector3d(12.88, 1.68, -23.52)
        mins: Qt.vector3d(-0.08, -0.88, -0.32)
        maxs: Qt.vector3d(0.08, 0.88, 0.32)
        wait: -1
        speed: 4
        body: map.model_4
        owner: door_4
        enemy: door_5
    }

    Door {
        id: door_5
        targetname: "t3"
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(12.88, 1.68, -22.88)
        mins: Qt.vector3d(-0.08, -0.88, -0.32)
        maxs: Qt.vector3d(0.08, 0.88, 0.32)
        wait: -1
        speed: 4
        sounds: 3
        body: map.model_5
        owner: door_4
        enemy: door_4
    }

    DoorTrigger {
        owner: door_4
    }

    Door {
        id: door_6
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(-1.96, 1.6, -23.36)
        mins: Qt.vector3d(-0.12, -0.96, -0.32)
        maxs: Qt.vector3d(0.12, 0.96, 0.32)
        wait: -1
        speed: 0.5
        sounds: 3
        body: map.model_6
        owner: door_6
        enemy: door_7
    }

    Door {
        id: door_7
        targetname: "t2"
        position: Qt.vector3d(-1.96, 1.6, -24)
        mins: Qt.vector3d(-0.12, -0.96, -0.32)
        maxs: Qt.vector3d(0.12, 0.96, 0.32)
        wait: -1
        speed: 0.5
        body: map.model_7
        owner: door_6
        enemy: door_6
    }

    DoorTrigger {
        owner: door_6
    }

    Wall {
        body: map.model_8
        visible: false
        solid: false
    }

    SetSkillTrigger {
        message: "0"
        body: map.model_9
    }

    SetSkillTrigger {
        message: "1"
        body: map.model_10
    }

    SetSkillTrigger {
        message: "2"
        body: map.model_11
    }

    ChangeLevelTrigger {
        spawnflags: 1
        position: Qt.vector3d(-5.48, 2.08, -23.68)
        mins: Qt.vector3d(-0.28, -0.8, -0.24)
        maxs: Qt.vector3d(0.28, 0.8, 0.24)
        body: map.model_12
        // map: "e2m1"
    }

    ChangeLevelTrigger {
        spawnflags: 1
        position: Qt.vector3d(15.36, 3.04, -30.44)
        mins: Qt.vector3d(-0.24, -0.8, -0.28)
        maxs: Qt.vector3d(0.24, 0.8, 0.28)
        body: map.model_13
        //map: "e3m1"
    }

    ChangeLevelTrigger {
        spawnflags: 1
        position: Qt.vector3d(-0.64, 1.76, -16.28)
        mins: Qt.vector3d(-0.24, -0.8, -0.28)
        maxs: Qt.vector3d(0.24, 0.8, 0.28)
        body: map.model_14
        map: "e1m1"
    }

    OnceTrigger {
        target: "t3"
        position: Qt.vector3d(12.72, 0.96, -23.2)
        mins: Qt.vector3d(-0.08, -0.32, -0.64)
        maxs: Qt.vector3d(0.08, 0.32, 0.64)
        body: map.model_15
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(5.52, -0.16, -10.32)
        mins: Qt.vector3d(-1.36, -0.08, -2)
        maxs: Qt.vector3d(1.36, 0.08, 2)
        body: map.model_16
        message: "This hall selects NORMAL skill"
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(2.32, -0.16, -10.24)
        mins: Qt.vector3d(-1.36, -0.08, -1.92)
        maxs: Qt.vector3d(1.36, 0.08, 1.92)
        body: map.model_17
        message: "This hall selects EASY skill"
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(8.64, -0.16, -10.24)
        mins: Qt.vector3d(-1.36, -0.08, -2.24)
        maxs: Qt.vector3d(1.36, 0.08, 2.24)
        body: map.model_18
        message: "This hall selects HARD skill"
        wait: 2
    }

    TeleportTrigger {
        target: "t4"
        position: Qt.vector3d(5.44, 0.96, -14.56)
        mins: Qt.vector3d(-0.32, -0.64, -0.08)
        maxs: Qt.vector3d(0.32, 0.64, 0.08)
        body: map.model_19
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(1.68, 0.76, -17.28)
        mins: Qt.vector3d(-0.72, -0.52, -0.64)
        maxs: Qt.vector3d(0.72, 0.52, 0.64)
        body: map.model_20
        message: "This is the first episode:\nDimension of the Doomed\n\nThe mystical past comes alive..."
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(-0.76, 1.04, -17.36)
        mins: Qt.vector3d(-0.44, -0.08, -0.56)
        maxs: Qt.vector3d(0.44, 0.08, 0.56)
        body: map.model_21
        message: "Walk into the Slipgate\nto start playing Quake!"
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(10.4, 1, -17.28)
        mins: Qt.vector3d(-1.76, -0.76, -0.64)
        maxs: Qt.vector3d(1.76, 0.76, 0.64)
        body: map.model_22
        message: "This is the fourth episode:\nThe Elder World\n\nYour worst nightmares come true..."
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(6.72, 0.88, -22.4)
        mins: Qt.vector3d(-0.64, -0.48, -1.44)
        maxs: Qt.vector3d(0.64, 0.48, 1.44)
        body: map.model_23
        message: "This is the third episode:\nThe Netherworld\n\nPrimal fear in a strange dimension..."
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(4.16, 1.04, -23.04)
        mins: Qt.vector3d(-0.64, -0.32, -1.28)
        maxs: Qt.vector3d(0.64, 0.32, 1.28)
        body: map.model_24
        message: "This is the second episode:\nThe Realm of Black Magic\n\nAncient castles and\nstrange beasts ahead..."
        wait: 2
    }

    TeleportTrigger {
        target: "t1"
        position: Qt.vector3d(10.4, -3.12, -17.36)
        mins: Qt.vector3d(-0.32, -0.48, -0.16)
        maxs: Qt.vector3d(0.32, 0.48, 0.16)
        body: map.model_25
    }

    ChangeLevelTrigger {
        spawnflags: 1
        position: Qt.vector3d(20.2, -1.76, -17.28)
        mins: Qt.vector3d(-0.28, -0.8, -0.24)
        maxs: Qt.vector3d(0.28, 0.8, 0.24)
        body: map.model_27
        //map: "e4m1"
    }

    OnceTrigger {
        target: "t5"
        position: Qt.vector3d(16.32, -3.16, -17.28)
        mins: Qt.vector3d(-0.08, -0.6, -1.28)
        maxs: Qt.vector3d(0.08, 0.6, 1.28)
        body: map.model_28
    }

    Door {
        id: door_26
        targetname: "t5"
        position: Qt.vector3d(16.64, -2.24, -17.28)
        mins: Qt.vector3d(-0.16, -1.6, -1.12)
        maxs: Qt.vector3d(0.16, 1.6, 1.12)
        movedir: Qt.vector3d(0, -1, 0)
        wait: -1
        speed: 0.5
        sounds: 3
        body: map.model_26
        owner: door_26
        enemy: door_26
    }

    DoorTrigger {
        owner: door_26
    }

    Wall {
        spawnflags: 1792
        body: map.model_30
    }

    Wall {
        spawnflags: 1792
        body: map.model_31
    }

    Wall {
        spawnflags: 1792
        body: map.model_32
    }

    Wall {
        spawnflags: 1792
        body: map.model_33
    }

    TeleportTrigger {
        spawnflags: 2048
        target: "t1"
        position: Qt.vector3d(9.88, -0.16, -19.04)
        mins: Qt.vector3d(-0.36, -0.8, -0.08)
        maxs: Qt.vector3d(0.36, 0.8, 0.08)
        body: map.model_34
    }

    SetSkillTrigger {
        spawnflags: 2048
        message: "3"
        body: map.model_35
    }

    MultipleTrigger {
        position: Qt.vector3d(14.16, -1.4, -20.64)
        mins: Qt.vector3d(-0.08, -0.44, -0.48)
        maxs: Qt.vector3d(0.08, 0.44, 0.48)
        body: map.model_36
        message: "This passage selects NIGHTMARE skill!"
        wait: 2
    }

    MultipleTrigger {
        position: Qt.vector3d(9.32, -0.32, -20.64)
        mins: Qt.vector3d(-0.04, -0.32, -0.32)
        maxs: Qt.vector3d(0.04, 0.32, 0.32)
        body: map.model_37
        message: "The Well of Wishes awaits in\nthe Crypt of Decay!"
        wait: 3
        health: 1
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(-1.04, -3.44, -20.08)
        mins: Qt.vector3d(-1.04, -0.32, -0.08)
        maxs: Qt.vector3d(1.04, 0.32, 0.08)
        body: map.model_39
        message: "Shub-Niggurath awaits you..."
        wait: 5
    }

    //Wall {
    //    body: map.model_38
    //}

    ChangeLevelTrigger {
        spawnflags: 1
        position: Qt.vector3d(-0.96, -6.16, -17.6)
        mins: Qt.vector3d(-0.88, -0.08, -0.88)
        maxs: Qt.vector3d(0.88, 0.08, 0.88)
        body: map.model_40
        map: "end"
    }

    EpisodeGate {
        spawnflags: 2049
        body: map.model_41
    }

    EpisodeGate {
        spawnflags: 2056
        body: map.model_42
    }

    EpisodeGate {
        spawnflags: 2052
        body: map.model_43
    }

    EpisodeGate {
        spawnflags: 2050
        body: map.model_44
    }

    TeleportTrigger {
        spawnflags: 1792
        target: "t7"
        position: Qt.vector3d(9.88, -0.16, -19.04)
        mins: Qt.vector3d(-0.36, -0.8, -0.08)
        maxs: Qt.vector3d(0.36, 0.8, 0.08)
        body: map.model_45
    }

    Wall {
        spawnflags: 1792
        body: map.model_46
    }

    Wall {
        spawnflags: 1792
        body: map.model_47
    }

    Wall {
        spawnflags: 2048
        body: map.model_48
    }

    TeleportTrigger {
        spawnflags: 1792
        target: "t8"
        position: Qt.vector3d(-4.24, -3.16, -18.56)
        mins: Qt.vector3d(-0.08, -0.44, -0.24)
        maxs: Qt.vector3d(0.08, 0.44, 0.24)
        body: map.model_49
    }

    OnceTrigger {
        target: "t9"
        position: Qt.vector3d(2.68, 0.32, -17.28)
        mins: Qt.vector3d(-0.12, -0.16, -0.56)
        maxs: Qt.vector3d(0.12, 0.16, 0.56)
        body: map.model_51
    }

    OnceTrigger {
        position: Qt.vector3d(-1.04, -3.6, -19.76)
        mins: Qt.vector3d(-0.16, -0.08, -0.16)
        maxs: Qt.vector3d(0.16, 0.08, 0.16)
        body: map.model_52
    }

    Wall {
        spawnflags: 1792
        body: map.model_53
    }

    TeleportTrigger {
        target: "t11"
        position: Qt.vector3d(-0.96, -6.64, -17.52)
        mins: Qt.vector3d(-0.08, -0.08, -0.08)
        maxs: Qt.vector3d(0.08, 0.08, 0.08)
        body: map.model_54
    }

    TeleportDestination {
        targetname: "t1"
        position: Qt.vector3d(5.44, 0.16, -15.36)
    }

    TeleportDestination {
        targetname: "t4"
        position: Qt.vector3d(5.44, 0.16, -2.80)
    }

    TeleportDestination {
        targetname: "t7"
        position: Qt.vector3d(-1.04, -3.76, -19.76)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "t8"
        position: Qt.vector3d(12.24, 1.12, -17.28)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t11"
        position: Qt.vector3d(-1.24, -6.68, -17.48)
    }

    Flame2 {
        position: Qt.vector3d(1.26, 0.12, -5.26)
    }

    Flame2 {
        position: Qt.vector3d(9.58, 0.12, -5.26)
    }

    Flame2 {
        position: Qt.vector3d(0.71, -3.16, -16.55)
    }

    Flame2 {
        position: Qt.vector3d(0.72, -2.52, -16.56)
    }

    Flame2 {
        position: Qt.vector3d(-2.81, -3.16, -16.55)
    }

    Flame2 {
        position: Qt.vector3d(-2.80, -2.52, -16.56)
    }

    Flame2 {
        position: Qt.vector3d(-2.81, -3.16, -19.59)
    }

    Flame2 {
        position: Qt.vector3d(-2.80, -2.52, -19.60)
    }

    Flame2 {
        position: Qt.vector3d(0.71, -3.16, -19.59)
    }

    Flame2 {
        position: Qt.vector3d(0.72, -2.52, -19.60)
    }

    Flame {
        position: Qt.vector3d(3.94, 0.84, -7.62)
    }

    Flame {
        position: Qt.vector3d(6.98, 0.84, -7.62)
    }

    Flame {
        position: Qt.vector3d(3.62, 0.20, -10.34)
    }

    Flame {
        position: Qt.vector3d(3.86, 1.32, -15.54)
    }

    Flame {
        position: Qt.vector3d(7.06, 1.32, -15.54)
    }

    Flame {
        position: Qt.vector3d(2.42, 1.32, -19.38)
    }

    Flame {
        position: Qt.vector3d(8.50, 1.32, -19.38)
    }

    Flame {
        position: Qt.vector3d(5.46, 1.48, -20.50)
    }

    Flame {
        position: Qt.vector3d(0.90, 1.48, -21.86)
    }

    Flame {
        position: Qt.vector3d(0.90, 1.48, -25.50)
    }

    Flame {
        position: Qt.vector3d(-1.50, 1.48, -25.50)
    }

    Flame {
        position: Qt.vector3d(-1.50, 1.48, -21.86)
    }

    Flame {
        position: Qt.vector3d(-6.24, 2.12, -21.70)
    }

    Flame {
        position: Qt.vector3d(-4.96, 2.12, -21.70)
    }

    Flame {
        position: Qt.vector3d(-3.68, 2.12, -21.70)
    }

    Flame {
        position: Qt.vector3d(-6.24, 2.12, -25.66)
    }

    Flame {
        position: Qt.vector3d(-4.96, 2.12, -25.66)
    }

    Flame {
        position: Qt.vector3d(-3.68, 2.12, -25.66)
    }

    Flame {
        position: Qt.vector3d(11.22, 1.80, -16.58)
    }

    Flame {
        position: Qt.vector3d(11.22, 1.80, -17.98)
    }

    Flame {
        position: Qt.vector3d(15.38, 1.80, -17.26)
    }

    Flame {
        position: Qt.vector3d(11.50, -3.00, -15.26)
    }

    Flame {
        position: Qt.vector3d(11.50, -3.00, -19.34)
    }

    Flame {
        position: Qt.vector3d(16.02, -3.00, -15.26)
    }

    Flame {
        position: Qt.vector3d(15.98, -3.00, -19.34)
    }

    Flame {
        position: Qt.vector3d(5.30, -1.48, -22.82)
    }

    Flame {
        position: Qt.vector3d(3.22, -1.48, -20.82)
    }

    Flame {
        position: Qt.vector3d(1.54, -1.48, -23.38)
    }

    Flame {
        position: Qt.vector3d(0.10, -1.48, -20.74)
    }

    Flame {
        position: Qt.vector3d(9.82, -3.00, -18.54)
    }

    Flame {
        position: Qt.vector3d(9.82, -3.00, -15.98)
    }

    Crucified {
        position: Qt.vector3d(10.04, 1.24, -10.48)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Crucified {
        position: Qt.vector3d(10.04, 0.72, -9.28)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Crucified {
        position: Qt.vector3d(7.08, 0.52, -9.92)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Crucified {
        position: Qt.vector3d(7.08, 1.20, -11.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Lavaball {
        position: Qt.vector3d(8.64, -1.68, -9.92)
        speed: 6
    }

    Lavaball {
        position: Qt.vector3d(10.88, -0.24, -22.08)
        speed: 6
    }

    Lavaball {
        position: Qt.vector3d(10.72, -0.24, -24.32)
        speed: 6
    }

    AmbientDrone {
        position: Qt.vector3d(-0.70, 1.60, -16.26 )
    }

    AmbientDrone {
        position: Qt.vector3d(-6.22, 2.00, -23.62 )
    }

    AmbientDrone {
        position: Qt.vector3d(15.46, 2.96, -31.46)
    }

    AmbientDrone {
        position: Qt.vector3d(21.06, -1.84, -17.30)
    }

    LightFluorospark {
        position: Qt.vector3d(-2.00, 1.52, -14.80)
    }

    LightFluoro {
        position: Qt.vector3d(0.64, 1.60, -14.88)
    }
}
