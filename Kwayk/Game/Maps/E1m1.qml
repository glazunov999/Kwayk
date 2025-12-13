import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Game
import Assets.maps.e1m1

World {
    id: root

    displayName: "the Slipgate Complex"
    worldtype: 0

    readonly property alias player: player

    E1m1_map {
        id: map
    }

    E1m1_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(4.8, 0.88, 3.52)
    }

    Door {
        id: door_1
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(2.32, 0.64, -5.64)
        mins: Qt.vector3d(-0.24, -0.64, -0.52)
        maxs: Qt.vector3d(0.24,  0.64,  0.52)
        speed: 4
        sounds: 2
        body: map.model_1
        owner: door_1
        enemy: door_2
    }

    Door {
        id: door_2
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(2.32, 0.64, -5.89)
        mins: Qt.vector3d(-0.24, -0.64, -0.51)
        maxs: Qt.vector3d(0.24,  0.64,  0.51)
        speed: 4
        body: map.model_2
        owner: door_1
        enemy: door_1
    }

    DoorTrigger {
        owner: door_1
    }

    Door {
        id: door_3
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(0, -1.2, -5.76)
        mins: Qt.vector3d(-0.64, -1.2, -0.64)
        maxs: Qt.vector3d(0.64, 1.2, 0.64)
        wait: 5
        sounds: 2
        body: map.model_3
        owner: door_3
        enemy: door_3
        targetname: "t1"
    }

    Button {
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(-0.64, 0.48, -5.76)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.04, 0.16, 0.16)
        body: map.model_4
        target: "t1"
    }

    Door {
        id: door_5
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(1.16, -1.44, -18)
        mins: Qt.vector3d(-0.52, -0.64, -0.24)
        maxs: Qt.vector3d(0.52, 0.64, 0.24)
        speed: 4
        sounds: 2
        body: map.model_5
        owner: door_5
        enemy: door_6
    }

    Door {
        id: door_6
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(1.41, -1.44, -18)
        mins: Qt.vector3d(-0.51, -0.64, -0.24)
        maxs: Qt.vector3d(0.51, 0.64, 0.24)
        speed: 4
        body: map.model_6
        owner: door_5
        enemy: door_5
    }

    DoorTrigger {
        owner: door_5
    }

    Plat {
        position: Qt.vector3d(-5.44, -0.48, -26.56)
        mins: Qt.vector3d(-0.48, -0.8, -0.32)
        maxs: Qt.vector3d(0.48, 0.8, 0.32)
        body: map.model_7
        sounds: 1
    }

    Door {
        id: door_8
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(1.6, -0.88, -27.56)
        mins: Qt.vector3d(-1.6, -0.08, -1.24)
        maxs: Qt.vector3d(1.6, 0.08, 1.24)
        speed: 6
        wait: -1
        spawnflags: 1
        sounds: 3
        body: map.model_8
        owner: door_8
        enemy: door_8
        targetname: "t2"
    }

    Button {
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(-0.48, -0.32, -26.6)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        speed: 0.5
        wait: -1
        body: map.model_9
        target: "t2"
    }

    SecretDoor {
        targetname: "t3"
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(2, 0.8, -23.68)
        mins: Qt.vector3d(-0.08, -0.64, -0.64)
        maxs: Qt.vector3d(0.08, 0.64, 0.64)
        spawnflags: 3
        body: map.model_10
    }

    OnceTrigger {
        position: Qt.vector3d(1.12, 0.56, -23.52)
        mins: Qt.vector3d(-0.32, -0.08, -0.32)
        maxs: Qt.vector3d(0.32, 0.08, 0.32)
        body: map.model_11
        target: "t3"
    }

    OnceTrigger {
        position: Qt.vector3d(2.48, 0.56, -23.68)
        mins: Qt.vector3d(-0.08, -0.08, -0.64)
        maxs: Qt.vector3d(0.08, 0.08, 0.64)
        body: map.model_12
        target: "t3"
    }

    SecretDoor {
        position: Qt.vector3d(7.6, -0.56, -24.8)
        mins: Qt.vector3d(-0.08, -0.56, -0.48)
        maxs: Qt.vector3d(0.08, 0.56, 0.48)
        spawnflags: 2
        sounds: 3
        body: map.model_13
    }

    SecretDoor {
        id: door_14
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(5.44, -0.96, -22.48)
        mins: Qt.vector3d(-0.32, -0.48, -0.08)
        maxs: Qt.vector3d(0.32, 0.48, 0.08)
        sounds: 3
        body: map.model_14
    }

    Door {
        id: door_15
        eulerRotation: Qt.vector3d(0, -90, 0)
        movedir: Qt.vector3d(0, -1, 0)
        offset: Qt.vector3d(0, -0.001, 0)
        position: Qt.vector3d(5.44, -1.63, -20.48)
        mins: Qt.vector3d(-0.32, -0.37, -1.28)
        maxs: Qt.vector3d(0.32, 0.37, 1.28)
        spawnflags: 1
        owner: door_15
        enemy: door_15
        body: map.model_15
        sounds: 2
        targetname: "t4"
    }

    MultipleTrigger {
        position: Qt.vector3d(4.52, -0.88, -20.16)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.04, 0.16, 0.16)
        health: 1
        body: map.model_16
        target: "t4"
    }

    Door {
        id: door_17
        spawnflags: 2048
        position: Qt.vector3d(5.84, -0.64, -24.88)
        mins: Qt.vector3d(-0.08, -0.64, -0.56)
        maxs: Qt.vector3d(0.08, 0.64, 0.56)
        wait: -1
        owner: door_17
        enemy: door_17
        sounds: 2
        targetname: "t5"
        body: map.model_17
    }

    OnceTrigger {
        spawnflags: 2048
        position: Qt.vector3d(8.32, -0.32, -26.08)
        mins: Qt.vector3d(-0.64, -0.48, -0.08)
        maxs: Qt.vector3d(0.64, 0.48, 0.08)
        target: "t5"
        body: map.model_18
    }

    Button {
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(0.96, -1.76, -7.08)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        body: map.model_19
        target: "t1"
    }

    TeleportTrigger {
        position: Qt.vector3d(13.12, -3.68, -10.88)
        mins: Qt.vector3d(-0.4, -0.4, -0.08)
        maxs: Qt.vector3d(0.4, 0.4, 0.08)
        target: "t6"
        body: map.model_20
    }

    SecretDoor {
        spawnflags: 2
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(11.12, -2.16, -10.24)
        mins: Qt.vector3d(-0.08, -0.56, -0.32)
        maxs: Qt.vector3d(0.08, 0.56, 0.32)
        body: map.model_21
    }

    TeleportDestination {
        targetname: "t6"
        position: Qt.vector3d(-0.32, -0.56, -18)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Plat {
        position: Qt.vector3d(7.92, 0.72, -5.12)
        mins: Qt.vector3d(-0.4, -0.08, -0.32)
        maxs: Qt.vector3d(0.4, 0.08, 0.32)
        height: 4
        spawnflags: 1
        body: map.model_22
        sounds: 1
    }

    SecretDoor {
        id: t8
        targetname: "t8"
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(7.44, 1.36, -5.12)
        mins: Qt.vector3d(-0.08, -0.56, -0.32)
        maxs: Qt.vector3d(0.08, 0.56, 0.32)
        spawnflags: 2
        body: map.model_23
    }

    MultipleTrigger {
        position: Qt.vector3d(7.92, 0.08, -5.12)
        mins: Qt.vector3d(-0.4, -0.08, -0.32)
        maxs: Qt.vector3d(0.4, 0.08, 0.32)
        body: map.model_24
        target: "t8"
    }

    Button {
        spawnflags: 2048
        wait: -1
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(12.92, -1.92, -20.48)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.04, 0.16, 0.16)
        body: map.model_25
        target: "t9"
    }

    Button {
        spawnflags: 2048
        wait: -1
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(12.32, -2.56, -25.08)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        body: map.model_26
        target: "t9"
    }

    Button {
        spawnflags: 2048
        wait: -1
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(8, -1.28, -19.88)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        body: map.model_27
        target: "t9"
    }

    CounterTrigger {
        position: Qt.vector3d(8, -1.28, -19.44)
        mins: Qt.vector3d(-0.08, -0.16, -0.08)
        maxs: Qt.vector3d(0.08, 0.16, 0.08)
        count: 3
        targetname: "t9"
        target: "t10"
        body: map.model_28
    }

    Door {
        id: door_29
        spawnflags: 2048
        wait: -1
        eulerRotation: Qt.vector3d(0, 90, 0)
        position: Qt.vector3d(8.24, -3.76, -18.8)
        mins: Qt.vector3d(-0.72, -0.56, -0.08)
        maxs: Qt.vector3d(0.72, 0.56, 0.08)
        body: map.model_29
        owner: door_29
        enemy: door_29
        sounds: 2
        targetname: "t10"
    }

    OnceTrigger {
        position: Qt.vector3d(8.4, -0.64, -23.76)
        mins: Qt.vector3d(-0.56, -0.4, -0.08)
        maxs: Qt.vector3d(0.56, 0.4, 0.08)
        body: map.model_30
        target: "t11"
        sounds: 3
    }

    OnceTrigger {
        position: Qt.vector3d(9.04, -1.28, -20.48)
        mins: Qt.vector3d(-0.08, -0.4, -0.64)
        maxs: Qt.vector3d(0.08, 0.4, 0.64)
        body: map.model_31
        target: "t12"
        sounds: 3
    }

    OnceTrigger {
        position: Qt.vector3d(12.32, -1.92, -21.2)
        mins: Qt.vector3d(-0.64, -0.4, -0.08)
        maxs: Qt.vector3d(0.64, 0.4, 0.08)
        body: map.model_32
        target: "t13"
        sounds: 3
    }

    OnceTrigger {
        position: Qt.vector3d(11.6, -2.56, -24.48)
        mins: Qt.vector3d(-0.08, -0.4, -0.64)
        maxs: Qt.vector3d(0.08, 0.4, 0.64)
        body: map.model_33
        target: "t14"
        sounds: 3
    }

    Door {
        id: door_34
        wait: -1
        spawnflags: 1
        eulerRotation: Qt.vector3d(0, -90, 0)
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(7.48, -1.24, -19.96)
        mins: Qt.vector3d(-0.07, -0.12, -0.07)
        maxs: Qt.vector3d(0.07, 0.12, 0.07)
        body: map.model_34
        owner: door_34
        enemy: door_34
        sounds: 1
        targetname: "t11"
    }

    Door {
        id: door_35
        wait: -1
        spawnflags: 1
        eulerRotation: Qt.vector3d(0, -90, 0)
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(12.84, -1.88, -19.96)
        mins: Qt.vector3d(-0.07, -0.12, -0.07)
        maxs: Qt.vector3d(0.07, 0.12, 0.07)
        body: map.model_35
        owner: door_35
        enemy: door_35
        sounds: 1
        targetname: "t12"
    }

    Door {
        id: door_36
        wait: -1
        spawnflags: 1
        eulerRotation: Qt.vector3d(0, -90, 0)
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(12.84, -2.52, -25)
        mins: Qt.vector3d(-0.07, -0.12, -0.07)
        maxs: Qt.vector3d(0.07, 0.12, 0.07)
        body: map.model_36
        owner: door_36
        enemy: door_36
        sounds: 1
        targetname: "t13"
    }

    Door {
        id: door_37
        wait: -1
        spawnflags: 1
        eulerRotation: Qt.vector3d(0, -90, 0)
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(7.8, -3.16, -25)
        mins: Qt.vector3d(-0.07, -0.12, -0.07)
        maxs: Qt.vector3d(0.07, 0.12, 0.07)
        body: map.model_37
        owner: door_37
        enemy: door_37
        sounds: 1
        targetname: "t14"
    }

    Door {
        id: door_38
        spawnflags: 2048
        message: "This door opens elsewhere..."
        wait: -1
        speed: 3
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(10.96, -2.16, -10.24)
        mins: Qt.vector3d(-0.08, -0.56, -0.64)
        maxs: Qt.vector3d(0.08, 0.56, 0.64)
        owner: door_38
        enemy: door_38
        body: map.model_38
        targetname: "t15"
    }

    OnceTrigger {
        spawnflags: 2048
        position: Qt.vector3d(13.16, -2.08, -11.28)
        mins: Qt.vector3d(-0.68, -0.56, -0.08)
        maxs: Qt.vector3d(0.68, 0.56, 0.08)
        target: "t15"
        body: map.model_39
    }

    MultipleTrigger {
        health: 1
        body: map.model_40
        target: "t18"
        position: Qt.vector3d(1.6, 0, -30.6)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
    }

    SecretDoor {
        targetname: "t18"
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(-3.12, -0.4, -29.12)
        mins: Qt.vector3d(-0.08, -0.4, -0.32)
        maxs: Qt.vector3d(0.08, 0.4, 0.32)
        spawnflags: 2
        body: map.model_41
    }

    MultipleTrigger {
        position: Qt.vector3d(-3.6, -0.4, -29.12)
        mins: Qt.vector3d(-0.24, -0.08, -0.32)
        maxs: Qt.vector3d(0.24, 0.08, 0.32)
        body: map.model_42
        target: "t18"
    }

    SecretDoor {
        spawnflags: 1
        eulerRotation: Qt.vector3d(0, -90, 0)
        position: Qt.vector3d(6.88, 0.8, -0.56)
        mins: Qt.vector3d(-0.32, -0.32, -0.08)
        maxs: Qt.vector3d(0.32, 0.32, 0.08)
        body: map.model_43
        message: "Shoot this secret door..."
    }

    SecretTrigger {
        position: Qt.vector3d(6.88, 0.8, -0.4)
        mins: Qt.vector3d(-0.32, -0.32, -0.08)
        maxs: Qt.vector3d(0.32, 0.32, 0.08)
        body: map.model_44
    }

    SecretTrigger {
        position: Qt.vector3d(9.16, -2.92, -9.32)
        mins: Qt.vector3d(-1.64, -0.52, -1.56)
        maxs: Qt.vector3d(1.64, 0.52, 1.56)
        body: map.model_45
    }

    SecretTrigger {
        position: Qt.vector3d(13.12, -3.92, -9.04)
        mins: Qt.vector3d(-0.56, -0.08, -0.56)
        maxs: Qt.vector3d(0.56, 0.08, 0.56)
        body: map.model_46
    }

    SecretTrigger {
        position: Qt.vector3d(9.84, -0.88, -24.32)
        mins: Qt.vector3d(-0.08, -0.4, -0.4)
        maxs: Qt.vector3d(0.08, 0.4, 0.4)
        body: map.model_47
    }

    SecretTrigger {
        position: Qt.vector3d(5.76, -0.72, -24.48)
        mins: Qt.vector3d(-0.64, -0.08, -0.8)
        maxs: Qt.vector3d(0.64, 0.08, 0.8)
        body: map.model_48
    }

    SecretTrigger {
        position: Qt.vector3d(-3.28, -0.4, -29.12)
        mins: Qt.vector3d(-0.08, -0.08, -0.32)
        maxs: Qt.vector3d(0.08, 0.08, 0.32)
        body: map.model_49
    }

    MultipleTrigger {
        spawnflags: 3072
        message: "You can jump across..."
        wait: 5
        sounds: 2
        targetname: "t32"
        position: Qt.vector3d(3.48, 0.64, -4.8)
        mins: Qt.vector3d(-0.28, -0.32, -0.16)
        maxs: Qt.vector3d(0.28, 0.32, 0.16)
        body: map.model_50
    }

    MultipleTrigger {
        spawnflags: 3072
        message: "You can jump up here..."
        wait: 5
        sounds: 2
        targetname: "t31"
        position: Qt.vector3d(6.16, 0.4, -1.92)
        mins: Qt.vector3d(-0.24, -0.24, -1.28)
        maxs: Qt.vector3d(0.24, 0.24, 1.28)
        body: map.model_51
    }

    ChangeLevelTrigger {
        map: "e1m2"
        position: Qt.vector3d(13.12, -2.04, -5.44)
        mins: Qt.vector3d(-0.24, -0.76, -0.24)
        maxs: Qt.vector3d(0.24, 0.76, 0.24)
        body: map.model_52
    }

    MultipleTrigger {
        wait: 5
        message: "Walk into the slipgate to exit."
        sounds: 2
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(13.12, -2.04, -7.04)
        mins: Qt.vector3d(-0.96, -0.76, -0.64)
        maxs: Qt.vector3d(0.96, 0.76, 0.64)
        body: map.model_53
    }

    OnceTrigger {
        spawnflags: 3072
        target: "t31"
        killtarget: "t31"
        position: Qt.vector3d(6.88, 0.8, -1.92)
        mins: Qt.vector3d(-0.16, -0.24, -1.28)
        maxs: Qt.vector3d(0.16, 0.24, 1.28)
        body: map.model_54
    }

    OnceTrigger {
        spawnflags: 3072
        target: "t32"
        killtarget: "t32"
        position: Qt.vector3d(3.48, 0.8, -6.72)
        mins: Qt.vector3d(-0.28, -0.32, -0.16)
        maxs: Qt.vector3d(0.28, 0.32, 0.16)
        body: map.model_55
    }

    Wall {
        spawnflags: 1792
        body: map.model_56
    }

    Wall {
        spawnflags: 1792
        body: map.model_57
    }

    Light {
        style: 32
        targetname: "t3"
    }

    Light {
        style: 33
        spawnflags: 1
        targetname: "t11"
    }

    Light {
        style: 34
        spawnflags: 1
        targetname: "t12"
    }

    Light {
        style: 35
        spawnflags: 1
        targetname: "t13"
    }

    Light {
        style: 36
        spawnflags: 1
        targetname: "t14"
    }

    InfoIntermission {
        position: Qt.vector3d(-1.12, 0.56, -7.04)
        eulerRotation: Qt.vector3d(-20, -45, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(-2.08, 1.92, -27.36)
        eulerRotation: Qt.vector3d(-20, 135, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(2.4, 1.04, -26.64)
        eulerRotation: Qt.vector3d(-20, 30, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(13.76, 0.64, -19.36)
        eulerRotation: Qt.vector3d(-20, 45, 0)
    }

    AmbientCompHum {
        position: Qt.vector3d(2.50, 0.72, -1.94)
    }

    AmbientCompHum {
        position: Qt.vector3d(7.14, 0.72, -1.94)
    }

    AmbientCompHum {
        position: Qt.vector3d(6.26, -1.04, -20.58)
    }

    AmbientCompHum {
        position: Qt.vector3d(4.66, -1.04, -22.26)
    }

    AmbientDrone {
        position: Qt.vector3d(13.14, -2.00, -4.50)
    }

    Soldier {
        position: Qt.vector3d(6.16, 0.40, -0.72)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(2.48, 0.40, -23.92)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Soldier {
        position: Qt.vector3d(0.00, 0.24, -5.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(0.08, -2.00, -15.20)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Dog {
        position: Qt.vector3d(0.88, -2.00, -15.20)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Soldier {
        position: Qt.vector3d(2.24, -2.00, -15.52)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(-0.08, -2.00, -9.36)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(6.48, 1.04, -7.36)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(13.12, -2.48, -9.36)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Dog {
        position: Qt.vector3d(13.36, -4.08, -17.84)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Soldier {
        position: Qt.vector3d(13.92, -2.48, -9.28)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

    Soldier {
        position: Qt.vector3d(13.84, -2.48, -10.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(12.40, -2.48, -10.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(12.56, -4.08, -17.60)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Soldier {
        position: Qt.vector3d(8.24, -4.08, -17.84)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

    Dog {
        position: Qt.vector3d(11.28, -4.08, -17.60)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 769
    }

    Soldier {
        position: Qt.vector3d(12.32, -2.16, -20.88)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "t16"
    }

    Soldier {
        position: Qt.vector3d(12.32, -2.80, -24.48)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(8.32, -3.44, -24.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(8.32, -4.08, -20.72)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Dog {
        position: Qt.vector3d(8.40, -4.08, -19.60)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(4.16, -1.68, -19.12)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
    }

    Dog {
        position: Qt.vector3d(4.32, -1.68, -21.20)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(0.80, -1.84, -20.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "t20"
    }

    Soldier {
        position: Qt.vector3d(-0.16, -1.84, -18.88)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
        target: "t22"
    }

    Dog {
        position: Qt.vector3d(-2.48, -1.36, -21.44)
        eulerRotation: Qt.vector3d(0, 225, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(-4.32, 0.56, -23.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 768
        target: "t23"
    }

    Dog {
        position: Qt.vector3d(-5.44, 0.56, -25.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(-3.44, -1.04, -26.56)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Dog {
        position: Qt.vector3d(-0.72, -0.56, -28.96)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(4.32, -0.56, -29.20)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "t25"
    }

    Soldier {
        position: Qt.vector3d(4.24, -0.56, -28.32)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 256
    }

    Soldier {
        position: Qt.vector3d(4.24, -0.56, -26.72)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "t27"
    }

    Soldier {
        position: Qt.vector3d(4.24, -0.56, -28.80)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(4.24, -0.56, -27.60)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(8.48, -0.72, -25.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 257
        target: "t29"
    }

    Soldier {
        position: Qt.vector3d(8.24, -1.52, -20.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(2.48, 0.40, -23.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(-0.72, 0.40, -24.64)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(9.04, -2.48, -10.24)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(2.88, -2.00, -15.36)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 768
    }

    Soldier {
        position: Qt.vector3d(9.68, -1.12, -24.32)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 768
    }

    PathCorner {
        position: Qt.vector3d(8.80, -1.68, -20.48)
        targetname: "t17"
        target: "t16"
    }

    PathCorner {
        position: Qt.vector3d(12.32, -2.32, -20.48)
        targetname: "t16"
        target: "t17"
    }

    PathCorner {
        position: Qt.vector3d(2.48, -2.00, -19.92)
        targetname: "t19"
        target: "t20"
    }

    PathCorner {
        position: Qt.vector3d(-2.00, -2.00, -19.92)
        targetname: "t20"
        target: "t21"
    }

    PathCorner {
        position: Qt.vector3d(-1.36, -2.00, -19.12)
        targetname: "t21"
        target: "t22"
    }

    PathCorner {
        position: Qt.vector3d(2.48, -2.00, -19.12)
        targetname: "t22"
        target: "t19"
    }

    PathCorner {
        position: Qt.vector3d(-5.60, 0.40, -23.52)
        targetname: "t23"
        target: "t24"
    }

    PathCorner {
        position: Qt.vector3d(-1.04, 0.40, -23.52)
        targetname: "t24"
        target: "t23"
    }

    PathCorner {
        position: Qt.vector3d(3.68, -0.72, -29.36)
        targetname: "t25"
        target: "t26"
    }

    PathCorner {
        position: Qt.vector3d(3.68, -0.72, -26.96)
        targetname: "t26"
        target: "t27"
    }

    PathCorner {
        position: Qt.vector3d(4.80, -0.72, -26.96)
        targetname: "t27"
        target: "t28"
    }

    PathCorner {
        position: Qt.vector3d(4.80, -0.72, -29.36)
        targetname: "t28"
        target: "t25"
    }

    PathCorner {
        position: Qt.vector3d(8.32, -0.88, -27.12)
        targetname: "t29"
        target: "t30"
    }

    PathCorner {
        position: Qt.vector3d(8.32, -1.04, -24.16)
        targetname: "t30"
        target: "t29"
    }

    Armor {
        position: Qt.vector3d(6.88, 0.80, -4.80)
        skin: 0
    }

    Spikes {
        position: Qt.vector3d(2.72, 0.64, -23.52)
    }

    SuperDamage {
        position: Qt.vector3d(5.44, -0.88, -24.80)
    }

    Health {
        position: Qt.vector3d(9.44, -2.72, -10.08)
        spawnflags: 2
    }

    Rockets {
        position: Qt.vector3d(13.92, -4.32, -10.24)
        spawnflags: 1793
    }

    Shells {
        position: Qt.vector3d(2.96, -1.92, -21.36)
    }

    Health {
        position: Qt.vector3d(14.24, -4.32, -9.04)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(13.76, -4.32, -8.08)
    }

    Health {
        position: Qt.vector3d(11.76, -4.32, -9.36)
    }

    Spikes {
        position: Qt.vector3d(13.76, -2.72, -10.24)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(11.84, -2.72, -9.92)
    }

    Health {
        position: Qt.vector3d(13.76, -2.72, -8.56)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(12.56, -4.32, -17.04)
        spawnflags: 1
    }

    Spikes {
        position: Qt.vector3d(4.64, 0.64, -7.28)
        spawnflags: 1793
    }

    Health {
        position: Qt.vector3d(3.28, -2.24, -8.48)
    }

    Health {
        position: Qt.vector3d(3.44, -2.24, -9.20)
    }

    Health {
        position: Qt.vector3d(-0.16, -2.08, -20.64)
        spawnflags: 1
    }

    Rockets {
        position: Qt.vector3d(-4.80, -1.60, -22.40)
        spawnflags: 1792
    }

    Shells {
        position: Qt.vector3d(-0.96, 0.16, -24.56)
        spawnflags: 1793
    }

    Rockets {
        position: Qt.vector3d(-1.04, 0.16, -22.16)
        spawnflags: 1793
    }

    Invulnerability {
        position: Qt.vector3d(2.56, -0.40, -18.08)
        spawnflags: 1792
    }

    Envirosuit {
        position: Qt.vector3d(7.12, -4.08, -20.40)
    }

    Rockets {
        position: Qt.vector3d(13.28, -5.28, -25.36)
        spawnflags: 1793
    }

    Health {
        position: Qt.vector3d(9.16, -1.36, -24.16)
        spawnflags: 2
    }

    Shells {
        position: Qt.vector3d(5.28, 0.80, -7.20)
    }

    Health {
        position: Qt.vector3d(-3.76, -2.24, -17.04)
        spawnflags: 1
    }

    Shells {
        position: Qt.vector3d(6.72, 0.48, 0.40)
    }

    Health {
        position: Qt.vector3d(6.00, -1.28, -22.00)
        spawnflags: 1
    }

    Health {
        position: Qt.vector3d(12.24, -3.04, -24.64)
        spawnflags: 1
    }

    Armor {
        position: Qt.vector3d(13.12, -4.32, -10.48)
        skin: 1
    }

    NailgunItem {
        position: Qt.vector3d(1.12, 0.16, -23.52)
        spawnflags: 2048
    }

    RocketLauncherItem {
        position: Qt.vector3d(1.44, 0.16, -23.52)
        spawnflags: 1792
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(12.16, -4.32, -10.40)
        spawnflags: 1792
    }

    SuperNailgunItem {
        position: Qt.vector3d(8.32, -3.68, -24.48)
        spawnflags: 1792
    }

    SuperShotgunItem {
        position: Qt.vector3d(1.28, -2.08, -12.16)
        spawnflags: 1792
    }

    NailgunItem {
        position: Qt.vector3d(4.80, 0.00, -5.76)
        spawnflags: 1792
    }

    SuperShotgunItem {
        position: Qt.vector3d(-3.60, -0.80, -29.12)
    }

    Explobox {
        position: Qt.vector3d(0.72, -2.08, -20.56)
    }
}
