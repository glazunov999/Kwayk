import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Kwayk.Core
import Backend
import "../../../js/math.js" as M

Monster {
    id: root

    property bool dead: false
    property bool settled: false
    property bool standingUp: false
    property bool standUpBlending: false
    property real standUpBlendTime: 0

    property string pendingClip: ""
    property real blendDurationMs: standUpBlendMs
    property bool standUpFaceDown: false

    property string clipState: "none"
    // 0 fine, 1 pain, 2 knocked down.
    property int inpain: 0
    property real painTimeLeft: 0
    property string painClipName: "painMid"
    property real attackTimeLeft: 0
    property real attackDuration: 0
    property bool attackHitDone: false
    property string attackClipName: "attackRight"

    readonly property real modelScale: 0.375
    readonly property real modelFacingYaw: 180
    readonly property real moveSpeed: 0.12
    readonly property real moveDist: moveSpeed * 0.1

    readonly property real idleSoundIntervalSec: 2.5
    property real idleSoundNextTime: 0
    readonly property real standUpBlendMs: 450
    readonly property real painBlendInMs: 110
    readonly property real painBlendOutMs: 260
    readonly property real painSideThreshold: 0.04
    readonly property real attackBlendInMs: 100
    readonly property real attackBlendOutMs: 200

    readonly property real attackThrowAt: 0.340

    readonly property vector3d attackLeftOffset: Qt.vector3d(0.12, -0.16, 0.18)
    readonly property vector3d attackRightOffset: Qt.vector3d(0.12, 0.16, 0.18)

    readonly property var zomGibComponent: Qt.createComponent("../../Flies/ZomGib.qml")

    property vector3d hitDir: Qt.vector3d(0, 0, 0)
    property vector3d hitPos: Qt.vector3d(0, 0, 0)
    property bool hitPosValid: false

    readonly property real fallBaseSpeed: 0.825
    readonly property real fallDamageScale: 0.0225
    readonly property real fallMaxSpeed: 2.775
    readonly property real fallDamageCap: 28
    readonly property real fallMinUp: 0.675
    readonly property real fallExplodeScale: 0.45
    readonly property real fallExplodeMaxSpeed: 5.0
    readonly property real fallTumbleImpulse: 14
    readonly property real fallTumbleImpulseMin: 8

    readonly property bool hasSkinnedModel: !!(modelItem && modelItem.hips)

    readonly property var clips: !hasSkinnedModel ? ({}) : ({
        "idle": { timeline: modelItem.idleTimeline,
                  animation: modelItem.idleAnimation },
        "walk": { timeline: modelItem.walkTimeline,
                  animation: modelItem.walkAnimation },
        "painLeft": { timeline: modelItem.painLeftTimeline,
                      animation: modelItem.painLeftAnimation },
        "painMid": { timeline: modelItem.painMidTimeline,
                     animation: modelItem.painMidAnimation },
        "painRight": { timeline: modelItem.painRightTimeline,
                       animation: modelItem.painRightAnimation },
        "attackLeft": { timeline: modelItem.attackLeftTimeline,
                        animation: modelItem.attackLeftAnimation },
        "attackRight": { timeline: modelItem.attackRightTimeline,
                         animation: modelItem.attackRightAnimation },
        "standUpFaceUp": { timeline: modelItem.standUpFaceUpTimeline,
                           animation: modelItem.standUpFaceUpAnimation },
        "standUpFaceDown": { timeline: modelItem.standUpFaceDownTimeline,
                             animation: modelItem.standUpFaceDownAnimation }
    })

    readonly property string standUpClipName: standUpFaceDown ? "standUpFaceDown"
                                                              : "standUpFaceUp"

    readonly property var activeStandUpAnimation: hasSkinnedModel
        ? clips[standUpClipName].animation
        : null

    readonly property real activeStandUpDurationMs: activeStandUpAnimation
                                                   ? activeStandUpAnimation.duration
                                                   : 1

    readonly property var activeStandUpController: root.standUpFaceDown
        ? standUpFaceDownController
        : standUpFaceUpController

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.40, 0.16)

    classname: "monster_zombie"

    health: 60
    max_health: 60

    th_stand: zombie_stand
    th_walk: zombie_walk
    th_run: zombie_run
    th_missile: zombie_missile
    th_melee: null
    th_pain: zombie_pain
    th_die: die

    modelComponent: ZombieV2Model {
        y: -0.24
        eulerRotation: Qt.vector3d(0, root.modelFacingYaw, 0)
        scale: Qt.vector3d(root.modelScale, root.modelScale, root.modelScale)
    }

    headComponent: Alias {
        mdl.source: "qrc:/Assets/progs/h_zombie.mdl"
        skin.source: "qrc:/Assets/progs/skins/h_zombie.png"
        active: false
    }

    ZombieV2Ragdoll {
        id: ragdoll
        objectLayer: Layers.NonSolid
        motionType: Body.Kinematic
        visible: false
        eulerRotation: Qt.vector3d(0, root.modelFacingYaw, 0)
    }

    SkeletonPose {
        id: neutralPose
    }

    SkeletonPose {
        id: currentPose
    }

    SkeletonPose {
        id: settledPose
    }

    SkeletonPose {
        id: animStartPose
    }

    SkeletonMapper {
        id: mapper
        ragdoll: ragdoll
        skin: root.hasSkinnedModel ? root.modelItem.skin : null
        modelNode: root.hasSkinnedModel ? root.modelItem : null
        neutralPose: neutralPose
        lockTranslations: true
    }

    AnimationController {
        id: standUpFaceUpController
        animation: root.hasSkinnedModel ? root.modelItem.standUpFaceUpAnimation : null
    }

    AnimationController {
        id: standUpFaceDownController
        animation: root.hasSkinnedModel ? root.modelItem.standUpFaceDownAnimation : null
    }

    Sound {
        id: idleSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_idle.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: idle1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_idle1.wav"
        attenuationType: Defs.attnIdle
    }

    Sound {
        id: fallSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_fall.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: painSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_pain.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: pain1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_pain1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: shot1Sound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_shot1.wav"
        attenuationType: Defs.attnNorm
    }

    Sound {
        id: gibSound
        ent: parent
        source: "qrc:/Assets/sounds/zombie/z_gib.wav"
        attenuationType: Defs.attnNorm
    }

    Timer {
        id: standUpTimer
        interval: 5000
        repeat: false
        onTriggered: startStandUp()
    }

    Connections {
        target: th
        function onPhysics() {
            if (flags & Defs.gib)
                return

            tryInitializeMapper()
            if (!mapper.initialized)
                return

            if (root.dead) {
                ragdoll.getPose(currentPose)
                mapper.map(currentPose)
                syncDeadBodyToHips()
                return
            }

            if (root.standingUp)
                advanceStandUpAnimation(frameTime)
            else if (root.painTimeLeft > 0)
                advancePainAnimation(frameTime)
            else if (root.attackTimeLeft > 0)
                advanceAttackAnimation(frameTime)

            if (root.standUpBlending) {
                driveStandUpBlend(frameTime)
                syncDeadBodyToHips()
                return
            }

            if (root.standingUp) {
                mapper.mapReverse(currentPose)
                ragdoll.driveToPoseUsingKinematics(currentPose, frameTime)
                syncDeadBodyToHips()
                return
            }

            mapper.mapReverse(currentPose)
            ragdoll.setPose(currentPose, true, false)
        }
    }

    Component.onCompleted: walkmonster_start()

    function stopClipAnimations() {
        const clips = root.clips
        for (const name in clips)
            clips[name].animation.running = false
    }

    function activateTimeline(which) {
        stopClipAnimations()
        const clips = root.clips
        for (const name in clips)
            clips[name].timeline.enabled = (name === which)
        root.clipState = which
    }

    function groundSpineYawDegrees(skeletonPose) {
        const dir = skeletonPose.jointRotation(0).times(Qt.vector3d(0, 1, 0))
        return Math.atan2(dir.x, dir.z) * 180 / Math.PI
    }

    function isFaceDownPose(skeletonPose) {
        const dir = skeletonPose.jointRotation(0).times(Qt.vector3d(0, 0, 1))
        return dir.y < 0
    }

    function blendPoses(fromPose, toPose, outPose, t) {
        outPose.rootOffset = M.vecLerp(fromPose.rootOffset, toPose.rootOffset, t)
        const n = fromPose.jointCount()
        for (let i = 0; i < n; ++i) {
            outPose.setJointRotation(i, M.quatSlerp(fromPose.jointRotation(i),
                                                    toPose.jointRotation(i), t))
            outPose.setJointTranslation(i, M.vecLerp(fromPose.jointTranslation(i),
                                                     toPose.jointTranslation(i), t))
        }
        outPose.calculateJointMatrices()
    }

    function syncRagdollTransform() {
        ragdoll.position = Qt.vector3d(0, 0, 0)
        ragdoll.eulerRotation = Qt.vector3d(0, root.modelFacingYaw, 0)
    }

    function alignAnimStartToSettled() {
        mapper.mapReverse(animStartPose)

        const yawDelta = groundSpineYawDegrees(settledPose)
                       - groundSpineYawDegrees(animStartPose)
        root.eulerRotation = Qt.vector3d(root.eulerRotation.x,
                                         root.eulerRotation.y + yawDelta,
                                         root.eulerRotation.z)
        if (body)
            body.eulerRotation = root.eulerRotation
        currentAngles = previousAngles = root.eulerRotation
        angles = Qt.vector3d(root.eulerRotation.x,
                             M.anglemod(root.eulerRotation.y),
                             root.eulerRotation.z)
        ideal_yaw = angles.y
        syncRagdollTransform()
        mapper.mapReverse(animStartPose)
    }

    function resetStandUpControllers() {
        standUpFaceUpController.progress = 0
        standUpFaceDownController.progress = 0
    }

    function startIdleAnimation() {
        if (!root.modelItem)
            return
        if (root.clipState === "idle" && root.modelItem.idleAnimation.running)
            return
        resetStandUpControllers()
        activateTimeline("idle")
        root.modelItem.idleTimeline.currentFrame = 0
        root.modelItem.idleAnimation.running = true
    }

    function startWalkAnimation() {
        if (!root.modelItem)
            return
        if (root.clipState === "walk" && root.modelItem.walkAnimation.running)
            return
        resetStandUpControllers()
        activateTimeline("walk")
        root.modelItem.walkTimeline.currentFrame = 0
        root.modelItem.walkAnimation.running = true
    }

    function locomotionClipName() {
        return (enemy && enemy.health > 0) ? "walk" : "idle"
    }

    function resumeAI() {
        if (enemy && enemy.health > 0)
            ai.huntTarget()
        else
            th_stand()
    }

    function isExplodeInflictor() {
        const inf = damage_inflictor
        return !!(inf && inf !== world && (inf.flags & (Defs.rocket | Defs.grenade)))
    }

    function blastCenter() {
        const inf = damage_inflictor
        if (!inf || inf === world)
            return null
        return inf.absmin.plus(inf.absmax).times(0.5)
    }

    function lateralOffset(worldPoint) {
        const right = M.makevectors(Qt.vector3d(0, root.angles.y, 0)).right
        const d = worldPoint.minus(root.position)
        return d.x * right.x + d.z * right.z
    }

    function painClipFromHit() {
        if (root.hitPosValid) {
            const hit = lateralOffset(root.hitPos)
            if (hit > root.painSideThreshold)
                return "painRight"
            if (hit < -root.painSideThreshold)
                return "painLeft"
            return "painMid"
        }

        const mid = blastCenter()
        if (!mid)
            return "painMid"
        const blast = lateralOffset(mid)
        if (blast > root.painSideThreshold)
            return "painLeft"
        if (blast < -root.painSideThreshold)
            return "painRight"
        return "painMid"
    }

    function cancelAttack() {
        root.attackTimeLeft = 0
        root.attackDuration = 0
        root.attackHitDone = false
    }

    function startPainAnimation() {
        if (root.dead || root.standingUp || root.standUpBlending)
            return

        cancelAttack()
        root.painClipName = painClipFromHit()
        if (!startClipBlend(root.painClipName, root.painBlendInMs))
            return

        root.inpain = 1
        th.think = null
        th.nextthink = -1
        if (Math.random() < 0.5)
            painSound.play()
        else
            pain1Sound.play()
    }

    function startPainClip() {
        const clip = root.clips[root.painClipName]
        activateTimeline(root.painClipName)
        clip.timeline.currentFrame = 0
        clip.animation.running = true
        root.painTimeLeft = clip.animation.duration / 1000
    }

    function advancePainAnimation(deltaTimeSec) {
        root.painTimeLeft -= deltaTimeSec
        if (root.painTimeLeft <= 0)
            finishPain()
    }

    function finishPain() {
        root.inpain = 0
        root.painTimeLeft = 0

        if (!startClipBlend(locomotionClipName(), root.painBlendOutMs))
            resumeAI()
    }

    function zombie_missile() {
        if (root.dead || root.standingUp || root.standUpBlending)
            return
        if (root.inpain !== 0 || root.attackTimeLeft > 0)
            return

        root.attackClipName = Math.random() < 0.5 ? "attackLeft" : "attackRight"
        root.attackHitDone = false
        if (!startClipBlend(root.attackClipName, root.attackBlendInMs))
            return

        th.think = null
        th.nextthink = -1
    }

    function playAttackClip() {
        const clip = root.clips[root.attackClipName]
        activateTimeline(root.attackClipName)
        clip.timeline.currentFrame = 0
        clip.animation.running = true
        root.attackDuration = clip.animation.duration / 1000
        root.attackTimeLeft = root.attackDuration
        scheduleThink(zombie_missileThink)
    }

    function zombie_missileThink() {
        scheduleThink(zombie_missileThink)
        if (enemy && enemy.health > 0)
            fight.ai_face()
    }

    function advanceAttackAnimation(deltaTimeSec) {
        root.attackTimeLeft -= deltaTimeSec

        if (!root.attackHitDone && root.attackDuration > 0
                && root.attackTimeLeft <= root.attackDuration * (1 - root.attackThrowAt)) {
            root.attackHitDone = true
            zombieFireGrenade(root.attackClipName === "attackLeft" ? root.attackLeftOffset
                                                                  : root.attackRightOffset)
        }

        if (root.attackTimeLeft <= 0)
            finishAttack()
    }

    function zombieFireGrenade(st) {
        if (!enemy || enemy.health <= 0 || zomGibComponent.status !== Component.Ready)
            return

        fight.ai_face()
        shot1Sound.play()

        const org = position.plus(forward.times(st.x))
                            .plus(right.times(st.y))
                            .plus(up.times(st.z))

        const delta = enemy.position.minus(org)
        const flat = Qt.vector3d(delta.x, 0, delta.z)
        const dist = flat.length()
        const flight = Math.max(dist / 6, 0.1)
        const dir = dist > 0.001 ? flat.times(1 / dist) : forward
        const gravity = vars.sv_gravity.value / 100

        const settings = {
            position: org,
            velocity: Qt.vector3d(dir.x * 6,
                                  delta.y / flight + 0.5 * gravity * flight,
                                  dir.z * 6),
            avelocity: Qt.vector3d(30, 10, 20),
            owner: self
        }

        const zomGib = zomGibComponent.createObject(world, settings)
        zomGib.remove.connect(() => { zomGib?.destroy() })
    }

    function finishAttack() {
        cancelAttack()
        th.think = null
        th.nextthink = -1
        if (!startClipBlend(locomotionClipName(), root.attackBlendOutMs))
            resumeAI()
    }

    function startClipBlend(clipName, durationMs) {
        if (!mapper.initialized || !hasSkinnedModel)
            return false

        mapper.mapReverse(settledPose)

        resetStandUpControllers()
        activateTimeline(clipName)
        root.clips[clipName].timeline.currentFrame = 0
        mapper.mapReverse(animStartPose)

        activateTimeline("none")
        applyPose(settledPose)

        root.pendingClip = clipName
        root.blendDurationMs = durationMs
        root.standUpBlending = true
        root.standUpBlendTime = 0
        return true
    }

    function applyPose(skeletonPose) {
        ragdoll.setPose(skeletonPose, true, true)
        ragdoll.getPose(currentPose)
        mapper.map(currentPose)
    }

    function applyHit(dir, damage, hitPoint) {
        if (flags & Defs.gib)
            return
        if (dir.length() < 1e-6)
            return
        root.hitDir = dir.normalized()
        if (hitPoint !== undefined && hitPoint !== null) {
            root.hitPos = Qt.vector3d(hitPoint.x, hitPoint.y, hitPoint.z)
            root.hitPosValid = true
        }
    }

    // applyHit runs before t_damage; clear after pain or explode uses stale hitPos.
    function clearHitRecord() {
        root.hitDir = Qt.vector3d(0, 0, 0)
        root.hitPosValid = false
    }

    function applySettledHit(damage) {
        if (!root.dead || !root.settled || root.standingUp || root.standUpBlending)
            return
        if (ragdoll.motionType !== Body.Dynamic)
            return
        applyFallVelocity(damage)
        standUpTimer.restart()
    }

    function explodeDirFromInflictor() {
        const mid = blastCenter()
        if (!mid)
            return Qt.vector3d(0, 0, 0)
        return root.position.plus(root.center).minus(mid)
    }

    function applyFallVelocity(damage) {
        const explode = isExplodeInflictor()
        const hitscan = !explode && root.hitDir.length() > 0.0001
        let d = (hitscan ? root.hitDir : explodeDirFromInflictor()).normalized()

        if (d.length() < 0.0001)
            return

        let v
        if (hitscan) {
            if (d.y < 0.08)
                d = Qt.vector3d(d.x, 0.08, d.z).normalized()
            const dmg = Math.min(root.fallDamageCap,
                                 Math.max(damage !== undefined ? damage : 12, 9))
            let speed = Math.min(root.fallMaxSpeed,
                                 root.fallBaseSpeed + dmg * root.fallDamageScale)
            v = d.times(speed)
            if (v.y < root.fallMinUp)
                v = Qt.vector3d(v.x, root.fallMinUp, v.z)
        } else {
            const dmg = Math.max(damage !== undefined ? damage : 40, 9)
            let speed = Math.min(root.fallExplodeMaxSpeed,
                                 dmg * 0.08 * root.fallExplodeScale)
            v = d.times(speed)
        }

        if (root.settled)
            ragdoll.addLinearVelocity(v)
        else
            ragdoll.setLinearVelocity(v)
        velocity = v

        let side = Qt.vector3d(-d.z, 0, d.x)
        if (side.length() < 0.15)
            side = Qt.vector3d(1, 0, 0)
        side = side.normalized()
        const kick = Math.max(root.fallTumbleImpulseMin,
                              v.length() * root.fallTumbleImpulse)

        if (root.modelItem && root.modelItem.head) {
            const headPos = root.modelItem.head.scenePosition
            const headKick = side.plus(Qt.vector3d(0, 0.35, 0)).normalized().times(kick)
            ragdoll.addImpulse("mixamorig:Head", headKick, headPos)
        }
        if (root.modelItem && root.modelItem.hips) {
            const hipsPos = root.modelItem.hips.scenePosition
            ragdoll.addImpulse("mixamorig:Hips", side.times(-kick * 0.45), hipsPos)
        }
    }

    function tryInitializeMapper() {
        if (mapper.initialized)
            return
        if (flags & Defs.gib)
            return
        if (!hasSkinnedModel)
            return

        activateTimeline("none")

        ragdoll.getPose(neutralPose)
        ragdoll.getPose(currentPose)
        ragdoll.getPose(settledPose)
        ragdoll.getPose(animStartPose)
        neutralPose.rootOffset = root.modelItem.hips.scenePosition
        ragdoll.setPose(neutralPose, true, true)
        ragdoll.getPose(neutralPose)

        if (!mapper.initialize()) {
            console.warn("ZombieV2: SkeletonMapper initialization failed")
            startIdleAnimation()
            return
        }

        ragdoll.activate()
        startIdleAnimation()
    }

    function cancelStandUp() {
        standUpTimer.stop()
        root.standingUp = false
        root.standUpBlending = false
        root.pendingClip = ""
        root.painTimeLeft = 0
        root.standUpFaceDown = false
        resetStandUpControllers()
    }

    function die() {
        if (flags & Defs.gib)
            return

        cancelAttack()
        cancelStandUp()
        root.dead = true
        root.settled = false
        root.inpain = 2
        th.think = null
        th.nextthink = -1

        activateTimeline("none")
        ragdoll.motionType = Body.Kinematic
        ragdoll.visible = false

        gibSound.play()
        throwHead(health)
        throwGib("gib1", health)
        throwGib("gib2", health)
        throwGib("gib3", health)
    }

    function syncDeadBodyToHips() {
        if (!deadBody || !root.modelItem || !root.modelItem.hips)
            return

        const hips = root.modelItem.hips
        deadBody.position = root.mapPositionFromScene(hips.scenePosition)

        const p = root.sceneRotation
        const h = hips.sceneRotation
        const inv = Qt.quaternion(p.scalar, -p.x, -p.y, -p.z)
        deadBody.rotation = inv.times(h)
    }

    function syncBodyToHips(worldHips) {
        if (!body)
            return

        const hips = worldHips
                     ?? (root.modelItem && root.modelItem.hips
                         ? root.modelItem.hips.scenePosition
                         : null)
        if (!hips)
            return

        const dx = hips.x - root.position.x
        const dz = hips.z - root.position.z
        if (dx * dx + dz * dz < 1e-8)
            return

        const newPos = Qt.vector3d(hips.x, root.position.y, hips.z)
        velocity = Qt.vector3d(0, 0, 0)
        body.setLinearVelocity(Qt.vector3d(0, 0, 0))
        body.teleport(newPos, Layers.Walker, [])
        root.position = newPos
        currentPosition = previousPosition = newPos
        moveLerpStart = time
    }

    function fall(damage) {
        if (root.dead)
            return
        if (!hasSkinnedModel)
            return

        tryInitializeMapper()
        if (!mapper.initialized)
            return

        fallSound.play()

        cancelAttack()
        activateTimeline("none")
        cancelStandUp()
        root.dead = true
        root.settled = false
        root.inpain = 2
        pain_finished = 0
        walkerDead(true)
        // walkerDead zeroes health; restore so only a big hit while down gibs.
        health = root.max_health
        th.nextthink = -1
        th.think = null
        onGround = true

        syncRagdollTransform()
        ragdoll.getPose(currentPose)
        mapper.map(currentPose)

        ragdoll.objectLayer = Layers.Item
        ragdoll.motionType = Body.Dynamic
        ragdoll.setLinearAndAngularVelocity(Qt.vector3d(0, 0, 0), Qt.vector3d(0, 0, 0))
        ragdoll.activate()
        applyFallVelocity(damage)
        root.settled = true
        syncDeadBodyToHips()

        standUpTimer.restart()
    }

    function startStandUp() {
        if (!root.dead || root.standingUp || root.standUpBlending)
            return
        if (!mapper.initialized || !root.modelItem)
            return

        ragdoll.getPose(settledPose)
        ragdoll.setLinearAndAngularVelocity(Qt.vector3d(0, 0, 0), Qt.vector3d(0, 0, 0))
        syncBodyToHips(settledPose.rootOffset)

        health = root.max_health
        idleSound.play()
        walkerDead(false)
        walkmove(0, 0)

        root.standUpFaceDown = isFaceDownPose(settledPose)
        const clip = root.clips[root.standUpClipName]

        syncRagdollTransform()
        activateTimeline(root.standUpClipName)
        root.activeStandUpController.progress = 0
        clip.timeline.currentFrame = clip.animation.from

        alignAnimStartToSettled()

        root.dead = false
        root.settled = false
        root.standingUp = true
        root.pendingClip = ""
        root.blendDurationMs = root.standUpBlendMs
        root.standUpBlending = true
        root.standUpBlendTime = 0
        th.think = null

        ragdoll.objectLayer = Layers.NonSolid
        ragdoll.motionType = Body.Kinematic
        ragdoll.setPose(settledPose, true, true)
        ragdoll.activate()
        ragdoll.getPose(currentPose)
        mapper.map(currentPose)
    }

    function driveStandUpBlend(deltaTimeSec) {
        root.standUpBlendTime += deltaTimeSec * 1000 / root.blendDurationMs
        const t = M.smoothstep(Math.min(1, root.standUpBlendTime))
        blendPoses(settledPose, animStartPose, currentPose, t)
        ragdoll.driveToPoseUsingKinematics(currentPose, deltaTimeSec)
        ragdoll.getPose(currentPose)
        mapper.map(currentPose)

        if (root.standUpBlendTime >= 1) {
            root.standUpBlending = false
            root.standUpBlendTime = 1
            finishStandUpBlend()
        }
    }

    function finishStandUpBlend() {
        const clipName = root.pendingClip
        if (clipName === "") {
            root.activeStandUpController.progress = 0
            return
        }

        root.pendingClip = ""
        ragdoll.objectLayer = Layers.NonSolid
        ragdoll.motionType = Body.Kinematic

        if (clipName.startsWith("pain")) {
            startPainClip()
            return
        }

        if (clipName.startsWith("attack")) {
            playAttackClip()
            return
        }

        if (clipName === "walk")
            startWalkAnimation()
        else
            startIdleAnimation()
        resumeAI()
    }

    function advanceStandUpAnimation(deltaTimeSec) {
        const controller = root.activeStandUpController
        controller.progress += deltaTimeSec * 1000 / root.activeStandUpDurationMs
        if (controller.progress >= 1) {
            controller.completeToEnd()
            finishStandUp()
        }
    }

    function finishStandUp() {
        if (!root.standingUp)
            return

        root.standingUp = false
        root.standUpFaceDown = false

        root.inpain = 0
        pain_finished = 0
        health = root.max_health
        velocity = Qt.vector3d(0, 0, 0)
        onGround = true
        currentPosition = previousPosition = root.position
        currentAngles = previousAngles = root.eulerRotation
        moveLerpStart = time
        anglesLerpStart = time
        moveTime = 0
        move = Qt.vector3d(0, 0, 0)
        angles = Qt.vector3d(root.eulerRotation.x,
                             M.anglemod(root.eulerRotation.y),
                             root.eulerRotation.z)
        ideal_yaw = angles.y

        if (!startClipBlend(locomotionClipName(), root.standUpBlendMs))
            resumeAI()
    }

    function zombie_stand() {
        scheduleThink(zombie_stand)
        startIdleAnimation()
        ai.ai_stand()
    }

    function startIdleSound() {
        if (time < root.idleSoundNextTime)
            return
        root.idleSoundNextTime = time + root.idleSoundIntervalSec
        if (Math.random() < 0.2)
            idleSound.play()
        else if (Math.random() > 0.8)
            idle1Sound.play()
    }

    function zombie_walk() {
        scheduleThink(zombie_walk)
        startWalkAnimation()
        ai.ai_walk(root.moveDist)
        startIdleSound()
    }

    function zombie_run() {
        scheduleThink(zombie_run)
        startWalkAnimation()
        ai.ai_run(root.moveDist)
        startIdleSound()
    }

    function scheduleThink(think) {
        th.think = think
        th.nextthink = time + 0.1
    }

    function zombie_pain(attacker, damage) {
        if (!root.standingUp)
            health = root.max_health
        painReaction(damage)
        clearHitRecord()
    }

    function painReaction(damage) {
        if (damage < 9)
            return

        if (root.standingUp) {
            if (damage >= 25 || isExplodeInflictor())
                fall(damage)
            return
        }

        if (root.inpain === 2) {
            applySettledHit(damage)
            return
        }

        if (damage >= 25 || isExplodeInflictor()) {
            fall(damage)
            return
        }

        if (root.inpain === 1) {
            pain_finished = time + 3
            return
        }

        if (pain_finished > time) {
            fall(damage)
            return
        }

        if (root.standUpBlending && !root.pendingClip.startsWith("attack"))
            return

        if (root.standUpBlending && root.pendingClip.startsWith("attack")) {
            root.standUpBlending = false
            root.pendingClip = ""
            cancelAttack()
        }

        startPainAnimation()
    }

    function sightSound() {
        idleSound.play()
    }
}
