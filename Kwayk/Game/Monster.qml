import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Kwayk.Core
import Backend
import "../js/vec.js" as Vec

Walker {
    id: root

    readonly property alias ai: ai
    readonly property alias fight: fight

    property var movetarget: null
    property real ideal_yaw: 0
    property real yaw_speed: 20
    property var goalentity: null
    property var oldenemy: null
    property real speed: 0
    property bool lefty: false;
    property real search_time: 0
    property int attack_state: 0
    property bool enemy_visible: false
    property bool enemy_infront: false
    property real enemy_range: 0
    property real enemy_yaw: 0

    property var th_stand: null
    property var th_walk: null
    property var th_run: null
    property var th_missile: null
    property var th_melee: null

    property vector3d move: Qt.vector3d(0, 0, 0)
    property real moveTime: 0
    property real moveLerpStart: 0
    property vector3d currentPosition: Qt.vector3d(0, 0, 0)
    property vector3d previousPosition: Qt.vector3d(0, 0, 0)

    property vector3d currentAngles: Qt.vector3d(0, 0, 0)
    property vector3d previousAngles: Qt.vector3d(0, 0, 0)
    property real anglesLerpStart: 0

    objectLayer: solid ? Layers.Monster : Layers.Item

    view_ofs: Qt.vector3d(0, 0.25, 0);
    monster: true

    th.movetype: "step"

    use: monster_use

    th.onPhysics: {
        if (th.movetype === "")
            return;

        if (th.movetype === "bounce" || th.movetype === "toss")
            physicsToss();
        else
            physicsStep();
    }

    Ai { id: ai }

    Fight { id: fight }

    Sound {
        id: dland2Sound
        ent: parent
        source: "qrc:/Assets/sounds/demon/dland2.wav"
        attenuationType: Defs.attnNorm
    }

    function lerpAngle(from, to, t) {
        let diff = to - from;
        if (diff > 180) diff -= 360;
        if (diff < -180) diff += 360;
        return from + diff * t;
    }

    function physicsStep() {
        let hitsound = false;
        if (th.movetype === "step") {
            hitsound = velocity.y < physicsSystem.gravity.y * 0.1;
            addGravity();
        }
        if (th.movetype === "step" && !onGround) {
            updatePosition();

            if (onGround && hitsound)
                dland2Sound.play();

            currentPosition = previousPosition = position;
            currentAngles = previousAngles = eulerRotation;
            moveTime = 0;
        } else {
            velocity = velocity.times(Qt.vector3d(0, 1, 0));

            const oldPos = body.position.minus(root.center);
            updatePosition();
            const pos = body.position.minus(root.center);

            let diff = pos.minus(oldPos);
            previousPosition = previousPosition.plus(diff);
            currentPosition = currentPosition.plus(diff);

            let blend = (time - moveLerpStart) / 0.1;
            blend = Math.min(1.0, blend);
            blend = Math.max(0.0, blend);

            diff = currentPosition.minus(previousPosition).times(blend);
            position = previousPosition.plus(diff);

            blend = (time - anglesLerpStart) / 0.1;
            blend = Math.min(1.0, blend);
            blend = Math.max(0.0, blend);

            eulerRotation = Qt.vector3d(
                lerpAngle(previousAngles.x, currentAngles.x, blend),
                lerpAngle(previousAngles.y, currentAngles.y, blend),
                lerpAngle(previousAngles.z, currentAngles.z, blend)
            );

            onGround = true;
            moveTime += frameTime;
        }
        checkWaterTransition();
    }

    function updateMove() {
        body.setLinearVelocity(move.times(10));
        const deltaTime = Math.min(moveTime, 0.1);
        body.extendedUpdate(deltaTime, physicsSystem.gravity, updateSettings, objectLayer, [body]);
        const pos = body.position.minus(root.center);
        previousPosition = currentPosition;
        currentPosition = pos;
        moveLerpStart = time;
        moveTime = 0;
    }

    function walkmove(yaw, dist) {
        if (!onGround && th.movetype === "step")
            return false;

        yaw = yaw * Math.PI / 180.0;
        move = Qt.vector3d(-Math.sin(yaw) * dist, 0, -Math.cos(yaw) * dist);
        const moved = movestep(move);
        if (!moved)
            move = Qt.vector3d(0, 0, 0);
        updateMove();
        return moved;
    }

    function movestep(move) {
        let pos = root.position.plus(root.center).plus(move);

        if (th.movetype !== "step") {
            for (let i = 0; i < 2; ++i) {
                const newpos = Qt.vector3d(pos.x, pos.y, pos.z);
                if (i === 0 && enemy !== null) {
                    const dy = position.y - enemy.y;
                    if (dy > 0.4)
                        newpos.y -= 0.08;
                    else if (dy < 0.3)
                        newpos.y += 0.08;
                }
                let trans = Qt.matrix4x4();
                trans.translate(newpos);
                let results = physicsSystem.collideShape(root.shape, trans, Qt.vector3d(0, 0, 0), Layers.Normal, [body]);
                if (results.length === 0) {
                    if (th.movetype === "swim" && pointContents(newpos) === Defs.contentsEmpty)
                        return false;

                    return true;
                }
                if (!enemy)
                    return false;
            }
            return false;
        }

        pos.y += 0.18;

        let trans = Qt.matrix4x4();
        trans.translate(pos);

        let results = physicsSystem.collideShape(root.shape, trans, Qt.vector3d(0, 0, 0), Layers.Normal, [body]);
        if (results.length !== 0) {
            pos.y -= 0.18;

            trans = Qt.matrix4x4();
            trans.translate(pos);

            results = physicsSystem.collideShape(root.shape, trans, Qt.vector3d(0, 0, 0), Layers.Normal, [body]);
            if (results.length !== 0) {
                move.x = move.y = move.z = 0;
                return false;
            }
        }

        if (!checkBottom(move))
            return false;

        return true;
    }

    function checkBottom(move) {
        const mins = root.mins.plus(root.position).plus(move);
        const maxs = root.maxs.plus(root.position).plus(move);

        let start = Qt.vector3d(0, 0, 0);
        let realcheck = false;

        start.y = mins.y - 0.01;
        for (let x = 0; x < 2 && !realcheck; ++x) {
            for (let z = 0; z < 2 && !realcheck; ++z) {
                start.x = x ? maxs.x : mins.x;
                start.z = z ? maxs.z : mins.z;
                const hits = physicsSystem.collidePoint(start, Layers.BP_Solid, Layers.Solid, []);
                realcheck = hits.length === 0;
            }
        }
        if (!realcheck)
            return true;

        start = Qt.vector3d((mins.x + maxs.x) / 2, mins.y, (mins.z + maxs.z) / 2);
        const stop = Qt.vector3d(start.x, start.y - 0.36, start.z);

        let hit = physicsSystem.castRay(start, stop.minus(start), Layers.Normal, [body]);
        if (hit.fraction >= 1.0)
            return false;

        const mid = hit.position.y;
        for (let x = 0; x <= 1; ++x) {
            for (let z = 0; z <= 1; ++z) {
                start.x = stop.x = x !== 0 ? maxs.x : mins.x;
                start.z = stop.z = z !== 0 ? maxs.z : mins.z;
                hit = physicsSystem.castRay(start, stop.minus(start), Layers.Normal, [body]);
                if ((hit.fraction >= 1.0) || (mid - hit.position.y > 0.18))
                    return false;
            }
        }

        return true;
    }

    function monster_use() {
        if (enemy)
            return;

        if (health <= 0)
            return;

        if (activator.items & Defs.itInvisibility)
            return;

        if (activator.noTarget)
            return;

        if (activator.classname !== "player")
            return;

        // delay reaction so if the monster is teleported, its sound is still heard
        enemy = activator;
        th.nextthink = time + 0.1;
        th.think = ai.foundTarget;
    }

    function movetogoal(dist) {
        if (!onGround && th.movetype === "step")
            return;
        if (Math.random() < 0.25 || !stepDirection(ideal_yaw, dist))
            newChaseDir(goalentity, dist);
    }

    function walkmonster_start() {
        th.nextthink += Math.random() * 0.5;
        th.think = walkmonster_start_go;

        if (visible)
            total_monsters++;
    }

    function walkmonster_start_go() {
        takedamage = Defs.damageAim;

        ideal_yaw = Vec.anglemod(eulerRotation.y);
        angles = Qt.vector3d(eulerRotation.x, ideal_yaw, eulerRotation.z);

        if (target) {
            const targets = world.find("targetname", target);
            if (!targets.length) {
                console.log("couldn't find target");
                return;
            }

            goalentity = movetarget = targets[0];
            ideal_yaw = Vec.vectoyaw(goalentity.position.minus(root.position));

            if (movetarget.classname === "path_corner") {
                th_walk();
            } else {
                pausetime = 99999999;
                th_stand();
            }

        } else {
            pausetime = 99999999;
            th_stand();
        }

        th.nextthink += Math.random() * 0.5;
    }

    function flymonster_start() {
        th.nextthink += Math.random() * 0.5;
        th.think = flymonster_start_go;

        if (visible)
            total_monsters++;
    }

    function flymonster_start_go() {
        takedamage = Defs.damageAim;

        ideal_yaw = Vec.anglemod(eulerRotation.y);
        angles = Qt.vector3d(eulerRotation.x, ideal_yaw, eulerRotation.z);

        if (target) {
            const targets = world.find("targetname", target);
            if (!targets.length) {
                console.log("couldn't find target");
                return;
            }

            goalentity = movetarget = targets[0];
            ideal_yaw = Vec.vectoyaw(goalentity.position.minus(root.position));

            if (movetarget.classname === "path_corner") {
                th_walk();
            } else {
                pausetime = 99999999;
                th_stand();
            }

        } else {
            pausetime = 99999999;
            th_stand();
        }
    }

    function swimmonster_start() {
        th.nextthink += Math.random() * 0.5;
        th.think = walkmonster_start_go;

        if (visible)
            total_monsters++;
    }

    function attackFinished(normal) {
        cnt = 0;
        if (vars.skill.value !== 3)
            attack_finished = time + normal;
    }

    function checkRefire(thinkst) {
        if (vars.skill.value !== 3)
            return;

        if (cnt === 1)
            return;

        if (!ai.isVisible(enemy))
            return;

        cnt = 1;
        th.think = thinkst;
    }

    function changeYaw() {
        const currentAngle = Vec.anglemod(angles.y);
        const ideal = ideal_yaw;

        if (currentAngle === ideal)
            return;

        let move = ideal - currentAngle;
        if (ideal > currentAngle) {
            if (move >= 180.0)
                move -= 360.0;
        } else {
            if (move <= -180.0)
                move += 360.0;
        }
        if (move > 0) {
            if (move > yaw_speed)
                move = yaw_speed;
        } else {
            if (move < -yaw_speed)
                move = -yaw_speed;
        }

        previousAngles = currentAngles;
        currentAngles = Qt.vector3d(currentAngles.x, currentAngle + move, currentAngles.z);
        anglesLerpStart = time;

        angles.y = Vec.anglemod(currentAngles.y);
    }

    function stepDirection(yaw, dist) {
        ideal_yaw = yaw;
        changeYaw();

        yaw = yaw * Math.PI / 180.0;
        move = Qt.vector3d(-Math.sin(yaw) * dist, 0, -Math.cos(yaw) * dist);

        if (movestep(move)) {
            const delta = angles.y - ideal_yaw;
            if (delta > 45 && delta < 315)
                move = Qt.vector3d(0, 0, 0);
            updateMove();
            return true;
        } else {
            move = Qt.vector3d(0, 0, 0)
        }

        updateMove();
        return false;
    }

    function newChaseDir(enemy, dist) {
        const DI_NODIR = -1;

        const olddir = Vec.anglemod(Math.floor(ideal_yaw / 45) * 45);
        const turnaround = Vec.anglemod(olddir - 180);

        const deltax = enemy.position.x - position.x;
        const deltaz = enemy.position.z - position.z;

        let d1, d2;

        if (deltax > 0.1)
            d1 = 270;
        else if (deltax < -0.1)
            d1 = 90;
        else
            d1 = DI_NODIR;

        if (deltaz > 0.1)
            d2 = 180;
        else if (deltaz < -0.1)
            d2 = 0;
        else
            d2 = DI_NODIR;

        let tdir;
        if (d1 !== DI_NODIR && d2 !== DI_NODIR) {
            if (d1 === 270)
                tdir = (d2 === 0) ? 315 : 225;
            else
                tdir = (d2 === 0) ? 45 : 135;

            if (tdir !== turnaround && stepDirection(tdir, dist))
                return;
        }

        // try other directions
        if ((Math.random() >= 0.5) || (Math.abs(deltaz) > Math.abs(deltax))) {
            tdir = d1;
            d1 = d2;
            d2 = tdir;
        }

        if (d1 !== DI_NODIR && d1 !== turnaround && stepDirection(d1, dist))
            return;

        if (d2 !== DI_NODIR && d2 !== turnaround && stepDirection(d2, dist))
            return;

        // there is no direct path to the player, so pick another direction
        if (olddir !== DI_NODIR && stepDirection(olddir, dist))
            return;

        if (Math.random() >= 0.5) {
            for (tdir = 0; tdir <= 315; tdir += 45) {
                if (tdir !== turnaround && stepDirection(tdir, dist))
                    return;
            }
        } else {
            for (tdir = 315; tdir >= 0; tdir -= 45) {
                if (tdir !== turnaround && stepDirection(tdir, dist))
                    return;
            }
        }

        if (turnaround !== DI_NODIR && stepDirection(turnaround, dist))
            return;

        ideal_yaw = olddir; // can't move
    }
}
