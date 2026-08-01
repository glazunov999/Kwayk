import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.lq_e0m8

World {
    id: root

    displayName: "Satan's Smelly Spawn"
    worldtype: 0

    readonly property alias player: player

    Lq_e0m8_map {
        id: map
    }

    Lq_e0m8_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(-0.32, -14.16, 13.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Button {
        // *1 func_button
        body: map.model_1
        position: Qt.vector3d(33.24, -23.76, 22.08)
        mins: Qt.vector3d(-0.0399971, -0.24, -0.24)
        maxs: Qt.vector3d(0.0400009, 0.24, 0.24)
        movedir: Qt.vector3d(1, 0, 0)
        target: "lift1"
        spawnflags: 2048
        wait: -1
        message: "elevator active"
    }

    Spikes {
        position: Qt.vector3d(24.48, -16.0, 12.32)
    }

    Spikes {
        position: Qt.vector3d(29.12, -16.0, 18.4)
    }

    Button {
        // *3 func_button
        body: map.model_3
        position: Qt.vector3d(23.04, -24.36, 20.52)
        mins: Qt.vector3d(-0.240002, -0.24, -0.0400009)
        maxs: Qt.vector3d(0.24, 0.24, 0.039999)
        movedir: Qt.vector3d(0, 0, -1)
        target: "bars_elevator_button"
        spawnflags: 2048
        wait: -1
        message: "bars raised nearby"
    }

    Spikes {
        position: Qt.vector3d(23.52, -16.0, 13.12)
    }

    Spikes {
        position: Qt.vector3d(24.48, -16.0, 18.56)
    }

    Health {
        spawnflags: 2048
        position: Qt.vector3d(27.04, -25.6, 10.72)
    }

    Spikes {
        position: Qt.vector3d(21.92, -16.0, 15.52)
    }

    Armor {
        skin: 1
        position: Qt.vector3d(33.6, -14.08, 9.6)
    }

    Health {
        position: Qt.vector3d(29.44, -16.16, 12.64)
    }

    Spikes {
        spawnflags: 2048
        position: Qt.vector3d(26.4, -25.6, 10.72)
    }

    Health {
        position: Qt.vector3d(30.24, -14.08, 11.36)
    }

    Spikes {
        position: Qt.vector3d(30.88, -14.08, 11.36)
    }

    Shells {
        spawnflags: 2048
        position: Qt.vector3d(22.08, -24.96, 22.08)
    }

    Shells {
        spawnflags: 2048
        position: Qt.vector3d(30.08, -24.32, 20.96)
    }

    Spikes {
        spawnflags: 2048
        position: Qt.vector3d(21.92, -24.96, 25.44)
    }

    Spikes {
        position: Qt.vector3d(34.56, -14.72, 12.64)
    }

    Spikes {
        position: Qt.vector3d(32.8, -14.72, 16.64)
    }

    Shells {
        position: Qt.vector3d(32.64, -14.72, 13.92)
    }

    Spikes {
        spawnflags: 2048
        position: Qt.vector3d(26.72, -25.6, 20.96)
    }

    Spikes {
        spawnflags: 2048
        position: Qt.vector3d(22.4, -24.96, 29.12)
    }

    Spikes {
        spawnflags: 2048
        position: Qt.vector3d(30.88, -24.32, 25.44)
    }

    Shells {
        spawnflags: 2048
        position: Qt.vector3d(30.72, -24.32, 30.08)
    }

    Spikes {
        spawnflags: 2048
        position: Qt.vector3d(26.72, -25.6, 21.28)
    }

    Health {
        position: Qt.vector3d(23.84, -24.96, 21.12)
    }

    Health {
        spawnflags: 2048
        position: Qt.vector3d(23.36, -24.32, 31.68)
    }

    Health {
        spawnflags: 2048
        position: Qt.vector3d(29.76, -24.32, 27.36)
    }

    Health {
        spawnflags: 2048
        position: Qt.vector3d(28.48, -24.32, 20.96)
    }

    Shells {
        position: Qt.vector3d(0.16, -14.56, 8.8)
    }

    Shells {
        position: Qt.vector3d(0.16, -14.72, 15.84)
    }

    Shells {
        position: Qt.vector3d(23.84, -16.0, 18.24)
    }

    Shells {
        position: Qt.vector3d(25.12, -16.0, 12.16)
    }

    GrenadeLauncherItem {
        position: Qt.vector3d(24.96, -15.52, 2.56)
    }

    Rockets {
        position: Qt.vector3d(22.24, -15.68, 1.76)
    }

    Shells {
        position: Qt.vector3d(26.56, -15.68, 1.92)
    }

    Spikes {
        position: Qt.vector3d(28.32, -15.36, 8.8)
    }

    Health {
        position: Qt.vector3d(28.32, -15.36, 9.44)
    }

    ChangeLevelTrigger {
        // *18 trigger_changelevel
        body: map.model_18
        position: Qt.vector3d(9.6, -13.76, -26)
        mins: Qt.vector3d(-0.64, -0.96, -0.0799999)
        maxs: Qt.vector3d(0.639999, 0.96, 0.0799999)
        map: "lq_e0m6"
    }

    RelayTrigger {
        targetname: "wave1"
        position: Qt.vector3d(9.68, -13.84, -6.64)
    }

    CounterTrigger {
        target: "wave2"
        targetname: "wave1_counter"
        spawnflags: 1
        count: 4
        position: Qt.vector3d(9.68, -13.84, -7.92)
    }

    RelayTrigger {
        targetname: "wave2"
        position: Qt.vector3d(10.0, -13.84, -6.64)
    }

    CounterTrigger {
        target: "wave3"
        targetname: "wave2_counter"
        spawnflags: 1
        count: 4
        position: Qt.vector3d(10.0, -13.84, -7.92)
    }

    Spikes {
        position: Qt.vector3d(10.56, -16.0, 1.76)
    }

    Spikes {
        position: Qt.vector3d(8.48, -16.0, 1.76)
    }

    Spikes {
        position: Qt.vector3d(13.6, -16.0, -0.32)
    }

    Spikes {
        position: Qt.vector3d(16.96, -14.72, -9.28)
    }

    Spikes {
        position: Qt.vector3d(2.24, -14.72, -9.76)
    }

    Spikes {
        position: Qt.vector3d(14.72, -15.36, -16.16)
    }

    Health {
        position: Qt.vector3d(17.44, -15.36, -3.28)
    }

    Health {
        position: Qt.vector3d(10.24, -16.0, -0.16)
    }

    Health {
        position: Qt.vector3d(4.48, -15.36, -15.84)
    }

    Health {
        position: Qt.vector3d(16.16, -14.72, -9.76)
    }

    RelayTrigger {
        targetname: "wave3"
        position: Qt.vector3d(10.32, -13.84, -6.64)
    }

    CounterTrigger {
        target: "goldkey"
        targetname: "wave3_counter"
        spawnflags: 0
        count: 2
        position: Qt.vector3d(10.32, -13.84, -7.92)
    }

    Rockets {
        position: Qt.vector3d(16.64, -14.72, -9.76)
    }

    Rockets {
        position: Qt.vector3d(7.84, -16.0, -0.16)
    }

    TeleportTrigger {
        // *21 trigger_teleport repop1
        body: map.model_21
        position: Qt.vector3d(-3.52, -15.2, -3.52)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop1_1"
        targetname: "repop1"
    }

    TeleportTrigger {
        // *22 trigger_teleport repop1
        body: map.model_22
        position: Qt.vector3d(-4.16, -15.2, -3.52)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop1_2"
        targetname: "repop1"
    }

    TeleportTrigger {
        // *23 trigger_teleport repop1
        body: map.model_23
        position: Qt.vector3d(-4.8, -15.2, -3.52)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop1_3"
        targetname: "repop1"
    }

    TeleportTrigger {
        // *24 trigger_teleport repop1
        body: map.model_24
        position: Qt.vector3d(-5.44, -15.2, -3.52)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop1_4"
        targetname: "repop1"
    }

    TeleportTrigger {
        // *25 trigger_teleport repop1
        body: map.model_25
        position: Qt.vector3d(-6.08, -15.2, -3.52)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop1_5"
        targetname: "repop1"
    }

    TeleportDestination {
        targetname: "repop1_1"
        position: Qt.vector3d(9.44, -14.56, 7.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "repop1_3"
        position: Qt.vector3d(9.12, -14.56, 5.92)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "repop1_2"
        position: Qt.vector3d(8.4, -14.56, 5.92)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "repop1_5"
        position: Qt.vector3d(10.56, -14.56, 5.92)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    OnceTrigger {
        // *26 trigger_once
        body: map.model_26
        position: Qt.vector3d(29.28, -15.04, 7.36)
        mins: Qt.vector3d(-0.16, -0.96, -0.96)
        maxs: Qt.vector3d(0.16, 0.96, 0.96)
        target: "repop1"
    }

    TeleportTrigger {
        // *27 trigger_teleport repop1
        body: map.model_27
        position: Qt.vector3d(-3.52, -15.2, -4.16)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop1_6"
        targetname: "repop1"
    }

    TeleportDestination {
        targetname: "repop1_6"
        position: Qt.vector3d(13.2, -14.56, 10.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Rockets {
        position: Qt.vector3d(20.48, -15.52, 1.84)
    }

    Health {
        position: Qt.vector3d(18.72, -15.52, 2.0)
    }

    Spikes {
        position: Qt.vector3d(1.76, -15.36, -2.96)
    }

    Shells {
        position: Qt.vector3d(10.72, -16.0, 13.6)
    }

    Shells {
        position: Qt.vector3d(8.16, -16.0, 13.52)
    }

    TeleportDestination {
        targetname: "repop1_4"
        position: Qt.vector3d(9.84, -14.56, 5.92)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Shells {
        position: Qt.vector3d(14.8, -16.0, 14.96)
    }

    Shells {
        position: Qt.vector3d(13.04, -16.0, 9.44)
    }

    Flame {
        position: Qt.vector3d(9.6, -15.32, 12.16)
    }

    Shells {
        position: Qt.vector3d(34.08, -14.72, 12.64)
    }

    Wall {
        // *28 func_wall secret1_kill
        body: map.model_28
        position: Qt.vector3d(9.6, -16.04, 8.32)
        mins: Qt.vector3d(-0.320001, -0.039999, -0.32)
        maxs: Qt.vector3d(0.32, 0.0400009, 0.320001)
        targetname: "secret1_kill"
    }

    RelayTrigger {
        targetname: "secret1"
        killtarget: "secret1_kill"
        position: Qt.vector3d(9.6, -15.52, 8.32)
    }

    SecretTrigger {
        // *29 trigger_secret
        body: map.model_29
        position: Qt.vector3d(9.6, -15.38, 12.16)
        mins: Qt.vector3d(-0.0799999, -0.1, -0.0799999)
        maxs: Qt.vector3d(0.0799999, 0.0999994, 0.0799999)
        target: "secret1"
        spawnflags: 2048
        message: "Your sacrifice is rewarded"
    }

    PathCorner {
        targetname: "path1_1"
        target: "path1_2"
        position: Qt.vector3d(4.4, -15.92, 5.84)
    }

    PathCorner {
        targetname: "path1_2"
        target: "path1_1"
        position: Qt.vector3d(4.4, -15.92, 15.28)
    }

    RelayTrigger {
        targetname: "secret2"
        killtarget: "secret2_kill"
        position: Qt.vector3d(10.32, -13.04, -0.08)
    }

    Wall {
        // *31 func_wall secret2_kill
        body: map.model_31
        position: Qt.vector3d(9.6, -16.04, -0.32)
        mins: Qt.vector3d(-0.320001, -0.039999, -0.32)
        maxs: Qt.vector3d(0.32, 0.0400009, 0.32)
        targetname: "secret2_kill"
    }

    SuperNailgunItem {
        spawnflags: 2048
        position: Qt.vector3d(9.6, -16.8, -0.32)
    }

    TeleportTrigger {
        // *32 trigger_teleport secret2
        body: map.model_32
        position: Qt.vector3d(-3.52, -15.2, -5.12)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "secret2_dest"
        targetname: "secret2"
        spawnflags: 2
    }

    TeleportTrigger {
        // *33 trigger_teleport secret2
        body: map.model_33
        position: Qt.vector3d(-4.16, -15.2, -5.12)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "secret2_dest"
        targetname: "secret2"
        spawnflags: 2
    }

    TeleportDestination {
        targetname: "secret2_dest"
        position: Qt.vector3d(9.6, -13.44, -0.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    InfoIntermission {
        position: Qt.vector3d(8.2, -14.7, 9.41)
        eulerRotation: Qt.vector3d(-13, 216, 0)
    }

    Shells {
        position: Qt.vector3d(1.44, -15.36, -3.76)
    }

    Shells {
        position: Qt.vector3d(3.52, -15.36, -15.2)
    }

    Shells {
        spawnflags: 2048
        position: Qt.vector3d(22.88, -24.96, 29.28)
    }

    TeleportDestination {
        targetname: "repop2_1"
        position: Qt.vector3d(28.64, -20.88, 13.6)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "repop2_2"
        position: Qt.vector3d(27.6, -20.4, 13.6)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "repop2_3"
        position: Qt.vector3d(28.48, -19.92, 12.8)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportTrigger {
        // *34 trigger_teleport repop2
        body: map.model_34
        position: Qt.vector3d(-6.08, -15.2, -4.8)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop2_1"
        targetname: "repop2"
    }

    TeleportTrigger {
        // *35 trigger_teleport repop2
        body: map.model_35
        position: Qt.vector3d(-6.08, -15.2, -5.44)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop2_2"
        targetname: "repop2"
    }

    TeleportTrigger {
        // *36 trigger_teleport repop2
        body: map.model_36
        position: Qt.vector3d(-6.08, -15.2, -6.08)
        mins: Qt.vector3d(-0.24, -0.16, -0.24)
        maxs: Qt.vector3d(0.24, 0.16, 0.24)
        target: "repop2_3"
        targetname: "repop2"
    }

    RelayTrigger {
        target: "repop2"
        targetname: "lift1"
        position: Qt.vector3d(33.2, -23.92, 22.64)
    }

    RelayTrigger {
        target: "final_bars"
        targetname: "goldkey"
        position: Qt.vector3d(12.56, -13.76, -0.16)
    }

    CounterTrigger {
        target: "smelly_door"
        targetname: "smelly_counter"
        position: Qt.vector3d(9.6, -13.12, -22.24)
    }

    SecretTrigger {
        // *38 trigger_secret
        body: map.model_38
        position: Qt.vector3d(28.32, -23.04, 34.24)
        mins: Qt.vector3d(-0.16, -1.28, -0.32)
        maxs: Qt.vector3d(0.16, 1.28, 0.320004)
        spawnflags: 2048
        message: "A gift of the dark"
    }

    Health {
        spawnflags: 2050
        position: Qt.vector3d(26.72, -26.72, 24.8)
    }

    SecretTrigger {
        // *39 trigger_secret
        body: map.model_39
        position: Qt.vector3d(26.88, -26.56, 24.64)
        mins: Qt.vector3d(-0.320002, -0.32, -0.32)
        maxs: Qt.vector3d(0.32, 0.32, 0.32)
        spawnflags: 2048
        message: "A gift of thermodynamics"
    }

    Wall {
        // *40 func_wall
        body: map.model_40
        position: Qt.vector3d(9.6, -15.2, 4.5)
        mins: Qt.vector3d(-1.12, -0.16, -0.02)
        maxs: Qt.vector3d(1.12, 0.16, 0.02)
        spawnflags: 2048
    }

    Wall {
        // *41 func_wall
        body: map.model_41
        position: Qt.vector3d(26.88, -23.36, 32.08)
        mins: Qt.vector3d(-0.640001, -0.959999, -0.0800018)
        maxs: Qt.vector3d(0.639999, 0.960001, 0.079998)
        spawnflags: 1792
    }

    Wall {
        // *42 func_wall
        body: map.model_42
        position: Qt.vector3d(22.4, -18.6, 16.64)
        mins: Qt.vector3d(-0.16, -0.0400009, -0.16)
        maxs: Qt.vector3d(0.16, 0.039999, 0.16)
        spawnflags: 2048
    }

    Wall {
        // *43 func_wall
        body: map.model_43
        position: Qt.vector3d(22.4, -21.16, 14.08)
        mins: Qt.vector3d(-0.16, -0.0400009, -0.16)
        maxs: Qt.vector3d(0.16, 0.039999, 0.16)
        spawnflags: 2048
    }

    Wall {
        // *44 func_wall
        body: map.model_44
        position: Qt.vector3d(26.88, -19.88, 10.88)
        mins: Qt.vector3d(-0.160002, -0.039999, -0.16)
        maxs: Qt.vector3d(0.16, 0.0400009, 0.16)
        spawnflags: 2048
    }

    Wall {
        // *45 func_wall
        body: map.model_45
        position: Qt.vector3d(26.88, -24.36, 10.88)
        mins: Qt.vector3d(-0.160002, -0.039999, -0.16)
        maxs: Qt.vector3d(0.16, 0.0400009, 0.16)
        spawnflags: 2048
    }

    Wall {
        // *46 func_wall
        body: map.model_46
        position: Qt.vector3d(26.88, -19.88, 19.84)
        mins: Qt.vector3d(-0.160002, -0.039999, -0.16)
        maxs: Qt.vector3d(0.16, 0.0400009, 0.16)
        spawnflags: 2048
    }

    Cells {
        spawnflags: 1793
        position: Qt.vector3d(6.56, -16.0, 15.84)
    }

    Rockets {
        spawnflags: 0
        position: Qt.vector3d(6.24, -15.12, -9.04)
    }

    Spikes {
        spawnflags: 0
        position: Qt.vector3d(8.0, -15.2, -3.2)
    }

    Shells {
        spawnflags: 0
        position: Qt.vector3d(10.72, -15.2, -3.2)
    }

    Spikes {
        spawnflags: 0
        position: Qt.vector3d(12.72, -15.28, -9.12)
    }

    Shells {
        spawnflags: 0
        position: Qt.vector3d(17.44, -15.28, -3.92)
    }

    TeleportDestination {
        targetname: "wave1.t1"
        position: Qt.vector3d(4.16, -15.28, -6.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    TeleportDestination {
        targetname: "wave1.t2"
        position: Qt.vector3d(6.4, -15.28, -8.64)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "wave1.t3"
        position: Qt.vector3d(12.8, -15.28, -8.64)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    TeleportDestination {
        targetname: "wave1.t4"
        position: Qt.vector3d(15.04, -15.28, -6.08)
        eulerRotation: Qt.vector3d(0, 105, 0)
    }

    TeleportTrigger {
        // *47 trigger_teleport wave1
        body: map.model_47
        position: Qt.vector3d(-6.24, -15.2, -8)
        mins: Qt.vector3d(-0.32, -0.16, -0.32)
        maxs: Qt.vector3d(0.32, 0.16, 0.32)
        target: "wave1.t1"
        targetname: "wave1"
        spawnflags: 2050
    }

    TeleportTrigger {
        // *48 trigger_teleport wave1
        body: map.model_48
        position: Qt.vector3d(-5.44, -15.2, -8)
        mins: Qt.vector3d(-0.32, -0.16, -0.32)
        maxs: Qt.vector3d(0.32, 0.16, 0.32)
        target: "wave1.t2"
        targetname: "wave1"
        spawnflags: 2050
    }

    TeleportTrigger {
        // *49 trigger_teleport wave1
        body: map.model_49
        position: Qt.vector3d(-4.64, -15.2, -8)
        mins: Qt.vector3d(-0.32, -0.16, -0.32)
        maxs: Qt.vector3d(0.32, 0.16, 0.32)
        target: "wave1.t3"
        targetname: "wave1"
        spawnflags: 2050
    }

    TeleportTrigger {
        // *50 trigger_teleport wave1
        body: map.model_50
        position: Qt.vector3d(-3.84, -15.2, -8)
        mins: Qt.vector3d(-0.32, -0.16, -0.32)
        maxs: Qt.vector3d(0.32, 0.16, 0.32)
        target: "wave1.t4"
        targetname: "wave1"
        spawnflags: 2050
    }

    TeleportTrigger {
        // *51 trigger_teleport wave2
        body: map.model_51
        position: Qt.vector3d(-6.08, -15.2, -9.28)
        mins: Qt.vector3d(-0.32, -0.16, -0.32)
        maxs: Qt.vector3d(0.32, 0.16, 0.320001)
        target: "wave2.t1"
        targetname: "wave2"
        spawnflags: 2050
    }

    TeleportTrigger {
        // *52 trigger_teleport wave2
        body: map.model_52
        position: Qt.vector3d(-4.8, -15.2, -9.28)
        mins: Qt.vector3d(-0.32, -0.16, -0.32)
        maxs: Qt.vector3d(0.32, 0.16, 0.320001)
        target: "wave2.t2"
        targetname: "wave2"
        spawnflags: 2050
    }

    TeleportDestination {
        targetname: "wave2.t1"
        position: Qt.vector3d(4.24, -15.28, -10.48)
        eulerRotation: Qt.vector3d(0, 225, 0)
    }

    TeleportDestination {
        targetname: "wave2.t2"
        position: Qt.vector3d(14.96, -15.28, -10.48)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    TeleportTrigger {
        // *53 trigger_teleport wave3
        body: map.model_53
        position: Qt.vector3d(-6.08, -15.2, -10.56)
        mins: Qt.vector3d(-0.32, -0.16, -0.320001)
        maxs: Qt.vector3d(0.32, 0.16, 0.32)
        target: "wave3.t1"
        targetname: "wave3"
        spawnflags: 2050
    }

    TeleportTrigger {
        // *54 trigger_teleport wave3
        body: map.model_54
        position: Qt.vector3d(-4.8, -15.2, -10.56)
        mins: Qt.vector3d(-0.32, -0.16, -0.320001)
        maxs: Qt.vector3d(0.32, 0.16, 0.32)
        target: "wave3.t2"
        targetname: "wave3"
        spawnflags: 2050
    }

    TeleportDestination {
        targetname: "wave3.t1"
        position: Qt.vector3d(4.16, -15.28, -14.32)
        eulerRotation: Qt.vector3d(0, 225, 0)
    }

    TeleportDestination {
        targetname: "wave3.t2"
        position: Qt.vector3d(15.04, -15.28, -14.32)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    TeleportDestination {
        targetname: "shortcut_teleporter_dest"
        position: Qt.vector3d(9.6, -14.24, -0.48)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportTrigger {
        // *57 trigger_teleport
        body: map.model_57
        position: Qt.vector3d(9.6, -15.36, 0.88)
        mins: Qt.vector3d(-0.320001, -0.639999, -0.08)
        maxs: Qt.vector3d(0.32, 0.64, 0.08)
        target: "shortcut_teleporter_dest"
        spawnflags: 2
    }

    RelayTrigger {
        targetname: "smelly_door"
        killtarget: "smelly_air"
        delay: 4
        position: Qt.vector3d(9.6, -13.36, -22.24)
    }

    Plat {
        // *59 func_plat
        body: map.model_59
        position: Qt.vector3d(30.44, -15.44, 15.36)
        mins: Qt.vector3d(-0.439999, -0.719999, -1.52)
        maxs: Qt.vector3d(0.440001, 0.72, 1.52)
        spawnflags: 1792
        speed: 2.5
        height: 1.28
    }

    Wall {
        // *60 func_wall
        body: map.model_60
        position: Qt.vector3d(26.88, -16.96, 15.36)
        mins: Qt.vector3d(-3.84, -0.800001, -3.84)
        maxs: Qt.vector3d(3.84, 0.799999, 3.84)
        spawnflags: 1792
    }

    Wall {
        // *61 func_wall
        body: map.model_61
        position: Qt.vector3d(9.6, -13.44, -16.32)
        mins: Qt.vector3d(-1.28, -1.28, -0.32)
        maxs: Qt.vector3d(1.28, 1.28, 0.32)
        spawnflags: 1792
    }

    Wall {
        // *62 func_wall
        body: map.model_62
        position: Qt.vector3d(9.6, -14.96, -4.16)
        mins: Qt.vector3d(-0.72, -0.24, -0.72)
        maxs: Qt.vector3d(0.719999, 0.24, 0.72)
        spawnflags: 1792
    }

    Wall {
        // *63 func_wall
        body: map.model_63
        position: Qt.vector3d(9.6, -15.12, -6.56)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.48)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.48)
        spawnflags: 1792
    }

    Armor {
        spawnflags: 1792
        skin: 2
        position: Qt.vector3d(9.6, -14.72, -4.16)
    }

    SuperNailgunItem {
        spawnflags: 1792
        position: Qt.vector3d(31.68, -13.84, 15.36)
    }

    Wall {
        // *70 func_wall
        body: map.model_70
        position: Qt.vector3d(10.08, -16.32, 17.28)
        mins: Qt.vector3d(-0.64, -0.32, -0.639999)
        maxs: Qt.vector3d(0.64, 0.32, 0.640001)
        spawnflags: 1792
    }

    RocketLauncherItem {
        spawnflags: 1792
        position: Qt.vector3d(9.6, -14.4, -14.72)
    }

    Wall {
        // *71 func_wall
        body: map.model_71
        position: Qt.vector3d(9.6, -14.68, -14.72)
        mins: Qt.vector3d(-0.320001, -0.04, -0.320001)
        maxs: Qt.vector3d(0.32, 0.04, 0.32)
        spawnflags: 1792
    }

    LightningItem {
        spawnflags: 1792
        position: Qt.vector3d(10.08, -15.2, 17.28)
    }

    Cells {
        spawnflags: 1793
        position: Qt.vector3d(6.56, -16.0, 19.68)
    }

    Cells {
        spawnflags: 1793
        position: Qt.vector3d(-1.12, -14.72, 8.8)
    }

    Cells {
        spawnflags: 1793
        position: Qt.vector3d(2.08, -16.0, 19.68)
    }

    Wall {
        // *72 func_wall
        body: map.model_72
        position: Qt.vector3d(9.6, -15.96, 10.24)
        mins: Qt.vector3d(-0.320001, -0.04, -0.32)
        maxs: Qt.vector3d(0.32, 0.04, 0.320001)
        spawnflags: 1792
    }

    SuperShotgunItem {
        spawnflags: 1792
        position: Qt.vector3d(9.6, -15.68, 10.24)
    }

    SuperDamage {
        spawnflags: 1792
        position: Qt.vector3d(33.6, -15.04, 1.38)
    }

    Wall {
        // *73 func_wall
        body: map.model_73
        position: Qt.vector3d(33.76, -14.56, 9.6)
        mins: Qt.vector3d(-0.480003, -0.160001, -1.28)
        maxs: Qt.vector3d(0.48, 0.16, 1.28)
        spawnflags: 1792
    }

    Health {
        spawnflags: 1794
        position: Qt.vector3d(26.72, -15.36, 15.52)
    }

    Plat {
        // *74 func_plat lift1
        body: map.model_74
        position: Qt.vector3d(30.36, -20.2, 15.36)
        mins: Qt.vector3d(-0.68, -5.48, -1.44)
        maxs: Qt.vector3d(0.68, 5.48, 1.44)
        targetname: "lift1"
        spawnflags: 2048
        sounds: 2
    }

    Button {
        // *75 func_button
        body: map.model_75
        position: Qt.vector3d(30.68, -15.6, 17.2)
        mins: Qt.vector3d(-0.0400009, -0.24, -0.240002)
        maxs: Qt.vector3d(0.039999, 0.240001, 0.24)
        movedir: Qt.vector3d(1, 0, 0)
        target: "romero"
        spawnflags: 2048
        wait: -1
        delay: 2
    }

    Wall {
        // *79 func_wall
        body: map.model_79
        position: Qt.vector3d(9.6, -13.92, -16.62)
        mins: Qt.vector3d(-1.12, -0.16, -0.0200005)
        maxs: Qt.vector3d(1.12, 0.16, 0.0199986)
        spawnflags: 2048
    }

    Button {
        // *81 func_button
        body: map.model_81
        position: Qt.vector3d(7.08, -14.08, -22.08)
        mins: Qt.vector3d(-0.04, -0.24, -0.24)
        maxs: Qt.vector3d(0.04, 0.24, 0.24)
        movedir: Qt.vector3d(-1, 0, 0)
        target: "smelly_counter"
        spawnflags: 2048
        wait: -1
    }

    Button {
        // *82 func_button
        body: map.model_82
        position: Qt.vector3d(12.12, -14.08, -22.08)
        mins: Qt.vector3d(-0.04, -0.24, -0.24)
        maxs: Qt.vector3d(0.04, 0.24, 0.24)
        movedir: Qt.vector3d(1, 0, 0)
        target: "smelly_counter"
        spawnflags: 2048
        wait: -1
    }

    Button {
        // *83 func_button
        body: map.model_83
        position: Qt.vector3d(9.6, -14.8, -6.56)
        mins: Qt.vector3d(-0.160001, -0.400001, -0.16)
        maxs: Qt.vector3d(0.16, 0.4, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        target: "wave1"
        spawnflags: 2048
        wait: -1
        speed: 0.1
        sounds: 1
        lip: 0.16
    }

    Key2 {
        spawnflags: 2048
        position: Qt.vector3d(9.6, -13.52, -4.16)
    }

    Key1 {
        spawnflags: 2048
        position: Qt.vector3d(31.68, -14.32, 15.36)
    }

    SuperDamage {
        spawnflags: 2048
        position: Qt.vector3d(39.2, -14.48, 17.92)
    }

    OnceTrigger {
        // *91 trigger_once
        body: map.model_91
        position: Qt.vector3d(18.24, -15.04, 12.16)
        mins: Qt.vector3d(-0.32, -0.96, -0.639999)
        maxs: Qt.vector3d(0.32, 0.96, 0.64)
        target: "onewaydoors1"
        spawnflags: 2048
    }

    SecretTrigger {
        // *92 trigger_secret secret2_trigger
        body: map.model_92
        position: Qt.vector3d(10, -13.36, -0.08)
        mins: Qt.vector3d(-0.0799999, -0.32, -0.08)
        maxs: Qt.vector3d(0.0799999, 0.320001, 0.08)
        target: "secret2"
        targetname: "secret2_trigger"
        spawnflags: 2049
        message: "A gift of mercy"
    }

    // model *93 missing from BSP export — no solid_93 in Lq_e0m8_map.qml
    // Button { body: map.model_93 ... }

    OnceTrigger {
        // *94 trigger_once
        body: map.model_94
        position: Qt.vector3d(9.28, -16.28, 17.28)
        mins: Qt.vector3d(-2.88, -0.200001, -1.92)
        maxs: Qt.vector3d(2.88, 0.199999, 1.92)
        target: "entry"
        spawnflags: 2048
        message: "You have been cleansed"
    }

    Wall {
        // *95 func_wall
        body: map.model_95
        position: Qt.vector3d(-0.32, -14.64, 13.76)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.48)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.48)
        spawnflags: 2048
    }

    Health {
        spawnflags: 2050
        position: Qt.vector3d(9.44, -16.88, 8.48)
    }

    Armor {
        spawnflags: 2048
        skin: 2
        position: Qt.vector3d(9.6, -14.72, -13.44)
    }

    SuperShotgunItem {
        spawnflags: 2048
        position: Qt.vector3d(10.08, -15.84, 17.28)
    }

    NailgunItem {
        spawnflags: 2048
        position: Qt.vector3d(25.44, -16.0, 15.36)
    }

    Armor {
        spawnflags: 2048
        skin: 0
        position: Qt.vector3d(26.88, -16.0, 15.36)
    }

    OnceTrigger {
        // *97 trigger_once
        body: map.model_97
        position: Qt.vector3d(9.68, -14.8, -6.56)
        mins: Qt.vector3d(-0.8, -0.56, -0.8)
        maxs: Qt.vector3d(0.799999, 0.559999, 0.8)
        target: "final_bars"
        spawnflags: 2048
    }

    // doors
    Door {
        id: door_2
        // *2 func_door bars_elevator_button
        body: map.model_2
        position: Qt.vector3d(31.68, -23.68, 22.08)
        mins: Qt.vector3d(-0.0799999, -0.639999, -0.799999)
        maxs: Qt.vector3d(0.0799999, 0.639999, 0.799999)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "bars_elevator_button"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "opens nearby"
        owner: door_2
        enemy: door_2
    }

    Door {
        id: door_4
        // *4 func_door bars_elevator_button
        body: map.model_4
        position: Qt.vector3d(21.52, -24, 25.28)
        mins: Qt.vector3d(-0.0799999, -0.959999, -1.6)
        maxs: Qt.vector3d(0.0799999, 0.959999, 1.6)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "bars_elevator_button"
        spawnflags: 2048
        wait: -1
        sounds: 3
        owner: door_4
        enemy: door_4
    }

    Door {
        id: door_5
        // *5 func_door bars_elevator_button
        body: map.model_5
        position: Qt.vector3d(26.88, -23.36, 32.32)
        mins: Qt.vector3d(-0.640001, -0.959999, -0.16)
        maxs: Qt.vector3d(0.639999, 0.960001, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "bars_elevator_button"
        wait: -1
        sounds: 3
        owner: door_5
        enemy: door_5
    }

    Door {
        id: door_6
        // *6 func_door
        body: map.model_6
        position: Qt.vector3d(12.48, -15.04, 9.92)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0800009, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        sounds: 3
        owner: door_6
        enemy: door_7
    }

    Door {
        id: door_7
        // *7 func_door
        body: map.model_7
        position: Qt.vector3d(12.48, -15.04, 10.56)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0800009, 0.96, 0.320001)
        movedir: Qt.vector3d(0, 0, 1)
        sounds: 3
        owner: door_6
        enemy: door_6
    }

    Door {
        id: door_8
        // *8 func_door
        body: map.model_8
        position: Qt.vector3d(27.2, -24.64, 20.16)
        mins: Qt.vector3d(-0.320002, -0.960001, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.959999, 0.0799999)
        movedir: Qt.vector3d(1, 0, 0)
        spawnflags: 2080
        sounds: 3
        owner: door_8
        enemy: door_9
    }

    Door {
        id: door_9
        // *9 func_door
        body: map.model_9
        position: Qt.vector3d(26.56, -24.64, 20.16)
        mins: Qt.vector3d(-0.32, -0.960001, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.959999, 0.0799999)
        movedir: Qt.vector3d(-1, 0, 0)
        spawnflags: 2080
        sounds: 3
        owner: door_8
        enemy: door_8
    }

    Door {
        id: door_14
        // *14 func_door
        body: map.model_14
        position: Qt.vector3d(33.92, -13.76, 15.68)
        mins: Qt.vector3d(-0.079998, -0.96, -0.320001)
        maxs: Qt.vector3d(0.0800018, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, 1)
        spawnflags: 0
        sounds: 3
        owner: door_14
        enemy: door_15
    }

    Door {
        id: door_15
        // *15 func_door
        body: map.model_15
        position: Qt.vector3d(33.92, -13.76, 15.04)
        mins: Qt.vector3d(-0.079998, -0.96, -0.32)
        maxs: Qt.vector3d(0.0800018, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        spawnflags: 0
        sounds: 3
        owner: door_14
        enemy: door_14
    }

    Door {
        id: door_16
        // *16 func_door final_bars
        body: map.model_16
        position: Qt.vector3d(14.4, -15.04, -0.96)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.56)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.56)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "final_bars"
        spawnflags: 2081
        wait: -1
        sounds: 3
        lip: 0.16
        owner: door_16
        enemy: door_16
    }

    Door {
        id: door_17
        // *17 func_door final_bars
        body: map.model_17
        position: Qt.vector3d(4.8, -15.04, -0.96)
        mins: Qt.vector3d(-0.0800004, -0.96, -0.56)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.56)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "final_bars"
        spawnflags: 2081
        wait: -1
        sounds: 3
        lip: 0.16
        owner: door_17
        enemy: door_17
    }

    Door {
        id: door_19
        // *19 func_door wave2
        body: map.model_19
        position: Qt.vector3d(18.16, -13.76, -7.68)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.64)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "wave2"
        wait: -1
        speed: 2
        sounds: 1
        owner: door_19
        enemy: door_19
    }

    Door {
        id: door_20
        // *20 func_door wave2
        body: map.model_20
        position: Qt.vector3d(1.04, -13.76, -7.68)
        mins: Qt.vector3d(-0.08, -0.96, -0.64)
        maxs: Qt.vector3d(0.08, 0.96, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "wave2"
        wait: -1
        speed: 2
        sounds: 1
        owner: door_20
        enemy: door_20
    }

    Door {
        id: door_30
        // *30 func_door secret2
        body: map.model_30
        position: Qt.vector3d(9.6, -16.44, -0.32)
        mins: Qt.vector3d(-0.320001, -0.52, -0.32)
        maxs: Qt.vector3d(0.32, 0.519999, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "secret2"
        spawnflags: 1
        wait: -1
        sounds: 4
        lip: 0.01
        owner: door_30
        enemy: door_30
    }

    Door {
        id: door_37
        // *37 func_door door_exit
        body: map.model_37
        position: Qt.vector3d(9.6, -13.68, -25.28)
        mins: Qt.vector3d(-1.12, -1.04, -0.16)
        maxs: Qt.vector3d(1.12, 1.04, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_exit"
        spawnflags: 2080
        wait: -1
        speed: 0.4
        sounds: 1
        message: "Destroy Satan's Smelly Spawn!"
        owner: door_37
        enemy: door_37
    }

    Door {
        id: door_55
        // *55 func_door
        body: map.model_55
        position: Qt.vector3d(21.44, -15.04, 15.68)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.320001)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, 1)
        sounds: 3
        owner: door_55
        enemy: door_56
    }

    Door {
        id: door_56
        // *56 func_door
        body: map.model_56
        position: Qt.vector3d(21.44, -15.04, 15.04)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        sounds: 3
        owner: door_55
        enemy: door_55
    }

    Door {
        id: door_58
        // *58 func_door final_bars
        body: map.model_58
        position: Qt.vector3d(9.6, -15.36, 1.2)
        mins: Qt.vector3d(-0.320001, -0.639999, -0.08)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "final_bars"
        spawnflags: 32
        owner: door_58
        enemy: door_58
    }

    Door {
        id: door_64
        // *64 func_door
        body: map.model_64
        position: Qt.vector3d(9.28, -15.04, 4.16)
        mins: Qt.vector3d(-0.320001, -0.96, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.96, 0.0799999)
        movedir: Qt.vector3d(-1, 0, 0)
        spawnflags: 1792
        sounds: 3
        owner: door_64
        enemy: door_65
    }

    Door {
        id: door_65
        // *65 func_door
        body: map.model_65
        position: Qt.vector3d(9.92, -15.04, 4.16)
        mins: Qt.vector3d(-0.32, -0.96, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.96, 0.0799999)
        movedir: Qt.vector3d(1, 0, 0)
        spawnflags: 1792
        sounds: 3
        owner: door_64
        enemy: door_64
    }

    Door {
        id: door_66
        // *66 func_door
        body: map.model_66
        position: Qt.vector3d(6.72, -15.04, 8.64)
        mins: Qt.vector3d(-0.0800004, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.320001)
        movedir: Qt.vector3d(0, 0, 1)
        spawnflags: 1792
        sounds: 3
        owner: door_66
        enemy: door_67
    }

    Door {
        id: door_67
        // *67 func_door
        body: map.model_67
        position: Qt.vector3d(6.72, -15.04, 8)
        mins: Qt.vector3d(-0.0800004, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        spawnflags: 1792
        sounds: 3
        owner: door_66
        enemy: door_66
    }

    Door {
        id: door_68
        // *68 func_door
        body: map.model_68
        position: Qt.vector3d(17.6, -15.04, 11.84)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        spawnflags: 1792
        sounds: 3
        owner: door_68
        enemy: door_69
    }

    Door {
        id: door_69
        // *69 func_door
        body: map.model_69
        position: Qt.vector3d(17.6, -15.04, 12.48)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.320001)
        movedir: Qt.vector3d(0, 0, 1)
        spawnflags: 1792
        sounds: 3
        owner: door_68
        enemy: door_68
    }

    Door {
        id: door_76
        // *76 func_door romero
        body: map.model_76
        position: Qt.vector3d(26.88, -21.04, 15.36)
        mins: Qt.vector3d(-3.84, -4.88, -3.84)
        maxs: Qt.vector3d(3.84, 4.88, 3.84)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "romero"
        spawnflags: 2080
        wait: -1
        speed: 0.35
        sounds: 1
        lip: 0.32
        dmg: 0
        owner: door_76
        enemy: door_76
    }

    Door {
        id: door_77
        // *77 func_door
        body: map.model_77
        position: Qt.vector3d(9.92, -13.76, -16.96)
        mins: Qt.vector3d(-0.32, -0.96, -0.0800018)
        maxs: Qt.vector3d(0.32, 0.96, 0.0799999)
        movedir: Qt.vector3d(1, 0, 0)
        spawnflags: 2056
        sounds: 3
        owner: door_77
        enemy: door_78
    }

    Door {
        id: door_78
        // *78 func_door
        body: map.model_78
        position: Qt.vector3d(9.28, -13.76, -16.96)
        mins: Qt.vector3d(-0.320001, -0.96, -0.0800018)
        maxs: Qt.vector3d(0.32, 0.96, 0.0799999)
        movedir: Qt.vector3d(-1, 0, 0)
        spawnflags: 2056
        sounds: 3
        owner: door_77
        enemy: door_77
    }

    Door {
        id: door_80
        // *80 func_door smelly_door
        body: map.model_80
        position: Qt.vector3d(9.6, -13.92, -21.76)
        mins: Qt.vector3d(-0.64, -0.64, -0.16)
        maxs: Qt.vector3d(0.639999, 0.64, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "smelly_door"
        spawnflags: 2080
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_80
        enemy: door_80
    }

    Door {
        id: door_84
        // *84 func_door goldkey
        body: map.model_84
        position: Qt.vector3d(9.6, -14.48, -4.16)
        mins: Qt.vector3d(-0.64, -0.72, -0.64)
        maxs: Qt.vector3d(0.639999, 0.719999, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "goldkey"
        spawnflags: 2048
        wait: -1
        speed: 0.2
        sounds: 1
        lip: 0.48
        owner: door_84
        enemy: door_84
    }

    Door {
        id: door_85
        // *85 func_door
        body: map.model_85
        position: Qt.vector3d(9.28, -15.04, 4.16)
        mins: Qt.vector3d(-0.320001, -0.96, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.96, 0.0799999)
        movedir: Qt.vector3d(-1, 0, 0)
        spawnflags: 2064
        sounds: 3
        owner: door_85
        enemy: door_86
    }

    Door {
        id: door_86
        // *86 func_door
        body: map.model_86
        position: Qt.vector3d(9.92, -15.04, 4.16)
        mins: Qt.vector3d(-0.32, -0.96, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.96, 0.0799999)
        movedir: Qt.vector3d(1, 0, 0)
        spawnflags: 2064
        sounds: 3
        owner: door_85
        enemy: door_85
    }

    Door {
        id: door_87
        // *87 func_door entry
        body: map.model_87
        position: Qt.vector3d(6.72, -15.04, 8.64)
        mins: Qt.vector3d(-0.0800004, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.320001)
        movedir: Qt.vector3d(0, 0, 1)
        targetname: "entry"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "Cleanse thyself"
        owner: door_87
        enemy: door_88
    }

    Door {
        id: door_88
        // *88 func_door entry
        body: map.model_88
        position: Qt.vector3d(6.72, -15.04, 8)
        mins: Qt.vector3d(-0.0800004, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        targetname: "entry"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "Cleanse thyself"
        owner: door_87
        enemy: door_87
    }

    Door {
        id: door_89
        // *89 func_door onewaydoors1
        body: map.model_89
        position: Qt.vector3d(17.6, -15.04, 12.48)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.320001)
        movedir: Qt.vector3d(0, 0, 1)
        targetname: "onewaydoors1"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "opens from the other side"
        owner: door_89
        enemy: door_90
    }

    Door {
        id: door_90
        // *90 func_door onewaydoors1
        body: map.model_90
        position: Qt.vector3d(17.6, -15.04, 11.84)
        mins: Qt.vector3d(-0.0799999, -0.96, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.96, 0.32)
        movedir: Qt.vector3d(0, 0, -1)
        targetname: "onewaydoors1"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "opens from the other side"
        owner: door_89
        enemy: door_89
    }

    Door {
        id: door_96
        // *96 func_door secret1
        body: map.model_96
        position: Qt.vector3d(9.6, -16.44, 8.32)
        mins: Qt.vector3d(-0.320001, -0.52, -0.32)
        maxs: Qt.vector3d(0.32, 0.519999, 0.320001)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "secret1"
        spawnflags: 2049
        wait: -1
        sounds: 4
        lip: 0.01
        owner: door_96
        enemy: door_96
    }

    DoorTrigger {
        owner: door_6
    }

    DoorTrigger {
        owner: door_8
    }

    DoorTrigger {
        owner: door_14
    }

    DoorTrigger {
        owner: door_55
    }

    DoorTrigger {
        owner: door_64
    }

    DoorTrigger {
        owner: door_66
    }

    DoorTrigger {
        owner: door_68
    }

    // monsters

    Shambler {
        position: Qt.vector3d(26.88, -23.92, 32.96)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Ogre {
        position: Qt.vector3d(20.48, -24.56, 26.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(22.24, -19.44, 16.64)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(26.88, -20.88, 10.88)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Ogre {
        position: Qt.vector3d(26.88, -25.12, 11.12)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Ogre {
        position: Qt.vector3d(22.32, -22.08, 14)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(26.88, -20.72, 19.84)
        eulerRotation: Qt.vector3d(0, 15, 0)
    }

    Ogre {
        position: Qt.vector3d(32.16, -13.68, 9.6)
        eulerRotation: Qt.vector3d(0, -75, 0)
    }

    Shambler {
        position: Qt.vector3d(28.16, -15.44, 2.08)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Ogre {
        position: Qt.vector3d(30.88, -13.68, 10.56)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(20.48, -24.56, 24.48)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(26.56, -24.08, 30.24)
        eulerRotation: Qt.vector3d(0, 15, 0)
    }

    Ogre {
        position: Qt.vector3d(30.24, -24.08, 26.4)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    HellKnight {
        position: Qt.vector3d(27.68, -24.72, 28.16)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    HellKnight {
        position: Qt.vector3d(24.8, -24.72, 28.16)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    HellKnight {
        position: Qt.vector3d(23.68, -24.72, 22.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(39.85, -14.48, 14.42)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(39.4, -14.48, 14.29)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(38.97, -14.48, 14.18)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(8, -15.76, 15.2)
        eulerRotation: Qt.vector3d(0, 105, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(9.12, -15.76, 15.2)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(4.32, -15.76, 5.44)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "path1_1"
    }

    Knight {
        position: Qt.vector3d(4.8, -15.76, 4.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(26.88, -15.6, 10.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(26.88, -15.6, 19.2)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    HellKnight {
        position: Qt.vector3d(28.96, -15.92, 15.04)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(36.16, -15.12, 7.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(36.8, -15.12, 6.88)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    HellKnight {
        position: Qt.vector3d(37.44, -15.12, 5.28)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    HellKnight {
        position: Qt.vector3d(34.4, -15.12, 5.28)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Ogre {
        position: Qt.vector3d(30.4, -15.12, 2.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(26.08, -15.12, 9.12)
        eulerRotation: Qt.vector3d(0, -45, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(23.84, -15.76, 7.2)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(23.84, -15.76, 6.4)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Demon {
        position: Qt.vector3d(19.52, -15.76, 11.84)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-6.24, -15.04, -8)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave1"
        target: "wave1_counter"
    }

    Ogre {
        position: Qt.vector3d(-3.84, -15.04, -8)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave1"
        target: "wave1_counter"
    }

    Ogre {
        position: Qt.vector3d(-4.64, -15.04, -8)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave1"
        target: "wave1_counter"
    }

    Ogre {
        position: Qt.vector3d(-5.44, -15.04, -8)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave1"
        target: "wave1_counter"
    }

    Shalrath {
        position: Qt.vector3d(18.72, -14.48, -7.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
        targetname: "wave2"
        target: "wave2_counter"
    }

    Shalrath {
        position: Qt.vector3d(0.48, -14.48, -7.68)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave2"
        target: "wave2_counter"
    }

    Tarbaby {
        position: Qt.vector3d(9.6, -14.28, -22.12)
        eulerRotation: Qt.vector3d(0, 0, 0)
        target: "door_exit"
    }

    Demon {
        position: Qt.vector3d(-6.08, -15.04, -9.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave2"
        target: "wave2_counter"
    }

    Shambler {
        position: Qt.vector3d(-6.08, -15.04, -10.56)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave3"
        target: "wave3_counter"
    }

    Shambler {
        position: Qt.vector3d(-4.8, -15.04, -10.56)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave3"
        target: "wave3_counter"
    }

    Knight {
        position: Qt.vector3d(6.88, -15.76, 1.92)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(6.88, -15.76, 2.72)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HellKnight {
        position: Qt.vector3d(12.16, -15.76, 2.56)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(-4.16, -15.12, -3.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-4.8, -15.12, -3.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-5.44, -15.12, -3.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(-6.08, -15.12, -3.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HellKnight {
        position: Qt.vector3d(-3.52, -15.12, -3.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HellKnight {
        position: Qt.vector3d(-3.52, -15.12, -4.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(20, -15.76, 12.8)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(19.36, -15.76, 12.8)
        eulerRotation: Qt.vector3d(0, -15, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(38.54, -14.48, 14.39)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(35.04, -15.12, 6.72)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(35.52, -15.12, 6.88)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(36.8, -15.12, 2.08)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(36.16, -15.12, 2.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(35.52, -15.12, 2.08)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(35.04, -15.12, 2.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(23.36, -15.76, 6.4)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(23.36, -15.76, 7.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HellKnight {
        position: Qt.vector3d(8.64, -15.76, 8.4)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(10.64, -15.76, 7.76)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(10.64, -15.76, 8.4)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(10.64, -15.76, 8.96)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Demon {
        position: Qt.vector3d(19.6, -15.76, 15.44)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    HellKnight {
        position: Qt.vector3d(15.6, -15.76, 10.32)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(5.28, -15.76, 4.96)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(9.6, -13.36, 0)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
        targetname: "secret2_kill"
    }

    Zombie {
        position: Qt.vector3d(-3.52, -14.96, -5.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 0
    }

    ZombieV2 {
        position: Qt.vector3d(-4.16, -14.96, -5.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 0
    }

    Knight {
        position: Qt.vector3d(2.88, -15.76, 19.04)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-6.08, -15.04, -4.8)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(-6.08, -15.04, -5.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(-6.08, -15.04, -6.08)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Demon {
        position: Qt.vector3d(-4.8, -15.04, -9.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "wave2"
        target: "wave2_counter"
    }

    Knight {
        position: Qt.vector3d(36, -14.48, 18.56)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 257
    }

}
