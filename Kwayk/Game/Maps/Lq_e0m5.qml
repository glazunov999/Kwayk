import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.lq_e0m5

World {
    id: root

    displayName: "Adequate Aquatic Adventure"
    worldtype: 1

    readonly property alias player: player

    Lq_e0m5_map {
        id: map
    }

    Lq_e0m5_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(-9.32, 6.0, -0.0)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Button {
        body: map.model_3
        position: Qt.vector3d(10.24, 0.36, 8)
        mins: Qt.vector3d(-0.32, -0.04, -0.32)
        maxs: Qt.vector3d(0.320001, 0.04, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        target: "door_grate1"
        spawnflags: 2048
        wait: -1
        sounds: 2
        lip: 0.04
    }

    OnceTrigger {
        body: map.model_5
        position: Qt.vector3d(-0.08, -1.92, 6.88)
        mins: Qt.vector3d(-0.88, -0.8, -0.16)
        maxs: Qt.vector3d(0.88, 0.8, 0.16)
        target: "door_grate2"
        spawnflags: 2048
    }

    OnceTrigger {
        body: map.model_6
        position: Qt.vector3d(11.2, 3.52, -1.96)
        mins: Qt.vector3d(-0.64, -0.96, -1.24)
        maxs: Qt.vector3d(0.639999, 0.96, 1.24)
        target: "plat1"
    }

    OnceTrigger {
        body: map.model_8
        position: Qt.vector3d(0, 8.2, 0)
        mins: Qt.vector3d(-0.8, -0.04, -0.8)
        maxs: Qt.vector3d(0.8, 0.04, 0.8)
        target: "door_grate4_delay"
        spawnflags: 2048
    }

    RelayTrigger {
        target: "door_grate4"
        targetname: "door_grate4_delay"
        delay: 0.8
        position: Qt.vector3d(0.0, 8.48, 0.08)
    }

    Plat {
        body: map.model_21
        position: Qt.vector3d(14.74, 5.88, 0)
        mins: Qt.vector3d(-0.94, -2.76, -1.24)
        maxs: Qt.vector3d(0.940001, 2.76, 1.24)
        targetname: "plat1"
        sounds: 2
    }

    Key2 {
        spawnflags: 2048
        position: Qt.vector3d(-0.48, -6.8, -0.0)
    }

    ChangeLevelTrigger {
        body: map.model_26
        position: Qt.vector3d(-22.24, 1.28, 0)
        mins: Qt.vector3d(-0.16, -0.64, -0.64)
        maxs: Qt.vector3d(0.16, 0.64, 0.64)
        map: "lq_e0m6"
    }

    ChangeLevelTrigger {
        body: map.model_29
        position: Qt.vector3d(-20.48, 1.28, 3.12)
        mins: Qt.vector3d(-0.640001, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.639999, 0.64, 0.0800002)
        map: "lq_e0m8"
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(5.28, -2.72, -7.52)
    }

    NailgunItem {
        position: Qt.vector3d(12.8, -2.72, 3.84)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(6.08, 0.32, 15.84)
    }

    Health {
        position: Qt.vector3d(5.28, 0.32, 14.88)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(7.04, 0.32, 15.84)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(7.52, 0.32, 15.84)
    }

    SuperShotgunItem {
        position: Qt.vector3d(-1.92, 5.6, -0.0)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(0.8, 5.6, 2.4)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(0.8, 5.6, -2.08)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(11.36, -3.36, -4.32)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(11.36, -3.36, -4.8)
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(11.2, -3.36, -11.04)
    }

    Armor {
        skin: 0
        position: Qt.vector3d(14.08, 1.28, -12.16)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(11.68, 1.32, -11.72)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(16.16, 1.32, -11.72)
    }

    Health {
        position: Qt.vector3d(11.0, 2.56, 10.2)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(10.56, 2.56, 10.16)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(11.44, 2.56, 10.2)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(14.68, 3.24, 1.76)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(5.0, 8.68, 0.12)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(4.04, 8.68, -3.76)
    }

    Health {
        position: Qt.vector3d(-1.76, 8.64, 2.24)
    }

    Health {
        position: Qt.vector3d(-1.76, 8.64, -1.92)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(3.96, 8.68, 4.08)
    }

    Shells {
        position: Qt.vector3d(14.52, 8.68, 2.08)
    }

    Spikes {
        position: Qt.vector3d(14.56, 8.68, -1.96)
    }

    Shells {
        position: Qt.vector3d(12.2, 0.16, -2.08)
    }

    Health {
        position: Qt.vector3d(-1.44, 2.56, 10.08)
    }

    InfoIntermission {
        position: Qt.vector3d(4.88, 2.8, -0.0)
        eulerRotation: Qt.vector3d(-0, 90, 0)
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(16.64, -3.04, -11.04)
    }

    TrapSpikeShooter {
        targetname: "spike1_1"
        spawnflags: 1
        position: Qt.vector3d(9.92, 9.12, 2.0)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TrapSpikeShooter {
        targetname: "spike1_3"
        spawnflags: 1
        position: Qt.vector3d(11.2, 9.12, 2.0)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TrapSpikeShooter {
        targetname: "spike1_5"
        spawnflags: 1
        position: Qt.vector3d(12.48, 9.12, 2.0)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TrapSpikeShooter {
        targetname: "spike1_4"
        spawnflags: 1
        position: Qt.vector3d(11.84, 9.12, -2.0)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TrapSpikeShooter {
        targetname: "spike1_2"
        spawnflags: 1
        position: Qt.vector3d(10.56, 9.12, -2.0)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    RelayTrigger {
        target: "spike1_2"
        targetname: "spike1_1"
        delay: 0.2
        position: Qt.vector3d(9.92, 8.8, 2.0)
    }

    RelayTrigger {
        target: "spike1_3"
        targetname: "spike1_2"
        delay: 0.2
        position: Qt.vector3d(10.56, 8.8, -2.0)
    }

    RelayTrigger {
        target: "spike1_4"
        targetname: "spike1_3"
        delay: 0.2
        position: Qt.vector3d(11.2, 8.8, 2.0)
    }

    RelayTrigger {
        target: "spike1_5"
        targetname: "spike1_4"
        delay: 0.2
        position: Qt.vector3d(11.84, 8.8, -2.0)
    }

    MultipleTrigger {
        body: map.model_31
        position: Qt.vector3d(11.44, 9.04, 0.08)
        mins: Qt.vector3d(-2, -0.4, -0.88)
        maxs: Qt.vector3d(2, 0.4, 0.88)
        target: "spike1_1"
        wait: 2
    }

    Key1 {
        target: "silver_key_picked_up"
        spawnflags: 2048
        position: Qt.vector3d(0.0, -2.48, 4.8)
    }

    AmbientDrip {
        position: Qt.vector3d(-1.04, 0.4, -0.24)
    }

    Health {
        spawnflags: 1
        position: Qt.vector3d(7.6, -3.68, 6.24)
    }

    Button {
        body: map.model_34
        position: Qt.vector3d(-1.28, 4.96, 11.56)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        eulerRotation: Qt.vector3d(0, 0, 0)
        target: "door_secret_1"
        wait: -1
        sounds: 2
        lip: 0.04
        health: 1
    }

    SuperDamage {
        position: Qt.vector3d(-1.28, 2.48, 14.4)
    }

    SecretTrigger {
        body: map.model_36
        position: Qt.vector3d(-1.28, 3.12, 14.48)
        mins: Qt.vector3d(-1.6, -0.88, -0.559999)
        maxs: Qt.vector3d(1.6, 0.88, 0.56)
    }

    SecretTrigger {
        body: map.model_37
        position: Qt.vector3d(4.72, 2.24, -7.52)
        mins: Qt.vector3d(-0.56, -0.64, -1.12)
        maxs: Qt.vector3d(0.56, 0.64, 1.12)
    }

    Health {
        spawnflags: 2
        position: Qt.vector3d(4.64, 1.6, -7.36)
    }

    Button {
        body: map.model_39
        position: Qt.vector3d(6.88, 1.52, -9.56)
        mins: Qt.vector3d(-0.16, -0.0799999, -0.04)
        maxs: Qt.vector3d(0.16, 0.08, 0.04)
        eulerRotation: Qt.vector3d(0, 0, 0)
        target: "door_secret_2"
        wait: -1
        sounds: 2
        lip: 0.02
    }

    SuperDamage {
        position: Qt.vector3d(14.08, 4.72, -8.96)
    }

    TeleportDestination {
        targetname: "tele_secret_1"
        position: Qt.vector3d(14.08, 4.64, -6.24)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportTrigger {
        body: map.model_40
        position: Qt.vector3d(17.92, 0.72, -0.56)
        mins: Qt.vector3d(-0.32, -0.56, -0.08)
        maxs: Qt.vector3d(0.32, 0.56, 0.08)
        target: "tele_secret_1"
    }

    SecretTrigger {
        body: map.model_42
        position: Qt.vector3d(14, 4.96, -6.32)
        mins: Qt.vector3d(-0.4, -0.48, -0.56)
        maxs: Qt.vector3d(0.4, 0.48, 0.56)
    }

    RocketLauncherItem {
        spawnflags: 1792
        position: Qt.vector3d(7.04, 2.56, 8.0)
    }

    Rockets {
        spawnflags: 1793
        position: Qt.vector3d(7.84, 2.56, 7.68)
    }

    Rockets {
        spawnflags: 1793
        position: Qt.vector3d(7.84, 2.56, 8.48)
    }

    SuperShotgunItem {
        spawnflags: 1792
        position: Qt.vector3d(6.72, 0.32, 14.72)
    }

    NailgunItem {
        spawnflags: 1792
        position: Qt.vector3d(-3.2, 8.64, -0.0)
    }

    SuperShotgunItem {
        spawnflags: 1792
        position: Qt.vector3d(-6.72, 1.28, 3.52)
    }

    // doors
    Door {
        id: door_1
        body: map.model_1
        position: Qt.vector3d(4, -1.28, 8)
        mins: Qt.vector3d(-0.0799999, -1.12, -0.56)
        maxs: Qt.vector3d(0.0799999, 1.12, 0.56)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "door_grate1"
        spawnflags: 2048
        wait: -1
        sounds: 4
        lip: 1.28
        dmg: 99999
        owner: door_1
        enemy: door_1
    }

    Door {
        id: door_2
        body: map.model_2
        position: Qt.vector3d(0, -1.92, 4)
        mins: Qt.vector3d(-0.56, -0.52, -0.0799999)
        maxs: Qt.vector3d(0.56, 0.52, 0.0799999)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "door_grate2"
        spawnflags: 2048
        wait: -1
        sounds: 4
        lip: 0.04
        owner: door_2
        enemy: door_2
    }

    Door {
        id: door_4
        body: map.model_4
        position: Qt.vector3d(0, -1.92, -4)
        mins: Qt.vector3d(-0.56, -0.52, -0.0799999)
        maxs: Qt.vector3d(0.56, 0.52, 0.0799999)
        movedir: Qt.vector3d(0, 1, 0)
        spawnflags: 2064
        wait: -1
        sounds: 4
        lip: 0.04
        owner: door_4
        enemy: door_4
    }

    Door {
        id: door_7
        body: map.model_7
        position: Qt.vector3d(0, -4, 0)
        mins: Qt.vector3d(-0.52, -0.0799999, -0.56)
        maxs: Qt.vector3d(0.52, 0.0799999, 0.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
        targetname: "door_grate4"
        wait: -1
        speed: 0.5
        sounds: 4
        lip: 0.04
        owner: door_7
        enemy: door_7
    }

    Door {
        id: door_9
        body: map.model_9
        position: Qt.vector3d(8.64, 9.28, -0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.639999, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_9
        enemy: door_10
    }

    Door {
        id: door_10
        body: map.model_10
        position: Qt.vector3d(8.64, 9.28, 0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.639999, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_9
        enemy: door_9
    }

    Door {
        id: door_11
        body: map.model_11
        position: Qt.vector3d(5.44, 1.92, -0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_11
        enemy: door_12
    }

    Door {
        id: door_12
        body: map.model_12
        position: Qt.vector3d(5.44, 1.92, 0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_11
        enemy: door_11
    }

    Door {
        id: door_13
        body: map.model_13
        position: Qt.vector3d(17.6, 1.92, -8.64)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.320001)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_13
        enemy: door_14
    }

    Door {
        id: door_14
        body: map.model_14
        position: Qt.vector3d(17.6, 1.92, -8)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_13
        enemy: door_13
    }

    Door {
        id: door_15
        body: map.model_15
        position: Qt.vector3d(3.84, 3.2, 7.68)
        mins: Qt.vector3d(-0.0800002, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_15
        enemy: door_16
    }

    Door {
        id: door_16
        body: map.model_16
        position: Qt.vector3d(3.84, 3.2, 8.32)
        mins: Qt.vector3d(-0.0800002, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.320001)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_15
        enemy: door_15
    }

    Door {
        id: door_17
        body: map.model_17
        position: Qt.vector3d(-5.44, 1.92, -0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_17
        enemy: door_18
    }

    Door {
        id: door_18
        body: map.model_18
        position: Qt.vector3d(-5.44, 1.92, 0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_17
        enemy: door_17
    }

    Door {
        id: door_19
        body: map.model_19
        position: Qt.vector3d(-5.44, 6.24, -0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_19
        enemy: door_20
    }

    Door {
        id: door_20
        body: map.model_20
        position: Qt.vector3d(-5.44, 6.24, 0.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_19
        enemy: door_19
    }

    Door {
        id: door_22
        body: map.model_22
        position: Qt.vector3d(2.88, 9.28, -0.32)
        mins: Qt.vector3d(-0.0800002, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.639999, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_22
        enemy: door_23
    }

    Door {
        id: door_23
        body: map.model_23
        position: Qt.vector3d(2.88, 9.28, 0.32)
        mins: Qt.vector3d(-0.0800002, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.639999, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_22
        enemy: door_22
    }

    Door {
        id: door_24
        body: map.model_24
        position: Qt.vector3d(9.92, 3.2, 7.68)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_24
        enemy: door_25
    }

    Door {
        id: door_25
        body: map.model_25
        position: Qt.vector3d(9.92, 3.2, 8.32)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.320001)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_24
        enemy: door_24
    }

    Door {
        id: door_27
        body: map.model_27
        position: Qt.vector3d(-17.28, -0.64, 0)
        mins: Qt.vector3d(-1.76, -1.28, -1.12)
        maxs: Qt.vector3d(1.76, 1.28, 1.12)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "bridge_exit"
        spawnflags: 5
        wait: -1
        sounds: 4
        lip: 0.32
        dmg: 500
        owner: door_27
        enemy: door_27
    }

    Door {
        id: door_28
        body: map.model_28
        position: Qt.vector3d(-14.88, 0.68, 0)
        mins: Qt.vector3d(-0.16, -0.04, -0.16)
        maxs: Qt.vector3d(0.16, 0.04, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        target: "bridge_exit"
        spawnflags: 12
        wait: -1
        sounds: 1
        lip: 0.02
        owner: door_28
        enemy: door_28
    }

    Door {
        id: door_30
        body: map.model_30
        position: Qt.vector3d(-20.48, 1.28, 2.64)
        mins: Qt.vector3d(-0.640001, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.639999, 0.64, 0.0800002)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "bridge_exit"
        spawnflags: 1
        wait: -1
        speed: 0.25
        sounds: 1
        owner: door_30
        enemy: door_30
    }

    Door {
        id: door_32
        body: map.model_32
        position: Qt.vector3d(10.56, 1.92, -7.84)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0800009, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_32
        enemy: door_33
    }

    Door {
        id: door_33
        body: map.model_33
        position: Qt.vector3d(10.56, 1.92, -7.2)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0800009, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 1
        owner: door_32
        enemy: door_32
    }

    SecretDoor {
        id: door_35
        body: map.model_35
        position: Qt.vector3d(-1.28, 3.2, 13.6)
        mins: Qt.vector3d(-1.6, -0.96, -0.160001)
        maxs: Qt.vector3d(1.6, 0.96, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "door_secret_1"
        wait: -1
        sounds: 1
        owner: door_35
        enemy: door_35
    }

    SecretDoor {
        id: door_38
        body: map.model_38
        position: Qt.vector3d(5.6, 2.24, -7.52)
        mins: Qt.vector3d(-0.16, -0.64, -1.12)
        maxs: Qt.vector3d(0.16, 0.64, 1.12)
        eulerRotation: Qt.vector3d(0, 180, 0)
        targetname: "door_secret_2"
        wait: -1
        sounds: 1
        owner: door_38
        enemy: door_38
    }

    SecretDoor {
        id: door_41
        body: map.model_41
        position: Qt.vector3d(17.92, 0.72, -1.2)
        mins: Qt.vector3d(-0.32, -0.56, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.56, 0.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 1
        owner: door_41
        enemy: door_41
    }

    DoorTrigger {
        owner: door_9
    }

    DoorTrigger {
        owner: door_11
    }

    DoorTrigger {
        owner: door_13
    }

    DoorTrigger {
        owner: door_15
    }

    DoorTrigger {
        owner: door_17
    }

    DoorTrigger {
        owner: door_19
    }

    DoorTrigger {
        owner: door_22
    }

    DoorTrigger {
        owner: door_24
    }

    DoorTrigger {
        owner: door_32
    }


    Flame {
        position: Qt.vector3d(9.0, 9.4, 1.12)
    }

    Flame {
        position: Qt.vector3d(9.0, 9.4, -1.12)
    }

    Flame {
        position: Qt.vector3d(15.64, 9.4, -0.0)
    }

    Flame {
        position: Qt.vector3d(-3.8, 9.4, -0.0)
    }

    Flame {
        position: Qt.vector3d(2.52, 9.24, 1.12)
    }

    Flame {
        position: Qt.vector3d(2.52, 9.24, -1.12)
    }

    Flame {
        position: Qt.vector3d(12.48, 3.32, 3.16)
    }

    Flame {
        position: Qt.vector3d(9.92, 3.32, 3.16)
    }

    Flame {
        position: Qt.vector3d(9.92, 3.96, -3.16)
    }

    Flame {
        position: Qt.vector3d(13.12, 3.96, -3.16)
    }

    Flame {
        position: Qt.vector3d(8.36, 3.32, 0.96)
    }

    Flame {
        position: Qt.vector3d(-1.28, 6.2, 2.52)
    }

    Flame {
        position: Qt.vector3d(-1.28, 6.2, -2.52)
    }

    Flame {
        position: Qt.vector3d(-8.96, 6.2, 1.88)
    }

    Flame {
        position: Qt.vector3d(-8.96, 6.2, -1.88)
    }

    Flame {
        position: Qt.vector3d(5.08, 2.04, -1.28)
    }

    Flame {
        position: Qt.vector3d(-5.08, 2.04, 1.28)
    }

    Flame {
        position: Qt.vector3d(5.08, 2.04, 1.28)
    }

    Flame {
        position: Qt.vector3d(-5.08, 2.04, -1.28)
    }

    Flame {
        position: Qt.vector3d(15.04, 0.76, -3.88)
    }

    Flame {
        position: Qt.vector3d(13.12, 0.76, -3.88)
    }

    Flame {
        position: Qt.vector3d(17.24, 1.88, -7.2)
    }

    Flame {
        position: Qt.vector3d(17.24, 1.88, -9.44)
    }

    Flame {
        position: Qt.vector3d(10.92, 1.88, -6.4)
    }

    Flame {
        position: Qt.vector3d(10.92, 1.88, -8.64)
    }

    Flame {
        position: Qt.vector3d(8.16, 0.76, 10.2)
    }

    Flame {
        position: Qt.vector3d(6.88, 3.32, 5.8)
    }

    Flame {
        position: Qt.vector3d(-6.72, 2.04, -1.88)
    }

    Flame {
        position: Qt.vector3d(-5.8, 2.04, 4.32)
    }

    Flame {
        position: Qt.vector3d(-6.72, 2.04, 8.92)
    }

    Flame {
        position: Qt.vector3d(12.12, 0.92, 8.0)
    }

    Flame {
        position: Qt.vector3d(9.96, 0.92, 11.52)
    }

    Flame {
        position: Qt.vector3d(12.12, 0.92, 14.72)
    }

    Flame {
        position: Qt.vector3d(5.16, 0.92, 14.72)
    }

    Flame {
        position: Qt.vector3d(11.2, 3.32, 10.24)
    }

    Flame {
        position: Qt.vector3d(12.12, 3.32, 4.64)
    }

    Flame {
        position: Qt.vector3d(6.72, 2.04, 1.8)
    }

    Flame {
        position: Qt.vector3d(7.64, 2.04, -3.68)
    }

    Flame {
        position: Qt.vector3d(6.72, 2.04, -9.56)
    }

    Flame {
        position: Qt.vector3d(12.2, 0.92, -2.24)
    }

    Flame {
        position: Qt.vector3d(19.8, 0.92, -2.24)
    }

    Flame {
        position: Qt.vector3d(18.88, 1.88, -9.88)
    }

    Flame {
        position: Qt.vector3d(-3.2, 6.2, -2.52)
    }

    Flame {
        position: Qt.vector3d(-3.2, 6.2, 2.52)
    }

    Flame {
        position: Qt.vector3d(0.64, 6.2, -2.52)
    }

    Flame {
        position: Qt.vector3d(0.64, 6.2, 2.52)
    }

    Flame {
        position: Qt.vector3d(0.32, 3.32, 6.44)
    }

    Flame {
        position: Qt.vector3d(-3.8, 3.32, 12.16)
    }

    Flame {
        position: Qt.vector3d(2.72, 3.32, 7.08)
    }

    Flame {
        position: Qt.vector3d(-2.88, 2.2, 6.44)
    }

    Flame {
        position: Qt.vector3d(1.24, 3.32, 12.16)
    }

    Flame {
        position: Qt.vector3d(6.44, 9.4, 1.6)
    }

    Flame {
        position: Qt.vector3d(5.08, 9.4, -1.6)
    }

    Flame {
        position: Qt.vector3d(-21.72, 1.4, -1.28)
    }

    Flame {
        position: Qt.vector3d(-21.72, 1.4, 1.28)
    }

    Flame {
        position: Qt.vector3d(-17.28, 1.4, -1.28)
    }

    Flame {
        position: Qt.vector3d(-17.28, 1.4, 1.24)
    }

    Flame {
        position: Qt.vector3d(-11.76, 1.4, -2.52)
    }

    Flame {
        position: Qt.vector3d(-11.76, 1.4, 2.52)
    }

    Flame {
        position: Qt.vector3d(8.12, 0.92, 11.84)
    }

    Flame {
        position: Qt.vector3d(6.44, 9.4, -1.6)
    }

    Flame {
        position: Qt.vector3d(5.08, 9.4, 1.6)
    }

    Flame {
        position: Qt.vector3d(11.84, 2.04, -12.12)
    }

    Flame {
        position: Qt.vector3d(16.32, 2.04, -12.12)
    }

    Flame {
        position: Qt.vector3d(2.52, 6.2, -0.0)
    }

    Flame {
        position: Qt.vector3d(5.6, 0.76, 10.2)
    }

    Flame {
        position: Qt.vector3d(7.64, 2.04, -6.24)
    }

    Flame {
        position: Qt.vector3d(19.8, 1.88, -5.76)
    }

    Flame {
        position: Qt.vector3d(9.12, 2.04, -6.28)
    }

    // monsters

    Ogre {
        position: Qt.vector3d(-1.44, 2.96, 7.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-21.75, 2.4, 0)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(14.72, 8.88, 0)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(10.88, 0.56, 13.92)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(11.36, 0.56, 14.4)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(10.72, 0.56, 14.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    HellKnight {
        position: Qt.vector3d(10.56, 0.56, 10.56)
        eulerRotation: Qt.vector3d(0, 195, 0)
        spawnflags: 257
    }

    Fish {
        position: Qt.vector3d(-3.2, -2.8, -1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Fish {
        position: Qt.vector3d(-3.84, -2.8, 2.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Fish {
        position: Qt.vector3d(3.2, -2.8, 0.96)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Fish {
        position: Qt.vector3d(4.8, -2.16, 9.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Fish {
        position: Qt.vector3d(4.8, -2.16, 6.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(11.68, 0.72, 8)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-4.32, 3.28, 0.32)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Wizard {
        position: Qt.vector3d(-4.32, 3.28, -1.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Zombie {
        position: Qt.vector3d(15.84, -2.8, -8.16)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 256
    }

    ZombieV2 {
        position: Qt.vector3d(15.84, -2.8, -5.12)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    Zombie {
        position: Qt.vector3d(14.56, -2.8, -6.56)
        eulerRotation: Qt.vector3d(0, 60, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(13.92, -2.8, -8.64)
        eulerRotation: Qt.vector3d(0, 105, 0)
    }

    Ogre {
        position: Qt.vector3d(18.88, 0.4, -2.24)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(19.04, 1.52, -8.32)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(18.4, 1.52, -7.68)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(18.4, 1.52, -8.24)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(19.2, 1.52, -7.52)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(9.44, 1.52, -7.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Demon {
        position: Qt.vector3d(6.68, 1.52, 1.28)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    HellKnight {
        position: Qt.vector3d(-6.76, 1.52, 5)
        eulerRotation: Qt.vector3d(0, 15, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-7.36, 1.52, 5.52)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-6.92, 1.52, 5.68)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-6.4, 1.52, 5.48)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 1
    }

    Demon {
        position: Qt.vector3d(11.2, 2.8, 1.96)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(14.24, 3.44, 2.36)
        eulerRotation: Qt.vector3d(0, 120, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(10.72, 3.44, -2.52)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(8.68, 2.84, 2.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(8.52, 2.84, 1.48)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(8.52, 2.84, 2)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-9.12, 2.28, -0.64)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-9.12, 2.28, 0.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Fish {
        position: Qt.vector3d(-8.92, -6.28, -0.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Fish {
        position: Qt.vector3d(-12.56, -2.72, 0.04)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Shambler {
        position: Qt.vector3d(-2.48, 9.04, 0.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(16.76, 1.56, -8.28)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(7.36, 8.88, 3.68)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Ogre {
        position: Qt.vector3d(7.36, 8.88, -3.72)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Fish {
        position: Qt.vector3d(13.07, -1.68, -11.11)
        eulerRotation: Qt.vector3d(0, 150, 0)
        spawnflags: 256
    }

    Fish {
        position: Qt.vector3d(13.12, -1.68, -4.68)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Fish {
        position: Qt.vector3d(12.41, -1.68, -11.31)
        eulerRotation: Qt.vector3d(0, 150, 0)
    }

    Knight {
        position: Qt.vector3d(-2.56, 2.32, 12.8)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-3.04, 2.32, 12.64)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-2.24, 2.32, 12.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Fish {
        position: Qt.vector3d(15.04, -1.68, -4.68)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Zombie {
        position: Qt.vector3d(-17.44, 1.04, 0.48)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-16.96, 1.04, -0.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(13.92, 1.68, -11.36)
        eulerRotation: Qt.vector3d(0, 195, 0)
        spawnflags: 257
    }

    HellKnight {
        position: Qt.vector3d(12.64, 3.2, -1.44)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(-6.72, 3.81, 1.44)
        eulerRotation: Qt.vector3d(0, 210, 0)
        spawnflags: 1
    }

}
