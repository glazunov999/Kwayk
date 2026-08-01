import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Kwayk.Core
import Assets.maps.start
import Backend

World {
    id: root

    displayName: "Tainted Tech Threshold"
    worldtype: 2

    readonly property alias player: player

    Start_map {
        id: map
    }

    Start_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(0, 4.24, 1.6)
    }

    // func_wall
    Wall {
        body: map.model_1
    }

    Wall {
        body: map.model_2
    }

    PushTrigger {
        body: map.model_3
        position: Qt.vector3d(0, 1.68, -16.32)
        mins: Qt.vector3d(-0.16, -1.52, -0.16)
        maxs: Qt.vector3d(0.16, 1.52, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        speed: 0.5
    }

    PushTrigger {
        body: map.model_4
        position: Qt.vector3d(0, 3.58, -19.6)
        mins: Qt.vector3d(-0.16, -0.0999999, -3.44)
        maxs: Qt.vector3d(0.16, 0.1, 3.44)
        movedir: Qt.vector3d(0, 0, -1)
        speed: 0.5
    }

    PushTrigger {
        body: map.model_5
        position: Qt.vector3d(0, 2.38, -22.96)
        mins: Qt.vector3d(-0.16, -1.1, -0.0800018)
        maxs: Qt.vector3d(0.16, 1.1, 0.0799999)
        movedir: Qt.vector3d(0, -1, 0)
        speed: 0.5
    }

    Wall {
        body: map.model_18
    }

    Wall {
        body: map.model_19
    }

    Wall {
        body: map.model_20
    }

    Wall {
        body: map.model_21
    }

    Wall {
        body: map.model_23
    }

    Wall {
        body: map.model_27
    }

    Wall {
        body: map.model_28
    }

    Wall {
        spawnflags: 2048
        body: map.model_29
    }

    Wall {
        spawnflags: 1792
        body: map.model_30
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(0, 0.64, -13.04)
        mins: Qt.vector3d(-0.96, -0.64, -0.88)
        maxs: Qt.vector3d(0.96, 0.64, 0.88)
        body: map.model_6
        message: "easy skill"
        wait: 2
    }

    SetSkillTrigger {
        message: "0"
        body: map.model_7
    }

    SetSkillTrigger {
        message: "1"
        body: map.model_8
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(-2.56, 0.64, -9.6)
        mins: Qt.vector3d(-0.96, -0.64, -0.96)
        maxs: Qt.vector3d(0.96, 0.64, 0.96)
        body: map.model_9
        message: "normal skill"
        wait: 2
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(2.72, 0.64, -9.6)
        mins: Qt.vector3d(-0.8, -0.64, -0.96)
        maxs: Qt.vector3d(0.8, 0.64, 0.96)
        body: map.model_10
        message: "hard skill"
        wait: 2
    }

    SetSkillTrigger {
        message: "2"
        body: map.model_11
    }

    MultipleTrigger {
        spawnflags: 2048
        position: Qt.vector3d(4.96, -1.92, -16.96)
        mins: Qt.vector3d(-0.16, -0.64, -0.640001)
        maxs: Qt.vector3d(0.16, 0.64, 0.639999)
        body: map.model_12
        message: "nightmare!"
        wait: 2
    }

    TeleportDestination {
        targetname: "tele_target_nightmare"
        position: Qt.vector3d(0, 0.32, -21.6)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportTrigger {
        target: "tele_target_nightmare"
        position: Qt.vector3d(0.88, -1.92, -16.96)
        mins: Qt.vector3d(-0.08, -0.64, -0.640001)
        maxs: Qt.vector3d(0.08, 0.64, 0.639999)
        body: map.model_13
    }

    SetSkillTrigger {
        message: "3"
        body: map.model_14
    }

    // door + button
    Door {
        id: door_start
        targetname: "door_start"
        eulerRotation: Qt.vector3d(0, -90, 0)
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(0, 1.76, -3.84)
        mins: Qt.vector3d(-1.28, -2.08, -0.64)
        maxs: Qt.vector3d(1.28, 2.08, 0.64)
        lip: 0.32
        speed: 1.5
        wait: -1
        sounds: 2
        spawnflags: 2048
        body: map.model_15
        owner: door_start
        enemy: door_start
    }

    Button {
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(0, 4.33, -4.54)
        mins: Qt.vector3d(-0.38, -0.11, -0.0799999)
        maxs: Qt.vector3d(0.38, 0.11, 0.0799999)
        wait: -1
        speed: 5
        sounds: 2
        spawnflags: 2048
        body: map.model_16
        target: "door_start"
    }

    ChangeLevelTrigger {
        spawnflags: 2049
        position: Qt.vector3d(0, 0.96, -28)
        mins: Qt.vector3d(-0.32, -0.32, -0.32)
        maxs: Qt.vector3d(0.32, 0.32, 0.32)
        body: map.model_17
        map: "lq_e0m1"
    }

    SecretTrigger {
        position: Qt.vector3d(5.8, -0.96, -16.96)
        mins: Qt.vector3d(-0.4, -0.08, -0.480001)
        maxs: Qt.vector3d(0.4, 0.08, 0.48)
        body: map.model_22
    }

    // func_train + path_corners
    PathCorner {
        targetname: "pump3_2"
        target: "pump3_1"
        position: Qt.vector3d(7.92, -0.72, -16.4)
        wait: 0.25
    }

    PathCorner {
        targetname: "pump2_2"
        target: "pump2_1"
        position: Qt.vector3d(7.92, -0.72, -16.88)
        wait: 0.25
    }

    PathCorner {
        targetname: "pump1_2"
        target: "pump1_1"
        position: Qt.vector3d(7.92, -0.72, -17.36)
        wait: 0.25
    }

    PathCorner {
        targetname: "pump1_1"
        target: "pump1_2"
        position: Qt.vector3d(7.92, -1.18, -17.36)
        wait: 0
    }

    PathCorner {
        targetname: "pump2_1"
        target: "pump2_2"
        position: Qt.vector3d(7.92, -1.18, -16.88)
        wait: 0
    }

    PathCorner {
        targetname: "pump3_1"
        target: "pump3_2"
        position: Qt.vector3d(7.92, -1.18, -16.4)
        wait: 0
    }

    Train {
        id: train_pump2
        target: "pump2_1"
        speed: 0.54
        sounds: 0
        body: map.model_24
        position: Qt.vector3d(8, -0.4, -16.96)
        mins: Qt.vector3d(-0.0799999, -0.24, -0.0800018)
        maxs: Qt.vector3d(0.0799999, 0.24, 0.0799999)
    }

    Train {
        id: train_pump1
        target: "pump1_1"
        speed: 0.46
        sounds: 0
        body: map.model_25
        position: Qt.vector3d(8, -0.4, -17.44)
        mins: Qt.vector3d(-0.0799999, -0.24, -0.0799999)
        maxs: Qt.vector3d(0.0799999, 0.24, 0.0799999)
    }

    Train {
        id: train_pump3
        target: "pump3_1"
        speed: 0.5
        sounds: 0
        body: map.model_26
        position: Qt.vector3d(8, -0.4, -16.48)
        mins: Qt.vector3d(-0.0799999, -0.24, -0.0799999)
        maxs: Qt.vector3d(0.0799999, 0.24, 0.0799999)
    }

    Explobox {
        position: Qt.vector3d(11.68, 0, -8.4)
    }

    Explobox {
        position: Qt.vector3d(7.36, 0, -23.68)
    }

    Explobox {
        position: Qt.vector3d(5.6, -0.8, -16.68)
    }

    Explobox {
        position: Qt.vector3d(5.76, -0.8, -17.08)
    }

    Explobox {
        position: Qt.vector3d(7.2, 0.32, -9.6)
    }

    Explobox {
        position: Qt.vector3d(7.36, 0.32, -10.6)
    }

    Explobox {
        small: true
        position: Qt.vector3d(4.32, 0, -5.92)
    }

    Explobox {
        small: true
        position: Qt.vector3d(5.92, -0.8, -16.76)
    }

    Explobox {
        position: Qt.vector3d(11.76, 0, -16.32)
    }

    Explobox {
        position: Qt.vector3d(11, 0, -16.8)
    }

    Explobox {
        position: Qt.vector3d(11, 0, -20.04)
    }

    AmbientCompHum {
        position: Qt.vector3d(0, 0.8, -20.72)
    }

    Explobox {
        position: Qt.vector3d(11.6, 0, -14.4)
    }

    Explobox {
        position: Qt.vector3d(8.16, 0, -6.16)
    }

    AmbientDrone {
        position: Qt.vector3d(0, 1.68, -28)
    }

    Explobox {
        small: true
        position: Qt.vector3d(11.84, 0, -7.16)
    }

    AmbientDrip {
        position: Qt.vector3d(3.76, -2.32, -18.8)
    }

    AmbientCompHum {
        position: Qt.vector3d(-13.36, 0.56, -14.64)
    }

    AmbientCompHum {
        position: Qt.vector3d(-13.36, 0.56, -14.64)
    }

    AmbientCompHum {
        position: Qt.vector3d(-13.36, 0.56, -18.48)
    }

    AmbientCompHum {
        position: Qt.vector3d(-8.24, 0.72, -9.84)
    }

    ViewThing {
        position: Qt.vector3d(5.6, 0.24, -9.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
        frame: 69
    }

    ViewThing {
        position: Qt.vector3d(11.0, -0.68, -15.8)
        eulerRotation: Qt.vector3d(0, -45, 0)
        frame: 49
    }

    ViewThing {
        position: Qt.vector3d(3.84, -2.3, -18.04)
        eulerRotation: Qt.vector3d(0, 135, 0)
        frame: 60
    }

    Crucified {
        position: Qt.vector3d(0.99, -2.04, -15.69)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Crucified {
        position: Qt.vector3d(0.99, -2.04, -18.25)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }
}
