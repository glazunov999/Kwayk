import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Backend

Entity {
    id: root

    property real ltime: 0
    property real t_length: 0
    property real t_width: 0
    property vector3d dest: Qt.vector3d(0, 0, 0)
    property vector3d dest1: Qt.vector3d(0, 0, 0)
    property vector3d dest2: Qt.vector3d(0, 0, 0)
    property real delay: 0
    property var think1: null
    property vector3d finaldest: Qt.vector3d(0, 0, 0);
    property real lip: 0
    property string __state: ""
    property vector3d origin: Qt.vector3d(0, 0, 0)
    property vector3d pos1: Qt.vector3d(0, 0, 0)
    property vector3d pos2: Qt.vector3d(0, 0, 0)
    property real height: 0
    property var blocked: null
    property real touch_finished: 0

    readonly property alias combat: combat

    movedir: forward

    th.movetype: "push"

    Component.onCompleted: {
        origin = root.position;

        if (body)
            body.kinematicPosition = Qt.binding(function() { return root.position.minus(origin); });

        bindAnimatedMaterial();
    }

    th.onPhysics: {
        const oldltime = ltime;
        const thinktime = th.nextthink;

        let movetime;
        if (thinktime < (ltime + frameTime)) {
            movetime = thinktime - oldltime;
            if (movetime < 0.0)
                movetime = 0.0;
        } else {
            movetime = frameTime;
        }

        if (movetime !== 0.0)
            pushMove(movetime);

        if (thinktime > oldltime && thinktime <= ltime) {
            th.nextthink = 0.0;
            th?.think();
        }
    }

    Connections {
        target: body
        function onCharacterContact(body) {
            other = body?.ent ?? null;
            if (touch !== null && other !== null && solid)
                touch();
        }
    }

    Combat { id: combat }

    function calcMove(tdest, tspeed, func) {
        if (!tspeed)
            console.log("No speed is defined!");

        think1 = func;
        finaldest = tdest;
        th.think = calcMoveDone;

        if (tdest.fuzzyEquals(root.position)) {
            velocity = Qt.vector3d(0, 0, 0);
            th.nextthink = ltime + 0.1;
            return
        }

        const vdestdelta = tdest.minus(root.position);
        const len = vdestdelta.length();
        let traveltime = len / tspeed;

        if (traveltime < 0.1)
            traveltime = 0.1;

        th.nextthink = ltime + traveltime;
        velocity = vdestdelta.times(1 / traveltime);
    }

    Component {
        id: pushedComponent
        Body {
            shape: body.shape
            objectLayer: Layers.Pushed
            motionType: Body.Static
        }
    }

    function testBodyPosition(check, pos) {
        const trans = Qt.matrix4x4();
        trans.translate(pos);

        const results = physicsSystem.collideShape(check.shape, trans, Qt.vector3d(0, 0, 0), Layers.BP_NonMoving, Layers.Pushed, []);
        return results.length !== 0;
    }

    function pushMove(movetime) {
        if (velocity.fuzzyEquals(Qt.vector3d(0, 0, 0))) {
            ltime += movetime;
            return;
        }

        const move = velocity.times(movetime);
        const pos = root.position.plus(move);

        let isBlocked = false;

        let trans = Qt.matrix4x4();
        trans.translate(pos);

        const ents = {}

        let results = physicsSystem.collideShape(root.body.shape, trans, Qt.vector3d(0, 0, 0), Layers.Normal, [], 8);
        for (let i = 0; i < results.length; ++i) {
            const body = results[i].body2;
            ents[body] = body.ent;
        }

        let pushed = null;
        if (results.length !== 0)
            pushed = pushedComponent.createObject(world, { position: pos });

        for (let e in ents) {
            const check = ents[e];

            trans = Qt.matrix4x4();
            trans.translate(check.position);

            results = physicsSystem.castShape(check.shape, trans, move, Qt.vector3d(0, 0, 0), Layers.Normal, [check.body, pushed], 1);
            if (results.length === 0)
                continue;

            let checkpos = results[0].position;
            checkpos = checkpos.minus(Qt.vector3d(0, check.size.y / 2, 0));

            if (testBodyPosition(check, checkpos)) {
                if (blocked) {
                    other = check;
                    isBlocked = true;
                    blocked();
                }
                break;
            }
        }

        pushed?.destroy();

        /*
        if (isBlocked) // FIXME: Walker's capsule gets stuck on a SecretDoor
            return;
        */

        root.position = pos;
        ltime += movetime;
    }

    function calcMoveDone() {
        root.position = finaldest;

        velocity = Qt.vector3d(0, 0, 0)
        th.nextthink = -1

        if (think1 !== null)
            think1();
    }

    function bindAnimatedMaterial() {
        for (let i = 0; i < body.children.length; ++i) {
            const child = body.children[i]
            if (!child.materials)
                continue;

            for (let j = 0; j < child.materials.length; ++j) {
                const material = child.materials[j];
                material.frame = Qt.binding(function() { return th.frame; })
            }
        }
    }
}
