import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Core
import Kwayk.Game
import Backend

Node {
    id: root

    function wall_velocity(vel, normal) {
        vel = vel.normalized();
        vel = vel.plus(self.up.times(Math.random() - 0.5).plus(self.right.times(Math.random() - 0.5))).normalized();
        vel = vel.plus(normal.times(2));
        vel = vel.times(2);

        return vel;
    }

    function spawnBlood(org, vel, damage) {
        particles.particle(org, vel.times(0.1), 73, damage * 4);
    }

    function spawn_touchblood(org, vel, normal, damage) {
        vel = wall_velocity(vel, normal).times(0.2);
        spawnBlood(org.plus(vel.times(0.0001)), vel, damage);
    }

    function canDamage(targ, inflictor) {
        const targdir = targ.position.minus(inflictor.position);
        let trace = physicsSystem.castRay(inflictor.position, targdir, Layers.NoMonsters, []);
        if (trace.fraction >= 1.0)
            return true;
        trace = physicsSystem.castRay(inflictor.position, targdir.plus(Qt.vector3d(0.15, 0, -0.15)), Layers.NoMonsters, []);
        if (trace.fraction >= 1.0)
            return true;
        trace = physicsSystem.castRay(inflictor.position, targdir.plus(Qt.vector3d(-0.15, 0, 0.15)), Layers.NoMonsters, []);
        if (trace.fraction >= 1.0)
            return true;
        trace = physicsSystem.castRay(inflictor.position, targdir.plus(Qt.vector3d(-0.15, 0, -0.15)), Layers.NoMonsters, []);
        if (trace.fraction >= 1.0)
            return true;
        trace = physicsSystem.castRay(inflictor.position, targdir.plus(Qt.vector3d(0.15, 0, 0.15)), Layers.NoMonsters, []);
        if (trace.fraction >= 1.0)
            return true;
        return false;
    }

    function killed(targ, attacker) {
        if (targ.health < -99)
            targ.health = -99; // don't let sbar look bad if a player

        if (targ.th.movetype === "push" || targ.th.movetype === "") {
            targ.th_die();
            return;
        }

        targ.enemy = attacker;

        if (targ.takedamage !== Defs.damageDead) {
            if (targ.monster)
                killed_monsters++;

            targ.takedamage = Defs.damageNo;
        }

        // TODO: ClientObituary

        targ.touch = null;

        targ.monster_death_use();
        targ.th_die();
    }

    function t_damage(targ, inflictor, attacker, damage) {
        if (!targ.takedamage)
            return;

        damage_attacker = attacker;

        // check for quad damage powerup on the attacker
        if (attacker.super_damage_finished > time)
             damage = damage * 4;

        // save damage based on the target's armor level
        let save = Math.ceil(targ.armortype * damage);
        if (save >= targ.armorvalue) {
            save = targ.armorvalue;
            targ.armortype = 0;
            targ.items = targ.items - (targ.items & (Defs.itArmor1 | Defs.itArmor2 | Defs.itArmor3));
        }

        targ.armorvalue -= save;
        const take = Math.ceil(damage - save);

        if (targ === player) {
            targ.dmg_take += take;
            targ.dmg_save += save;
            targ.dmg_inflictor = inflictor;
        }

        // figure momentum add
        if (inflictor !== world && targ.th.movetype === "walk") {
            let dir = targ.position.minus(inflictor.absmin.plus(inflictor.absmax).times(0.5));
            dir = dir.normalized();
            targ.velocity = targ.velocity.plus(dir.times(damage * 0.08));
        }

        // check for godmode and invincibility
        if (targ.godMode)
            return;

        if (targ.invincible_finished >= time) {
            if (invincible_sound < time) {
                protect3Sound.play();
                invincible_sound = time + 2;
            }
            return;
        }

        // do the damage
        targ.health -= take;

        if (targ.health <= 0) {
            killed(targ, attacker);
            return;
        }

        if (targ.monster && attacker !== world) {
            if (targ !== attacker && attacker !== targ.enemy) {
                if (targ.classname !== attacker.classname || targ.classname === "monster_army") {
                    if (targ.enemy && targ.enemy.classname === "player")
                        targ.oldenemy = targ.enemy;
                    targ.enemy = attacker;
                    targ.ai.foundTarget();
                }
            }
        }

        if (targ.th_pain !== null) {
            targ.th_pain(attacker, take);
            // nightmare mode monsters don't go into pain frames often
            if (vars.skill.value === 3)
                pain_finished = time + 5;
        }
    }

    Component {
        id: radiusComponent // for missile and grenade radius explosion
        SphereShape {}
    }

    function t_radiusDamage(inflictor, attacker, damage, ignore) {
        const radius = (damage + 40) / 100;
        const shape = radiusComponent.createObject(null, { diameter: radius * 2 });
        const trans = Qt.matrix4x4();

        trans.translate(inflictor.position);
        const results = physicsSystem.collideShape(shape,
                                                   trans,
                                                   Qt.vector3d(0, 0, 0),
                                                   Layers.Normal,
                                                   [ignore.body],
                                                   16);

        shape.destroy();

        for (let i = 0; i < results.length; ++i) {
            const head = results[i].body2.ent;

            if (head.takedamage) {
                const org = head.position.plus(head.center);
                let points = 0.5 * inflictor.position.minus(org).length() * 100;
                if (points < 0)
                    points = 0;
                points = damage - points;
                if (head === attacker)
                    points = points * 0.5;
                if (points > 0) {
                    if (canDamage(head, inflictor)) {
                        if (head.classname === "monster_shambler")
                            t_damage(head, inflictor, attacker, points * 0.5);
                        else
                            t_damage(head, inflictor, attacker, points);
                    }
                }
            }
        }
    }

    Sound {
        id: exp3Sound
        ent: self
        attenuationType: Defs.attnNorm
        source: "qrc:/Assets/sounds/weapons/r_exp3.wav"
    }

    function barrel_explode(org) {
        self.takedamage = Defs.damageNo;
        t_radiusDamage(self, self, 160, world);
        becomeExplosion(org);
    }

    function becomeExplosion(org) {
        particles.particleExplosion(org);
        exp3Sound.play();
        self.velocity = Qt.vector3d(0, 0, 0);
        self.solid = false;
        self.visible = false;
    }
}
