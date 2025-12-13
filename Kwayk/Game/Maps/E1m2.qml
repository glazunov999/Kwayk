import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Game
import Assets.maps.e1m2

World {
    id: root

    displayName: "Castle of the Damned"
    worldtype: 0

    readonly property alias player: player

    E1m2_map {
        id: map
    }

    E1m2_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(14.96, 2.96, -16.64)
        eulerRotation: Qt.vector3d(0, 180.0, 0)
    }

    TeleportTrigger {
        target: "t43"
        position: Qt.vector3d(18.66, 3.22, 5.64)
        mins: Qt.vector3d(-0.139999, -0.5, -0.36)
        maxs: Qt.vector3d(0.139999, 0.5, 0.36)
        body: map.model_1
    }

    Door {
        id: door_2
        wait: -1
        sounds: 1
        body: map.model_2
        owner: door_2
        enemy: door_3
        targetname: "t50"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(13.6, 4.96, 10.6)
        mins: Qt.vector3d(-0.8, -0.8, -0.120001)
        maxs: Qt.vector3d(0.799999, 0.8, 0.12)
    }

    Door {
        id: door_3
        wait: -1
        sounds: 1
        body: map.model_3
        owner: door_2
        enemy: door_2
        targetname: "t50"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(11.36, 4.96, 10.6)
        mins: Qt.vector3d(-0.8, -0.8, -0.120001)
        maxs: Qt.vector3d(0.799999, 0.8, 0.12)
    }

    OnceTrigger {
        body: map.model_4
        target: "t50"
        position: Qt.vector3d(14.52, 4.64, 9.3)
        mins: Qt.vector3d(-0.120001, -0.48, -0.94)
        maxs: Qt.vector3d(0.12, 0.48, 0.940001)
    }

    Door {
        id: door_5
        lip: 0.64
        wait: -1
        sounds: 1
        body: map.model_5
        owner: door_5
        enemy: door_6
        targetname: "t53"
        movedir: Qt.vector3d(0, 1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(13.4, 4.3, 6.12)
        mins: Qt.vector3d(-0.24, -1.14, -0.28)
        maxs: Qt.vector3d(0.240001, 1.14, 0.28)
    }

    Door {
        id: door_6
        lip: 0.64
        wait: -1
        sounds: 1
        body: map.model_6
        owner: door_5
        enemy: door_5
        targetname: "t53"
        movedir: Qt.vector3d(0, 1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(13.4, 4.3, 4.76)
        mins: Qt.vector3d(-0.24, -1.14, -0.28)
        maxs: Qt.vector3d(0.240001, 1.14, 0.28)
    }

    TeleportTrigger {
        target: "t54"
        targetname: "t53"
        spawnflags: 2
        body: map.model_7
        position: Qt.vector3d(18.96, 2.365, 9.4)
        mins: Qt.vector3d(-0.16, -0.675, -0.36)
        maxs: Qt.vector3d(0.160002, 0.675, 0.360001)
    }

    TeleportTrigger {
        target: "t57"
        targetname: "t53"
        spawnflags: 2
        body: map.model_8
        position: Qt.vector3d(18.96, 2.365, 8.56)
        mins: Qt.vector3d(-0.16, -0.675, -0.4)
        maxs: Qt.vector3d(0.160002, 0.675, 0.400001)
    }

    Door {
        id: door_9
        wait: -1
        sounds: 1
        body: map.model_9
        owner: door_9
        enemy: door_9
        targetname: "t61"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(10.08, 1.96, 5.12)
        mins: Qt.vector3d(-0.16, -0.52, -0.56)
        maxs: Qt.vector3d(0.16, 0.52, 0.56)
    }

    Door {
        id: door_10
        lip: 0.64
        spawnflags: 1
        wait: -1
        sounds: 3
        body: map.model_10
        owner: door_10
        enemy: door_10
        targetname: "t58"
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(8.84, 4, 5.08)
        mins: Qt.vector3d(-0.440001, -0.0799999, -1.88)
        maxs: Qt.vector3d(0.44, 0.0799999, 1.88)
    }

    Button {
        wait: -1
        sounds: 1
        body: map.model_11
        target: "t58"
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(12.48, 4.64, 12.11)
        mins: Qt.vector3d(-0.24, -0.24, -0.0900002)
        maxs: Qt.vector3d(0.240001, 0.24, 0.0899992)
    }

    OnceTrigger {
        body: map.model_12
        target: "t61"
        position: Qt.vector3d(8.8, 3.29, 4.92)
        mins: Qt.vector3d(-1.12, -0.0799999, -2.04)
        maxs: Qt.vector3d(1.12, 0.0799999, 2.04)
    }

    Door {
        id: door_13
        lip: 1.96
        wait: -1
        sounds: 1
        body: map.model_13
        owner: door_13
        enemy: door_14
        targetname: "t73"
        movedir: Qt.vector3d(0, 1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(2.56, 4.52, -3.08)
        mins: Qt.vector3d(-0.64, -1.56, -0.6)
        maxs: Qt.vector3d(0.64, 1.56, 0.6)
    }

    Door {
        id: door_14
        lip: 1.96
        wait: -1
        sounds: 1
        body: map.model_14
        owner: door_13
        enemy: door_13
        targetname: "t73"
        movedir: Qt.vector3d(0, 1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(-4.2, 4.52, -3.04)
        mins: Qt.vector3d(-0.6, -1.56, -0.64)
        maxs: Qt.vector3d(0.6, 1.56, 0.64)
    }

    Door {
        id: door_15
        lip: -0.02
        speed: 3.50
        wait: -1
        sounds: 3
        body: map.model_15
        owner: door_15
        enemy: door_19
        targetname: "t73"
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(-1.32, 3.72, -4.72)
        mins: Qt.vector3d(-0.36, -0.76, -0.0799999)
        maxs: Qt.vector3d(0.36, 0.76, 0.0800004)
    }

    Button {
        wait: -1
        sounds: 1
        body: map.model_16
        target: "t65"
        targetname: "t71"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(-0.96, 2.96, -2.88)
        mins: Qt.vector3d(-0.32, -0.04, -0.32)
        maxs: Qt.vector3d(0.32, 0.04, 0.32)
    }

    Train {
        id: train_17
        speed: 0.5
        sounds: 1
        body: map.model_17
        target: "t62"
        targetname: "t65"
        position: Qt.vector3d(0.16, 4.58, -1.94)
        mins: Qt.vector3d(-0.2, -0.22, -0.18)
        maxs: Qt.vector3d(0.2, 0.22, 0.18)
    }

    Train {
        id: train_18
        speed: 0.5
        sounds: 1
        body: map.model_18
        target: "t70"
        targetname: "t65"
        position: Qt.vector3d(-1.76, 4.58, -1.94)
        mins: Qt.vector3d(-0.2, -0.22, -0.18)
        maxs: Qt.vector3d(0.2, 0.22, 0.18)
    }

    Door {
        id: door_19
        lip: -0.02
        speed: 3.50
        wait: -1
        sounds: 0
        body: map.model_19
        owner: door_15
        enemy: door_15
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(-0.6, 3.72, -4.72)
        mins: Qt.vector3d(-0.36, -0.76, -0.0799999)
        maxs: Qt.vector3d(0.36, 0.76, 0.0800004)
    }

    OnceTrigger {
        body: map.model_20
        delay: 4.7
        target: "t73"
        targetname: "t65"
        position: Qt.vector3d(-0.96, 5.42, -4.36)
        mins: Qt.vector3d(-0.32, -0.0599999, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.0599999, 0.0799999)
    }

    TeleportTrigger {
        target: "t75"
        spawnflags: 1
        body: map.model_21
        position: Qt.vector3d(2.61, 3.56, -3.09)
        mins: Qt.vector3d(-0.17, -0.48, -0.17)
        maxs: Qt.vector3d(0.17, 0.48, 0.17)
    }

    TeleportTrigger {
        target: "t74"
        spawnflags: 1
        body: map.model_22
        position: Qt.vector3d(-4.2, 3.56, -3.04)
        mins: Qt.vector3d(-0.18, -0.48, -0.18)
        maxs: Qt.vector3d(0.18, 0.48, 0.18)
    }

    Door {
        id: door_23
        wait: -1
        sounds: 0
        body: map.model_23
        owner: door_23
        enemy: door_23
        targetname: "t73"
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(-0.96, 3.2, -0.2)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.08)
        maxs: Qt.vector3d(0.48, 0.0800002, 0.08)
    }

    Door {
        id: door_24
        wait: -1
        sounds: 0
        body: map.model_24
        owner: door_24
        enemy: door_24
        targetname: "t73"
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(-0.96, 3.2, 0.24)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.08)
        maxs: Qt.vector3d(0.48, 0.0800002, 0.08)
    }

    Door {
        id: door_25
        wait: -1
        sounds: 0
        body: map.model_25
        owner: door_25
        enemy: door_25
        targetname: "t73"
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(-0.96, 3.92, -0.2)
        mins: Qt.vector3d(-0.48, -0.0800002, -0.08)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.08)
    }

    Door {
        id: door_26
        wait: -1
        sounds: 0
        body: map.model_26
        owner: door_26
        enemy: door_26
        targetname: "t73"
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(-0.96, 3.92, 0.24)
        mins: Qt.vector3d(-0.48, -0.0800002, -0.08)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.08)
    }

    Door {
        id: door_27
        wait: -1
        sounds: 3
        body: map.model_27
        owner: door_27
        enemy: door_27
        targetname: "t73"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(-0.96, 3.56, 0)
        mins: Qt.vector3d(-0.08, -0.6, -0.08)
        maxs: Qt.vector3d(0.08, 0.6, 0.08)
    }

    OnceTrigger {
        body: map.model_28
        target: "t84"
        position: Qt.vector3d(14.8, 3.36, -3.92)
        mins: Qt.vector3d(-0.0799999, -0.48, -0.56)
        maxs: Qt.vector3d(0.0799999, 0.48, 0.56)
    }

    OnceTrigger {
        spawnflags: 256
        body: map.model_29
        target: "t89"
        position: Qt.vector3d(11.48, 2.96, 5.04)
        mins: Qt.vector3d(-0.679999, -0.0799999, -0.0799999)
        maxs: Qt.vector3d(0.68, 0.0799999, 0.0799999)
    }

    OnceTrigger {
        spawnflags: 768
        body: map.model_30
        target: "t101"
        position: Qt.vector3d(2.16, 3.24, 0.2)
        mins: Qt.vector3d(-0.88, -0.28, -0.04)
        maxs: Qt.vector3d(0.88, 0.28, 0.04)
    }

    Door {
        id: door_31
        wait: 3
        sounds: 3
        body: map.model_31
        owner: door_31
        enemy: door_32
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(7.28, 3.76, 0.96)
        mins: Qt.vector3d(-0.0799999, -0.72, -0.32)
        maxs: Qt.vector3d(0.0800004, 0.72, 0.32)
    }

    Door {
        id: door_32
        wait: 3
        sounds: 0
        body: map.model_32
        owner: door_31
        enemy: door_31
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(7.28, 3.76, 1.6)
        mins: Qt.vector3d(-0.0799999, -0.72, -0.32)
        maxs: Qt.vector3d(0.0800004, 0.72, 0.32)
    }

    DoorTrigger {
        owner: door_31
    }

    Door {
        id: door_33
        wait: -1
        body: map.model_33
        owner: door_33
        enemy: door_34
        targetname: "t110"
        eulerRotation: Qt.vector3d(0, 0, 0)
        offset: Qt.vector3d(-0.001, 0, 0)
        position: Qt.vector3d(-6.52, 5.48, 4.32)
        mins: Qt.vector3d(-0.12, -0.92, -0.56)
        maxs: Qt.vector3d(0.12 + 1, 0.92 + 1, 0.56 + 1)
    }

    Door {
        id: door_34
        wait: -1
        sounds: 3
        body: map.model_34
        owner: door_33
        enemy: door_33
        eulerRotation: Qt.vector3d(0, 180, 0)
        offset: Qt.vector3d(-0.001, 0, 0)
        position: Qt.vector3d(-6.52, 5.48, 5.52)
        mins: Qt.vector3d(-0.12, -0.92, -0.64)
        maxs: Qt.vector3d(0.12, 0.92, 0.64)
    }

    OnceTrigger {
        body: map.model_35
        target: "t110"
        position: Qt.vector3d(-6.36, 5.2, 4.8)
        mins: Qt.vector3d(-0.04, -0.56, -0.8)
        maxs: Qt.vector3d(0.04, 0.56, 0.8)
    }

    ChangeLevelTrigger {
        body: map.model_36
        position: Qt.vector3d(-6.68, 5.2, 5)
        mins: Qt.vector3d(-0.04, -0.56, -1.24)
        maxs: Qt.vector3d(0.04, 0.56, 1.24)
        map: "e1m7"
    }

    Door {
        id: door_37
        lip: 0.04
        wait: -1
        sounds: 1
        body: map.model_37
        owner: door_37
        enemy: door_37
        targetname: "t120"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(4.32, 3.44, 2.48)
        mins: Qt.vector3d(-0.4, -0.48, -0.0799999)
        maxs: Qt.vector3d(0.4, 0.48, 0.0799999)
    }

    OnceTrigger {
        body: map.model_38
        target: "t120"
        position: Qt.vector3d(4.32, 2.88, 1.56)
        mins: Qt.vector3d(-0.56, -0.48, -0.04)
        maxs: Qt.vector3d(0.56, 0.48, 0.0400001)
    }

    Door {
        id: door_39
        spawnflags: 2064
        wait: -1
        sounds: 3
        body: map.model_39
        owner: door_39
        enemy: door_40
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(2.72, 3.76, 2.4)
        mins: Qt.vector3d(-0.32, -0.72, -0.0800002)
        maxs: Qt.vector3d(0.32, 0.72, 0.0799999)
    }

    Door {
        id: door_40
        spawnflags: 2064
        wait: -1
        body: map.model_40
        owner: door_39
        enemy: door_39
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(2.08, 3.76, 2.4)
        mins: Qt.vector3d(-0.32, -0.72, -0.0800002)
        maxs: Qt.vector3d(0.32, 0.72, 0.0799999)
    }

    MultipleTrigger {
        body: map.model_41
        target: "t121"
        wait: 0.8
        position: Qt.vector3d(19.96, 3.34, 2.52)
        mins: Qt.vector3d(-1.48, -0.0800002, -2.28)
        maxs: Qt.vector3d(1.48, 0.0799999, 2.28)
    }

    Door {
        id: door_42
        lip: 0.06
        speed: 0.5
        wait: -1
        sounds: 1
        body: map.model_42
        owner: door_42
        enemy: door_42
        targetname: "t123"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(15.52, 2.04, 5.64)
        mins: Qt.vector3d(-0.160001, -0.6, -0.52)
        maxs: Qt.vector3d(0.16, 0.6, 0.52)
    }

    OnceTrigger {
        body: map.model_43
        target: "t123"
        position: Qt.vector3d(15.52, 2.04, 5.64)
        mins: Qt.vector3d(-0.160001, -0.6, -0.52)
        maxs: Qt.vector3d(0.16, 0.6, 0.52)
    }

    Plat {
        body: map.model_44
        sounds: 1
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(12.72, 1.78, -0.36)
        mins: Qt.vector3d(-0.639999, -1.1, -0.44)
        maxs: Qt.vector3d(0.64, 1.1, 0.44)
    }

    OnceTrigger {
        body: map.model_45
        target: "t129"
        position: Qt.vector3d(5.92, 4.48, 10.04)
        mins: Qt.vector3d(-0.64, -0.32, -0.04)
        maxs: Qt.vector3d(0.64, 0.32, 0.04)
    }

    SecretTrigger {
        body: map.model_46
        sounds: 1
        position: Qt.vector3d(7.32, 1.88, -8.12)
        mins: Qt.vector3d(-1.48, -0.04, -1.4)
        maxs: Qt.vector3d(1.48, 0.04, 1.4)
    }

    SecretTrigger {
        body: map.model_47
        sounds: 1
        position: Qt.vector3d(15.72, 2.08, 5.64)
        mins: Qt.vector3d(-0.04, -0.24, -0.36)
        maxs: Qt.vector3d(0.04, 0.24, 0.36)
    }

    SecretDoor {
        spawnflags: 1
        body: map.model_48
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(11.68, 0.88, -11.52)
        mins: Qt.vector3d(-0.0799999, -0.4, -0.4)
        maxs: Qt.vector3d(0.0799999, 0.4, 0.400001)
    }

    Door {
        id: door_49
        message: "This door is opened elsewhere..."
        spawnflags: 2048
        speed: 0.35
        wait: -1
        sounds: 3
        body: map.model_49
        owner: door_49
        enemy: door_50
        targetname: "t122"
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(8.44, 4.92, 10.4)
        mins: Qt.vector3d(-0.360001, -0.76, -0.0799999)
        maxs: Qt.vector3d(0.36, 0.76, 0.0799999)
    }

    Door {
        id: door_50
        spawnflags: 2048
        speed: 0.3
        wait: -1
        body: map.model_50
        owner: door_49
        enemy: door_49
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(9.16, 4.92, 10.4)
        mins: Qt.vector3d(-0.36, -0.76, -0.0799999)
        maxs: Qt.vector3d(0.360001, 0.76, 0.0799999)
    }

    Wall {
        spawnflags: 768
        body: map.model_51
        position: Qt.vector3d(20.48, 3.28, 0.32)
        mins: Qt.vector3d(-0.266666, -0.266667, -0.08)
        maxs: Qt.vector3d(0.266668, 0.266667, 0.08)
    }

    OnceTrigger {
        spawnflags: 768
        body: map.model_52
        target: "t137"
        position: Qt.vector3d(14.96, 2.7, -16.28)
        mins: Qt.vector3d(-3.2, -0.32, -0.0400009)
        maxs: Qt.vector3d(3.2, 0.32, 0.039999)
    }

    OnceTrigger {
        body: map.model_53
        target: "t138"
        position: Qt.vector3d(6.16, 2.52, -4.12)
        mins: Qt.vector3d(-0.0799999, -1.72, -1.24)
        maxs: Qt.vector3d(0.0799999, 1.72, 1.24)
    }

    TeleportTrigger {
        target: "t142"
        targetname: "t143"
        spawnflags: 2
        body: map.model_54
        position: Qt.vector3d(-1.92, 3.91, -8)
        mins: Qt.vector3d(-0.56, -0.56, -0.24)
        maxs: Qt.vector3d(0.56, 0.56, 0.24)
    }

    TeleportTrigger {
        target: "t141"
        targetname: "t143"
        spawnflags: 2
        body: map.model_55
        position: Qt.vector3d(0.32, 3.91, -8)
        mins: Qt.vector3d(-0.56, -0.56, -0.24)
        maxs: Qt.vector3d(0.56, 0.56, 0.24)
    }

    Button {
        wait: -1
        health: 1
        body: map.model_56
        target: "t53"
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(15.46, 3.28, 5.52)
        mins: Qt.vector3d(-0.0199995, -0.24, -0.24)
        maxs: Qt.vector3d(0.0200005, 0.24, 0.24)
    }

    OnceTrigger {
        body: map.model_57
        message: "Pass through the arch to exit..."
        position: Qt.vector3d(-3.96, 4.68, 5.04)
        mins: Qt.vector3d(-0.04, -0.44, -0.8)
        maxs: Qt.vector3d(0.04, 0.44, 0.8)
    }

    Button {
        speed: 0.2
        wait: -1
        sounds: 1
        body: map.model_58
        target: "t144"
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(4.83, 4.32, 9.92)
        mins: Qt.vector3d(-0.0699997, -0.16, -0.32)
        maxs: Qt.vector3d(0.0700002, 0.16, 0.32)
    }

    Door {
        id: door_59
        speed: 0.2
        wait: -1
        sounds: 1
        body: map.model_59
        owner: door_59
        enemy: door_59
        targetname: "t144"
        movedir: Qt.vector3d(0, -1, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(4, 4.6, 13)
        mins: Qt.vector3d(-0.48, -0.52, -0.12)
        maxs: Qt.vector3d(0.48, 0.52, 0.12)
    }

    SecretTrigger {
        body: map.model_60
        position: Qt.vector3d(4, 4.36, 13.24)
        mins: Qt.vector3d(-0.48, -0.28, -0.04)
        maxs: Qt.vector3d(0.48, 0.28, 0.04)
    }

    Wall {
        spawnflags: 1792
        body: map.model_61
        position: Qt.vector3d(-6.24, 4.84, 4.96)
        mins: Qt.vector3d(-0.0800004, -0.28, -0.96)
        maxs: Qt.vector3d(0.0799999, 0.28, 0.96)
    }

    TeleportDestination {
        targetname: "t43"
        position: Qt.vector3d(8.0, 3.12, -3.68)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "t54"
        position: Qt.vector3d(14.08, 4.49, 6.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t57"
        position: Qt.vector3d(14.08, 3.61, 4.0)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t74"
        position: Qt.vector3d(1.32, 4.76, 1.92)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportDestination {
        targetname: "t75"
        position: Qt.vector3d(-3.28, 4.76, 1.96)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportDestination {
        targetname: "t141"
        position: Qt.vector3d(0.8, 3.03, -2.16)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "t142"
        position: Qt.vector3d(-2.64, 3.03, -2.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    PathCorner {
        targetname: "t62"
        target: "t63"
        position: Qt.vector3d(-0.12, 2.64, -3.12)
    }

    PathCorner {
        targetname: "t63"
        target: "t64"
        position: Qt.vector3d(-0.12, 3.56, -3.12)
    }

    PathCorner {
        targetname: "t64"
        target: "t66"
        wait: -1
        position: Qt.vector3d(-0.13, 3.55, -4.4)
    }

    PathCorner {
        targetname: "t66"
        target: "t64"
        position: Qt.vector3d(-0.13, 3.55, -4.4)
    }

    PathCorner {
        targetname: "t70"
        target: "t67"
        position: Qt.vector3d(-2.2, 2.64, -3.12)
    }

    PathCorner {
        targetname: "t67"
        target: "t68"
        position: Qt.vector3d(-2.2, 3.56, -3.12)
    }

    PathCorner {
        targetname: "t68"
        target: "t69"
        wait: -1
        position: Qt.vector3d(-2.21, 3.55, -4.4)
    }

    PathCorner {
        targetname: "t69"
        target: "t68"
        position: Qt.vector3d(-2.21, 3.55, -4.4)
    }

    Ogre {
        position: Qt.vector3d(10.18, 3.20, 1.26)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
        target: "t8"
    }

    Soldier {
        position: Qt.vector3d(16.46, 3.60, 6.98)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
        targetname: "t89"
    }

    Soldier {
        position: Qt.vector3d(2.62, 3.20, 4.58)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
        target: "t96"
    }

    Knight {
        position: Qt.vector3d(-5.78, 4.80, 6.54)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
        target: "t41"
    }

    Ogre {
        position: Qt.vector3d(14.94, 2.08, -11.34)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "t22"
    }

    Wizard {
        position: Qt.vector3d(19.12, 2.17, 8.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
        targetname: "t53"
    }

    Wizard {
        position: Qt.vector3d(19.12, 2.17, 9.36)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
        targetname: "t53"
    }

    Knight {
        position: Qt.vector3d(13.20, 4.41, 11.12)
        eulerRotation: Qt.vector3d(0, 0, 0)
        targetname: "t50"
    }

    Knight {
        position: Qt.vector3d(10.56, 4.41, 11.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
        targetname: "t50"
    }

    Demon {
        position: Qt.vector3d(-0.96, 3.20, -5.52)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1024
        targetname: "t73"
    }

    Soldier {
        position: Qt.vector3d(8.06, 3.20, -2.06)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 256
        target: "t82"
    }

    Ogre {
        position: Qt.vector3d(17.90, 3.12, 1.46)
        eulerRotation: Qt.vector3d(0, 0, 0)
        targetname: "t84"
    }

    Ogre {
        position: Qt.vector3d(10.86, 3.12, 4.98)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
        target: "t88"
    }

    Soldier {
        position: Qt.vector3d(3.90, 4.32, 9.70)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "t94"
    }

    Soldier {
        position: Qt.vector3d(5.66, 4.32, 9.70)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "t92"
    }

    Ogre {
        position: Qt.vector3d(2.40, 3.20, -1.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1280
        target: "t99"
    }

    Ogre {
        position: Qt.vector3d(-3.92, 3.20, -0.80)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 768
        targetname: "t101"
    }

    Wizard {
        position: Qt.vector3d(8.80, 5.68, 4.00)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 769
    }

    Ogre {
        position: Qt.vector3d(9.54, 4.44, 7.54)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 769
    }

    Ogre {
        position: Qt.vector3d(10.70, 3.12, -6.46)
        eulerRotation: Qt.vector3d(0, 225, 0)
        spawnflags: 768
        target: "t34"
    }

    Wizard {
        position: Qt.vector3d(16.24, 3.76, -0.88)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
        targetname: "t84"
    }

    Ogre {
        position: Qt.vector3d(18.66, 3.12, 3.78)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
        targetname: "t84"
    }

    Knight {
        position: Qt.vector3d(10.88, 4.40, 10.96)
        eulerRotation: Qt.vector3d(0, -45, 0)
        targetname: "t50"
    }

    Knight {
        position: Qt.vector3d(14.00, 4.40, 11.44)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
        targetname: "t50"
    }

    Soldier {
        position: Qt.vector3d(7.58, 4.32, 12.18)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
        target: "t111"
    }

    Ogre {
        position: Qt.vector3d(-0.98, 3.20, 1.94)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 769
        target: "t113"
        targetname: "t116"
    }

    Wizard {
        position: Qt.vector3d(-5.60, 5.92, 3.12)
        eulerRotation: Qt.vector3d(0, 225, 0)
        spawnflags: 769
        target: "t117"
    }

    Soldier {
        position: Qt.vector3d(11.04, 3.16, -4.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "t127"
    }

    Soldier {
        position: Qt.vector3d(5.52, 3.20, 1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "t129"
    }

    Soldier {
        position: Qt.vector3d(15.92, 2.00, -12.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Demon {
        position: Qt.vector3d(-0.96, 3.20, -5.76)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
        target: "t143"
        targetname: "t73"
    }

    Soldier {
        position: Qt.vector3d(13.92, 3.20, -3.52)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
        target: "t130"
    }

    Soldier {
        position: Qt.vector3d(4.72, 3.20, 4.56)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
        target: "t132"
    }

    Soldier {
        position: Qt.vector3d(17.12, 3.76, 7.84)
        eulerRotation: Qt.vector3d(0, 45, 0)
        spawnflags: 1
        targetname: "t89"
    }

    Soldier {
        position: Qt.vector3d(4.08, 4.32, 12.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
        target: "t134"
    }

    Soldier {
        position: Qt.vector3d(-2.88, 4.88, 0.24)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
        targetname: "t101"
    }

    Soldier {
        position: Qt.vector3d(1.36, 4.88, 1.28)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
        targetname: "t101"
    }

    Ogre {
        position: Qt.vector3d(-3.04, 4.88, 3.04)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 769
    }

    Wizard {
        position: Qt.vector3d(6.72, 3.84, -3.28)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
        targetname: "t138"
    }

    Ogre {
        position: Qt.vector3d(-4.00, 3.20, -1.68)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 768
        target: "t139"
    }

    Demon {
        position: Qt.vector3d(0.32, 3.59, -8.40)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
        targetname: "t143"
    }

    Demon {
        position: Qt.vector3d(-1.92, 3.59, -8.40)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
        targetname: "t143"
    }

    Soldier {
        position: Qt.vector3d(14.08, 2.00, -12.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
    }

    Ogre {
        position: Qt.vector3d(2.32, 3.20, 1.76)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(-3.68, 4.80, 3.12)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 1280
    }

    PathCorner {
        position: Qt.vector3d(11.68, 2.96, -7.36)
        targetname: "t5"
        target: "t6"
    }

    PathCorner {
        position: Qt.vector3d(9.92, 2.96, -7.44)
        targetname: "t6"
        target: "t7"
    }

    PathCorner {
        position: Qt.vector3d(10.00, 2.96, -5.44)
        targetname: "t7"
        target: "t34"
    }

    PathCorner {
        position: Qt.vector3d(13.44, 3.04, 1.28)
        targetname: "t9"
        target: "t8"
    }

    PathCorner {
        position: Qt.vector3d(8.98, 3.04, 1.28)
        targetname: "t8"
        target: "t9"
    }

    PathCorner {
        position: Qt.vector3d(14.96, 1.84, -10.40)
        targetname: "t22"
        target: "t23"
    }

    PathCorner {
        position: Qt.vector3d(14.96, 2.48, -8.40)
        targetname: "t23"
        target: "t33"
    }

    PathCorner {
        position: Qt.vector3d(14.00, 2.72, -6.40)
        targetname: "t30"
        target: "t79"
    }

    PathCorner {
        position: Qt.vector3d(14.96, 2.32, -7.52)
        targetname: "t33"
        target: "t77"
    }

    PathCorner {
        position: Qt.vector3d(11.92, 2.96, -5.60)
        targetname: "t34"
        target: "t80"
    }

    PathCorner {
        position: Qt.vector3d(-5.36, 4.72, 7.04)
        targetname: "t42"
        target: "t41"
    }

    PathCorner {
        position: Qt.vector3d(-5.76, 4.72, 4.16)
        targetname: "t41"
        target: "t42"
    }

    PathCorner {
        position: Qt.vector3d(14.80, 2.64, -7.04)
        targetname: "t77"
        target: "t78"
    }

    PathCorner {
        position: Qt.vector3d(14.48, 2.64, -6.56)
        targetname: "t78"
        target: "t30"
    }

    PathCorner {
        position: Qt.vector3d(12.64, 3.04, -6.40)
        targetname: "t80"
        target: "t5"
    }

    PathCorner {
        position: Qt.vector3d(13.28, 3.04, -6.40)
        targetname: "t79"
        target: "t80"
    }

    PathCorner {
        position: Qt.vector3d(8.16, 3.04, -0.80)
        targetname: "t83"
        target: "t82"
        spawnflags: 256
    }

    PathCorner {
        position: Qt.vector3d(8.16, 3.04, -3.12)
        targetname: "t82"
        target: "t83"
        spawnflags: 256
    }

    PathCorner {
        position: Qt.vector3d(10.88, 2.96, 6.72)
        targetname: "t88"
        target: "t85"
    }

    PathCorner {
        position: Qt.vector3d(10.88, 2.96, 3.76)
        targetname: "t85"
        target: "t86"
    }

    PathCorner {
        position: Qt.vector3d(10.88, 2.96, 3.76)
        targetname: "t87"
        target: "t88"
    }

    PathCorner {
        position: Qt.vector3d(14.48, 2.96, 3.76)
        targetname: "t86"
        target: "t87"
    }

    PathCorner {
        position: Qt.vector3d(4.08, 4.16, 7.76)
        targetname: "t94"
        target: "t95"
    }

    PathCorner {
        position: Qt.vector3d(4.00, 4.16, 10.88)
        targetname: "t95"
        target: "t94"
    }

    PathCorner {
        position: Qt.vector3d(5.84, 4.16, 10.96)
        targetname: "t92"
        target: "t93"
    }

    PathCorner {
        position: Qt.vector3d(5.84, 4.16, 7.92)
        targetname: "t93"
        target: "t92"
    }

    PathCorner {
        position: Qt.vector3d(2.08, 3.04, 3.04)
        targetname: "t97"
        target: "t96"
    }

    PathCorner {
        position: Qt.vector3d(2.08, 3.04, 4.64)
        targetname: "t96"
        target: "t97"
    }

    PathCorner {
        position: Qt.vector3d(-3.44, 3.04, -1.60)
        targetname: "t100"
        target: "t99"
        spawnflags: 1280
    }

    PathCorner {
        position: Qt.vector3d(1.68, 3.04, -1.52)
        targetname: "t99"
        target: "t100"
        spawnflags: 1280
    }

    PathCorner {
        position: Qt.vector3d(8.96, 4.16, 12.16)
        targetname: "t112"
        target: "t111"
        spawnflags: 256
    }

    PathCorner {
        position: Qt.vector3d(7.04, 4.16, 12.16)
        targetname: "t111"
        target: "t112"
        spawnflags: 256
    }

    PathCorner {
        position: Qt.vector3d(-0.96, 3.68, 5.20)
        targetname: "t113"
        target: "t114"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(-0.96, 3.04, 1.52)
        targetname: "t114"
        target: "t113"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(-5.28, 5.76, 3.44)
        targetname: "t117"
        target: "t118"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(-3.52, 5.76, 6.56)
        targetname: "t118"
        target: "t117"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(11.04, 3.00, -3.36)
        targetname: "t127"
        target: "t126"
    }

    PathCorner {
        position: Qt.vector3d(11.04, 3.00, -0.24)
        targetname: "t126"
        target: "t127"
    }

    PathCorner {
        position: Qt.vector3d(13.92, 3.04, -4.16)
        targetname: "t131"
        target: "t130"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(13.92, 3.04, -2.96)
        targetname: "t130"
        target: "t131"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(2.96, 3.04, 3.28)
        targetname: "t133"
        target: "t132"
    }

    PathCorner {
        position: Qt.vector3d(4.72, 3.04, 4.16)
        targetname: "t132"
        target: "t133"
    }

    PathCorner {
        position: Qt.vector3d(4.00, 4.16, 11.28)
        targetname: "t134"
        target: "t135"
        spawnflags: 256
    }

    PathCorner {
        position: Qt.vector3d(4.00, 4.16, 12.48)
        targetname: "t135"
        target: "t134"
        spawnflags: 256
    }

    PathCorner {
        position: Qt.vector3d(-3.44, 3.04, -1.36)
        targetname: "t139"
        target: "t140"
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(1.68, 3.04, -1.28)
        targetname: "t140"
        target: "t139"
        spawnflags: 768
    }

    Health {
        position: Qt.vector3d(9.60, 2.88, -7.04)
    }

    Shells {
        position: Qt.vector3d(9.52, 2.88, -5.12)
    }

    Health {
        position: Qt.vector3d(13.44, 2.96, 2.24)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(14.00, 2.96, 2.24)
        spawnflags: 1
    }

    Shells {
        position: Qt.vector3d(15.28, 2.96, -1.92)
    }

    Shells {
        position: Qt.vector3d(10.56, 2.88, 6.48)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(11.84, 2.88, 7.36)
    }

    Shells {
        position: Qt.vector3d(16.16, 1.76, -12.80)
    }

    Health {
        position: Qt.vector3d(10.56, 4.16, 8.40)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(11.04, 4.16, 8.40)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(1.36, 2.96, 2.96)
        spawnflags: 1024
    }

    Shells {
        position: Qt.vector3d(-3.68, 4.56, 7.52)
    }

    Health {
        position: Qt.vector3d(-0.16, 3.60, 5.20)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(-0.16, 3.60, 5.76)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(7.52, 2.96, -1.68)
    }

    Health {
        position: Qt.vector3d(17.12, 2.56, 5.68)
    }

    Key1 {
        position: Qt.vector3d(8.80, 4.64, 3.00)
        spawnflags: 2048
        items: Defs.itKey1
        sounds: 1
        target: "t122"
    }

    Armor {
        position: Qt.vector3d(13.40, 3.84, 5.44)
        skin: 1
    }

    Health {
        position: Qt.vector3d(3.52, 4.08, 7.52)
        spawnflags: 1025
    }

    Health {
        position: Qt.vector3d(3.52, 4.08, 7.92)
        spawnflags: 1025
    }

    Health {
        position: Qt.vector3d(3.52, 4.08, 8.32)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(0.40, 4.64, 0.16)
    }

    Health {
        position: Qt.vector3d(0.80, 4.64, 0.48)
    }

    Shells {
        position: Qt.vector3d(5.20, 2.96, 0.72)
    }

    Shells {
        position: Qt.vector3d(-4.24, 2.96, 2.16)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(2.64, 3.00, 0.96)
    }

    Health {
        position: Qt.vector3d(2.64, 3.00, 1.40)
    }

    Health {
        position: Qt.vector3d(11.84, 2.40, -15.68)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(11.84, 2.40, -16.16)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(8.56, 1.82, -5.92)
    }

    Health {
        position: Qt.vector3d(8.24, 1.82, -5.52)
    }

    Shells {
        position: Qt.vector3d(6.80, 1.82, -8.32)
        spawnflags: 1
    }

    Shells {
        position: Qt.vector3d(5.20, 4.08, 12.80)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(-1.12, 4.64, 0.08)
        spawnflags: 1794
    }

    Spikes {
        position: Qt.vector3d(-1.12, 3.60, 5.68)
        spawnflags: 1793
    }

    Spikes {
        position: Qt.vector3d(16.16, 1.76, -14.24)
        spawnflags: 1792
    }

    Spikes {
        position: Qt.vector3d(16.56, 1.76, -14.24)
        spawnflags: 1792
    }

    Spikes {
        position: Qt.vector3d(16.96, 1.76, -14.24)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(19.36, 2.89, 0.96)
        spawnflags: 1536
    }

    Health {
        position: Qt.vector3d(10.40, 4.17, 12.00)
        spawnflags: 1025
    }

    Armor {
        position: Qt.vector3d(7.84, 3.04, -0.56)
        skin: 0
    }

    Spikes {
        position: Qt.vector3d(14.80, 0.68, -11.04)
        spawnflags: 1
    }

    Spikes {
        position: Qt.vector3d(17.60, 2.56, 5.68)
        spawnflags: 1
    }

    Spikes {
        position: Qt.vector3d(12.32, 4.16, 12.00)
    }

    Rockets {
        position: Qt.vector3d(-2.64, 4.64, 0.24)
        spawnflags: 1792
    }

    Spikes {
        position: Qt.vector3d(-2.40, 4.64, 0.08)
        spawnflags: 2048
    }

    Shells {
        position: Qt.vector3d(14.16, 3.00, -2.24)
        spawnflags: 768
    }

    Spikes {
        position: Qt.vector3d(-3.36, 4.70, 0.80)
        spawnflags: 768
    }

    Shells {
        position: Qt.vector3d(7.72, 4.20, 8.56)
        spawnflags: 768
    }

    Rockets {
        position: Qt.vector3d(8.64, 4.40, 3.12)
        spawnflags: 1793
    }

    SuperDamage {
        position: Qt.vector3d(4.00, 4.32, 13.60)
    }

    Spikes {
        position: Qt.vector3d(8.08, 1.92, 6.32)
        spawnflags: 2049
    }

    Health {
        position: Qt.vector3d(9.24, 1.92, 6.32)
        spawnflags: 2048
    }

    SuperShotgunItem {
        position: Qt.vector3d(13.92, 3.00, -2.40)
    }

    RocketLauncherItem {
        position: Qt.vector3d(6.80, 1.84, -7.28)
        spawnflags: 1792
    }

    NailgunItem {
        position: Qt.vector3d(14.96, 1.76, -12.56)
        spawnflags: 1792
    }

    SuperNailgunItem {
        position: Qt.vector3d(-0.96, 3.60, 4.96)
        spawnflags: 1792
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(12.48, 4.20, 11.28)
        spawnflags: 1792
    }

    SuperNailgunItem {
        position: Qt.vector3d(8.80, 1.92, 6.16)
        spawnflags: 1792
    }

    TrapSpikeShooter {
        position: Qt.vector3d(21.20, 3.32, 2.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1024
        targetname: "t121"
    }

    TrapSpikeShooter {
        position: Qt.vector3d(19.44, 3.32, 4.56)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1024
        targetname: "t121"
    }

    TrapSpikeShooter {
        position: Qt.vector3d(20.48, 3.32, 0.48)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 769
        targetname: "t121"
    }
    TrapSpikeShooter {
        position: Qt.vector3d(21.20, 3.32, 2.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 769
        targetname: "t121"
    }

    TrapSpikeShooter {
        position: Qt.vector3d(19.44, 3.32, 4.56)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 769
        targetname: "t121"
    }

    Light {
        position: Qt.vector3d(20.48, 3.36, 4.56)
        targetname: "t137"
        target: "t136"
        style: 32
        spawnflags: 1
    }

    Light {
        position: Qt.vector3d(20.04, 3.32, 0.52)
        targetname: "t137"
        style: 32
        spawnflags: 1
    }

    InfoIntermission {
        position: Qt.vector3d(-2.24, 5.12, -4.24)
        eulerRotation: Qt.vector3d(-20, 210, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(10.48, 4.88, 7.44)
        eulerRotation: Qt.vector3d(-20, -45, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(11.04, 5.28, -4.24)
        eulerRotation: Qt.vector3d(-20, 180, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(12.40, 4.16, -9.84)
        eulerRotation: Qt.vector3d(-20, -45, 0)
    }

    Flame {
        position: Qt.vector3d(6.48, 4.30, 3.84)
    }

    Flame {
        position: Qt.vector3d(11.04, 4.06, 2.24)
    }

    Flame {
        position: Qt.vector3d(14.56, 4.06, 1.28)
    }

    Flame {
        position: Qt.vector3d(16.16, 3.10, -9.36)
    }

    Flame {
        position: Qt.vector3d(13.60, 3.10, -9.36)
    }

    Flame {
        position: Qt.vector3d(17.92, 3.90, -5.04)
    }

    Flame {
        position: Qt.vector3d(8.80, 5.62, 3.28)
    }

    Flame {
        position: Qt.vector3d(11.52, 4.22, 2.96)
    }

    Flame {
        position: Qt.vector3d(11.52, 4.22, 7.60)
    }

    Flame {
        position: Qt.vector3d(15.28, 4.78, 5.56)
    }

    Flame {
        position: Qt.vector3d(-0.24, 4.14, 2.32)
    }

    Flame {
        position: Qt.vector3d(-0.96, 4.06, -6.32)
    }

    Flame {
        position: Qt.vector3d(8.32, 2.94, -11.84)
    }

    Flame {
        position: Qt.vector3d(4.64, 3.58, -5.36)
    }

    Flame {
        position: Qt.vector3d(6.00, 3.34, -7.04)
    }

    Flame {
        position: Qt.vector3d(5.20, 4.06, 1.28)
    }

    AmbientDrip {
        position: Qt.vector3d(8.42, 3.44, -9.78)
    }

    AmbientDrip {
        position: Qt.vector3d(5.46, 4.00, -3.30)
    }

    AmbientDrip {
        position: Qt.vector3d(18.10, 2.00, -2.74)
    }

    AmbientDrip {
        position: Qt.vector3d(18.02, 2.00, 1.02)
    }

    AmbientDrip {
        position: Qt.vector3d(20.50, 2.00, 2.14)
    }

    AmbientDrip {
        position: Qt.vector3d(20.02, 2.00, 3.90)
    }

    AmbientDrip {
        position: Qt.vector3d(17.38, 2.00, 3.98)
    }

    AmbientDrip {
        position: Qt.vector3d(13.46, 2.00, 3.98)
    }

    AmbientDrip {
        position: Qt.vector3d(11.38, 2.00, 5.42)
    }

    AmbientDrip {
        position: Qt.vector3d(8.82, 2.00, 4.94)
    }

    AmbientSwamp1 {
        position: Qt.vector3d(17.22, 1.76, -10.90)
    }

    AmbientSwamp1 {
        position: Qt.vector3d(12.42, 1.76, -10.90)
    }

    AmbientSwamp2 {
        position: Qt.vector3d(11.06, 1.92, -6.42)
    }

    AmbientSwamp2 {
        position: Qt.vector3d(13.46, 1.92, -2.42)
    }

    AmbientSwamp1 {
        position: Qt.vector3d(8.66, 1.92, -2.10)
    }

    AmbientSwamp1 {
        position: Qt.vector3d(18.02, 1.92, -0.90)
    }

    AmbientSwamp1 {
        position: Qt.vector3d(15.46, 1.92, 3.98)
    }

    AmbientSwamp2 {
        position: Qt.vector3d(20.42, 1.92, 3.10)
    }

    AmbientSwamp2 {
        position: Qt.vector3d(11.78, 1.92, 3.98)
    }

    AmbientSwamp2 {
        position: Qt.vector3d(12.02, 1.92, 6.78)
    }
}
