import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.lq_e0m4

World {
    id: root

    displayName: "Feint-free funtime"
    worldtype: 0

    readonly property alias player: player

    Lq_e0m4_map {
        id: map
    }

    Lq_e0m4_map_hull0 {
    }

    Key2 {
        spawnflags: 2048
        position: Qt.vector3d(0.0, 0.56, -8.48)
    }

    Plat {
        body: map.model_1
        position: Qt.vector3d(0, -1.64, 3.84)
        mins: Qt.vector3d(-0.64, -1.64, -0.64)
        maxs: Qt.vector3d(0.64, 1.64, 0.64)
        targetname: "plat_1"
    }

    OnceTrigger {
        body: map.model_2
        position: Qt.vector3d(0, -2.56, 2)
        mins: Qt.vector3d(-1.12, -0.64, -1.2)
        maxs: Qt.vector3d(1.12, 0.64, 1.2)
        target: "plat_1"
    }

    Plat {
        body: map.model_3
        position: Qt.vector3d(-13.44, -2.12, 20.48)
        mins: Qt.vector3d(-0.639999, -1.48, -0.639999)
        maxs: Qt.vector3d(0.64, 1.48, 0.640001)
        targetname: "plat_2"
    }

    OnceTrigger {
        body: map.model_4
        position: Qt.vector3d(-10.4, -2.88, 20.48)
        mins: Qt.vector3d(-0.160001, -0.64, -0.639999)
        maxs: Qt.vector3d(0.16, 0.64, 0.640001)
        target: "plat_2"
    }

    Health {
        spawnflags: 2
        position: Qt.vector3d(-16.16, -3.52, 22.08)
    }

    OnceTrigger {
        body: map.model_6
        position: Qt.vector3d(-9.12, 0.08, 15.98)
        mins: Qt.vector3d(-0.16, -0.88, -1.3)
        maxs: Qt.vector3d(0.16, 0.88, 1.3)
        target: "door_lava"
    }

    OnceTrigger {
        body: map.model_7
        position: Qt.vector3d(-2.88, 0.4, 20.48)
        mins: Qt.vector3d(-0.32, -1.04, -0.639999)
        maxs: Qt.vector3d(0.32, 1.04, 0.640001)
        target: "door_teleport"
    }

    Shells {
        position: Qt.vector3d(5.32, 0.32, 0.88)
    }

    ChangeLevelTrigger {
        body: map.model_8
        position: Qt.vector3d(11.12, 0.48, 20.48)
        mins: Qt.vector3d(-0.400001, -1.12, -0.959999)
        maxs: Qt.vector3d(0.4, 1.12, 0.960001)
        spawnflags: 2048
        map: "lq_e0m5"
    }

    TrapSpikeShooter {
        targetname: "spikeshooter_1"
        position: Qt.vector3d(-0.64, 0.48, 10.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TrapSpikeShooter {
        targetname: "spikeshooter_2"
        position: Qt.vector3d(-0.64, 0.48, 6.96)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    MultipleTrigger {
        body: map.model_12
        position: Qt.vector3d(-0.64, 0.48, 6.4)
        mins: Qt.vector3d(-0.32, -0.24, -0.64)
        maxs: Qt.vector3d(0.32, 0.24, 0.64)
        target: "spikeshooter_2"
        targetname: "trigger_spikeshooter_2"
        wait: 0.5
    }

    MultipleTrigger {
        body: map.model_13
        position: Qt.vector3d(-0.64, 0.48, 11.52)
        mins: Qt.vector3d(-0.32, -0.24, -0.64)
        maxs: Qt.vector3d(0.32, 0.24, 0.639999)
        target: "spikeshooter_1"
        targetname: "trigger_spikeshooter_1"
        wait: 0.5
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(-7.2, -3.2, -4.16)
    }

    Rockets {
        position: Qt.vector3d(-7.36, -3.2, -2.88)
    }

    Rockets {
        position: Qt.vector3d(-7.36, -3.2, -3.2)
    }

    Health {
        position: Qt.vector3d(-7.36, -3.2, -5.12)
    }

    Shells {
        position: Qt.vector3d(-4.56, -1.92, 4.62)
    }

    Shells {
        position: Qt.vector3d(-12.08, -2.56, 2.74)
    }

    Shells {
        position: Qt.vector3d(-10.0, 0.0, 7.0)
    }

    Spikes {
        position: Qt.vector3d(-5.6, 0.0, 7.0)
    }

    Health {
        position: Qt.vector3d(-7.6, 0.0, -5.2)
    }

    Health {
        position: Qt.vector3d(-7.6, 0.0, -9.84)
    }

    TeleportDestination {
        targetname: "teletarget_shambler"
        position: Qt.vector3d(9.92, -0.32, 20.48)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportTrigger {
        body: map.model_14
        position: Qt.vector3d(5.76, 0.16, 35.2)
        mins: Qt.vector3d(-0.64, -0.16, -0.639999)
        maxs: Qt.vector3d(0.64, 0.16, 0.639999)
        target: "teletarget_shambler"
        targetname: "tele_shambler"
        spawnflags: 2
    }

    Spikes {
        position: Qt.vector3d(2.16, -1.2, 22.56)
    }

    Spikes {
        position: Qt.vector3d(2.16, -1.2, 18.72)
    }

    Armor {
        skin: 0
        position: Qt.vector3d(-8.32, -3.52, 10.48)
    }

    Health {
        position: Qt.vector3d(-5.84, 0.0, 13.36)
    }

    Rockets {
        position: Qt.vector3d(-0.48, 0.32, 10.08)
    }

    Rockets {
        position: Qt.vector3d(-0.48, 0.32, 8.08)
    }

    Shells {
        position: Qt.vector3d(-9.92, 0.0, 13.36)
    }

    Shells {
        position: Qt.vector3d(-8.48, -3.52, 22.24)
    }

    Spikes {
        position: Qt.vector3d(-11.88, -3.52, 11.2)
    }

    Shells {
        position: Qt.vector3d(-1.92, 0.36, 8.04)
    }

    Shells {
        position: Qt.vector3d(-1.92, 0.36, 10.16)
    }

    Shells {
        position: Qt.vector3d(-8.68, 0.0, -9.24)
    }

    Shells {
        position: Qt.vector3d(-8.68, 0.0, -9.24)
    }

    Shells {
        position: Qt.vector3d(-12.12, 0.0, -9.24)
    }

    OnceTrigger {
        body: map.model_15
        position: Qt.vector3d(6.24, -0.32, 17.44)
        mins: Qt.vector3d(-0.8, -0.96, -0.799999)
        maxs: Qt.vector3d(0.8, 0.96, 0.800001)
        target: "tele_shambler"
        delay: 0.5
    }

    InfoIntermission {
        position: Qt.vector3d(-1.84, 1.36, 20.56)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Shells {
        position: Qt.vector3d(1.44, -1.2, 25.44)
    }

    Shells {
        position: Qt.vector3d(4.64, -1.2, 25.44)
    }

    TrapSpikeShooter {
        targetname: "spikeshooter_6"
        position: Qt.vector3d(-7.52, 1.5, 23.52)
    }

    TrapSpikeShooter {
        targetname: "spikeshooter_5"
        position: Qt.vector3d(-8.8, 1.5, 24.8)
    }

    TrapSpikeShooter {
        targetname: "spikeshooter_4"
        position: Qt.vector3d(-10.4, 1.5, 24.16)
    }

    TrapSpikeShooter {
        targetname: "spikeshooter_3"
        position: Qt.vector3d(-11.68, 1.5, 23.52)
    }

    MultipleTrigger {
        body: map.model_16
        position: Qt.vector3d(-7.52, 0.36, 23.52)
        mins: Qt.vector3d(-0.32, -0.68, -0.32)
        maxs: Qt.vector3d(0.32, 0.68, 0.32)
        target: "spikeshooter_6"
        wait: 0.25
    }

    MultipleTrigger {
        body: map.model_17
        position: Qt.vector3d(-8.8, 0.36, 24.8)
        mins: Qt.vector3d(-0.320001, -0.68, -0.32)
        maxs: Qt.vector3d(0.32, 0.68, 0.320002)
        target: "spikeshooter_5"
        wait: 0.25
    }

    MultipleTrigger {
        body: map.model_18
        position: Qt.vector3d(-10.4, 0.36, 24.16)
        mins: Qt.vector3d(-0.320001, -0.68, -0.32)
        maxs: Qt.vector3d(0.32, 0.68, 0.32)
        target: "spikeshooter_4"
        wait: 0.25
    }

    MultipleTrigger {
        body: map.model_19
        position: Qt.vector3d(-11.68, 0.36, 23.52)
        mins: Qt.vector3d(-0.32, -0.68, -0.32)
        maxs: Qt.vector3d(0.320001, 0.68, 0.32)
        target: "spikeshooter_3"
        wait: 0.25
    }

    SuperShotgunItem {
        position: Qt.vector3d(12.48, 1.28, 15.04)
    }

    Shells {
        position: Qt.vector3d(12.8, 1.28, 12.64)
    }

    Shells {
        position: Qt.vector3d(10.72, 1.28, 15.68)
    }

    Player {
        id: player
        position: Qt.vector3d(16.56, 5.04, 7.36)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    OnceTrigger {
        body: map.model_23
        position: Qt.vector3d(12.96, 4.32, 7.36)
        mins: Qt.vector3d(-2.72, -0.16, -1.92)
        maxs: Qt.vector3d(2.72, 0.16, 1.92)
        target: "door_squisher1"
    }

    Shells {
        position: Qt.vector3d(7.28, 0.0, 10.0)
    }

    SecretTrigger {
        body: map.model_24
        position: Qt.vector3d(2.84, -0.8, 0.32)
        mins: Qt.vector3d(-0.0400002, -0.48, -0.32)
        maxs: Qt.vector3d(0.04, 0.48, 0.32)
    }

    OnceTrigger {
        body: map.model_25
        position: Qt.vector3d(-15.2, 0.16, 18.08)
        mins: Qt.vector3d(-0.8, -0.8, -0.16)
        maxs: Qt.vector3d(0.8, 0.8, 0.16)
        target: "knight_joe"
    }

    SecretTrigger {
        body: map.model_27
        position: Qt.vector3d(-4.72, -2.72, 16)
        mins: Qt.vector3d(-0.0799999, -0.48, -0.32)
        maxs: Qt.vector3d(0.0800004, 0.48, 0.32)
    }

    Button {
        body: map.model_28
        position: Qt.vector3d(-0.64, 1.9, 6.4)
        mins: Qt.vector3d(-0.16, -0.02, -0.16)
        maxs: Qt.vector3d(0.16, 0.02, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        wait: -1
        sounds: 2
        lip: 0.02
        health: 1
    }

    Button {
        body: map.model_29
        position: Qt.vector3d(-0.64, 1.9, 11.52)
        mins: Qt.vector3d(-0.16, -0.02, -0.160001)
        maxs: Qt.vector3d(0.16, 0.02, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        wait: -1
        sounds: 2
        lip: 0.02
        health: 1
    }

    SecretTrigger {
        body: map.model_30
        position: Qt.vector3d(-8.48, -3.28, 16)
        mins: Qt.vector3d(-0.160001, -0.0799999, -0.48)
        maxs: Qt.vector3d(0.16, 0.0799999, 0.48)
    }

    NailgunItem {
        position: Qt.vector3d(-7.68, 0.32, 6.88)
    }

    Spikes {
        position: Qt.vector3d(-6.0, 0.0, 7.0)
    }

    Shells {
        position: Qt.vector3d(5.96, 0.32, 0.88)
    }

    RelayTrigger {
        target: "door_trapescape"
        targetname: "door_squisher1"
        delay: 4
        position: Qt.vector3d(10.0, 5.04, 7.2)
    }

    Button {
        body: map.model_32
        position: Qt.vector3d(9.04, 4.96, 7.36)
        mins: Qt.vector3d(-0.24, -0.16, -0.64)
        maxs: Qt.vector3d(0.24, 0.16, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        target: "door_trap1"
        wait: -1
        lip: 0.2
    }

    SuperDamage {
        position: Qt.vector3d(3.28, -1.04, 0.32)
    }

    RocketLauncherItem {
        position: Qt.vector3d(5.44, 2.56, 8.96)
    }

    SecretTrigger {
        body: map.model_35
        position: Qt.vector3d(5.44, 2.72, 8.96)
        mins: Qt.vector3d(-1.28, -0.16, -1.12)
        maxs: Qt.vector3d(1.28, 0.16, 1.12)
    }

    Rockets {
        position: Qt.vector3d(7.2, 2.56, 9.12)
    }

    Rockets {
        position: Qt.vector3d(7.52, 2.56, 9.12)
    }

    Armor {
        skin: 0
        position: Qt.vector3d(5.76, 0.32, 0.76)
    }

    Button {
        body: map.model_37
        position: Qt.vector3d(6.48, 3.5, 8.88)
        mins: Qt.vector3d(-0.16, -0.02, -0.16)
        maxs: Qt.vector3d(0.16, 0.02, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        target: "counter_secret_ceiling"
        wait: -1
        sounds: 2
        lip: 0.02
        health: 1
    }

    Button {
        body: map.model_38
        position: Qt.vector3d(10.8, 3.82, 7.36)
        mins: Qt.vector3d(-0.16, -0.02, -0.16)
        maxs: Qt.vector3d(0.16, 0.02, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        target: "counter_secret_ceiling"
        wait: -1
        sounds: 2
        lip: 0.02
        health: 1
    }

    CounterTrigger {
        target: "door_secret_ceiling"
        targetname: "counter_secret_ceiling"
        count: 2
        position: Qt.vector3d(10.64, 3.76, 7.72)
    }

    Armor {
        skin: 0
        position: Qt.vector3d(-1.6, -2.56, 2.88)
    }

    SecretTrigger {
        body: map.model_41
        position: Qt.vector3d(-1.92, -2.08, 2.88)
        mins: Qt.vector3d(-0.32, -0.48, -0.32)
        maxs: Qt.vector3d(0.32, 0.48, 0.32)
    }

    Spikes {
        position: Qt.vector3d(-12.72, -3.52, 11.2)
    }

    Health {
        position: Qt.vector3d(-5.92, -1.92, 5.28)
    }

    // doors
    Door {
        id: door_5
        body: map.model_5
        position: Qt.vector3d(-11.68, -0.88, 16)
        mins: Qt.vector3d(-2.4, -0.08, -1.28)
        maxs: Qt.vector3d(2.4, 0.08, 1.28)
        eulerRotation: Qt.vector3d(0, 180, 0)
        targetname: "door_lava"
        wait: -1
        speed: 2
        sounds: 4
        owner: door_5
        enemy: door_5
    }

    Door {
        id: door_9
        body: map.model_9
        position: Qt.vector3d(3.2, 0.96, 9.28)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.320001)
        maxs: Qt.vector3d(0.0800002, 0.96, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 2056
        wait: -1
        sounds: 1
        owner: door_9
        enemy: door_10
    }

    Door {
        id: door_10
        body: map.model_10
        position: Qt.vector3d(3.2, 0.96, 8.64)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0800002, 0.96, 0.320001)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 2056
        wait: -1
        sounds: 1
        owner: door_9
        enemy: door_9
    }

    Door {
        id: door_11
        body: map.model_11
        position: Qt.vector3d(-8, -1.67, 2.56)
        mins: Qt.vector3d(-0.0200005, -0.87, -0.56)
        maxs: Qt.vector3d(0.02, 0.87, 0.56)
        movedir: Qt.vector3d(0, -1, 0)
        wait: 1
        speed: 3.5
        sounds: 4
        dmg: 35
        owner: door_11
        enemy: door_11
    }

    Door {
        id: door_20
        body: map.model_20
        position: Qt.vector3d(11.84, 4, 7.36)
        mins: Qt.vector3d(-0.64, -0.12, -0.64)
        maxs: Qt.vector3d(0.639999, 0.12, 0.64)
        eulerRotation: Qt.vector3d(0, 90, 0)
        targetname: "door_trap1"
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_20
        enemy: door_20
    }

    Door {
        id: door_21
        body: map.model_21
        position: Qt.vector3d(12.96, 4.8, 4.48)
        mins: Qt.vector3d(-2.72, -0.64, -0.96)
        maxs: Qt.vector3d(2.72, 0.64, 0.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 4
        wait: 1
        speed: 0.2
        sounds: 1
        lip: 0.04
        owner: door_21
        enemy: door_22
    }

    Door {
        id: door_22
        body: map.model_22
        position: Qt.vector3d(12.96, 4.8, 10.24)
        mins: Qt.vector3d(-2.72, -0.64, -0.96)
        maxs: Qt.vector3d(2.72, 0.64, 0.96)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 4
        wait: 1
        speed: 0.2
        sounds: 1
        lip: 0.04
        owner: door_21
        enemy: door_21
    }

    SecretDoor {
        id: door_26
        body: map.model_26
        position: Qt.vector3d(-5.02, -2.72, 16)
        mins: Qt.vector3d(-0.0799999, -0.48, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.48, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_26
        enemy: door_26
    }

    Door {
        id: door_31
        body: map.model_31
        position: Qt.vector3d(10.08, 4.48, 7.36)
        mins: Qt.vector3d(-0.16, -0.32, -0.64)
        maxs: Qt.vector3d(0.16, 0.32, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_trapescape"
        spawnflags: 36
        wait: -1
        speed: 0.2
        sounds: 1
        lip: 0.32
        owner: door_31
        enemy: door_31
    }

    SecretDoor {
        id: door_33
        body: map.model_33
        position: Qt.vector3d(2.66, -0.8, 0.32)
        mins: Qt.vector3d(-0.0799999, -0.48, -0.32)
        maxs: Qt.vector3d(0.0800002, 0.48, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_33
        enemy: door_33
    }

    SecretDoor {
        id: door_36
        body: map.model_36
        position: Qt.vector3d(10.18, 2.4, 7.36)
        mins: Qt.vector3d(-0.0600004, -0.48, -0.32)
        maxs: Qt.vector3d(0.0599995, 0.48, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        targetname: "door_secret_ceiling"
        spawnflags: 8
        wait: -1
        sounds: 1
        owner: door_36
        enemy: door_36
    }

    Door {
        id: door_39
        body: map.model_39
        position: Qt.vector3d(4.48, 0.32, 20.48)
        mins: Qt.vector3d(-7.04, -0.96, -0.959999)
        maxs: Qt.vector3d(7.04, 0.96, 0.960001)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "door_teleport"
        spawnflags: 2048
        wait: -1
        speed: 6
        sounds: 4
        lip: 0.64
        owner: door_39
        enemy: door_39
    }

    SecretDoor {
        id: door_40
        body: map.model_40
        position: Qt.vector3d(-3.72, -2.08, 2.24)
        mins: Qt.vector3d(-0.0799999, -0.48, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.48, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 1
        owner: door_40
        enemy: door_40
    }


    Flame {
        position: Qt.vector3d(-2.52, 0.76, -6.76)
    }

    Flame {
        position: Qt.vector3d(2.52, 0.76, -6.76)
    }

    Flame {
        position: Qt.vector3d(2.52, 0.76, 0.96)
    }

    Flame {
        position: Qt.vector3d(-2.52, 0.76, 0.96)
    }

    Flame {
        position: Qt.vector3d(2.52, -2.76, -2.88)
    }

    Flame {
        position: Qt.vector3d(-2.52, -2.76, -2.88)
    }

    Flame {
        position: Qt.vector3d(0.0, -2.76, -6.36)
    }

    Flame {
        position: Qt.vector3d(-3.88, -1.8, 2.68)
    }

    Flame {
        position: Qt.vector3d(-12.12, -1.8, 2.56)
    }

    Flame {
        position: Qt.vector3d(-6.08, 0.76, -10.2)
    }

    Flame {
        position: Qt.vector3d(-14.36, 0.76, -9.56)
    }

    Flame {
        position: Qt.vector3d(-17.88, 0.76, -7.32)
    }

    Flame {
        position: Qt.vector3d(-8.36, -0.84, -3.84)
    }

    Flame {
        position: Qt.vector3d(-15.36, -0.2, -2.6)
    }

    Flame {
        position: Qt.vector3d(-11.52, -0.84, -2.6)
    }

    Flame {
        position: Qt.vector3d(0.0, 0.76, 4.76)
    }

    Flame {
        position: Qt.vector3d(0.0, -2.44, 5.08)
    }

    Flame {
        position: Qt.vector3d(5.76, 1.08, 0.36)
    }

    Flame {
        position: Qt.vector3d(7.64, 0.76, 10.56)
    }

    Flame {
        position: Qt.vector3d(3.88, 0.76, 7.36)
    }

    Flame {
        position: Qt.vector3d(1.6, 0.76, 5.8)
    }

    Flame {
        position: Qt.vector3d(1.6, 0.76, 12.12)
    }

    Flame {
        position: Qt.vector3d(-2.88, 0.76, 5.8)
    }

    Flame {
        position: Qt.vector3d(-2.88, 0.76, 12.12)
    }

    Flame {
        position: Qt.vector3d(-7.68, 0.12, 17.92)
    }

    Flame {
        position: Qt.vector3d(-13.6, 0.12, 19.88)
    }

    Flame {
        position: Qt.vector3d(-8.32, -2.44, 22.36)
    }

    Flame {
        position: Qt.vector3d(-8.32, -2.76, 10.28)
    }

    Flame {
        position: Qt.vector3d(8.92, 0.44, 23.04)
    }

    Flame {
        position: Qt.vector3d(8.92, 0.44, 17.92)
    }

    Flame {
        position: Qt.vector3d(-1.88, 0.44, 22.4)
    }

    Flame {
        position: Qt.vector3d(-1.88, 0.44, 18.56)
    }

    Flame {
        position: Qt.vector3d(10.24, 0.44, 19.24)
    }

    Flame {
        position: Qt.vector3d(10.24, 0.44, 21.72)
    }

    Flame {
        position: Qt.vector3d(2.52, 0.12, 18.56)
    }

    Flame {
        position: Qt.vector3d(2.52, 0.12, 22.4)
    }

    Flame {
        position: Qt.vector3d(3.88, 0.12, 18.56)
    }

    Flame {
        position: Qt.vector3d(3.88, 0.12, 22.4)
    }

    Flame {
        position: Qt.vector3d(3.88, 0.76, 10.56)
    }

    Flame {
        position: Qt.vector3d(-7.68, 1.08, 6.44)
    }

    Flame {
        position: Qt.vector3d(-0.04, 1.08, 8.96)
    }

    Flame {
        position: Qt.vector3d(-10.2, -2.76, 19.52)
    }

    Flame {
        position: Qt.vector3d(-5.16, -2.76, 16.64)
    }

    Flame {
        position: Qt.vector3d(-11.64, 0.12, 18.6)
    }

    Flame {
        position: Qt.vector3d(-10.2, 0.12, 20.48)
    }

    Flame {
        position: Qt.vector3d(-12.16, -2.76, 18.6)
    }

    Flame {
        position: Qt.vector3d(-5.16, 0.76, 11.52)
    }

    Flame {
        position: Qt.vector3d(7.64, 0.76, 7.36)
    }

    Flame {
        position: Qt.vector3d(5.76, 0.76, 14.68)
    }

    Flame {
        position: Qt.vector3d(11.84, 2.68, 5.48)
    }

    Flame {
        position: Qt.vector3d(12.44, 2.36, 10.56)
    }

    Flame {
        position: Qt.vector3d(12.76, 2.04, 15.32)
    }

    Flame {
        position: Qt.vector3d(16.32, 5.88, 8.92)
    }

    Flame {
        position: Qt.vector3d(16.32, 5.88, 5.8)
    }

    Flame {
        position: Qt.vector3d(13.12, 5.88, 5.48)
    }

    Flame {
        position: Qt.vector3d(13.12, 5.88, 9.24)
    }

    Flame {
        position: Qt.vector3d(-16.6, 0.12, 20.8)
    }

    Flame {
        position: Qt.vector3d(-14.44, 0.12, 18.56)
    }

    Flame {
        position: Qt.vector3d(-16.6, 0.12, 16.0)
    }

    Flame {
        position: Qt.vector3d(-11.84, -2.76, 12.72)
    }

    Flame {
        position: Qt.vector3d(-17.24, -2.76, 16.0)
    }

    Flame {
        position: Qt.vector3d(-14.44, -2.76, 20.48)
    }

    Flame {
        position: Qt.vector3d(-11.52, -0.2, 14.76)
    }

    Flame {
        position: Qt.vector3d(-7.64, -2.44, -4.16)
    }

    Flame {
        position: Qt.vector3d(0.0, 1.08, -8.92)
    }

    Flame {
        position: Qt.vector3d(-6.08, 0.76, -5.16)
    }

    Flame {
        position: Qt.vector3d(-5.48, 0.76, -7.68)
    }

    Flame {
        position: Qt.vector3d(8.32, 3.0, 7.08)
    }

    Flame {
        position: Qt.vector3d(-2.56, -2.1, 4.2)
    }

    Flame {
        position: Qt.vector3d(-16.0, -2.76, 10.92)
    }

    Flame {
        position: Qt.vector3d(-5.76, -1.16, 5.4)
    }

    Flame {
        position: Qt.vector3d(-10.24, -1.16, 5.4)
    }

    Flame {
        position: Qt.vector3d(-6.72, -1.8, 1.32)
    }

    Flame {
        position: Qt.vector3d(-10.2, 0.76, 11.2)
    }

    // monsters

    Ogre {
        position: Qt.vector3d(-0.64, 0.56, 8.96)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(0.16, 0.24, 2.4)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(0.48, 0.24, 1.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(0.64, -3.12, -5.44)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 256
    }

    Demon {
        position: Qt.vector3d(-5.92, 0.24, -7.64)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-14.72, 0.24, -5.44)
        eulerRotation: Qt.vector3d(0, 225, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-5.6, -2.32, 2.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Knight {
        position: Qt.vector3d(-1.72, -3.12, -0.43)
        eulerRotation: Qt.vector3d(0, -15, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-4.27, -3.12, -3.4)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 2
    }

    HellKnight {
        position: Qt.vector3d(-11.31, -2.16, 1.99)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 257
    }

    Ogre {
        position: Qt.vector3d(-10.24, 0.24, -6.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Zombie {
        position: Qt.vector3d(2.08, -3.12, -0.16)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(1.6, -3.12, 0.08)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    Zombie {
        position: Qt.vector3d(1.6, -3.12, -0.72)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    Ogre {
        position: Qt.vector3d(-4.32, 0.24, -6.16)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 1
    }

    Shambler {
        position: Qt.vector3d(5.76, 1.2, 35.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
        targetname: "tele_shambler"
    }

    Knight {
        position: Qt.vector3d(-5.36, -3.28, 17.52)
        eulerRotation: Qt.vector3d(0, 75, 0)
    }

    Knight {
        position: Qt.vector3d(-5.36, -3.28, 16.72)
        eulerRotation: Qt.vector3d(0, 75, 0)
    }

    Knight {
        position: Qt.vector3d(-4.16, -0.4, 19.92)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-4.08, -0.4, 20.64)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-3.6, -0.4, 19.44)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-9.92, 0.24, 8.88)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-9.68, 0.24, 9.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-9.68, 0.24, 7.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(2.24, 0.24, 8.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-9.68, 0.24, 9.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-5.36, -3.28, 18.24)
        eulerRotation: Qt.vector3d(0, 75, 0)
    }

    HellKnight {
        position: Qt.vector3d(-16.16, -0.72, -3.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-2.96, -0.4, 21.48)
        eulerRotation: Qt.vector3d(0, 75, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(0.64, -0.96, 18.4)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    Knight {
        position: Qt.vector3d(0.64, -0.96, 20.32)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    Knight {
        position: Qt.vector3d(4.16, -0.96, 19.68)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    Knight {
        position: Qt.vector3d(2.4, -0.96, 16.8)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(0.96, -3.12, 0.08)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    Zombie {
        position: Qt.vector3d(0.96, -3.12, -0.72)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    HellKnight {
        position: Qt.vector3d(-13.52, -0.4, 20.48)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "knight_joe"
    }

    Knight {
        position: Qt.vector3d(-1.08, -3.12, -0.43)
        eulerRotation: Qt.vector3d(0, -15, 0)
    }

    Wizard {
        position: Qt.vector3d(-0.32, 3.28, -5.76)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 257
    }

    Wizard {
        position: Qt.vector3d(0.32, 2.64, -5.76)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(6.56, 2, 22.08)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Wizard {
        position: Qt.vector3d(6.56, 2, 18.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Demon {
        position: Qt.vector3d(5.76, 0.24, 3.52)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(7.44, 0.24, 8.08)
        eulerRotation: Qt.vector3d(0, 60, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(0.8, 0.24, 2.72)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(1.44, 0.24, 2.48)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 0
    }

    Knight {
        position: Qt.vector3d(1.44, 0.24, 1.92)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 0
    }

    Wizard {
        position: Qt.vector3d(-0.72, 2.8, -5.76)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(11.04, 4.72, 7.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(-10.8, -0.4, 20.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-10.8, -0.4, 19.76)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-15.47, -0.4, 21.88)
        eulerRotation: Qt.vector3d(0, -15, 0)
    }

    Knight {
        position: Qt.vector3d(-15.52, -3.28, 21.44)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(-16.64, -3.28, 21.44)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(-7.36, -0.4, 15.2)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-8, -0.4, 14.88)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    ZombieV2 {
        position: Qt.vector3d(-6.96, -1.64, 5)
        eulerRotation: Qt.vector3d(0, -45, 0)
    }

    HellKnight {
        position: Qt.vector3d(-9.92, 0.24, 8.4)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 768
    }

    Dog {
        position: Qt.vector3d(5.76, 2.16, 35.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1536
        targetname: "tele_shambler"
    }

}
