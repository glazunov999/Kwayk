import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.lq_e0m2

World {
    id: root

    displayName: "Cruel Cave Conundrum"
    worldtype: 0

    readonly property alias player: player

    Lq_e0m2_map {
        id: map
    }

    Lq_e0m2_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(-23.04, 2.44, 35.2)
        eulerRotation: Qt.vector3d(0, -15, 0)
    }

    Plat {
        body: map.model_1
        position: Qt.vector3d(-0.72, -0.6, -8)
        mins: Qt.vector3d(-0.56, -1.16, -0.96)
        maxs: Qt.vector3d(0.56, 1.16, 0.96)
        targetname: "plat1"
        speed: 1
        height: 2.16
    }

    OnceTrigger {
        body: map.model_4
        position: Qt.vector3d(-2.56, 1.28, -6.48)
        mins: Qt.vector3d(-0.64, -0.64, -0.32)
        maxs: Qt.vector3d(0.64, 0.64, 0.32)
        target: "door_locked1"
        spawnflags: 2048
    }

    OnceTrigger {
        body: map.model_12
        position: Qt.vector3d(5.44, -2.88, -28.8)
        mins: Qt.vector3d(-0.24, -0.96, -1.92)
        maxs: Qt.vector3d(0.24, 0.96, 1.92)
        target: "ogre_surprise"
    }

    ChangeLevelTrigger {
        body: map.model_13
        position: Qt.vector3d(24, -0.76, 3.2)
        mins: Qt.vector3d(-0.16, -0.6, -0.48)
        maxs: Qt.vector3d(0.16, 0.6, 0.48)
        spawnflags: 0
        map: "lq_e0m3"
    }

    OnceTrigger {
        body: map.model_15
        position: Qt.vector3d(5.72, -1.32, -24.64)
        mins: Qt.vector3d(-0.6, -0.44, -0.960001)
        maxs: Qt.vector3d(0.6, 0.44, 0.959999)
        target: "bridge1"
        spawnflags: 0
    }

    TeleportTrigger {
        body: map.model_16
        position: Qt.vector3d(-23.2, 5.44, -39.52)
        mins: Qt.vector3d(-0.4, -0.16, -0.48)
        maxs: Qt.vector3d(0.400002, 0.16, 0.48)
        target: "goldkeydoor_tele1"
        targetname: "goldkeydoor_teles"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_17
        position: Qt.vector3d(-22.24, 5.44, -39.52)
        mins: Qt.vector3d(-0.4, -0.16, -0.48)
        maxs: Qt.vector3d(0.4, 0.16, 0.48)
        target: "goldkeydoor_tele2"
        targetname: "goldkeydoor_teles"
        spawnflags: 2
    }

    MultipleTrigger {
        body: map.model_18
        position: Qt.vector3d(-15.04, -0.72, -11.24)
        mins: Qt.vector3d(-3.04, -0.56, -0.52)
        maxs: Qt.vector3d(3.04, 0.56, 0.52)
        target: "goldkeydoor_surpise"
    }

    Button {
        eulerRotation: Qt.vector3d(0, -90, 0)
        body: map.model_19
        position: Qt.vector3d(-20.76, 5.72, -40.4)
        mins: Qt.vector3d(-0.200001, -0.28, -0.079998)
        maxs: Qt.vector3d(0.199999, 0.28, 0.0800018)
        target: "goldkeydoor_teles"
        wait: -1
        speed: 5
        health: 1
    }

    Wall {
        body: map.model_20
        position: Qt.vector3d(-20.8, 5.68, -40.16)
        mins: Qt.vector3d(-0.320002, -0.4, -0.079998)
        maxs: Qt.vector3d(0.32, 0.4, 0.0800018)
        targetname: "goldkeydoor_kill"
    }

    TeleportTrigger {
        body: map.model_21
        position: Qt.vector3d(-23.6, 5.56, -38.04)
        mins: Qt.vector3d(-0.24, -0.28, -0.279999)
        maxs: Qt.vector3d(0.24, 0.28, 0.280003)
        target: "gold_repop_tele1"
        targetname: "gold_repop"
        spawnflags: 2
    }

    Door {
        id: door_2
        body: map.model_2
        position: Qt.vector3d(-2.24, 1.28, -6.08)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "door_locked1"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "opens on the other side"
        owner: door_2
        enemy: door_3
    }

    Door {
        id: door_3
        body: map.model_3
        position: Qt.vector3d(-2.88, 1.28, -6.08)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        targetname: "door_locked1"
        spawnflags: 2048
        wait: -1
        sounds: 3
        message: "opens on the other side"
        owner: door_2
        enemy: door_2
    }

    Door {
        id: door_5
        body: map.model_5
        position: Qt.vector3d(1.6, -0.96, -10.16)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 3
        owner: door_5
        enemy: door_6
    }

    Door {
        id: door_6
        body: map.model_6
        position: Qt.vector3d(0.96, -0.96, -10.16)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 3
        owner: door_5
        enemy: door_5
    }

    Door {
        id: door_7
        body: map.model_7
        position: Qt.vector3d(1.6, -0.96, -15.12)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 3
        owner: door_7
        enemy: door_8
    }

    Door {
        id: door_8
        body: map.model_8
        position: Qt.vector3d(0.96, -0.96, -15.12)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 3
        owner: door_7
        enemy: door_7
    }

    Door {
        id: door_9
        body: map.model_9
        position: Qt.vector3d(3.52, -0.96, -26.48)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 3
        owner: door_9
        enemy: door_10
    }

    Door {
        id: door_10
        body: map.model_10
        position: Qt.vector3d(4.16, -0.96, -26.48)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 3
        owner: door_9
        enemy: door_9
    }

    Door {
        id: door_11
        body: map.model_11
        position: Qt.vector3d(6.72, -7.12, -28.76)
        mins: Qt.vector3d(-0.8, -1.12, -0.84)
        maxs: Qt.vector3d(0.8, 1.12, 0.84)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "ogre_surprise"
        spawnflags: 32
        wait: -1
        speed: 4
        sounds: 4
        owner: door_11
        enemy: door_11
    }

    Door {
        id: door_14
        body: map.model_14
        position: Qt.vector3d(7.72, -1.86, -24.64)
        mins: Qt.vector3d(-1.24, -0.0600001, -0.800001)
        maxs: Qt.vector3d(1.24, 0.0599999, 0.799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        targetname: "bridge1"
        spawnflags: 33
        wait: -1
        sounds: 4
        lip: 0.32
        owner: door_14
        enemy: door_14
    }

    TeleportDestination {
        targetname: "goldkeydoor_tele1"
        position: Qt.vector3d(-12.64, -1.12, -10.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportDestination {
        targetname: "goldkeydoor_tele2"
        position: Qt.vector3d(-17.44, -1.12, -10.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TrapSpikeShooter {
        targetname: "goldkeydoor_surpise"
        spawnflags: 1
        position: Qt.vector3d(-20.8, 5.68, -39.92)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    RelayTrigger {
        targetname: "goldkeydoor"
        killtarget: "goldkeydoor_kill"
        position: Qt.vector3d(-15.04, 0.24, -15.92)
    }

    TeleportDestination {
        targetname: "gold_repop_tele1"
        position: Qt.vector3d(-11.48, 0.08, -4.87)
        eulerRotation: Qt.vector3d(0, 105, 0)
    }

    TeleportDestination {
        targetname: "gold_repop_tele2"
        position: Qt.vector3d(-11.51, 0.4, -4.04)
        eulerRotation: Qt.vector3d(0, 45, 0)
    }

    TeleportDestination {
        targetname: "gold_repop_tele3"
        position: Qt.vector3d(-12.32, 0.08, -4.04)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

    TeleportTrigger {
        body: map.model_22
        position: Qt.vector3d(-23.04, 5.56, -38.04)
        mins: Qt.vector3d(-0.24, -0.28, -0.279999)
        maxs: Qt.vector3d(0.240002, 0.28, 0.280003)
        target: "gold_repop_tele2"
        targetname: "gold_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_23
        position: Qt.vector3d(-22.48, 5.56, -38.04)
        mins: Qt.vector3d(-0.24, -0.28, -0.279999)
        maxs: Qt.vector3d(0.24, 0.28, 0.280003)
        target: "gold_repop_tele3"
        targetname: "gold_repop"
        spawnflags: 2
    }

    OnceTrigger {
        body: map.model_24
        position: Qt.vector3d(-18.4, -0.32, -12.32)
        mins: Qt.vector3d(-0.16, -0.96, -1.44)
        maxs: Qt.vector3d(0.16, 0.96, 1.44)
        target: "gold_repop"
    }

    OnceTrigger {
        body: map.model_29
        position: Qt.vector3d(1.28, -1.08, -9.92)
        mins: Qt.vector3d(-0.64, -0.52, -0.0799999)
        maxs: Qt.vector3d(0.64, 0.52, 0.0799999)
        target: "plat1"
    }

    OnceTrigger {
        body: map.model_30
        position: Qt.vector3d(-0.96, -2.16, -31.04)
        mins: Qt.vector3d(-0.64, -0.88, -0.32)
        maxs: Qt.vector3d(0.64, 0.88, 0.320002)
        target: "waterhall_repop"
    }

    TeleportTrigger {
        body: map.model_31
        position: Qt.vector3d(-19.76, 5.56, -36.84)
        mins: Qt.vector3d(-0.24, -0.28, -0.279999)
        maxs: Qt.vector3d(0.24, 0.28, 0.279999)
        target: "waterhall_tele6"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_32
        position: Qt.vector3d(-19.76, 5.56, -37.48)
        mins: Qt.vector3d(-0.24, -0.28, -0.279999)
        maxs: Qt.vector3d(0.24, 0.28, 0.279999)
        target: "waterhall_tele5"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_33
        position: Qt.vector3d(-20.56, 5.56, -36.96)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.4, 0.28, 0.399998)
        target: "waterhall_tele4"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_34
        position: Qt.vector3d(-21.44, 5.56, -36.96)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.4, 0.28, 0.399998)
        target: "waterhall_tele3"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_35
        position: Qt.vector3d(-22.4, 5.56, -36.96)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.4, 0.28, 0.399998)
        target: "waterhall_tele2"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_36
        position: Qt.vector3d(-23.36, 5.56, -36.96)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.400002, 0.28, 0.399998)
        target: "waterhall_tele1"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_37
        position: Qt.vector3d(-23.36, 5.56, -35.92)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.400002, 0.28, 0.399998)
        target: "hub_tele1"
        targetname: "hub_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_38
        position: Qt.vector3d(-22.48, 5.56, -35.92)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.4, 0.28, 0.399998)
        target: "hub_tele2"
        targetname: "hub_repop"
        spawnflags: 2
    }

    TeleportTrigger {
        body: map.model_39
        position: Qt.vector3d(-21.6, 5.56, -35.92)
        mins: Qt.vector3d(-0.4, -0.28, -0.400002)
        maxs: Qt.vector3d(0.4, 0.28, 0.399998)
        target: "hub_tele3"
        targetname: "hub_repop"
        spawnflags: 2
    }

    OnceTrigger {
        body: map.model_40
        position: Qt.vector3d(-15.88, -1.96, 0.28)
        mins: Qt.vector3d(-0.440001, -0.6, -0.12)
        maxs: Qt.vector3d(0.44, 0.6, 0.12)
        target: "hub_repop"
    }

    Door {
        id: door_25
        body: map.model_25
        position: Qt.vector3d(-15.36, -0.64, -6.48)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.320001, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        sounds: 3
        owner: door_25
        enemy: door_26
    }

    Door {
        id: door_26
        body: map.model_26
        position: Qt.vector3d(-14.72, -0.64, -6.48)
        mins: Qt.vector3d(-0.320001, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        sounds: 3
        owner: door_25
        enemy: door_25
    }

    Door {
        id: door_27
        body: map.model_27
        position: Qt.vector3d(-18.64, -1.6, -1.28)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 3
        owner: door_27
        enemy: door_28
    }

    Door {
        id: door_28
        body: map.model_28
        position: Qt.vector3d(-18.64, -1.6, -1.92)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 3
        owner: door_27
        enemy: door_27
    }

    Door {
        id: door_41
        body: map.model_41
        position: Qt.vector3d(22.56, -0.64, 3.2)
        mins: Qt.vector3d(-0.0799999, -0.96, -1.12)
        maxs: Qt.vector3d(0.0799999, 0.96, 1.12)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_door"
        wait: -1
        speed: 0.4
        sounds: 4
        owner: door_41
        enemy: door_41
    }

    TeleportDestination {
        targetname: "waterhall_tele2"
        position: Qt.vector3d(9.44, -1.52, -24.8)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "waterhall_tele1"
        position: Qt.vector3d(3.92, -1.52, -24.72)
        eulerRotation: Qt.vector3d(0, -15, 0)
    }

    TeleportDestination {
        targetname: "waterhall_tele3"
        position: Qt.vector3d(8.64, -1.52, -17.84)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

    TeleportDestination {
        targetname: "waterhall_tele4"
        position: Qt.vector3d(5.28, -1.52, -16.88)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

    TeleportDestination {
        targetname: "waterhall_tele5"
        position: Qt.vector3d(5.28, -0.32, -19.68)
        eulerRotation: Qt.vector3d(0, 15, 0)
    }

    TeleportDestination {
        targetname: "waterhall_tele6"
        position: Qt.vector3d(4.16, -0.56, -19.68)
        eulerRotation: Qt.vector3d(0, -30, 0)
    }

    TeleportDestination {
        targetname: "hub_tele1"
        position: Qt.vector3d(-2.4, 0.8, -4.72)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportDestination {
        targetname: "hub_tele2"
        position: Qt.vector3d(-2.24, 0.8, -2.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportDestination {
        targetname: "hub_tele3"
        position: Qt.vector3d(0.8, 0.8, -2.08)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportDestination {
        targetname: "waterhall_tele7"
        position: Qt.vector3d(1.12, -1.2, -14.16)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Button {
        body: map.model_42
        position: Qt.vector3d(19.84, -1.44, -0.6)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        eulerRotation: Qt.vector3d(0, 0, 0)
        target: "exit_counter"
        wait: -1
    }

    Button {
        body: map.model_43
        position: Qt.vector3d(19.84, -1.44, 7)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "exit_counter"
        wait: -1
    }

    Button {
        body: map.model_45
        position: Qt.vector3d(-0.64, -1.88, -8.56)
        mins: Qt.vector3d(-0.16, -0.04, -0.160001)
        maxs: Qt.vector3d(0.16, 0.04, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        target: "quadsecret_door"
        wait: -1
    }

    SecretTrigger {
        body: map.model_46
        position: Qt.vector3d(4.48, 1.08, -8)
        mins: Qt.vector3d(-0.64, -0.44, -0.64)
        maxs: Qt.vector3d(0.64, 0.44, 0.64)
    }

    Button {
        body: map.model_47
        position: Qt.vector3d(5.76, -3.04, -26.92)
        mins: Qt.vector3d(-0.32, -0.16, -0.0400009)
        maxs: Qt.vector3d(0.32, 0.16, 0.039999)
        eulerRotation: Qt.vector3d(0, 180, 0)
        target: "ogre_surprise"
        wait: 3
    }

    SecretTrigger {
        body: map.model_48
        position: Qt.vector3d(6.72, -5.66, -27.76)
        mins: Qt.vector3d(-0.32, -0.42, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.42, 0.0799999)
    }

    SecretDoor {
        id: door_44
        body: map.model_44
        position: Qt.vector3d(3.6, 1.28, -8)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.64)
        maxs: Qt.vector3d(0.0800002, 0.64, 0.64)
        eulerRotation: Qt.vector3d(0, 0, 0)
        targetname: "quadsecret_door"
        spawnflags: 9
        sounds: 1
        owner: door_44
        enemy: door_44
    }

    Door {
        id: door_49
        body: map.model_49
        position: Qt.vector3d(9.92, -0.96, 3.2)
        mins: Qt.vector3d(-0.32, -0.96, -0.96)
        maxs: Qt.vector3d(0.32, 0.96, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_50
    }

    Door {
        id: door_50
        body: map.model_50
        position: Qt.vector3d(9.28, -0.88, 3.2)
        mins: Qt.vector3d(-0.320001, -0.88, -0.96)
        maxs: Qt.vector3d(0.32, 0.88, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_51
    }

    Door {
        id: door_51
        body: map.model_51
        position: Qt.vector3d(8.64, -0.8, 3.2)
        mins: Qt.vector3d(-0.32, -0.8, -0.96)
        maxs: Qt.vector3d(0.320001, 0.8, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_52
    }

    Door {
        id: door_52
        body: map.model_52
        position: Qt.vector3d(8, -0.72, 3.2)
        mins: Qt.vector3d(-0.32, -0.72, -0.96)
        maxs: Qt.vector3d(0.32, 0.72, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_53
    }

    Door {
        id: door_53
        body: map.model_53
        position: Qt.vector3d(7.36, -0.64, 3.2)
        mins: Qt.vector3d(-0.32, -0.64, -0.96)
        maxs: Qt.vector3d(0.32, 0.64, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_54
    }

    Door {
        id: door_54
        body: map.model_54
        position: Qt.vector3d(6.72, -0.56, 3.2)
        mins: Qt.vector3d(-0.32, -0.56, -0.96)
        maxs: Qt.vector3d(0.32, 0.56, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_55
    }

    Door {
        id: door_55
        body: map.model_55
        position: Qt.vector3d(6.08, -0.48, 3.2)
        mins: Qt.vector3d(-0.32, -0.48, -0.96)
        maxs: Qt.vector3d(0.32, 0.48, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_56
    }

    Door {
        id: door_56
        body: map.model_56
        position: Qt.vector3d(5.44, -0.4, 3.2)
        mins: Qt.vector3d(-0.32, -0.4, -0.96)
        maxs: Qt.vector3d(0.32, 0.4, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_57
    }

    Door {
        id: door_57
        body: map.model_57
        position: Qt.vector3d(4.8, -0.32, 3.2)
        mins: Qt.vector3d(-0.32, -0.32, -0.96)
        maxs: Qt.vector3d(0.32, 0.32, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_58
    }

    Door {
        id: door_58
        body: map.model_58
        position: Qt.vector3d(4.16, -0.24, 3.2)
        mins: Qt.vector3d(-0.32, -0.24, -0.96)
        maxs: Qt.vector3d(0.32, 0.24, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_59
    }

    Door {
        id: door_59
        body: map.model_59
        position: Qt.vector3d(3.52, -0.16, 3.2)
        mins: Qt.vector3d(-0.32, -0.16, -0.96)
        maxs: Qt.vector3d(0.32, 0.16, 0.96)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "exit_showdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.16
        owner: door_49
        enemy: door_49
    }

    Door {
        id: door_60
        body: map.model_60
        position: Qt.vector3d(8.32, 0.8, 4.64)
        mins: Qt.vector3d(-0.64, -0.8, -0.16)
        maxs: Qt.vector3d(0.64, 0.8, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "exit_surprise_door"
        wait: -1
        sounds: 3
        lip: 0.04
        owner: door_60
        enemy: door_61
    }

    Door {
        id: door_61
        body: map.model_61
        position: Qt.vector3d(6.4, 0.8, 4.64)
        mins: Qt.vector3d(-0.64, -0.8, -0.16)
        maxs: Qt.vector3d(0.64, 0.8, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "exit_surprise_door"
        wait: -1
        sounds: 3
        lip: 0.04
        owner: door_60
        enemy: door_62
    }

    CounterTrigger {
        target: "exit_door"
        targetname: "exit_counter"
        count: 2
        position: Qt.vector3d(22.16, 1.04, 3.2)
    }

    CounterTrigger {
        target: "exit_showdoor"
        targetname: "exit_showdoor_counter"
        count: 2
        delay: 2
        position: Qt.vector3d(9.84, 1.52, 3.2)
    }

    PathCorner {
        targetname: "pblink.1"
        target: "pblink.2"
        position: Qt.vector3d(24.72, 0.72, 4.4)
    }

    PathCorner {
        targetname: "pblink.2"
        target: "pblink.1"
        position: Qt.vector3d(24.72, -2.32, 4.4)
    }

    // patrol paths

    PathCorner {
        targetname: "p1.1"
        target: "p1.2"
        position: Qt.vector3d(0.64, 0.32, 0.16)
    }

    PathCorner {
        targetname: "p1.2"
        target: "p1.3"
        position: Qt.vector3d(0.64, 0.32, -2)
    }

    PathCorner {
        targetname: "p1.3"
        target: "p1.4"
        position: Qt.vector3d(-4.88, 0.32, -2)
    }

    PathCorner {
        targetname: "p1.4"
        target: "p1.1"
        position: Qt.vector3d(-4.96, 0.32, 0.08)
    }

    PathCorner {
        targetname: "p2.1"
        target: "p2.2"
        position: Qt.vector3d(-14, 0.72, 29.68)
    }

    PathCorner {
        targetname: "p2.2"
        target: "p2.3"
        position: Qt.vector3d(-14, 0.16, 23.28)
    }

    PathCorner {
        targetname: "p2.3"
        target: "p2.4"
        position: Qt.vector3d(-14.96, 0.4, 20.72)
    }

    PathCorner {
        targetname: "p2.4"
        target: "p2.5"
        position: Qt.vector3d(-9.04, 1.36, 20.24)
    }

    PathCorner {
        targetname: "p2.5"
        target: "p2.6"
        position: Qt.vector3d(-6.96, 1.36, 20.24)
    }

    PathCorner {
        targetname: "p2.6"
        target: "p2.7"
        position: Qt.vector3d(-6.8, 1.04, 23.44)
    }

    PathCorner {
        targetname: "p2.7"
        target: "p2.8"
        position: Qt.vector3d(-3.6, 0.72, 22.96)
    }

    PathCorner {
        targetname: "p2.8"
        target: "p2.7"
        position: Qt.vector3d(-3.76, 0.72, 19.44)
    }

    PathCorner {
        targetname: "p3.1"
        target: "p3.2"
        position: Qt.vector3d(-0.72, 0.72, 7.44)
    }

    PathCorner {
        targetname: "p3.2"
        target: "p3.3"
        position: Qt.vector3d(-0.4, 0.72, 10.16)
    }

    PathCorner {
        targetname: "p3.3"
        target: "p3.4"
        position: Qt.vector3d(2, 0.72, 10.32)
    }

    PathCorner {
        targetname: "p3.4"
        target: "p3.1"
        position: Qt.vector3d(-0.72, 0.72, 10.64)
    }

    Button {
        eulerRotation: Qt.vector3d(0, -90, 0)
        body: map.model_66
        position: Qt.vector3d(10.2, 0.48, 3.2)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.04, 0.16, 0.16)
        target: "exit_surprise_door"
        wait: -1
    }

    Button {
        body: map.model_67
        position: Qt.vector3d(2.6, 0.48, 0.96)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.0400002, 0.16, 0.16)
        eulerRotation: Qt.vector3d(0, 90, 0)
        target: "exit_showdoor_counter"
        wait: -1
    }

    Button {
        body: map.model_68
        position: Qt.vector3d(2.6, 0.48, 5.44)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.0400002, 0.16, 0.16)
        eulerRotation: Qt.vector3d(0, 90, 0)
        target: "exit_showdoor_counter"
        wait: -1
    }

    Train {
        body: map.model_69
        position: Qt.vector3d(25.68, 0.76, 3.2)
        mins: Qt.vector3d(-0.0799999, -0.04, -1.28)
        maxs: Qt.vector3d(0.0799999, 0.04, 1.28)
        target: "pblink.1"
        spawnflags: 2048
        speed: 1.5
        sounds: 0
    }

    Train {
        body: map.model_70
        position: Qt.vector3d(25.68, 0.44, 3.2)
        mins: Qt.vector3d(-0.0799999, -0.04, -1.28)
        maxs: Qt.vector3d(0.0799999, 0.04, 1.28)
        target: "pblink.1"
        spawnflags: 2048
        speed: 1.7
        sounds: 0
    }

    Train {
        body: map.model_71
        position: Qt.vector3d(25.68, 0.12, 3.2)
        mins: Qt.vector3d(-0.0799999, -0.04, -1.28)
        maxs: Qt.vector3d(0.0799999, 0.04, 1.28)
        target: "pblink.1"
        spawnflags: 2048
        speed: 2
        sounds: 0
    }

    Train {
        body: map.model_72
        position: Qt.vector3d(25.68, -0.2, 3.2)
        mins: Qt.vector3d(-0.0799999, -0.04, -1.28)
        maxs: Qt.vector3d(0.0799999, 0.04, 1.28)
        target: "pblink.1"
        spawnflags: 2048
        speed: 2.4
        sounds: 0
    }

    TeleportTrigger {
        body: map.model_73
        position: Qt.vector3d(-20.56, 5.56, -37.76)
        mins: Qt.vector3d(-0.4, -0.28, -0.399998)
        maxs: Qt.vector3d(0.4, 0.28, 0.400002)
        target: "waterhall_tele7"
        targetname: "waterhall_repop"
        spawnflags: 2
    }

    MultipleTrigger {
        body: map.model_75
        position: Qt.vector3d(7.04, 0.88, 14.08)
        mins: Qt.vector3d(-0.96, -0.88, -0.48)
        maxs: Qt.vector3d(0.96, 0.88, 0.48)
        wait: 5
    }

    Button {
        body: map.model_76
        position: Qt.vector3d(5.76, 0.48, 9.88)
        mins: Qt.vector3d(-0.16, -0.16, -0.04)
        maxs: Qt.vector3d(0.16, 0.16, 0.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
        wait: 5
    }

    Door {
        id: door_62
        body: map.model_62
        position: Qt.vector3d(4.48, 0.8, 4.64)
        mins: Qt.vector3d(-0.64, -0.8, -0.16)
        maxs: Qt.vector3d(0.64, 0.8, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "exit_surprise_door"
        wait: -1
        sounds: 3
        lip: 0.04
        owner: door_60
        enemy: door_63
    }

    Door {
        id: door_63
        body: map.model_63
        position: Qt.vector3d(4.48, 0.8, 1.76)
        mins: Qt.vector3d(-0.64, -0.8, -0.16)
        maxs: Qt.vector3d(0.64, 0.8, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "exit_surprise_door"
        wait: -1
        sounds: 3
        lip: 0.04
        owner: door_60
        enemy: door_64
    }

    Door {
        id: door_64
        body: map.model_64
        position: Qt.vector3d(6.4, 0.8, 1.76)
        mins: Qt.vector3d(-0.64, -0.8, -0.16)
        maxs: Qt.vector3d(0.64, 0.8, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "exit_surprise_door"
        wait: -1
        sounds: 3
        lip: 0.04
        owner: door_60
        enemy: door_65
    }

    Door {
        id: door_65
        body: map.model_65
        position: Qt.vector3d(8.32, 0.8, 1.76)
        mins: Qt.vector3d(-0.64, -0.8, -0.16)
        maxs: Qt.vector3d(0.64, 0.8, 0.16)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "exit_surprise_door"
        wait: -1
        sounds: 3
        lip: 0.04
        owner: door_60
        enemy: door_60
    }

    Door {
        id: door_74
        body: map.model_74
        position: Qt.vector3d(8.98, 0.64, 14.08)
        mins: Qt.vector3d(-1.02, -0.64, -3.52)
        maxs: Qt.vector3d(1.02, 0.64, 3.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
        targetname: "the_wesley_crusher_door"
        spawnflags: 32
        wait: -1
        speed: 0.68
        sounds: 4
        lip: 0
        owner: door_74
        enemy: door_74
    }

    Door {
        id: door_77
        body: map.model_77
        position: Qt.vector3d(-8.48, 1.92, 19.84)
        mins: Qt.vector3d(-0.0800009, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        sounds: 3
        owner: door_77
        enemy: door_78
    }

    Door {
        id: door_78
        body: map.model_78
        position: Qt.vector3d(-8.48, 1.92, 20.48)
        mins: Qt.vector3d(-0.0800009, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        sounds: 3
        owner: door_77
        enemy: door_77
    }

    Door {
        id: door_79
        body: map.model_79
        position: Qt.vector3d(3.52, 0.64, 8.64)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.320001)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 0
        sounds: 3
        owner: door_79
        enemy: door_80
    }

    Door {
        id: door_80
        body: map.model_80
        position: Qt.vector3d(3.52, 0.64, 9.28)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.320001)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 0
        sounds: 3
        owner: door_79
        enemy: door_79
    }

    Door {
        id: door_81
        body: map.model_81
        position: Qt.vector3d(0.32, 0.64, 6.08)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 0
        sounds: 3
        owner: door_81
        enemy: door_82
    }

    TeleportDestination {
        targetname: "tele_dmshortcut1"
        position: Qt.vector3d(-20.8, -2.0, -0.52)
        eulerRotation: Qt.vector3d(0, -15, 0)
    }

    Plat {
        body: map.model_83
        position: Qt.vector3d(0.64, 2.08, 12.88)
        mins: Qt.vector3d(-0.32, -1.44, -0.24)
        maxs: Qt.vector3d(0.32, 1.44, 0.24)
    }

    SecretTrigger {
        body: map.model_84
        position: Qt.vector3d(0.64, 3.92, 11.68)
        mins: Qt.vector3d(-0.32, -0.4, -0.16)
        maxs: Qt.vector3d(0.32, 0.4, 0.16)
    }

    ChangeLevelTrigger {
        body: map.model_85
        position: Qt.vector3d(24, 0.04, 3.2)
        mins: Qt.vector3d(-0.16, -0.12, -0.48)
        maxs: Qt.vector3d(0.16, 0.12, 0.48)
        spawnflags: 0
        map: "e0-level-trans"
    }

    OnceTrigger {
        body: map.model_86
        position: Qt.vector3d(6, 0.64, 20.16)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.959999)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.960001)
        target: "entry_surprise_knights"
    }

    Door {
        id: door_82
        body: map.model_82
        position: Qt.vector3d(0.96, 0.64, 6.08)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 0
        sounds: 3
        owner: door_81
        enemy: door_81
    }

    Wall {
        body: map.model_87
        position: Qt.vector3d(2.04, 0.64, 3.2)
        mins: Qt.vector3d(-0.12, -0.64, -0.64)
        maxs: Qt.vector3d(0.12, 0.64, 0.64)
        spawnflags: 1792
    }

    Wall {
        body: map.model_88
        position: Qt.vector3d(-14.9586, 1.76, 18.7096)
        mins: Qt.vector3d(-0.201507, -0.64, -0.48435)
        maxs: Qt.vector3d(0.201508, 0.64, 0.484348)
        spawnflags: 1792
    }

    TeleportTrigger {
        body: map.model_89
        position: Qt.vector3d(-14.8427, 1.76, 18.7407)
        mins: Qt.vector3d(-0.121459, -0.48, -0.31945)
        maxs: Qt.vector3d(0.121459, 0.48, 0.319448)
        target: "tele_dmshortcut1"
        spawnflags: 1792
    }

    Plat {
        body: map.model_90
        position: Qt.vector3d(-22.24, -1.44, -8.96)
        mins: Qt.vector3d(-0.16, -0.8, -0.48)
        maxs: Qt.vector3d(0.16, 0.8, 0.48)
        spawnflags: 1792
        height: 1.44
    }

    Flame {
        position: Qt.vector3d(3.84, -1.16, -22.84)
    }
    Armor {
        skin: 0
        position: Qt.vector3d(3.2, 0.64, -8.0)
    }
    GrenadeLauncherItem {
        position: Qt.vector3d(-21.12, -0.64, -7.28)
    }
    SuperShotgunItem {
        position: Qt.vector3d(-2.4, 0.64, -3.36)
    }
    NailgunItem {
        position: Qt.vector3d(8.64, -3.52, -28.8)
    }
    AmbientDrip {
        position: Qt.vector3d(4.32, -0.56, -21.6)
    }
    InfoIntermission {
        position: Qt.vector3d(-0.71, -0.06, -18.15)
        eulerRotation: Qt.vector3d(-12, -38, 0)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(-6.56, -2.24, -13.92)
    }
    Rockets {
        spawnflags: 1
        position: Qt.vector3d(-8.24, -2.24, -13.84)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(-3.68, 0.64, -5.2)
    }
    Armor {
        skin: 0
        position: Qt.vector3d(-17.92, -2.48, 4.88)
    }
    Health {
        position: Qt.vector3d(-17.76, -2.24, -4.64)
    }
    Health {
        position: Qt.vector3d(-9.44, -0.48, 7.52)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(-11.44, -0.64, -10.64)
    }
    Rockets {
        spawnflags: 1
        position: Qt.vector3d(-22.88, -0.64, -7.68)
    }
    Shells {
        position: Qt.vector3d(-18.0, -2.56, 4.32)
    }
    Spikes {
        spawnflags: 1
        position: Qt.vector3d(3.76, -3.84, -21.6)
    }
    Spikes {
        position: Qt.vector3d(0.4, -1.6, -34.0)
    }
    Health {
        position: Qt.vector3d(3.28, -1.6, -7.68)
    }
    Health {
        position: Qt.vector3d(3.68, -3.84, -30.24)
    }
    Health {
        position: Qt.vector3d(7.04, -4.96, -25.04)
    }
    Health {
        position: Qt.vector3d(-15.12, -1.28, -8.56)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(3.28, -1.6, -8.24)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(0.48, -3.84, -30.24)
    }
    Spikes {
        position: Qt.vector3d(9.2, -1.76, -25.6)
    }
    Rockets {
        spawnflags: 1
        position: Qt.vector3d(13.52, -1.44, 4.0)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(13.52, -1.44, 3.36)
    }
    Spikes {
        spawnflags: 1
        position: Qt.vector3d(13.52, -1.44, 2.72)
    }
    SuperDamage {
        position: Qt.vector3d(4.48, 0.88, -8.0)
    }
    SuperDamage {
        position: Qt.vector3d(6.72, -5.84, -27.44)
    }
    Health {
        spawnflags: 0
        position: Qt.vector3d(9.6, -0.0, 5.68)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(9.76, -0.0, 1.04)
    }
    Spikes {
        position: Qt.vector3d(-2.64, -3.04, -28.4)
    }
    Shells {
        position: Qt.vector3d(2.48, -1.6, -33.36)
    }
    Spikes {
        position: Qt.vector3d(3.28, -1.6, -7.2)
    }
    Shells {
        position: Qt.vector3d(8.48, -0.0, 19.76)
    }
    AmbientDrip {
        position: Qt.vector3d(-13.44, 0.64, 24.72)
    }
    Shells {
        position: Qt.vector3d(1.28, 1.92, 17.68)
    }
    Invisibility {
        position: Qt.vector3d(0.64, 3.76, 8.96)
    }
    Health {
        spawnflags: 1536
        position: Qt.vector3d(8.0, -4.96, -25.04)
    }
    Shells {
        spawnflags: 1
        position: Qt.vector3d(-3.04, 0.64, 23.36)
    }
    LightningItem {
        spawnflags: 1792
        position: Qt.vector3d(-13.88, 0.96, 18.6)
    }
    Cells {
        spawnflags: 1793
        position: Qt.vector3d(-14.2, 0.96, 19.44)
    }
    Cells {
        spawnflags: 1793
        position: Qt.vector3d(-14.08, 0.96, 18.08)
    }
    SuperShotgunItem {
        spawnflags: 1792
        position: Qt.vector3d(-23.52, 2.24, 28.4)
    }
    Shells {
        spawnflags: 1793
        position: Qt.vector3d(-23.84, 2.24, 25.44)
    }
    Armor {
        spawnflags: 1792
        skin: 0
        position: Qt.vector3d(-22.56, 2.56, 28.24)
    }
    Health {
        spawnflags: 1794
        position: Qt.vector3d(-15.2, -1.28, -4.8)
    }
    Health {
        spawnflags: 1792
        position: Qt.vector3d(-6.24, -0.0, 0.32)
    }
    NailgunItem {
        spawnflags: 1792
        position: Qt.vector3d(-1.44, 0.64, 8.96)
    }
    Spikes {
        spawnflags: 1793
        position: Qt.vector3d(-1.76, 0.64, 8.48)
    }
    Spikes {
        spawnflags: 1793
        position: Qt.vector3d(-1.76, 0.64, 9.76)
    }
    Health {
        spawnflags: 1792
        position: Qt.vector3d(1.76, 0.64, 10.72)
    }
    Armor {
        spawnflags: 1792
        skin: 0
        position: Qt.vector3d(-0.8, 2.48, 20.16)
    }
    RocketLauncherItem {
        spawnflags: 1792
        position: Qt.vector3d(3.76, -1.76, -24.08)
    }
    Rockets {
        spawnflags: 1793
        position: Qt.vector3d(1.36, -1.76, -25.84)
    }
    Health {
        spawnflags: 1792
        position: Qt.vector3d(-4.16, 1.92, 16.48)
    }
    Cells {
        spawnflags: 1793
        position: Qt.vector3d(-3.04, 0.64, 22.72)
    }
    Spikes {
        spawnflags: 1793
        position: Qt.vector3d(8.48, -0.0, 20.88)
    }
    Health {
        spawnflags: 1792
        position: Qt.vector3d(8.48, -0.0, 20.32)
    }
    Wall {
        body: map.model_102
        position: Qt.vector3d(-23.04, 2, 35.2)
        mins: Qt.vector3d(-0.48, -0.08, -0.48)
        maxs: Qt.vector3d(0.480001, 0.0799999, 0.48)
        spawnflags: 2048
    }
    Key2 {
        spawnflags: 2048
        position: Qt.vector3d(-15.04, -1.04, -5.44)
    }
    Button {
        body: map.model_105
        position: Qt.vector3d(-15.04, -0.16, -16.28)
        mins: Qt.vector3d(-0.16, -0.16, -0.0400009)
        maxs: Qt.vector3d(0.16, 0.16, 0.039999)
        eulerRotation: Qt.vector3d(0, 0, 0)
        target: "goldkeydoor"
        spawnflags: 2048
        wait: -1
    }
    Button {
        body: map.model_107
        position: Qt.vector3d(2.2, 2.4, 18.24)
        mins: Qt.vector3d(-0.04, -0.16, -0.16)
        maxs: Qt.vector3d(0.04, 0.16, 0.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "entry_surprise"
        spawnflags: 2048
        wait: -1
    }
    Door {
        id: door_103
        body: map.model_103
        position: Qt.vector3d(-17.44, -0.76, -9.6)
        mins: Qt.vector3d(-0.16, -0.52, -0.0799999)
        maxs: Qt.vector3d(0.16, 0.52, 0.0799999)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "goldkeydoor"
        spawnflags: 2048
        wait: -1
        speed: 0.4
        sounds: 4
        owner: door_103
        enemy: door_104
    }
    Door {
        id: door_104
        body: map.model_104
        position: Qt.vector3d(-12.64, -0.76, -9.6)
        mins: Qt.vector3d(-0.160001, -0.52, -0.0799999)
        maxs: Qt.vector3d(0.16, 0.52, 0.0799999)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "goldkeydoor"
        spawnflags: 2048
        wait: -1
        speed: 0.4
        sounds: 4
        owner: door_103
        enemy: door_103
    }
    Door {
        id: door_106
        body: map.model_106
        position: Qt.vector3d(-10.08, -2.04, -3.84)
        mins: Qt.vector3d(-0.0799999, -0.52, -0.16)
        maxs: Qt.vector3d(0.0799999, 0.52, 0.16)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "goldkeydoor"
        spawnflags: 2048
        wait: -1
        speed: 0.4
        sounds: 4
        owner: door_106
        enemy: door_106
    }
    Door {
        id: door_108
        body: map.model_108
        position: Qt.vector3d(1.12, 1.28, 21.92)
        mins: Qt.vector3d(-1.12, -0.64, -0.0799999)
        maxs: Qt.vector3d(1.12, 0.64, 0.0799999)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "entry_surprise_knights"
        spawnflags: 2048
        wait: -1
        sounds: 1
        owner: door_108
        enemy: door_108
    }
    Door {
        id: door_109
        body: map.model_109
        position: Qt.vector3d(5.6, 0.56, 20.16)
        mins: Qt.vector3d(-0.0799999, -0.56, -0.799999)
        maxs: Qt.vector3d(0.0799999, 0.56, 0.799999)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "entry_surprise"
        spawnflags: 2048
        wait: -1
        speed: 0.4
        sounds: 4
        owner: door_109
        enemy: door_109
    }
    DoorTrigger {
        owner: door_5
    }
    DoorTrigger {
        owner: door_7
    }
    DoorTrigger {
        owner: door_9
    }
    DoorTrigger {
        owner: door_25
    }
    DoorTrigger {
        owner: door_27
    }
    DoorTrigger {
        owner: door_77
    }
    DoorTrigger {
        owner: door_79
    }
    DoorTrigger {
        owner: door_81
    }
    Wall {
        body: map.model_92
        position: Qt.vector3d(2.16, -3.84, -17.52)
        mins: Qt.vector3d(-0.88, -1.92, -0.24)
        maxs: Qt.vector3d(0.88, 1.92, 0.24)
        spawnflags: 1792
    }
    Wall {
        body: map.model_93
        position: Qt.vector3d(5.52, -3.84, -17.52)
        mins: Qt.vector3d(-0.88, -1.92, -0.24)
        maxs: Qt.vector3d(0.88, 1.92, 0.24)
        spawnflags: 1792
    }
    Wall {
        body: map.model_94
        position: Qt.vector3d(8.72, -3.84, -21.68)
        mins: Qt.vector3d(-0.24, -1.92, -0.879999)
        maxs: Qt.vector3d(0.240001, 1.92, 0.880001)
        spawnflags: 1792
    }
    Wall {
        body: map.model_95
        position: Qt.vector3d(3.84, -1.84, -19.2)
        mins: Qt.vector3d(-0.64, -0.08, -1.92)
        maxs: Qt.vector3d(0.64, 0.0799999, 1.92)
        spawnflags: 1792
    }
    Wall {
        body: map.model_96
        position: Qt.vector3d(1.9, 0.8, 3.2)
        mins: Qt.vector3d(-0.02, -0.16, -1.12)
        maxs: Qt.vector3d(0.02, 0.16, 1.12)
        spawnflags: 2048
    }
    Wall {
        body: map.model_100
        position: Qt.vector3d(0.16, 1.28, 12.16)
        mins: Qt.vector3d(-0.16, -0.64, -0.32)
        maxs: Qt.vector3d(0.16, 0.64, 0.32)
        spawnflags: 2048
    }
    Wall {
        body: map.model_101
        position: Qt.vector3d(0.96, 2.4, 17.12)
        mins: Qt.vector3d(-0.32, -0.48, -0.16)
        maxs: Qt.vector3d(0.32, 0.48, 0.160002)
        spawnflags: 2048
    }
    Door {
        id: door_97
        body: map.model_97
        position: Qt.vector3d(2.24, 0.64, 3.52)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 2056
        sounds: 3
        owner: door_97
        enemy: door_98
    }
    Door {
        id: door_98
        body: map.model_98
        position: Qt.vector3d(2.24, 0.64, 2.88)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        eulerRotation: Qt.vector3d(0, 0, 0)
        spawnflags: 2056
        sounds: 3
        owner: door_97
        enemy: door_97
    }
    SecretDoor {
        id: door_99
        body: map.model_99
        position: Qt.vector3d(0.64, 1.12, 11.64)
        mins: Qt.vector3d(-0.32, -0.48, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.48, 0.0799999)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 2048
        sounds: 1
        owner: door_99
        enemy: door_99
    }
    Plat {
        body: map.model_91
        position: Qt.vector3d(-14.48, -1.68, 4.8)
        mins: Qt.vector3d(-0.240001, -0.88, -0.32)
        maxs: Qt.vector3d(0.24, 0.88, 0.32)
        spawnflags: 1792
        height: 1.52
    }


    Flame {
        position: Qt.vector3d(-0.6, 1.08, 3.4)
    }

    Flame {
        position: Qt.vector3d(-0.32, 1.08, -1.32)
    }

    Flame {
        position: Qt.vector3d(-4.16, 1.08, -1.32)
    }

    Flame {
        position: Qt.vector3d(-0.32, 1.08, -0.6)
    }

    Flame {
        position: Qt.vector3d(-4.16, 1.08, -0.6)
    }

    Flame {
        position: Qt.vector3d(-0.0, 1.08, -5.72)
    }

    Flame {
        position: Qt.vector3d(-3.8, 1.56, -4.6)
    }

    Flame {
        position: Qt.vector3d(-3.24, 1.08, 2.12)
    }

    Flame {
        position: Qt.vector3d(-15.0, -0.32, -8.92)
    }

    Flame {
        position: Qt.vector3d(-15.0, -0.32, -10.28)
    }

    Flame {
        position: Qt.vector3d(-12.76, 0.08, -15.0)
    }

    Flame {
        position: Qt.vector3d(-17.28, 0.08, -15.0)
    }

    Flame {
        position: Qt.vector3d(-20.12, 0.08, -13.5)
    }

    Flame {
        position: Qt.vector3d(-22.28, 0.08, -12.18)
    }

    Flame {
        position: Qt.vector3d(-23.0, 0.08, -9.98)
    }

    Flame {
        position: Qt.vector3d(-19.88, -1.28, -8.94)
    }

    Flame {
        position: Qt.vector3d(-19.72, -1.28, -4.86)
    }

    Flame {
        position: Qt.vector3d(-21.08, -1.28, -0.06)
    }

    Flame {
        position: Qt.vector3d(3.84, -0.64, -28.12)
    }

    Flame {
        position: Qt.vector3d(3.84, -0.64, -29.48)
    }

    Flame {
        position: Qt.vector3d(2.56, -0.64, -34.52)
    }

    Flame {
        position: Qt.vector3d(-1.56, -2.24, -32.0)
    }

    Flame {
        position: Qt.vector3d(-1.56, -2.24, -28.48)
    }

    Flame {
        position: Qt.vector3d(3.84, -2.76, -30.68)
    }

    Flame {
        position: Qt.vector3d(1.68, -2.76, -26.92)
    }

    Flame {
        position: Qt.vector3d(1.64, -3.04, -24.28)
    }

    Flame {
        position: Qt.vector3d(6.04, -3.04, -24.28)
    }

    Flame {
        position: Qt.vector3d(1.28, -0.64, -13.48)
    }

    Flame {
        position: Qt.vector3d(1.28, -0.64, -12.12)
    }

    Flame {
        position: Qt.vector3d(3.8, -0.64, -8.04)
    }

    Flame {
        position: Qt.vector3d(1.56, -0.64, -6.44)
    }

    Flame {
        position: Qt.vector3d(-3.79, 1.52, -8.0)
    }

    Flame {
        position: Qt.vector3d(8.92, -2.76, -28.76)
    }

    Flame {
        position: Qt.vector3d(2.88, -1.08, -25.88)
    }

    Flame {
        position: Qt.vector3d(4.8, -1.08, -25.88)
    }

    Flame {
        position: Qt.vector3d(2.88, -1.12, -15.72)
    }

    Flame {
        position: Qt.vector3d(-0.32, -1.12, -15.72)
    }

    Flame {
        position: Qt.vector3d(12.76, -0.84, 3.2)
    }

    Flame {
        position: Qt.vector3d(13.48, -0.84, 3.2)
    }

    Flame {
        position: Qt.vector3d(14.12, -0.84, 1.24)
    }

    Flame {
        position: Qt.vector3d(14.12, -0.84, 5.16)
    }

    Flame {
        position: Qt.vector3d(-10.92, 0.08, -11.88)
    }

    Flame {
        position: Qt.vector3d(19.84, -0.84, 7.0)
    }

    Flame {
        position: Qt.vector3d(19.84, -0.84, -0.6)
    }

    Flame {
        position: Qt.vector3d(5.44, 0.76, 2.28)
    }

    Flame {
        position: Qt.vector3d(4.48, 0.76, 6.04)
    }

    Flame {
        position: Qt.vector3d(7.36, 0.76, 2.28)
    }

    Flame {
        position: Qt.vector3d(4.48, 0.76, 0.36)
    }

    Flame {
        position: Qt.vector3d(5.44, 0.76, 4.12)
    }

    Flame {
        position: Qt.vector3d(7.36, 0.76, 4.12)
    }

    Flame {
        position: Qt.vector3d(8.32, 0.76, 0.36)
    }

    Flame {
        position: Qt.vector3d(8.32, 0.76, 6.04)
    }

    Flame {
        position: Qt.vector3d(-2.28, -2.24, -28.48)
    }

    Flame {
        position: Qt.vector3d(1.36, -1.2, -31.4)
    }

    Flame {
        position: Qt.vector3d(-1.88, 1.56, 8.92)
    }

    Flame {
        position: Qt.vector3d(4.92, 1.08, 9.88)
    }

    Flame {
        position: Qt.vector3d(8.92, 1.08, 20.12)
    }

    Flame {
        position: Qt.vector3d(5.4, 1.92, 20.16)
    }

    Flame {
        position: Qt.vector3d(-1.88, 3.52, 20.16)
    }

    Flame {
        position: Qt.vector3d(0.28, 2.4, 17.32)
    }

    Flame {
        position: Qt.vector3d(-5.48, 2.4, 17.88)
    }

    Flame {
        position: Qt.vector3d(-5.48, 1.92, 22.44)
    }

    Flame {
        position: Qt.vector3d(-6.12, 2.2, 20.16)
    }

    Flame {
        position: Qt.vector3d(-9.0, 2.08, 18.88)
    }

    Flame {
        position: Qt.vector3d(-9.0, 2.08, 21.44)
    }

    Flame {
        position: Qt.vector3d(-4.76, 1.72, 20.16)
    }

    Flame {
        position: Qt.vector3d(2.52, 1.28, 21.72)
    }

    Flame {
        position: Qt.vector3d(2.36, 1.56, 7.24)
    }

    Flame {
        position: Qt.vector3d(-1.0, 2.08, 14.6)
    }

    // monsters

    Ogre {
        position: Qt.vector3d(6.8, -5.76, -28.8)
        eulerRotation: Qt.vector3d(0, 105, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-23.18, 6, -39.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
        targetname: "goldkeydoor"
    }

    Ogre {
        position: Qt.vector3d(-22.24, 6, -39.52)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
        targetname: "goldkeydoor"
    }

    Ogre {
        position: Qt.vector3d(-21.22, -0.88, -10.1)
        eulerRotation: Qt.vector3d(0, 195, 0)
    }

    HellKnight {
        position: Qt.vector3d(-20.48, -0.4, -7.52)
        eulerRotation: Qt.vector3d(0, 165, 0)
    }

    Wizard {
        position: Qt.vector3d(-23.6, 5.84, -38)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(-23.04, 5.84, -38)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(-22.48, 5.84, -38)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Ogre {
        position: Qt.vector3d(-17.68, -1.04, -12.48)
        eulerRotation: Qt.vector3d(0, 120, 0)
    }

    Knight {
        position: Qt.vector3d(-11.68, -0.32, -11.76)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-11.6, -0.32, -12.32)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-11.52, -0.32, -12.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-7.12, -1.9, -14.24)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-8.48, -2.16, -10.32)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Zombie {
        position: Qt.vector3d(-8.08, -2.16, -10.08)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-7.44, -2.16, -10.08)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Zombie {
        position: Qt.vector3d(-7.84, -2.16, -9.6)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-7.2, -2.16, -16.64)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Zombie {
        position: Qt.vector3d(-6.72, -2.16, -17.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Knight {
        position: Qt.vector3d(0.56, 0.24, 0.88)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "p1.1"
    }

    Knight {
        position: Qt.vector3d(-3.68, 0.24, 0.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "p1.1"
    }

    Ogre {
        position: Qt.vector3d(-3.04, 0.88, -4)
        eulerRotation: Qt.vector3d(0, 225, 0)
    }

    Knight {
        position: Qt.vector3d(-12.08, -0.56, 2.96)
        eulerRotation: Qt.vector3d(0, 225, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-14.96, -2.32, -0.16)
        eulerRotation: Qt.vector3d(0, 105, 0)
        spawnflags: 2
    }

    Zombie {
        position: Qt.vector3d(4.48, -5.52, -20.08)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(4.48, -5.52, -19.44)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    Zombie {
        position: Qt.vector3d(3.92, -5.52, -19.68)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    Ogre {
        position: Qt.vector3d(1.12, -1.36, -16.8)
        eulerRotation: Qt.vector3d(0, 45, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(9.52, -1.52, -20.64)
        eulerRotation: Qt.vector3d(0, 75, 0)
    }

    HellKnight {
        position: Qt.vector3d(2.4, -1.52, -22.72)
        eulerRotation: Qt.vector3d(0, 135, 0)
    }

    Ogre {
        position: Qt.vector3d(4.16, -1.36, -32.24)
        eulerRotation: Qt.vector3d(0, 120, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(4.96, -3.6, -22.08)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

    Knight {
        position: Qt.vector3d(3.2, -3.6, -22.08)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

    Wizard {
        position: Qt.vector3d(1.2, 0, -19.2)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(1.2, -0.64, -18.32)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-0.72, 0.88, -8)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(4.32, -1.36, -27.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(3.76, -1.36, -27.44)
        eulerRotation: Qt.vector3d(0, 75, 0)
    }

    Knight {
        position: Qt.vector3d(1.68, -1.28, -6.72)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    Knight {
        position: Qt.vector3d(-12.48, -0.56, 3.36)
        eulerRotation: Qt.vector3d(0, 225, 0)
    }

    Knight {
        position: Qt.vector3d(-3.68, 0.24, -2.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "p1.3"
    }

    Wizard {
        position: Qt.vector3d(-19.76, 5.84, -36.8)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-19.76, 5.84, -37.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-20.56, 5.76, -36.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-21.44, 5.76, -36.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-22.4, 5.76, -36.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-23.36, 5.76, -36.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-22.56, 5.76, -36)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(-21.68, 5.76, -36)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-23.36, 5.76, -35.92)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-13.68, -0.32, -12.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 0
    }

    HellKnight {
        position: Qt.vector3d(19.6, -1.68, -0.24)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 1
    }

    HellKnight {
        position: Qt.vector3d(20, -1.68, 6.72)
        eulerRotation: Qt.vector3d(0, 15, 0)
        spawnflags: 1
    }

    Demon {
        position: Qt.vector3d(22, -1.12, 3.2)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1536
    }

    Knight {
        position: Qt.vector3d(12.32, -1.52, 3.6)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(12.32, -1.52, 2.48)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    HellKnight {
        position: Qt.vector3d(11.84, -1.52, 3.04)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    Knight {
        position: Qt.vector3d(4.4, 0.24, 5.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(4.4, 0.24, 5.68)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(4.4, 0.24, 1.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(3.84, 0.24, 0.88)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(3.68, 0.24, 5.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Knight {
        position: Qt.vector3d(4.48, 0.24, 0.88)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HellKnight {
        position: Qt.vector3d(-1.68, -2.8, -27.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HellKnight {
        position: Qt.vector3d(1.04, -1.36, -34)
        eulerRotation: Qt.vector3d(0, 210, 0)
    }

    Ogre {
        position: Qt.vector3d(-20.56, 5.76, -37.84)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(-0.4, 2.88, 20.16)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(1.68, 1.04, 22.56)
        eulerRotation: Qt.vector3d(0, -15, 0)
        targetname: "entry_surprise_knights"
    }

    Knight {
        position: Qt.vector3d(1.68, 1.04, 23.04)
        eulerRotation: Qt.vector3d(0, -15, 0)
        targetname: "entry_surprise_knights"
    }

    Knight {
        position: Qt.vector3d(1.12, 1.04, 23.04)
        eulerRotation: Qt.vector3d(0, -15, 0)
        targetname: "entry_surprise_knights"
    }

    Knight {
        position: Qt.vector3d(1.12, 1.04, 22.56)
        eulerRotation: Qt.vector3d(0, -15, 0)
        targetname: "entry_surprise_knights"
    }

    Knight {
        position: Qt.vector3d(0.64, 1.04, 22.56)
        eulerRotation: Qt.vector3d(0, -15, 0)
        targetname: "entry_surprise_knights"
    }

    Knight {
        position: Qt.vector3d(0.64, 1.04, 23.04)
        eulerRotation: Qt.vector3d(0, -15, 0)
        targetname: "entry_surprise_knights"
    }

    Knight {
        position: Qt.vector3d(-20.48, 2.18, 29.6)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "p2.1"
    }

    Ogre {
        position: Qt.vector3d(-4, 2.24, 18.32)
        eulerRotation: Qt.vector3d(0, 195, 0)
    }

    Ogre {
        position: Qt.vector3d(-0.8, 0.88, 9.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
        target: "p3.1"
    }

    Shambler {
        position: Qt.vector3d(22, -0.12, 3.2)
        eulerRotation: Qt.vector3d(0, 105, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(18.88, -1.6, 2.08)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(18.88, -1.6, 2.72)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 256
    }

    Knight {
        position: Qt.vector3d(18.32, -1.6, 4.4)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 256
    }

    Demon {
        position: Qt.vector3d(-14.08, -2.28, 3.52)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 257
    }

    Knight {
        position: Qt.vector3d(-16, -2.16, -0.48)
        eulerRotation: Qt.vector3d(0, 165, 0)
    }

}
