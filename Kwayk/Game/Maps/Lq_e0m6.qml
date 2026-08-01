import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.lq_e0m6

World {
    id: root

    displayName: "Great Greek Grinder"
    worldtype: 0

    readonly property alias player: player

    Lq_e0m6_map {
        id: map
    }

    Lq_e0m6_map_hull0 {
    }

    CounterTrigger {
        target: "door_silver_gold"
        targetname: "counter_silver_gold"
        count: 2
        delay: 1
        position: Qt.vector3d(0.08, 2.16, 2.16)
    }

    Key2 {
        spawnflags: 2048
        position: Qt.vector3d(17.28, 3.8, 3.16)
    }

    Key1 {
        spawnflags: 2048
        position: Qt.vector3d(0.0, 0.72, -15.04)
    }

    ChangeLevelTrigger {
        body: map.model_17
        position: Qt.vector3d(-17.84, -5.24, 25.84)
        mins: Qt.vector3d(-0.24, -0.68, -0.16)
        maxs: Qt.vector3d(0.24, 0.68, 0.16)
        map: "lq_e0m7"
    }

    Player {
        id: player
        position: Qt.vector3d(0.0, 1.04, 35.84)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(0.0, 2.16, 35.12)
        eulerRotation: Qt.vector3d(-0, 0, 0)
    }

    Armor {
        skin: 1
        position: Qt.vector3d(15.36, 1.28, 11.2)
    }

    Key1 {
        spawnflags: 2048
        position: Qt.vector3d(-16.64, 2.32, 7.68)
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(-20.8, 2.16, 0.64)
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(-20.8, 2.16, -0.96)
    }

    SuperShotgunItem {
        position: Qt.vector3d(0.0, 0.08, 30.72)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-0.16, 0.08, 29.6)
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(17.28, 3.2, 11.2)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(15.84, 3.36, 11.96)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(15.84, 3.36, 10.6)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-5.6, 0.0, 28.64)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(5.28, 0.0, 28.64)
    }

    NailgunItem {
        position: Qt.vector3d(-15.04, 1.28, -0.32)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(-20.8, 2.16, 0.16)
    }

    Spikes {
        spawnflags: 1025
        position: Qt.vector3d(-20.8, 2.16, -0.48)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(0.08, 0.68, -2.56)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(-0.36, 0.68, -2.56)
    }

    Health {
        position: Qt.vector3d(-0.16, 0.64, -0.28)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-3.8, 0.04, -12.88)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(1.56, 0.04, -14.16)
    }

    Health {
        position: Qt.vector3d(3.32, 0.04, -21.24)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(20.64, -1.76, 6.88)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(19.36, -1.76, 6.88)
    }

    SuperDamage {
        position: Qt.vector3d(16.0, -0.4, -1.6)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(14.36, 0.8, 10.72)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(14.36, 0.8, 12.0)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-1.76, 0.8, 13.28)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(1.44, 0.8, 13.28)
    }

    Health {
        position: Qt.vector3d(10.4, 3.2, -4.0)
    }

    LightningItem {
        position: Qt.vector3d(-7.36, 0.16, -7.36)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-6.8, 0.16, -7.12)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-8.24, 0.16, -7.12)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-5.6, 0.08, -16.24)
    }

    TeleportDestination {
        targetname: "tele_pop_center1"
        position: Qt.vector3d(-0.32, -1.6, 6.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportDestination {
        targetname: "tele_pop_center2"
        position: Qt.vector3d(-0.96, -1.6, 7.68)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportDestination {
        targetname: "tele_pop_center3"
        position: Qt.vector3d(0.32, -1.6, 8.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportTrigger {
        body: map.model_24
        position: Qt.vector3d(13.28, -0.88, 22.08)
        mins: Qt.vector3d(-0.48, -0.08, -0.48)
        maxs: Qt.vector3d(0.48, 0.08, 0.48)
        target: "tele_pop_center1"
        targetname: "pop_basement_arena"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_25
        position: Qt.vector3d(13.28, -0.88, 20.96)
        mins: Qt.vector3d(-0.48, -0.08, -0.48)
        maxs: Qt.vector3d(0.48, 0.08, 0.480001)
        target: "tele_pop_center2"
        targetname: "pop_basement_arena"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_26
        position: Qt.vector3d(13.28, -0.88, 19.84)
        mins: Qt.vector3d(-0.48, -0.08, -0.48)
        maxs: Qt.vector3d(0.48, 0.08, 0.48)
        target: "tele_pop_center3"
        targetname: "pop_basement_arena"
        spawnflags: 2
    }

    OnceTrigger {
        body: map.model_27
        position: Qt.vector3d(9.92, 0.8, -7.92)
        mins: Qt.vector3d(-0.96, -0.8, -0.0799999)
        maxs: Qt.vector3d(0.96, 0.8, 0.0799999)
        target: "pop_basement_arena"
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(8.92, -2.16, 8.08)
    }

    Health {
        position: Qt.vector3d(-1.12, 0.16, -14.24)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(18.08, 0.0, -2.72)
    }

    Health {
        position: Qt.vector3d(-12.96, -1.92, 18.88)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-12.32, -1.6, 18.88)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(-13.6, -1.6, 18.88)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(12.0, -2.16, 8.08)
    }

    OnceTrigger {
        body: map.model_28
        position: Qt.vector3d(-2.56, 0.88, -15.6)
        mins: Qt.vector3d(-0.64, -0.88, -0.0799999)
        maxs: Qt.vector3d(0.64, 0.88, 0.0799999)
        target: "bob"
    }

    Button {
        body: map.model_30
        position: Qt.vector3d(19.24, 2.4, -2.24)
        mins: Qt.vector3d(-0.0400009, -0.16, -0.16)
        maxs: Qt.vector3d(0.039999, 0.16, 0.16)
        eulerRotation: Qt.vector3d(0, 90, 0)
        target: "door_secret1"
        wait: -1
        lip: 0.04
        health: 1
    }

    SecretTrigger {
        body: map.model_31
        position: Qt.vector3d(16, -0.4, -1.68)
        mins: Qt.vector3d(-1.92, -0.24, -0.24)
        maxs: Qt.vector3d(1.92, 0.24, 0.24)
        spawnflags: 2048
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(15.04, -1.76, -0.0)
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(16.64, -1.76, -0.0)
    }

    AmbientDrip {
        position: Qt.vector3d(15.44, -0.56, 9.68)
    }

    SecretTrigger {
        body: map.model_33
        position: Qt.vector3d(8, 3.52, -1.94)
        mins: Qt.vector3d(-0.04, -0.32, -0.62)
        maxs: Qt.vector3d(0.04, 0.32, 0.62)
        spawnflags: 2048
    }

    RocketLauncherItem {
        position: Qt.vector3d(-10.88, 1.92, 0.6)
    }

    SecretTrigger {
        body: map.model_35
        position: Qt.vector3d(-11.34, 2.24, 0.62)
        mins: Qt.vector3d(-0.139999, -0.32, -0.62)
        maxs: Qt.vector3d(0.14, 0.32, 0.62)
        spawnflags: 2048
    }

    Rockets {
        position: Qt.vector3d(-10.6, 1.92, 0.36)
    }

    Rockets {
        position: Qt.vector3d(-10.6, 1.92, 1.24)
    }

    Wall {
        body: map.model_36
        position: Qt.vector3d(-4.56, -1.28, 7.68)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.64)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.64)
        spawnflags: 1792
    }

    Wall {
        body: map.model_37
        position: Qt.vector3d(0, -1.2, 7.68)
        mins: Qt.vector3d(-0.08, -0.56, -0.4)
        maxs: Qt.vector3d(0.08, 0.56, 0.4)
        spawnflags: 1792
    }

    Wall {
        body: map.model_38
        position: Qt.vector3d(0, -1.2, 7.68)
        mins: Qt.vector3d(-0.04, -0.4, -0.24)
        maxs: Qt.vector3d(0.04, 0.4, 0.24)
        spawnflags: 1792
    }

    TeleportTrigger {
        body: map.model_39
        position: Qt.vector3d(0.16, -1.36, 7.68)
        mins: Qt.vector3d(-0.08, -0.56, -0.32)
        maxs: Qt.vector3d(0.08, 0.56, 0.32)
        target: "tele_dm1"
        spawnflags: 1792
    }

    TeleportDestination {
        targetname: "tele_dm1"
        position: Qt.vector3d(-7.36, 0.88, 11.68)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "tele_dm2"
        position: Qt.vector3d(7.04, 0.88, 11.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportTrigger {
        body: map.model_40
        position: Qt.vector3d(-0.16, -1.36, 7.68)
        mins: Qt.vector3d(-0.08, -0.56, -0.32)
        maxs: Qt.vector3d(0.08, 0.56, 0.32)
        target: "tele_dm2"
        spawnflags: 1792
    }

    Wall {
        body: map.model_41
        position: Qt.vector3d(5.6, 0.72, -8.8)
        mins: Qt.vector3d(-0.0799999, -0.56, -0.400001)
        maxs: Qt.vector3d(0.0799999, 0.56, 0.4)
        spawnflags: 1792
    }

    TeleportTrigger {
        body: map.model_42
        position: Qt.vector3d(5.44, 0.56, -8.8)
        mins: Qt.vector3d(-0.0799999, -0.56, -0.320001)
        maxs: Qt.vector3d(0.0799999, 0.56, 0.32)
        target: "tele_dm3"
        spawnflags: 1792
    }

    TeleportDestination {
        targetname: "tele_dm3"
        position: Qt.vector3d(6.8, 0.24, -9.04)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wall {
        body: map.model_43
        position: Qt.vector3d(5.6, 0.72, -8.8)
        mins: Qt.vector3d(-0.04, -0.4, -0.24)
        maxs: Qt.vector3d(0.04, 0.4, 0.24)
        spawnflags: 1792
    }

    // doors
    Door {
        id: door_1
        body: map.model_1
        position: Qt.vector3d(0.32, 1.28, 19.52)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 1
        owner: door_1
        enemy: door_2
    }

    Door {
        id: door_2
        body: map.model_2
        position: Qt.vector3d(-0.32, 1.28, 19.52)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 1
        owner: door_1
        enemy: door_1
    }

    Door {
        id: door_3
        body: map.model_3
        position: Qt.vector3d(6.08, 1.28, 8)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_3
        enemy: door_4
    }

    Door {
        id: door_4
        body: map.model_4
        position: Qt.vector3d(6.08, 1.28, 7.36)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_3
        enemy: door_3
    }

    Door {
        id: door_5
        body: map.model_5
        position: Qt.vector3d(-1.12, 1.12, 2.56)
        mins: Qt.vector3d(-0.16, -0.48, -0.16)
        maxs: Qt.vector3d(0.16, 0.48, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        target: "counter_silver_gold"
        spawnflags: 2064
        wait: -1
        speed: 0.2
        sounds: 3
        lip: 0.32
        owner: door_5
        enemy: door_5
    }

    Door {
        id: door_6
        body: map.model_6
        position: Qt.vector3d(1.12, 1.12, 2.56)
        mins: Qt.vector3d(-0.16, -0.48, -0.16)
        maxs: Qt.vector3d(0.16, 0.48, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        target: "counter_silver_gold"
        spawnflags: 2056
        wait: -1
        speed: 0.2
        sounds: 3
        lip: 0.32
        owner: door_6
        enemy: door_6
    }

    Door {
        id: door_7
        body: map.model_7
        position: Qt.vector3d(-6.08, 1.28, 8)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_7
        enemy: door_8
    }

    Door {
        id: door_8
        body: map.model_8
        position: Qt.vector3d(-6.08, 1.28, 7.36)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_7
        enemy: door_7
    }

    Door {
        id: door_9
        body: map.model_9
        position: Qt.vector3d(0.32, 1.28, 1.6)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "door_silver_gold"
        spawnflags: 2048
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_9
        enemy: door_10
    }

    Door {
        id: door_10
        body: map.model_10
        position: Qt.vector3d(-0.32, 1.28, 1.6)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.08)
        eulerRotation: Qt.vector3d(0, 90, 0)
        targetname: "door_silver_gold"
        spawnflags: 2048
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_9
        enemy: door_9
    }

    Door {
        id: door_11
        body: map.model_11
        position: Qt.vector3d(13.76, 3.84, -0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_11
        enemy: door_12
    }

    Door {
        id: door_12
        body: map.model_12
        position: Qt.vector3d(13.76, 3.84, -0.96)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_11
        enemy: door_11
    }

    Door {
        id: door_13
        body: map.model_13
        position: Qt.vector3d(0.32, 1.28, -4.8)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0800004)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 1
        owner: door_13
        enemy: door_14
    }

    Door {
        id: door_14
        body: map.model_14
        position: Qt.vector3d(-0.32, 1.28, -4.8)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0800004)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 1
        owner: door_13
        enemy: door_13
    }

    Door {
        id: door_15
        body: map.model_15
        position: Qt.vector3d(8.64, 0.64, -9.28)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.320001)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 2064
        sounds: 1
        owner: door_15
        enemy: door_16
    }

    Door {
        id: door_16
        body: map.model_16
        position: Qt.vector3d(8.64, 0.64, -8.64)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.320001)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 2064
        sounds: 1
        owner: door_15
        enemy: door_15
    }

    Door {
        id: door_18
        body: map.model_18
        position: Qt.vector3d(0.32, 1.28, 13.76)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 1
        owner: door_18
        enemy: door_19
    }

    Door {
        id: door_19
        body: map.model_19
        position: Qt.vector3d(-0.32, 1.28, 13.76)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 1
        owner: door_18
        enemy: door_18
    }

    Door {
        id: door_20
        body: map.model_20
        position: Qt.vector3d(17.6, 3.84, 7.36)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 1
        owner: door_20
        enemy: door_21
    }

    Door {
        id: door_21
        body: map.model_21
        position: Qt.vector3d(16.96, 3.84, 7.36)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.320002, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 1
        owner: door_20
        enemy: door_20
    }

    Door {
        id: door_22
        body: map.model_22
        position: Qt.vector3d(-11.84, 1.28, 8)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_22
        enemy: door_23
    }

    Door {
        id: door_23
        body: map.model_23
        position: Qt.vector3d(-11.84, 1.28, 7.36)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_22
        enemy: door_22
    }

    Door {
        id: door_29
        body: map.model_29
        position: Qt.vector3d(16, 0.96, -2.08)
        mins: Qt.vector3d(-0.88, -0.64, -0.0800002)
        maxs: Qt.vector3d(0.879999, 0.64, 0.0799999)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "door_secret1"
        spawnflags: 0
        wait: -1
        speed: 0.2
        sounds: 1
        lip: 0.16
        owner: door_29
        enemy: door_29
    }

    SecretDoor {
        id: door_32
        body: map.model_32
        position: Qt.vector3d(8.2, 3.52, -1.92)
        mins: Qt.vector3d(-0.0799999, -0.32, -0.64)
        maxs: Qt.vector3d(0.0799999, 0.32, 0.64)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 2048
        wait: 5
        sounds: 1
        owner: door_32
        enemy: door_32
    }

    SecretDoor {
        id: door_34
        body: map.model_34
        position: Qt.vector3d(-12.04, 2.24, 0.64)
        mins: Qt.vector3d(-0.0799999, -0.32, -0.64)
        maxs: Qt.vector3d(0.0799999, 0.32, 0.64)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 2048
        wait: 5
        sounds: 1
        owner: door_34
        enemy: door_34
    }

    DoorTrigger {
        owner: door_1
    }

    DoorTrigger {
        owner: door_3
    }

    DoorTrigger {
        owner: door_7
    }

    DoorTrigger {
        owner: door_11
    }

    DoorTrigger {
        owner: door_13
    }

    DoorTrigger {
        owner: door_18
    }

    DoorTrigger {
        owner: door_20
    }

    DoorTrigger {
        owner: door_22
    }


    Flame {
        position: Qt.vector3d(-1.92, 1.4, 17.32)
    }

    Flame {
        position: Qt.vector3d(1.92, 1.4, 17.32)
    }

    Flame {
        position: Qt.vector3d(-1.92, 1.4, 15.96)
    }

    Flame {
        position: Qt.vector3d(1.92, 1.4, 15.96)
    }

    Flame {
        position: Qt.vector3d(1.92, 1.4, -0.6)
    }

    Flame {
        position: Qt.vector3d(-1.92, 1.4, -0.6)
    }

    Flame {
        position: Qt.vector3d(1.92, 1.4, -2.6)
    }

    Flame {
        position: Qt.vector3d(-1.92, 1.4, -2.6)
    }

    Flame {
        position: Qt.vector3d(6.4, -1.16, 5.8)
    }

    Flame {
        position: Qt.vector3d(-6.72, -1.16, 5.8)
    }

    Flame {
        position: Qt.vector3d(-10.24, -1.16, 12.12)
    }

    Flame {
        position: Qt.vector3d(-7.36, 1.4, 5.16)
    }

    Flame {
        position: Qt.vector3d(-10.56, 1.4, 5.16)
    }

    Flame {
        position: Qt.vector3d(7.36, 1.4, 5.16)
    }

    Flame {
        position: Qt.vector3d(9.64, 3.48, 5.16)
    }

    Flame {
        position: Qt.vector3d(9.92, 0.76, -10.2)
    }

    Flame {
        position: Qt.vector3d(9.92, 0.76, -2.6)
    }

    Flame {
        position: Qt.vector3d(17.92, 0.76, -4.44)
    }

    Flame {
        position: Qt.vector3d(20.16, -1.0, 7.0)
    }

    Flame {
        position: Qt.vector3d(14.12, -1.16, 3.2)
    }

    Flame {
        position: Qt.vector3d(19.24, 0.12, 0.64)
    }

    Flame {
        position: Qt.vector3d(10.56, -1.64, 7.72)
    }

    Flame {
        position: Qt.vector3d(18.56, 3.96, 7.0)
    }

    Flame {
        position: Qt.vector3d(8.96, 1.4, 12.12)
    }

    Flame {
        position: Qt.vector3d(14.12, 3.96, 3.2)
    }

    Flame {
        position: Qt.vector3d(20.44, 3.96, 1.28)
    }

    Flame {
        position: Qt.vector3d(6.4, -1.16, 11.48)
    }

    Flame {
        position: Qt.vector3d(13.44, 1.56, 10.28)
    }

    Flame {
        position: Qt.vector3d(14.76, 3.96, 11.2)
    }

    Flame {
        position: Qt.vector3d(18.52, 3.96, 9.6)
    }

    Flame {
        position: Qt.vector3d(16.0, 3.96, 7.0)
    }

    Flame {
        position: Qt.vector3d(8.36, 3.96, 0.64)
    }

    Flame {
        position: Qt.vector3d(13.4, 3.96, 0.64)
    }

    Flame {
        position: Qt.vector3d(8.28, 0.76, -7.68)
    }

    Flame {
        position: Qt.vector3d(-3.88, 1.4, -1.6)
    }

    Flame {
        position: Qt.vector3d(3.88, 1.4, -1.6)
    }

    Flame {
        position: Qt.vector3d(1.92, 1.4, -5.16)
    }

    Flame {
        position: Qt.vector3d(-1.92, 1.4, -5.16)
    }

    Flame {
        position: Qt.vector3d(-8.96, 1.4, 12.12)
    }

    Flame {
        position: Qt.vector3d(-12.2, 2.2, 2.56)
    }

    Flame {
        position: Qt.vector3d(-21.08, 2.84, 0.96)
    }

    Flame {
        position: Qt.vector3d(-21.08, 2.84, -1.6)
    }

    Flame {
        position: Qt.vector3d(-19.8, 2.84, 9.6)
    }

    Flame {
        position: Qt.vector3d(-17.92, 2.84, 10.84)
    }

    Flame {
        position: Qt.vector3d(-14.08, 2.84, 10.84)
    }

    Flame {
        position: Qt.vector3d(-19.8, 2.84, 5.76)
    }

    Flame {
        position: Qt.vector3d(14.72, -1.0, 7.0)
    }

    Flame {
        position: Qt.vector3d(-12.2, 2.2, -1.28)
    }

    Flame {
        position: Qt.vector3d(17.88, -1.64, 9.92)
    }

    Flame {
        position: Qt.vector3d(-19.16, -1.8, 12.8)
    }

    Flame {
        position: Qt.vector3d(-11.56, -3.72, 16.32)
    }

    Flame {
        position: Qt.vector3d(-13.4, -3.72, 18.56)
    }

    Flame {
        position: Qt.vector3d(-19.84, -4.68, 19.72)
    }

    Flame {
        position: Qt.vector3d(-23.48, -4.68, 25.56)
    }

    Flame {
        position: Qt.vector3d(15.36, 3.96, -4.44)
    }

    Flame {
        position: Qt.vector3d(10.56, -1.64, 12.12)
    }

    Flame {
        position: Qt.vector3d(15.36, -1.64, 12.12)
    }

    Flame {
        position: Qt.vector3d(-14.72, -1.16, 10.28)
    }

    Flame {
        position: Qt.vector3d(-15.52, -3.88, 20.52)
    }

    Flame {
        position: Qt.vector3d(-16.0, -2.44, 15.32)
    }

    Flame {
        position: Qt.vector3d(-14.04, -1.0, 17.28)
    }

    Flame {
        position: Qt.vector3d(-11.56, -1.0, 13.12)
    }

    Flame {
        position: Qt.vector3d(19.2, 3.96, -4.44)
    }

    // patrol paths

    PathCorner {
        targetname: "path1_c1"
        target: "path1_c2"
        position: Qt.vector3d(-2.32, 3.12, -10.8)
    }

    PathCorner {
        targetname: "path1_c2"
        target: "path1_c3"
        position: Qt.vector3d(-2.32, 3.12, -16.24)
    }

    PathCorner {
        targetname: "path1_c3"
        target: "path1_c4"
        position: Qt.vector3d(1.84, 3.12, -16.24)
    }

    PathCorner {
        targetname: "path1_c4"
        target: "path1_c1"
        position: Qt.vector3d(1.84, 3.12, -10.8)
    }

    PathCorner {
        targetname: "path2_c1"
        target: "path2_c2"
        position: Qt.vector3d(-4.24, 1.04, 11.6)
    }

    PathCorner {
        targetname: "path2_c2"
        target: "path2_c3"
        position: Qt.vector3d(-4.24, 1.04, 3.6)
    }

    PathCorner {
        targetname: "path2_c3"
        target: "path2_c4"
        position: Qt.vector3d(4.08, 1.04, 3.6)
    }

    PathCorner {
        targetname: "path2_c4"
        target: "path2_c1"
        position: Qt.vector3d(4.08, 1.04, 11.92)
    }

    PathCorner {
        targetname: "path3_c1"
        target: "path3_c2"
        position: Qt.vector3d(-2.96, 1.04, 20.4)
    }

    PathCorner {
        targetname: "path3_c2"
        target: "path3_c1"
        position: Qt.vector3d(3.12, 1.04, 20.4)
    }

    // monsters

    Shambler {
        position: Qt.vector3d(-2.64, 0.4, -20.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
        targetname: "bob"
    }

    Ogre {
        position: Qt.vector3d(8.94, 3.48, 2.59)
        eulerRotation: Qt.vector3d(0, -45, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-0.16, 0.24, 25.6)
        eulerRotation: Qt.vector3d(0, 165, 0)
    }

    Ogre {
        position: Qt.vector3d(2.4, 0.88, 24.8)
        eulerRotation: Qt.vector3d(0, 165, 0)
    }

    HellKnight {
        position: Qt.vector3d(15.04, 3.44, -0.64)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(16.32, 3.44, 0.16)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(16.32, 3.44, -1.28)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Demon {
        position: Qt.vector3d(10.56, 2.64, 3.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Dog {
        position: Qt.vector3d(-5.12, 0.24, 35.36)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Dog {
        position: Qt.vector3d(-5.92, 0.24, 35.04)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

    Dog {
        position: Qt.vector3d(5.12, 0.24, 35.04)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

    Dog {
        position: Qt.vector3d(5.92, 0.24, 35.36)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-3.52, 0.88, 20.48)
        eulerRotation: Qt.vector3d(0, 225, 0)
        target: "path3_c1"
    }

    Knight {
        position: Qt.vector3d(0.64, 0.88, 21.12)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Dog {
        position: Qt.vector3d(-7.88, 0.24, -20.6)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Dog {
        position: Qt.vector3d(-7.2, 0.24, -20.44)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Dog {
        position: Qt.vector3d(-7.96, 0.24, -19.68)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Dog {
        position: Qt.vector3d(-7.28, 0.24, -19.68)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Demon {
        position: Qt.vector3d(7.36, 0.28, -7.48)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Ogre {
        position: Qt.vector3d(-2.52, 0.28, -11.84)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Shambler {
        position: Qt.vector3d(0.96, 0.4, -14.56)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

    Ogre {
        position: Qt.vector3d(3.52, 0.4, -17.44)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Dog {
        position: Qt.vector3d(0.16, 0.24, -19.04)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Dog {
        position: Qt.vector3d(-0.12, 0.24, -19.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Dog {
        position: Qt.vector3d(1.44, 0.24, -19.04)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(4.48, 0.4, -12.48)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(4.16, 0.4, -12)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(3.84, 0.4, -12.8)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-1.12, 4.08, 6.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-0.48, 4.08, 5.44)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(1.28, 4.08, 6.08)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(0.32, 4.08, 5.92)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-0.64, 0.72, 9.28)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 0
    }

    Knight {
        position: Qt.vector3d(1.28, 0.72, 9.12)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 0
    }

    Knight {
        position: Qt.vector3d(0.48, 0.72, 9.6)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 0
    }

    Knight {
        position: Qt.vector3d(-3.04, 1.04, 12.48)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 0
        target: "path2_c1"
    }

    ZombieV2 {
        position: Qt.vector3d(14.08, -2.16, 11.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(15.04, -2.16, 10.56)
        eulerRotation: Qt.vector3d(0, -30, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(14.24, -2.16, 10.56)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(13.12, -2.16, 10.72)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(9.28, -2.16, 11.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(9.44, -2.16, 10.56)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(11.6, -1.92, 8.16)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Zombie {
        position: Qt.vector3d(6.4, -1.52, 6.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    HellKnight {
        position: Qt.vector3d(14.24, 0.4, -3.84)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Ogre {
        position: Qt.vector3d(-13.28, 2.32, 10.24)
        eulerRotation: Qt.vector3d(0, 45, 0)
        spawnflags: 257
    }

    HellKnight {
        position: Qt.vector3d(-14.4, 0.88, 5.28)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(-14.88, 1.52, 1.12)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(-14.24, 1.52, 1.44)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(-15.36, 1.52, 1.44)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(-17.6, 2.32, 6.4)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(-1.92, 3.12, -11.84)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "path1_c1"
    }

    Wizard {
        position: Qt.vector3d(1.76, 3.12, -16.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "path1_c3"
    }

    Knight {
        position: Qt.vector3d(6.08, 0.4, -22.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(6.08, 0.4, -21.92)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(5.28, 0.4, -22.24)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(3.84, 0.4, -22.4)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Dog {
        position: Qt.vector3d(-6.73, 0.32, -10.39)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Shambler {
        position: Qt.vector3d(13.28, -0.56, 20.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Demon {
        position: Qt.vector3d(13.28, -0.56, 22.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Demon {
        position: Qt.vector3d(13.28, -0.56, 19.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(16.8, -1.68, 5.12)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Ogre {
        position: Qt.vector3d(15.36, -1.68, 4.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Ogre {
        position: Qt.vector3d(20.16, -1.68, 4.8)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(16, -0.32, 7.03)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-13.64, -1.36, 17.28)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(-14.88, -1.36, 12.64)
        eulerRotation: Qt.vector3d(0, -60, 0)
    }

    Knight {
        position: Qt.vector3d(-12.32, -4.24, 20.16)
        eulerRotation: Qt.vector3d(0, -30, 0)
    }

    Knight {
        position: Qt.vector3d(-12.16, -4.24, 19.36)
        eulerRotation: Qt.vector3d(0, -30, 0)
    }

    Knight {
        position: Qt.vector3d(-12.64, -4.24, 20.96)
        eulerRotation: Qt.vector3d(0, -30, 0)
        spawnflags: 256
    }

    Wizard {
        position: Qt.vector3d(-22.88, -4.24, 24.8)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(-22.4, -4.24, 24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-22.24, -5.2, 21.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(17.28, 3.52, 8.48)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(17.28, 3.44, 6.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Zombie {
        position: Qt.vector3d(-11.72, -1.28, 17.16)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-12.44, -1.28, 15.16)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

}
