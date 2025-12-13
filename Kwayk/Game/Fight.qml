import QtQuick
import QtQuick3D

import Backend
import Kwayk.Game
import "../js/vec.js" as Vec

QtObject {
    id: root

    function ai_face() {
        ideal_yaw = Vec.vectoyaw(enemy.position.minus(position));
        changeYaw();
    }

    function ai_charge(d) {
        ai_face();
        movetogoal(d);
    }

    function ai_charge_side() {
        ai_face();

        const dtemp = enemy.position.minus(right.times(0.3));
        const heading = Vec.vectoyaw(dtemp.minus(position));

        walkmove(heading, 0.2);
    }

    function ai_melee() {
        if (!enemy)
            return;

        const delta = enemy.position.minus(position);
        if (delta.length() > 0.6)
            return;

        const ldmg = (Math.random() + Math.random() + Math.random()) * 3;
        weapons.t_damage(enemy, self, self, ldmg);
    }

    function ai_melee_side() {
        if (!enemy)
            return;

        ai_charge_side();

        const delta = enemy.position.minus(position);
        if (delta.length() > 0.6)
            return;

        if (!weapons.canDamage(enemy, self))
            return;

        const ldmg = (Math.random() + Math.random() + Math.random()) * 3;
        weapons.t_damage(enemy, self, self, ldmg);
    }

    function checkAttack() {
        const targ = enemy;

        const spot1 = position.plus(view_ofs);
        const spot2 = targ.position.plus(targ.view_ofs);

        const trace = physicsSystem.castRay(spot1, spot2.minus(spot1), Layers.Normal, [body]);

        if (trace.body?.ent !== targ)
            return false;

        if (enemy_range === Defs.rangeMelee) {
            // melee attack
            if (th_melee) {
                if (classname === "monster_knight")
                    knight_attack();
                else
                    th_melee();
                return true;
            }
        }

        if (!th_missile)
            return false;

        if (time < attack_finished)
            return false;

        if (enemy_range === Defs.rangeFar)
            return false;

        let chance = 0;

        if (enemy_range === Defs.rangeMelee) {
            chance = 0.9;
            attack_finished = 0;
        } else if (enemy_range === Defs.rangeNear) {
            if (th_melee)
                chance = 0.2;
            else
                chance = 0.4;
        } else if (enemy_range === Defs.rangeMid) {
            if (th_melee)
                chance = 0.05;
            else
                chance = 0.1;
        } else {
            chance = 0;
        }

        if (Math.random() < chance) {
            th_missile();
            attackFinished(2 * Math.random());
            return true;
        }

        return false;
    }
}
