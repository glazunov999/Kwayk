import QtQuick
import QtQuick3D

import Backend
import Kwayk.Core
import Kwayk.Ui

Node {
    id: root

    property vector3d velocity: Qt.vector3d(0, 0, 0)
    property vector3d avelocity: Qt.vector3d(0, 0, 0)
    property vector3d punchangle: Qt.vector3d(0, 0, 0)
    property vector3d mins: Qt.vector3d(0, 0, 0)
    property vector3d maxs: Qt.vector3d(0, 0, 0)
    readonly property vector3d size: maxs.minus(mins)
    readonly property vector3d absmin: position.plus(mins)
    readonly property vector3d absmax: position.plus(maxs)
    readonly property vector3d center: maxs.plus(mins).times(0.5)

    property vector3d movedir: Qt.vector3d(0, 0, 0)

    property var self: root
    property var other: null
    property var owner: null
    property var body: null
    property string classname: ""
    property bool solid: true

    property real max_health: 0
    property real health: 0
    property real takedamage: 0
    property var enemy: null
    property int spawnflags: 0
    property int flags: 0
    property string target: ""
    property string targetname: ""
    property string killtarget: ""
    property real armortype: 0
    property real armorvalue: 0
    property string message: ""
    property int sounds: 0
    property real attack_finished: 0
    property real speed: 0
    property real wait: 0
    property real dmg: 0
    property int cnt: 0
    property int items: 0
    property real delay: 0
    property var activator: null
    property var use: null
    property var touch: null
    property int effects: 0
    property int waterlevel: 0
    property int watertype: 0
    property var th_pain: null
    property var th_die: null

    readonly property alias th: th
    readonly property alias talkSound: noise

    readonly property int notEasy: 256
    readonly property int notMedium: 512
    readonly property int notHard: 1024

    Think {
        id: th
        running: root.visible
    }

    Think {
        id: delayTimer
        think: delayThink
        running: root.visible
    }

    Component.onCompleted: {
        if ((vars.skill.value === 0 && (spawnflags & notEasy))
                || (vars.skill.value === 1 && (spawnflags & notMedium))
                || (vars.skill.value >= 2 && (spawnflags & notHard))) {
            solid = visible = false;
        }
    }

    onBodyChanged: {
        if (!body)
            return;

        if (body.simulationEnabled !== undefined)
            body.simulationEnabled = Qt.binding(function() { return root.solid; });
        body.visible = Qt.binding(function() { return visible; })

        if (body.ent !== undefined)
            body.ent = this;
    }

    function delayThink() {
        delay = 0;
        useTargets();
    }

    function find(targetname, target) {
        const ents = []
        for (let i = 0; i < children.length; ++i) {
            const ent = children[i]
            if (ent[targetname] === target)
                ents.push(ent);
        }

        return ents;
    }

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/misc/talk.wav"
    }

    function useTargets() {
        // check for a delay
        if (delay > 0) {
            delayTimer.nextthink = time + delay;
            return;
        }

        // print the message
        if (activator && activator.classname === "player" && message !== "") {
            ui.centerprint(message);
            noise.play();
        }

        // kill the killtargets
        if (killtarget) {
            const targets = world.find("targetname", target);
            for (let i = 0; i < targets.length; ++i) {
                const targ = targets[i];
                targ.solid = false;
                targ.visible = false;
            }
        }

        // fire targets
        if (target) {
            const targets = world.find("targetname", target);
            for (let i = 0; i < targets.length; ++i) {
                const targ = targets[i];
                if (targ && targ.use && targ.solid) {
                    targ.activator = activator;
                    targ.use();
                }
            }
        }
    }

    Sound {
        id: h20hit1Sound
        ent: parent
        source: "qrc:/Assets/sounds/misc/h2ohit1.wav"
        attenuationType: Defs.attnNorm
    }

    function pointContents(point) {
        const hits = physicsSystem.collidePoint(point, Layers.BP_NonSolid, Layers.NonSolid, []);
        for (let i = 0; i < hits.length; ++i) {
            const hit = hits[i];
            if (hit.objectName.startsWith("water"))
                return Defs.contentsWater;
            if (hit.objectName.startsWith("slime"))
                return Defs.contentsSlime;
            if (hit.objectName.startsWith("lava"))
                return Defs.contentsLava;
            if (hit.objectName.startsWith("sky"))
                return Defs.contentsSky;
        }
        return Defs.contentsEmpty;
    }

    function checkWaterTransition() {
        const cont = pointContents(position);

        if (watertype === 0) {
            watertype = cont;
            return;
        }

        if (cont <= Defs.contentsWater) {
            if (watertype === Defs.contentsEmpty)
                h20hit1Sound.play();
            watertype = cont;
            return;
        }

        if (watertype !== Defs.contentsEmpty)
            h20hit1Sound.play();

        watertype = Defs.contentsEmpty;
    }
}
