import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.Particles3D

import Backend
import Kwayk.Core
import Kwayk.Game

import "../js/math.js" as M
import "../js/vec.js" as Vec

Combat {
    id: root

    property var trace: null
    property var multiDamage: ({})

    readonly property var spikeComponent: Qt.createComponent("Flies/Spike.qml")
    readonly property var meatComponent: Qt.createComponent("Misc/Meat.qml")
    readonly property var laserComponent: Qt.createComponent("Flies/Laser.qml")

    function spawnMeatSpray(org, vel) {
        const velocity = Qt.vector3d(vel.x, vel.y, vel.z);
        velocity.y += (250 + 50 * Math.random()) / 100;
        const avelocity = Qt.vector3d(30, 10, 20);
        meatComponent.createObject(world, { position: org, velocity, avelocity });
    }

    function clearMultiDamage() {
        multiDamage = {}
    }

    function applyMultiDamage() {
        for (const key in multiDamage) {
            const ent = multiDamage[key][0];
            const damage = multiDamage[key][1];
            t_damage(ent, self, self, damage);
        }
    }

    function addMultiDamage(hit, damage) {
        if (!hit)
            return;

        if (!multiDamage[hit])
            multiDamage[hit] = [hit, damage];
        else
            multiDamage[hit][1] += damage;
    }

    function traceAttack(damage, dir) {
        let vel = self.up.times(M.crandom()).plus(self.right.times(M.crandom())).plus(dir);
        vel = vel.plus(trace.normal.times(2));
        vel = vel.times(2);

        const org = trace.position.minus(dir.times(0.04));

        if (trace?.body && trace.body.ent && trace.body.ent.takedamage) {
            spawnBlood(org, vel.times(0.2), damage)
            addMultiDamage(trace.body.ent, damage);

            const bloodTrace = physicsSystem.castRay(org, dir.times(1.2), Layers.BP_Solid, Layers.Solid, []);
            if (bloodTrace.fraction < 1.0)
                decals.spawnBloodDecal(bloodTrace.position, bloodTrace.normal);

        } else {
            particles.runParticleEffect(org, Qt.vector3d(0, 0, 0), 0, 20);
        }
    }

    function fireBullets(shotcount, dir, spread) {
        const src = self.position.plus(self.forward.times(0.1));
        src.y = absmin.y + size.y * 0.7;

        clearMultiDamage();
        for (let i = 0; i < shotcount; ++i) {
            const direction = dir.plus(self.right.times(M.crandom() * spread.x)).plus(self.up.times(M.crandom() * spread.y));
            trace = physicsSystem.castRay(src, direction.times(20.48), Layers.Normal, [body]);
            if (trace.fraction < 1.0) {
                traceAttack(4, direction);
                decals.spawnBulletHole(trace.position, trace.normal);
            }
        }
        applyMultiDamage();
    }

    function launch_spike(org, dir, vel, type) {
        const settings = {
            position: org,
            eulerRotation: Vec.vectoangles(dir),
            velocity: vel,
            type: type,
            owner: self,
        }

        return spikeComponent.createObject(world, settings);
    }

    function launchLaser(org, dir) {
        const settings = {
            position: org,
            eulerRotation: Vec.vectoangles(dir),
            velocity: dir.times(6),
            owner: self,
        }

        return laserComponent.createObject(world, settings);
    }

    function lightningDamage(p1, p2, from, damage) {
        let f = p2.minus(p1).normalized();

        f.x = -f.y;
        f.y = f.x;
        f.z = 0;
        f = f.times(0.16);

        let e1, e2 = world;

        trace = physicsSystem.castRay(p1, p2.minus(p1), Layers.Normal, [body]);
        if (trace?.body && trace.body.ent.takedamage) {
            const endpos = trace.fraction >= 1.0 ? p2 : trace.position;
            particles.particle(endpos, Qt.vector3d(0, 0.1, 0), 73, damage * 4);
            t_damage(trace.body.ent, from, from, damage);
        }
        if (trace?.body)
            e1 = trace.body.ent;

        let p1_ = p1.plus(f);
        let p2_ = p2.plus(f);

        trace = physicsSystem.castRay(p1_, p2_.minus(p1_), Layers.Normal, [body]);
        if (trace?.body && trace.body.ent !== e1 && trace.body.ent.takedamage) {
            const endpos = trace.fraction >= 1.0 ? p2_ : trace.position;
            particles.particle(endpos, Qt.vector3d(0, 0.1, 0), 73, damage * 4);
            t_damage(trace.body.ent, from, from, damage);
        }
        if (trace?.body)
            e2 = trace.body.ent;

        p1_ = p1.minus(f);
        p2_ = p2.minus(f);

        trace = physicsSystem.castRay(p1_, p2_.minus(p1_), Layers.Normal, [body]);
        if (trace?.body && trace.body.ent !== e1 && trace.body.ent !== e2 && trace.body.ent.takedamage) {
            const endpos = trace.fraction >= 1.0 ? p2_ : trace.position;
            particles.particle(endpos, Qt.vector3d(0, 0.1, 0), 73, damage * 4);
            t_damage(trace.body.ent, from, from, damage);
        }
    }
}
