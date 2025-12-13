import QtQuick
import QtQuick3D

import Kwayk.Game
import Backend
import "../js/vec.js" as Vec

QtObject {
    id: root

    property real movedist: 0

    function ai_forward(dist) {
        walkmove(angles.y, dist);
    }

    function ai_back(dist) {
        walkmove(angles.y + 180, dist);
    }

    function ai_pain(dist) {
        ai_back(dist);
    }

    function ai_painforward(dist) {
        walkmove(ideal_yaw, dist);
    }

    function ai_walk(dist) {
        movedist = dist;

        if (classname === "monster_dragon") {
            movetogoal(dist);
            return;
        }

        if (findTarget())
            return;

        movetogoal(dist);
    }

    function ai_stand() {
        if (findTarget())
            return;

        if (time > pausetime)
            th_walk();
    }

    function ai_turn() {
        if (findTarget())
            return;

        changeYaw();
    }

    function facingIdeal() {
        const delta = Vec.anglemod(eulerRotation.y - ideal_yaw);
        if (delta > 45 && delta < 315)
            return false;

        return true;
    }

    function ai_run_melee() {
        ideal_yaw = enemy_yaw;
        changeYaw();

        if (facingIdeal()) {
            th_melee();
            attack_state = Defs.asStraight;
        }
    }

    function ai_run_missile() {
        ideal_yaw = enemy_yaw;
        changeYaw();

        if (facingIdeal()) {
            th_missile();
            attack_state = Defs.asStraight;
        }
    }

    function ai_run_slide() {
        ideal_yaw = enemy_yaw;
        changeYaw();

        const ofs = lefty ? 90 : -90;
        if (walkmove(ideal_yaw + ofs, movedist))
            return;

        lefty = !lefty;

        walkmove(ideal_yaw - ofs, movedist);
    }

    function ai_run(dist) {
        movedist = dist;

        if (enemy.health <= 0) {
            enemy = world;

            if (oldenemy && oldenemy.health > 0) {
                enemy = oldenemy;
                huntTarget();
            } else {
                if (movetarget)
                    th_walk();
                else
                    th_stand();
                return;
            }
        }

        enemy_visible = isVisible(enemy);
        if (enemy_visible);
            search_time = time + 5;

        enemy_infront = infront(enemy);
        enemy_range = range(enemy);
        enemy_yaw = Vec.vectoyaw(enemy.position.minus(position));

        if (attack_state === Defs.asMissile) {
            ai_run_missile();
            return;
        }
        if (attack_state === Defs.asMelee) {
            ai_run_melee();
            return;
        }

        if (checkAnyAttack())
            return;

        if (attack_state === Defs.asSliding) {
            ai_run_slide();
            return;
        }

        movetogoal(dist);
    }

    function range(targ) {
        const spot1 = position.plus(view_ofs);
        const spot2 = targ.position.plus(targ.view_ofs);

        const r = (spot1.minus(spot2)).length();
        if (r < 1.20)
            return Defs.rangeMelee;
        if (r < 5.00)
            return Defs.rangeNear;
        if (r < 10.0)
            return Defs.rangeMid;
        return Defs.rangeFar;
    }

    function isVisible(targ) {
        const spot1 = position.plus(view_ofs);
        const spot2 = targ.position.plus(targ.view_ofs);
        const trace = physicsSystem.castRay(spot1, spot2.minus(spot1), Layers.NoMonsters, [body]);
        return trace.fraction >= 1.0;
    }

    function infront(targ) {
        const vec = targ.position.minus(position).normalized();
        const dot = vec.dotProduct(forward);
        return dot > 0.3;
    }

    function huntTarget() {
        goalentity = enemy;
        th.think = th_run;
        ideal_yaw = Vec.vectoyaw(enemy.position.minus(position));
        th.nextthink = time + 0.1;
        attackFinished(1);
    }

    function findTarget() {
        let client;

        if (sight_entity_time >= (time - 0.1) && !(spawnflags & 3)) {
            client = sight_entity;
            if (client?.enemy === enemy)
                return true;
        } else {
            client = player;
            if (client.health <= 0)
                return false;
        }

        if (client === enemy)
            return false;

        if (client.noTarget)
            return false;

        if (client.items & Defs.itInvisibility)
            return false;

        const r = range(client);
        if (r === Defs.rangeFar)
            return false;

        if (!isVisible(client))
            return false;

        if (r === Defs.rangeNear) {
            if (client.show_hostile < time && !infront(client))
                return false;
        } else if (r === Defs.rangeMid) {
            if (!infront(client))
                return false;
        }

        enemy = client;
        if (enemy.classname !== "player") {
            enemy = enemy.enemy;
            if (enemy.classname !== "player") {
                enemy = world;
                return false;
            }
        }

        foundTarget();
        return true;
    }

    function foundTarget() {
        if (enemy.classname === "player") {
            sight_entity = self;
            sight_entity_time = time;
        }

        sightSound();
        huntTarget();
    }

    function checkAnyAttack() {
        if (!enemy_visible)
            return false;

        if (classname === "monster_army")
            return soldierCheckAttack();
        if (classname === "monster_ogre")
            return ogreCheckAttack();
        if (classname === "monster_shambler")
            return shamCheckAttack();
        if (classname === "monster_demon1")
            return demonCheckAttack();
        if (classname === "monster_dog")
            return dogCheckAttack();
        if (classname === "monster_wizard")
            return wizardCheckAttack();
        return fight.checkAttack();
    }
}
