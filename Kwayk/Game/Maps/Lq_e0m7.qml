import QtQuick
import QtQuick3D

import Kwayk.Game
import Kwayk.Core
import Assets.maps.lq_e0m7

World {
    id: root

    displayName: "Beyond Baneful Boundaries"
    worldtype: 1

    readonly property alias player: player

    Lq_e0m7_map {
        id: map
    }

    Lq_e0m7_map_hull0 {
    }

    Player {
        id: player
        position: Qt.vector3d(0.0, 7.68, 19.96)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    OnceTrigger {
        body: map.model_1
        position: Qt.vector3d(0, 0.64, -0.64)
        mins: Qt.vector3d(-1.28, -0.64, -0.32)
        maxs: Qt.vector3d(1.28, 0.64, 0.32)
        target: "bigdoor"
        spawnflags: 2048
    }

    Flame {
        position: Qt.vector3d(-1.88, 0.76, -4.16)
    }

    Flame {
        position: Qt.vector3d(1.88, 0.76, -5.44)
    }

    Flame {
        position: Qt.vector3d(1.88, 0.76, -2.88)
    }

    Train {
        body: map.model_2
        position: Qt.vector3d(-0.64, 0.96, -1.6)
        mins: Qt.vector3d(-0.64, -0.96, -0.32)
        maxs: Qt.vector3d(0.64, 0.96, 0.32)
        target: "bigdoor_pl1"
        targetname: "bigdoor"
        spawnflags: 2048
        speed: 0.5
        sounds: 1
    }

    Train {
        body: map.model_3
        position: Qt.vector3d(0.64, 0.96, -1.6)
        mins: Qt.vector3d(-0.64, -0.96, -0.32)
        maxs: Qt.vector3d(0.64, 0.96, 0.32)
        target: "bigdoor_pr1"
        targetname: "bigdoor"
        spawnflags: 2048
        speed: 0.5
        sounds: 1
    }

    PathCorner {
        targetname: "bigdoor_pl1"
        target: "bigdoor_pl2"
        position: Qt.vector3d(-1.28, 0.0, -1.28)
    }

    PathCorner {
        targetname: "bigdoor_pl2"
        target: "bigdoor_pl3"
        wait: 2
        position: Qt.vector3d(-1.28, 0.0, -8.0)
    }

    PathCorner {
        targetname: "bigdoor_pl3"
        target: "bigdoor_pl1"
        wait: -1
        position: Qt.vector3d(-2.56, 0.0, -8.0)
    }

    PathCorner {
        targetname: "bigdoor_pr1"
        target: "bigdoor_pr2"
        position: Qt.vector3d(0.0, 0.0, -1.28)
    }

    PathCorner {
        targetname: "bigdoor_pr2"
        target: "bigdoor_pr3"
        wait: 2
        position: Qt.vector3d(0.0, 0.0, -8.0)
    }

    PathCorner {
        targetname: "bigdoor_pr3"
        target: "bigdoor_pr1"
        wait: -1
        position: Qt.vector3d(1.28, 0.0, -8.0)
    }

    PathCorner {
        targetname: "path1_1"
        target: "path1_2"
        position: Qt.vector3d(-1.68, 0.24, -9.84)
    }

    PathCorner {
        targetname: "path1_2"
        target: "path1_1"
        position: Qt.vector3d(1.84, 0.24, -9.84)
    }

    PathCorner {
        targetname: "shamblerpath1"
        target: "shamblerpath2"
        position: Qt.vector3d(-1.2, -8.56, -26.96)
    }

    PathCorner {
        targetname: "shamblerpath2"
        target: "shamblerpath3"
        position: Qt.vector3d(-1.2, -8.56, -16.08)
    }

    PathCorner {
        targetname: "shamblerpath3"
        target: "shamblerpath4"
        position: Qt.vector3d(2.96, -8.56, -16.08)
    }

    PathCorner {
        targetname: "shamblerpath4"
        target: "shamblerpath1"
        position: Qt.vector3d(2.96, -8.56, -26.8)
    }

    Flame {
        position: Qt.vector3d(-2.6, 0.92, -11.52)
    }

    Flame {
        position: Qt.vector3d(2.6, 0.92, -11.56)
    }

    Flame {
        position: Qt.vector3d(-1.28, 0.92, -12.2)
    }

    Flame {
        position: Qt.vector3d(2.52, 0.92, -0.0)
    }

    Flame {
        position: Qt.vector3d(-2.52, 0.92, -0.0)
    }

    Flame {
        position: Qt.vector3d(-2.52, 0.92, 5.76)
    }

    Flame {
        position: Qt.vector3d(2.52, 0.92, 5.76)
    }

    SuperShotgunItem {
        spawnflags: 2048
        position: Qt.vector3d(2.0, 0.16, 4.8)
    }

    SuperNailgunItem {
        spawnflags: 2048
        position: Qt.vector3d(2.0, 0.16, 3.52)
    }

    RocketLauncherItem {
        spawnflags: 2048
        position: Qt.vector3d(2.0, 0.16, 0.96)
    }

    LightningItem {
        spawnflags: 0
        position: Qt.vector3d(2.0, 0.16, 2.24)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(-2.16, 0.16, 4.88)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(-2.16, 0.16, 3.68)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-2.16, 0.16, 2.4)
    }

    Armor {
        skin: 0
        position: Qt.vector3d(-2.0, 0.16, 0.96)
    }

    Flame {
        position: Qt.vector3d(-1.8, 1.08, 8.0)
    }

    Flame {
        position: Qt.vector3d(2.2, -0.36, -24.64)
    }

    Flame {
        position: Qt.vector3d(-1.24, 0.76, -15.36)
    }

    Flame {
        position: Qt.vector3d(4.44, 0.28, -17.92)
    }

    Flame {
        position: Qt.vector3d(-4.44, 0.28, -17.92)
    }

    Flame {
        position: Qt.vector3d(3.2, -0.36, -23.64)
    }

    Flame {
        position: Qt.vector3d(2.56, -0.36, -19.24)
    }

    Flame {
        position: Qt.vector3d(-2.56, -0.36, -19.24)
    }

    Wall {
        body: map.model_4
        position: Qt.vector3d(-1.36, 0.96, -8.32)
        mins: Qt.vector3d(-0.08, -0.96, -0.320001)
        maxs: Qt.vector3d(0.08, 0.96, 0.32)
        spawnflags: 1792
    }

    Wall {
        body: map.model_5
        position: Qt.vector3d(1.36, 0.96, -8.32)
        mins: Qt.vector3d(-0.08, -0.96, -0.320001)
        maxs: Qt.vector3d(0.08, 0.96, 0.32)
        spawnflags: 1792
    }

    Flame {
        position: Qt.vector3d(8.0, -1.0, -18.6)
    }

    Flame {
        position: Qt.vector3d(10.2, -1.0, -22.72)
    }

    Flame {
        position: Qt.vector3d(8.0, -7.4, -24.6)
    }

    Flame {
        position: Qt.vector3d(5.48, -7.4, -19.84)
    }

    Flame {
        position: Qt.vector3d(10.52, -7.4, -22.4)
    }

    OnceTrigger {
        body: map.model_7
        position: Qt.vector3d(8, -1.64, -21.44)
        mins: Qt.vector3d(-1.28, -0.28, -1.6)
        maxs: Qt.vector3d(1.28, 0.28, 1.6)
        target: "elevator"
        spawnflags: 2048
        delay: 1
    }

    Flame {
        position: Qt.vector3d(8.0, -7.4, -18.28)
    }

    Flame {
        position: Qt.vector3d(5.48, -7.4, -23.04)
    }

    Flame {
        position: Qt.vector3d(1.28, 0.92, -12.2)
    }

    Shells {
        position: Qt.vector3d(0.48, 0.0, -11.68)
    }

    Spikes {
        position: Qt.vector3d(-0.8, 0.0, -11.68)
    }

    Shells {
        position: Qt.vector3d(1.76, -1.28, -24.0)
    }

    Health {
        position: Qt.vector3d(-0.16, 0.0, -11.68)
    }

    Flame {
        position: Qt.vector3d(1.88, 1.08, 8.0)
    }

    Flame {
        position: Qt.vector3d(10.2, -1.0, -20.16)
    }

    Flame {
        position: Qt.vector3d(10.52, -7.4, -20.48)
    }

    TeleportTrigger {
        body: map.model_10
        position: Qt.vector3d(11.4, -7.68, -21.44)
        mins: Qt.vector3d(-0.04, -0.64, -0.32)
        maxs: Qt.vector3d(0.04, 0.64, 0.32)
        target: "tele_up"
    }

    TeleportDestination {
        targetname: "tele_down"
        position: Qt.vector3d(9.92, -7.52, -21.44)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportDestination {
        targetname: "tele_up"
        position: Qt.vector3d(7.12, -0.88, -21.44)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    TeleportTrigger {
        body: map.model_11
        position: Qt.vector3d(11.08, -1.28, -21.44)
        mins: Qt.vector3d(-0.04, -0.64, -0.32)
        maxs: Qt.vector3d(0.04, 0.64, 0.32)
        target: "tele_down"
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(-2.32, -1.2, -25.2)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-0.64, -1.2, -25.2)
    }

    Health {
        position: Qt.vector3d(-2.56, -1.28, -19.36)
    }

    Rockets {
        spawnflags: 1
        position: Qt.vector3d(-1.84, -1.2, -25.2)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-0.16, -1.2, -25.2)
    }

    Shells {
        position: Qt.vector3d(1.76, -1.28, -24.48)
    }

    Health {
        position: Qt.vector3d(-2.08, -1.28, -19.36)
    }

    OnceTrigger {
        body: map.model_12
        position: Qt.vector3d(0, 7.6, 9.28)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.48)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.48)
        target: "elevator_entry"
        delay: 1
    }

    TeleportTrigger {
        body: map.model_13
        position: Qt.vector3d(0, 5.2, 17.6)
        mins: Qt.vector3d(-4.48, -0.0799999, -6.72)
        maxs: Qt.vector3d(4.48, 0.0800004, 6.72)
        target: "tele_start"
    }

    TeleportDestination {
        targetname: "tele_start"
        position: Qt.vector3d(0.0, 8.0, 20.6)
        eulerRotation: Qt.vector3d(0, 0, 0)
    }

    TeleportTrigger {
        body: map.model_14
        position: Qt.vector3d(-3.04, 5.2, 7.68)
        mins: Qt.vector3d(-1.44, -0.0799999, -3.2)
        maxs: Qt.vector3d(1.44, 0.0800004, 3.2)
        target: "tele_start"
    }

    TeleportTrigger {
        body: map.model_15
        position: Qt.vector3d(3.04, 5.2, 7.68)
        mins: Qt.vector3d(-1.44, -0.0799999, -3.2)
        maxs: Qt.vector3d(1.44, 0.0800004, 3.2)
        target: "tele_start"
    }

    TeleportTrigger {
        body: map.model_16
        position: Qt.vector3d(0, 5.2, 6.08)
        mins: Qt.vector3d(-1.6, -0.0799999, -1.6)
        maxs: Qt.vector3d(1.6, 0.0800004, 1.6)
        target: "tele_start"
    }

    OnceTrigger {
        body: map.model_18
        position: Qt.vector3d(0, 7.52, 18.8)
        mins: Qt.vector3d(-0.64, -0.16, -0.24)
        maxs: Qt.vector3d(0.64, 0.16, 0.240002)
        target: "door_void1"
    }

    OnceTrigger {
        body: map.model_21
        position: Qt.vector3d(0, 7.52, 16.96)
        mins: Qt.vector3d(-0.64, -0.16, -0.48)
        maxs: Qt.vector3d(0.64, 0.16, 0.480001)
        target: "door_void2"
    }

    OnceTrigger {
        body: map.model_22
        position: Qt.vector3d(0, 7.52, 14.72)
        mins: Qt.vector3d(-0.64, -0.16, -0.48)
        maxs: Qt.vector3d(0.64, 0.16, 0.48)
        target: "door_void3"
    }

    Flame {
        position: Qt.vector3d(1.12, 7.96, 9.28)
    }

    Flame {
        position: Qt.vector3d(-1.12, 7.96, 9.28)
    }

    Flame {
        position: Qt.vector3d(-2.88, 0.76, -1.32)
    }

    SecretTrigger {
        body: map.model_24
        position: Qt.vector3d(-2.88, 0.64, -4.72)
        mins: Qt.vector3d(-0.32, -0.64, -0.0799999)
        maxs: Qt.vector3d(0.32, 0.64, 0.0800004)
    }

    Flame {
        position: Qt.vector3d(-5.12, 0.76, -1.32)
    }

    SuperDamage {
        position: Qt.vector3d(-5.12, 0.4, -5.44)
    }

    AmbientCompHum {
        position: Qt.vector3d(-4.56, -0.08, -21.12)
    }

    InfoIntermission {
        position: Qt.vector3d(-0.23608, 9.8907, 23.8839)
        eulerRotation: Qt.vector3d(-0, -180, -90)
    }

    Plat {
        body: map.model_25
        position: Qt.vector3d(-3.68, -9.28, -21.44)
        mins: Qt.vector3d(-0.16, -0.32, -1.28)
        maxs: Qt.vector3d(0.16, 0.320001, 1.28)
        targetname: "bossdeath"
        sounds: 2
    }

    RelayTrigger {
        target: "door_exit"
        targetname: "bossdeath"
        position: Qt.vector3d(10.48, -6.96, -20.72)
    }

    Flame {
        position: Qt.vector3d(1.64, -8.04, -18.56)
    }

    Flame {
        position: Qt.vector3d(1.64, -8.04, -24.32)
    }

    Flame {
        position: Qt.vector3d(0.28, -8.04, -24.32)
    }

    Flame {
        position: Qt.vector3d(0.28, -8.04, -18.56)
    }

    Flame {
        position: Qt.vector3d(4.12, -8.04, -24.32)
    }

    Flame {
        position: Qt.vector3d(4.12, -8.04, -18.56)
    }

    Flame {
        position: Qt.vector3d(-2.2, -8.04, -24.32)
    }

    Flame {
        position: Qt.vector3d(-2.2, -8.04, -18.56)
    }

    Flame {
        position: Qt.vector3d(-4.96, -8.52, -22.68)
    }

    Flame {
        position: Qt.vector3d(-4.96, -8.52, -20.2)
    }

    Flame {
        position: Qt.vector3d(0.96, -8.04, -17.24)
    }

    Flame {
        position: Qt.vector3d(0.96, -8.04, -25.64)
    }

    Armor {
        skin: 0
        position: Qt.vector3d(-5.12, -9.44, -21.44)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(1.12, -8.96, -21.92)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(1.12, -8.96, -20.64)
    }

    ChangeLevelTrigger {
        body: map.model_28
        position: Qt.vector3d(-17.68, -7.12, -21.44)
        mins: Qt.vector3d(-0.0799999, -0.72, -1.28)
        maxs: Qt.vector3d(0.0799999, 0.72, 1.28)
        map: "start"
    }

    Button {
        body: map.model_30
        position: Qt.vector3d(-11.52, -7.8, -24.32)
        mins: Qt.vector3d(-0.32, -0.04, -0.32)
        maxs: Qt.vector3d(0.320001, 0.04, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        target: "terminator_counter"
        wait: -1
        sounds: 2
    }

    Button {
        body: map.model_32
        position: Qt.vector3d(-15.36, -9.56, -21.44)
        mins: Qt.vector3d(-0.32, -0.04, -0.32)
        maxs: Qt.vector3d(0.320001, 0.04, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        target: "elevator_bossarena"
        wait: -1
        sounds: 2
    }

    Button {
        body: map.model_34
        position: Qt.vector3d(-11.52, -7.8, -18.56)
        mins: Qt.vector3d(-0.32, -0.04, -0.32)
        maxs: Qt.vector3d(0.320001, 0.04, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        target: "terminator_counter"
        wait: -1
        sounds: 2
    }

    Plat {
        body: map.model_35
        position: Qt.vector3d(-11.52, -8.72, -14.56)
        mins: Qt.vector3d(-1.92, -0.88, -0.48)
        maxs: Qt.vector3d(1.92, 0.88, 0.48)
        targetname: "elevator_bossarena"
        speed: 0.65
        sounds: 2
    }

    Plat {
        body: map.model_37
        position: Qt.vector3d(-11.52, -8.72, -28.32)
        mins: Qt.vector3d(-1.92, -0.88, -0.48)
        maxs: Qt.vector3d(1.92, 0.88, 0.48)
        targetname: "elevator_bossarena"
        speed: 0.65
        sounds: 2
    }

    Flame {
        position: Qt.vector3d(-14.44, -8.68, -18.88)
    }

    Flame {
        position: Qt.vector3d(-14.44, -8.68, -24.0)
    }

    Flame {
        position: Qt.vector3d(-8.6, -8.68, -24.0)
    }

    Flame {
        position: Qt.vector3d(-8.6, -8.68, -18.88)
    }

    CounterTrigger {
        target: "terminator"
        targetname: "terminator_counter"
        count: 2
        position: Qt.vector3d(-11.92, -7.68, -21.52)
    }

    Shalrath {
        targetname: "boss"
        target: "bossdeath"
        armortype: 1
        armorvalue: 3000
        effects: Defs.efBrightfield
        position: Qt.vector3d(-11.52, -8.4, -21.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    HurtTrigger {
        body: map.model_27
        position: Qt.vector3d(-11.52, -10.88, -21.52)
        mins: Qt.vector3d(-0.799999, -0.48, -0.879999)
        maxs: Qt.vector3d(0.8, 0.48, 0.880001)
        dmg: 50000
    }

    HurtTrigger {
        body: map.model_31
        position: Qt.vector3d(-11.52, -10, -21.52)
        mins: Qt.vector3d(-0.799999, -0.0799999, -0.879999)
        maxs: Qt.vector3d(0.8, 0.0799999, 0.880001)
        dmg: 0.1
    }

    HurtTrigger {
        body: map.model_33
        position: Qt.vector3d(-11.52, -9.68, -21.52)
        mins: Qt.vector3d(-0.799999, -0.0799999, -0.879999)
        maxs: Qt.vector3d(0.8, 0.0799999, 0.880001)
        dmg: 0.1
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-8.32, -9.6, -25.92)
    }

    Shells {
        spawnflags: 1
        position: Qt.vector3d(-7.84, -9.6, -16.64)
    }

    Health {
        position: Qt.vector3d(-16.16, -9.6, -20.0)
    }

    Health {
        position: Qt.vector3d(-16.16, -9.6, -22.56)
    }

    OnceTrigger {
        body: map.model_40
        position: Qt.vector3d(-4.96, -9.52, -21.44)
        mins: Qt.vector3d(-1.12, -0.0799999, -1.28)
        maxs: Qt.vector3d(1.12, 0.0800009, 1.28)
        target: "bossdoor"
    }

    RelayTrigger {
        targetname: "bossdeath"
        killtarget: "boss"
        delay: 3
        position: Qt.vector3d(-10.96, -8.72, -22.0)
    }

    AmbientCompHum {
        position: Qt.vector3d(-11.44, -5.68, -21.52)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(1.12, -8.96, -21.04)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(1.12, -8.96, -21.52)
    }

    Spikes {
        spawnflags: 1
        position: Qt.vector3d(-4.24, -9.44, -20.24)
    }

    Cells {
        spawnflags: 1
        position: Qt.vector3d(-4.72, -9.44, -22.32)
    }

    Shells {
        spawnflags: 1792
        position: Qt.vector3d(-1.12, 7.36, 8.16)
    }

    SuperShotgunItem {
        spawnflags: 1792
        position: Qt.vector3d(0.0, 7.36, 8.0)
    }

    Shells {
        spawnflags: 1792
        position: Qt.vector3d(0.96, 7.36, 8.16)
    }

    NailgunItem {
        spawnflags: 1792
        position: Qt.vector3d(-4.0, 0.0, -13.12)
    }

    Spikes {
        spawnflags: 1792
        position: Qt.vector3d(-4.32, 0.0, -12.32)
    }

    Spikes {
        spawnflags: 1792
        position: Qt.vector3d(-4.32, 0.0, -11.84)
    }

    // doors
    Door {
        id: door_6
        body: map.model_6
        position: Qt.vector3d(8, -5.04, -21.44)
        mins: Qt.vector3d(-1.44, -3.28, -1.76)
        maxs: Qt.vector3d(1.44, 3.28, 1.76)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "elevator"
        spawnflags: 2048
        wait: -1
        speed: 0.5
        sounds: 3
        lip: 0.16
        owner: door_6
        enemy: door_6
    }

    Door {
        id: door_8
        body: map.model_8
        position: Qt.vector3d(10.32, -1.28, -21.44)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_exit"
        spawnflags: 2048
        wait: -1
        owner: door_8
        enemy: door_8
    }

    Door {
        id: door_9
        body: map.model_9
        position: Qt.vector3d(10.64, -7.68, -21.44)
        mins: Qt.vector3d(-0.0799999, -0.64, -0.32)
        maxs: Qt.vector3d(0.0799999, 0.64, 0.32)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_exit"
        spawnflags: 2048
        wait: -1
        owner: door_9
        enemy: door_9
    }

    Door {
        id: door_17
        body: map.model_17
        position: Qt.vector3d(0, 5.28, 16.96)
        mins: Qt.vector3d(-0.64, -2.08, -0.639999)
        maxs: Qt.vector3d(0.64, 2.08, 0.640001)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_void1"
        spawnflags: 5
        wait: -1
        speed: 4
        sounds: 3
        owner: door_17
        enemy: door_17
    }

    Door {
        id: door_19
        body: map.model_19
        position: Qt.vector3d(0, 5.28, 14.72)
        mins: Qt.vector3d(-0.64, -2.08, -0.639999)
        maxs: Qt.vector3d(0.64, 2.08, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_void2"
        spawnflags: 5
        wait: -1
        speed: 4
        sounds: 3
        owner: door_19
        enemy: door_19
    }

    Door {
        id: door_20
        body: map.model_20
        position: Qt.vector3d(0, 5.28, 12.48)
        mins: Qt.vector3d(-0.64, -2.08, -0.639999)
        maxs: Qt.vector3d(0.64, 2.08, 0.64)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "door_void3"
        spawnflags: 5
        wait: -1
        speed: 4
        sounds: 3
        owner: door_20
        enemy: door_20
    }

    Door {
        id: door_23
        body: map.model_23
        position: Qt.vector3d(0, 3.68, 9.28)
        mins: Qt.vector3d(-0.64, -3.84, -0.64)
        maxs: Qt.vector3d(0.64, 3.84, 0.639999)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "elevator_entry"
        wait: -1
        speed: 0.5
        sounds: 3
        lip: 0.32
        owner: door_23
        enemy: door_23
    }

    Door {
        id: door_26
        body: map.model_26
        position: Qt.vector3d(-11.52, -10.08, -21.44)
        mins: Qt.vector3d(-0.639999, -1.28, -0.640001)
        maxs: Qt.vector3d(0.64, 1.28, 0.639999)
        movedir: Qt.vector3d(0, -1, 0)
        targetname: "terminator"
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_26
        enemy: door_26
    }

    Door {
        id: door_29
        body: map.model_29
        position: Qt.vector3d(-14.08, -8, -21.44)
        mins: Qt.vector3d(-1.28, -0.0799999, -0.560001)
        maxs: Qt.vector3d(1.28, 0.0799999, 0.559999)
        eulerRotation: Qt.vector3d(0, 90, 0)
        movedir: Qt.vector3d(-1, 0, 0)
        targetname: "bossdeath"
        spawnflags: 1
        wait: -1
        speed: 0.25
        owner: door_29
        enemy: door_29
    }

    Door {
        id: door_36
        body: map.model_36
        position: Qt.vector3d(-11.52, -8, -19.84)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.639999)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.639999)
        eulerRotation: Qt.vector3d(0, 180, 0)
        movedir: Qt.vector3d(0, 0, 1)
        targetname: "bossdeath"
        spawnflags: 1
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_36
        enemy: door_36
    }

    Door {
        id: door_38
        body: map.model_38
        position: Qt.vector3d(-11.52, -8, -23.04)
        mins: Qt.vector3d(-0.48, -0.0799999, -0.639999)
        maxs: Qt.vector3d(0.48, 0.0799999, 0.640001)
        eulerRotation: Qt.vector3d(0, 0, 0)
        movedir: Qt.vector3d(0, 0, -1)
        targetname: "bossdeath"
        spawnflags: 1
        wait: -1
        speed: 0.2
        sounds: 1
        owner: door_38
        enemy: door_38
    }

    Door {
        id: door_39
        body: map.model_39
        position: Qt.vector3d(-6.4, -8.96, -21.44)
        mins: Qt.vector3d(-0.16, -0.64, -0.960001)
        maxs: Qt.vector3d(0.16, 0.64, 0.959999)
        movedir: Qt.vector3d(0, 1, 0)
        targetname: "bossdoor"
        wait: -1
        speed: 0.25
        sounds: 3
        lip: 0.32
        owner: door_39
        enemy: door_39
    }

    // monsters

    ZombieV2 {
        position: Qt.vector3d(-1.68, 0.4, -6.72)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(1.68, 0.4, -6.72)
        eulerRotation: Qt.vector3d(0, 90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(4.47, 0.94, -21.44)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Wizard {
        position: Qt.vector3d(-0.16, 2.2, -23.04)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Wizard {
        position: Qt.vector3d(0.96, 2.2, -23.36)
        eulerRotation: Qt.vector3d(0, 180, 0)
    }

    Wizard {
        position: Qt.vector3d(0.32, 2.2, -23.2)
        eulerRotation: Qt.vector3d(0, 180, 0)
        spawnflags: 256
    }

    Ogre {
        position: Qt.vector3d(-4.08, -0.4, -17.6)
        eulerRotation: Qt.vector3d(0, -75, 0)
        spawnflags: 257
    }

    Ogre {
        position: Qt.vector3d(0.32, 0.24, -9.92)
        eulerRotation: Qt.vector3d(0, 165, 0)
        target: "path1_1"
    }

    HellKnight {
        position: Qt.vector3d(5.44, -1.52, -20.72)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-4.08, -0.96, -23.04)
        eulerRotation: Qt.vector3d(0, 165, 0)
    }

    Knight {
        position: Qt.vector3d(-0.48, -0.96, -24.8)
        eulerRotation: Qt.vector3d(0, 165, 0)
    }

    Knight {
        position: Qt.vector3d(-1.04, -0.96, -24.08)
        eulerRotation: Qt.vector3d(0, 165, 0)
        spawnflags: 256
    }

    ZombieV2 {
        position: Qt.vector3d(-4.79, 1.14, -21.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    Ogre {
        position: Qt.vector3d(3.36, -0.4, -17.44)
        eulerRotation: Qt.vector3d(0, 90, 0)
        spawnflags: 1
    }

    Knight {
        position: Qt.vector3d(-4.16, -0.32, -18.24)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    HellKnight {
        position: Qt.vector3d(0.64, -1.04, -20.8)
        eulerRotation: Qt.vector3d(0, 135, 0)
        spawnflags: 256
    }

    Shambler {
        position: Qt.vector3d(0.32, -8.72, -26.88)
        eulerRotation: Qt.vector3d(0, 90, 0)
        target: "shamblerpath1"
    }

    Shalrath {
        position: Qt.vector3d(-11.52, -7.6, -17.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Shalrath {
        position: Qt.vector3d(-11.52, -7.6, -25.12)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
    }

    Shambler {
        position: Qt.vector3d(-1.28, -8.72, -16.48)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 256
        target: "shamblerpath3"
    }

    ZombieV2 {
        position: Qt.vector3d(-6.07, -7.44, -21.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
        spawnflags: 1
    }

    ZombieV2 {
        position: Qt.vector3d(-15.36, -9.36, -24.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-14.56, -9.36, -25.6)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-13.76, -9.36, -17.44)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-12.48, -9.36, -17.92)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-9.12, -9.36, -17.28)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-10.08, -9.36, -25.76)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    ZombieV2 {
        position: Qt.vector3d(-9.76, -9.36, -24.96)
        eulerRotation: Qt.vector3d(0, -90, 0)
    }

    Wizard {
        position: Qt.vector3d(0.12, -6.48, -23.36)
        eulerRotation: Qt.vector3d(0, 150, 0)
    }

    Wizard {
        position: Qt.vector3d(0.12, -6.64, -19.28)
        eulerRotation: Qt.vector3d(0, 30, 0)
    }

}
