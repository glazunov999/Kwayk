import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Backend
import Kwayk.Game
import Assets.maps.e1m7

World {
    id: root

    displayName: "The House of Chthon"
    worldtype: 1

    readonly property alias player: player

    E1m7_map {
        id: map
    }

    E1m7_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(-4.48, 0.56, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Plat {
        body: map.model_1
        sounds: 1
        height: 1.76
        position: Qt.vector3d(12.16, 1.2, -0.64)
        mins: Qt.vector3d(-0.64, -0.24, -0.72)
        maxs: Qt.vector3d(0.64, 0.24, 0.72)
    }

    Wall {
        spawnflags: 1792
        body: map.model_2
        position: Qt.vector3d(7.04, 2.48, 3.52)
        mins: Qt.vector3d(-0.64, -0.08, -0.32)
        maxs: Qt.vector3d(0.64, 0.08, 0.32)
    }

    Wall {
        spawnflags: 1792
        body: map.model_3
        position: Qt.vector3d(1.28, 2.48, 3.52)
        mins: Qt.vector3d(-0.64, -0.08, -0.32)
        maxs: Qt.vector3d(0.64, 0.08, 0.32)
    }

    Wall {
        spawnflags: 1792
        body: map.model_4
        position: Qt.vector3d(1.28, 2.48, -4.8)
        mins: Qt.vector3d(-0.64, -0.08, -0.32)
        maxs: Qt.vector3d(0.64, 0.08, 0.32)
    }

    Wall {
        spawnflags: 1792
        body: map.model_5
        position: Qt.vector3d(7.04, 2.48, -4.8)
        mins: Qt.vector3d(-0.64, -0.08, -0.32)
        maxs: Qt.vector3d(0.64, 0.08, 0.32)
    }

    Wall {
        spawnflags: 1792
        body: map.model_6
        position: Qt.vector3d(-2.56, 2.1, -0.64)
        mins: Qt.vector3d(-0.32, -0.02, -0.32)
        maxs: Qt.vector3d(0.32, 0.02, 0.32)
    }

    Wall {
        spawnflags: 1792
        body: map.model_7
        position: Qt.vector3d(10.24, 1.46, -0.64)
        mins: Qt.vector3d(-0.32, -0.02, -0.32)
        maxs: Qt.vector3d(0.32, 0.02, 0.32)
    }

    Door {
        id: door_8
        wait: -1
        spawnflags: 1
        sounds: 0
        body: map.model_8
        owner: door_8
        enemy: door_9
        targetname: "t9"
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(7.04, -0.28, 0.64)
        mins: Qt.vector3d(-0.64, -0.44, -1.28)
        maxs: Qt.vector3d(0.64, 0.44, 1.28)
    }

    Door {
        id: door_9
        wait: -1
        spawnflags: 1
        sounds: 0
        body: map.model_9
        owner: door_8
        enemy: door_8
        targetname: "t9"
        eulerRotation: Qt.vector3d(0, 0, 0)
        position: Qt.vector3d(7.04, -0.28, -1.92)
        mins: Qt.vector3d(-0.64, -0.44, -1.28)
        maxs: Qt.vector3d(0.64, 0.44, 1.28)
    }

    Door {
        id: door_10
        lip: 0.64
        wait: 20
        spawnflags: 1
        sounds: 0
        body: map.model_10
        owner: door_10
        enemy: door_10
        targetname: "t12"
        target: "lightning"
        movedir: Qt.vector3d(0, 1, 0)
        position: Qt.vector3d(3.6, 2.88, -2.8)
        mins: Qt.vector3d(-0.32, -1.6, -0.32)
        maxs: Qt.vector3d(0.32, 1.6, 0.32)
    }

    Door {
        id: door_11
        lip: 0.64
        wait: 20
        spawnflags: 1
        sounds: 0
        body: map.model_11
        owner: door_11
        enemy: door_11
        targetname: "t13"
        target: "lightning"
        movedir: Qt.vector3d(0, 1, 0)
        position: Qt.vector3d(3.6, 2.88, 1.52)
        mins: Qt.vector3d(-0.32, -1.6, -0.32)
        maxs: Qt.vector3d(0.32, 1.6, 0.32)
    }

    Button {
        body: map.model_12
        target: "t13"
        spawnflags: 2816
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(3.52, 1.9, 3.2)
        mins: Qt.vector3d(-0.32, -0.06, -0.32)
        maxs: Qt.vector3d(0.32, 0.06, 0.32)
    }

    Button {
        body: map.model_13
        target: "t14"
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(8.24, 1.42, -0.64)
        mins: Qt.vector3d(-0.32, -0.06, -0.32)
        maxs: Qt.vector3d(0.32, 0.06, 0.32)
    }

    ChangeLevelTrigger {
        map: "start"
        target: "t18"
        body: map.model_14
        position: Qt.vector3d(10.16, -10, -0.52)
        mins: Qt.vector3d(-0.16, -0.56, -0.52)
        maxs: Qt.vector3d(0.16, 0.56, 0.52)
    }

    TeleportTrigger {
        target: "t15"
        body: map.model_15
        position: Qt.vector3d(10.24, -8.96, -0.56)
        mins: Qt.vector3d(-0.08, -0.08, -0.08)
        maxs: Qt.vector3d(0.08, 0.08, 0.08)
    }

    Button {
        body: map.model_16
        target: "t9"
        spawnflags: 1792
        wait: -1
        eulerRotation: Qt.vector3d(0, 180, 0)
        position: Qt.vector3d(7.04, 0.88, 3.8)
        mins: Qt.vector3d(-0.32, -0.32, -0.04)
        maxs: Qt.vector3d(0.32, 0.32, 0.04)
    }

    Button {
        body: map.model_17
        target: "t13"
        spawnflags: 1024
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(3.52, 1.9, 2.48)
        mins: Qt.vector3d(-0.32, -0.06, -0.32)
        maxs: Qt.vector3d(0.32, 0.06, 0.32)
    }

    Wall {
        spawnflags: 1024
        body: map.model_18
        position: Qt.vector3d(3.52, 1.84, 3.24)
        mins: Qt.vector3d(-0.4, -0.08, -0.36)
        maxs: Qt.vector3d(0.4, 0.08, 0.36)
    }

    Wall {
        spawnflags: 2816
        body: map.model_19
        position: Qt.vector3d(3.52, 1.84, 2.42)
        mins: Qt.vector3d(-0.4, -0.08, -0.38)
        maxs: Qt.vector3d(0.4, 0.08, 0.38)
    }

    Button {
        body: map.model_20
        target: "t12"
        spawnflags: 2816
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(3.52, 1.9, -4.48)
        mins: Qt.vector3d(-0.32, -0.06, -0.32)
        maxs: Qt.vector3d(0.32, 0.06, 0.32)
    }

    Button {
        body: map.model_21
        target: "t12"
        spawnflags: 1024
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(3.52, 1.9, -3.76)
        mins: Qt.vector3d(-0.32, -0.06, -0.32)
        maxs: Qt.vector3d(0.32, 0.06, 0.32)
    }

    Wall {
        spawnflags: 1024
        body: map.model_22
        position: Qt.vector3d(3.52, 1.84, -4.52)
        mins: Qt.vector3d(-0.4, -0.08, -0.36)
        maxs: Qt.vector3d(0.4, 0.08, 0.36)
    }

    Wall {
        spawnflags: 2816
        body: map.model_23
        position: Qt.vector3d(3.52, 1.84, -3.7)
        mins: Qt.vector3d(-0.4, -0.08, -0.38)
        maxs: Qt.vector3d(0.4, 0.08, 0.38)
    }

    TeleportTrigger {
        targetname: "t17"
        target: "t19"
        body: map.model_24
        position: Qt.vector3d(15.88, 0.28, -3.44)
        mins: Qt.vector3d(-0.36, -0.04, -0.08)
        maxs: Qt.vector3d(0.36, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t17"
        target: "t20"
        body: map.model_25
        position: Qt.vector3d(18.04, 0.28, -3.44)
        mins: Qt.vector3d(-0.28, -0.04, -0.08)
        maxs: Qt.vector3d(0.28, 0.04, 0.08)
    }

    OnceTrigger {
        targetname: "t16"
        target: "t27"
        delay: 4.8
        body: map.model_26
        position: Qt.vector3d(16.96, 0.28, -1.28)
        mins: Qt.vector3d(-0.08, -0.04, -0.08)
        maxs: Qt.vector3d(0.08, 0.04, 0.08)
    }

    OnceTrigger {
        targetname: "t16"
        target: "t22"
        delay: 2.8
        body: map.model_27
        position: Qt.vector3d(16.96, 0.28, -2.24)
        mins: Qt.vector3d(-0.08, -0.04, -0.08)
        maxs: Qt.vector3d(0.08, 0.04, 0.08)
    }

    OnceTrigger {
        targetname: "t16"
        target: "t17"
        delay: 0.2
        body: map.model_28
        position: Qt.vector3d(16.96, 0.28, -3.44)
        mins: Qt.vector3d(-0.08, -0.04, -0.08)
        maxs: Qt.vector3d(0.08, 0.04, 0.08)
    }

    OnceTrigger {
        targetname: "t16"
        target: "t21"
        delay: 2
        body: map.model_29
        position: Qt.vector3d(16.96, 0.28, 2.24)
        mins: Qt.vector3d(-0.08, -0.04, -0.08)
        maxs: Qt.vector3d(0.08, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t21"
        target: "t25"
        body: map.model_30
        position: Qt.vector3d(15.88, 0.28, 2.24)
        mins: Qt.vector3d(-0.28, -0.04, -0.08)
        maxs: Qt.vector3d(0.28, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t21"
        target: "t26"
        body: map.model_31
        position: Qt.vector3d(18.04, 0.28, 2.24)
        mins: Qt.vector3d(-0.28, -0.04, -0.08)
        maxs: Qt.vector3d(0.28, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t22"
        target: "t24"
        body: map.model_32
        position: Qt.vector3d(18.04, 0.28, -2.24)
        mins: Qt.vector3d(-0.28, -0.04, -0.08)
        maxs: Qt.vector3d(0.28, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t22"
        target: "t23"
        body: map.model_33
        position: Qt.vector3d(15.88, 0.28, -2.24)
        mins: Qt.vector3d(-0.28, -0.04, -0.08)
        maxs: Qt.vector3d(0.28, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t27"
        target: "t29"
        body: map.model_34
        position: Qt.vector3d(17.92, 0.28, -1.28)
        mins: Qt.vector3d(-0.24, -0.04, -0.08)
        maxs: Qt.vector3d(0.24, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t27"
        target: "t28"
        body: map.model_35
        position: Qt.vector3d(16, 0.28, -1.28)
        mins: Qt.vector3d(-0.24, -0.04, -0.08)
        maxs: Qt.vector3d(0.24, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t30"
        target: "t32"
        body: map.model_36
        position: Qt.vector3d(17.92, 0.28, -0.64)
        mins: Qt.vector3d(-0.24, -0.04, -0.08)
        maxs: Qt.vector3d(0.24, 0.04, 0.08)
    }

    TeleportTrigger {
        targetname: "t30"
        target: "t31"
        body: map.model_37
        position: Qt.vector3d(16, 0.28, -0.64)
        mins: Qt.vector3d(-0.24, -0.04, -0.08)
        maxs: Qt.vector3d(0.24, 0.04, 0.08)
    }

    OnceTrigger {
        targetname: "t16"
        target: "t30"
        delay: 6.3
        body: map.model_38
        position: Qt.vector3d(16.96, 0.28, -0.64)
        mins: Qt.vector3d(-0.08, -0.04, -0.08)
        maxs: Qt.vector3d(0.08, 0.04, 0.08)
    }

    Door {
        id: door_39
        wait: -1
        spawnflags: 2048
        sounds: 3
        body: map.model_39
        owner: door_39
        enemy: door_39
        targetname: "t9"
        movedir: Qt.vector3d(0, -1, 0)
        position: Qt.vector3d(7.84, 0.48, -0.64)
        mins: Qt.vector3d(-0.08, -0.48, -0.08)
        maxs: Qt.vector3d(0.08, 0.48, 0.08)
    }

    EventLightning {
        position: Qt.vector3d(7.68, 2.24, 0.40)
        targetname: "t14"
    }

    TeleportDestination {
        targetname: "t8"
        position: Qt.vector3d(-2.56, 2.24, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1792
    }

    TeleportDestination {
        targetname: "t15"
        position: Qt.vector3d(9.44, -9.52, -0.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t19"
        position: Qt.vector3d(1.28, 3.20, -1.92)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportDestination {
        targetname: "t20"
        position: Qt.vector3d(1.28, 3.20, 0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportDestination {
        targetname: "t23"
        position: Qt.vector3d(3.52, 2.24, -1.28)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t24"
        position: Qt.vector3d(3.52, 2.24, 0.32)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t25"
        position: Qt.vector3d(6.72, 3.12, -0.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t26"
        position: Qt.vector3d(5.76, 3.12, 0.96)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t28"
        position: Qt.vector3d(5.60, 2.16, 2.24)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t29"
        position: Qt.vector3d(2.48, 2.16, -3.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t31"
        position: Qt.vector3d(6.88, 2.00, -3.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "t32"
        position: Qt.vector3d(1.28, 2.00, 2.24)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    RelayTrigger {
        targetname: "t10"
        target: "t9"
        position: Qt.vector3d(5.60, 0, -0.48)
    }

    RelayTrigger {
        targetname: "t18"
        target: "t16"
        position: Qt.vector3d(15.12, 0.32, -12.8)
    }

    InfoIntermission {
        position: Qt.vector3d(-0.16, 3.68, -3.84)
        eulerRotation: Qt.vector3d(-20, 225, 0)
    }

    Boss {
        targetname: "t4"
        target: "t10"
        position: Qt.vector3d(3.04, -0.48, -0.64)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Shambler {
        position: Qt.vector3d(15.44, 0.24, -3.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(16.32, 0.24, -3.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(18.48, 0.24, -3.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(17.60, 0.24, -3.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(18.48, 0.24, -2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(17.60, 0.24, -2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(16.32, 0.24, -2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(15.44, 0.24, -2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(18.48, 0.24, 2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(17.60, 0.24, 2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(16.32, 0.24, 2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shambler {
        position: Qt.vector3d(15.44, 0.24, 2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(17.60, 0.24, -1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(18.24, 0.24, -1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(15.68, 0.24, -1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(16.32, 0.24, -1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(18.24, 0.24, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(17.60, 0.24, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(16.32, 0.24, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(15.68, 0.24, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Sigil {
        target: "t4"
        spawnflags: 2049
        position: Qt.vector3d(0.08, 0.24, -0.64)
    }

    SuperShotgunItem {
        position: Qt.vector3d(-1.60, 2.08, -0.64)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(-3.12, 2.08, 3.12)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(-3.12, 2.08, 2.80)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(-2.80, 2.08, 3.12)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(-3.12, 2.08, -4.08)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(-3.12, 2.08, -3.76)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(-2.80, 2.08, -4.08)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(10.48, 1.92, -4.72)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(10.48, 1.92, -4.40)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(10.48, 1.92, 3.76)
        spawnflags: 1792
    }
    Health {
        position: Qt.vector3d(10.48, 1.92, 3.44)
        spawnflags: 1792
    }

    Shells {
        position: Qt.vector3d(0.48, 0.32, -4.32)
        spawnflags: 1793
    }

    Shells {
        position: Qt.vector3d(7.52, 0.32, -4.32)
        spawnflags: 1793
    }

    Shells {
        position: Qt.vector3d(0.48, 0.32, 3.36)
        spawnflags: 1793
    }

    Shells {
        position: Qt.vector3d(7.52, 0.32, 3.36)
        spawnflags: 1793
    }

    Rockets {
        position: Qt.vector3d(10.08, 1.92, 2.72)
        spawnflags: 1793
    }

    Rockets {
        position: Qt.vector3d(10.08, 1.92, -3.68)
        spawnflags: 1793
    }

    SuperNailgunItem {
        position: Qt.vector3d(11.20, -0.32, -0.64)
        spawnflags: 1792
    }

    Spikes {
        position: Qt.vector3d(3.44, 0.32, -3.92)
        spawnflags: 1793
    }

    Spikes {
        position: Qt.vector3d(3.28, 0.32, -3.92)
        spawnflags: 1793
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(-3.92, 0.32, -0.64)
        spawnflags: 1792
    }

    Health {
        position: Qt.vector3d(9.76, -0.32, -0.48)
        spawnflags: 1026
    }

    RocketLauncherItem {
        position: Qt.vector3d(9.84, 1.92, 3.28)
        spawnflags: 1792
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(9.84, 1.92, -4.40)
        spawnflags: 1792
    }

    SuperNailgunItem {
        position: Qt.vector3d(-2.24, 1.92, -3.76)
        spawnflags: 1792
    }

    SuperShotgunItem {
        position: Qt.vector3d(-2.16, 1.92, 2.88)
        spawnflags: 1792
    }

    NailgunItem {
        position: Qt.vector3d(3.52, 0.32, -4.56)
        spawnflags: 1792
    }

    SuperDamage {
        position: Qt.vector3d(0, 0.24, -0.64)
        spawnflags: 1792
    }

    Flame {
        position: Qt.vector3d(-1.58, 1.16, -3.54)
    }

    Flame {
        position: Qt.vector3d(-1.58, 1.16, 2.22)
    }

    Flame {
        position: Qt.vector3d(9.30, 0.52, 2.22)
    }

    Flame {
        position: Qt.vector3d(9.22, 0.52, -3.46)
    }

    Flame2 {
        position: Qt.vector3d(6.62, -10.44, -1.60)
    }

    Flame2 {
        position: Qt.vector3d(6.70, -10.44, 0.32)
    }
}
