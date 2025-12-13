import QtQuick
import QtQuick3D
import QtQuick3D.JoltPhysics

import Kwayk.Game
import Kwayk.Core
import Backend

Trigger {
    id: root

    readonly property int weaponBig2: 1

    property int weapon: 0
    property int aflag: 0
    property string netname: ""

    property alias model: itemContent.children

    readonly property alias item: item
    readonly property alias noise: noise

    body: trigger

    Body {
        id: item

        property real boxHeight: 0.24

        shape: BoxShape {
            extents: Qt.vector3d(root.size.x, item.boxHeight, root.size.z)
        }

        objectLayer: Layers.Item
        motionQuality: Body.LinearCast
        motionType: Body.Dynamic
        position: Qt.vector3d(root.center.x, 0.06, root.center.z)
        allowedDOFs: Body.TranslationX | Body.TranslationY | Body.TranslationZ

        restitution: 0
        friction: 1

        Node {
            id: itemContent
            position.x: -root.center.x
            position.y: -item.boxHeight / 2 + 0.02
            position.z: -root.center.z
        }

        Body {
            id: trigger
            shape: BoxShape {
                extents: root.size.plus(Qt.vector3d(0.28, 0.02, 0.28))
            }

            isSensor: true
            objectLayer: Layers.Sensor
            motionType: Body.Static
            position.y: root.center.y - item.boxHeight / 2
        }
    }

    Component.onCompleted: {
        item.setLinearVelocity(velocity);
        item.setAngularVelocity(avelocity);
    }

    Sound {
        id: noise
        ent: parent
        attenuationType: Defs.attnNorm
    }

    function bound_other_ammo() {
        if (other.ammo_shells > 100)
            other.ammo_shells = 100;
        if (other.ammo_nails > 200)
            other.ammo_nails = 200;
        if (other.ammo_rockets > 100)
            other.ammo_rockets = 100;
        if (other.ammo_cells > 100)
            other.ammo_cells = 100;
    }

    function weapon_touch() {
        if (other.classname !== "player")
            return;
        if (other.health <= 0)
            return;

        const best = other.bestWeapon();
        let hadammo;
        let new_;
        if (classname === "weapon_nailgun") {
            hadammo = other.ammo_nails;
            new_ = Defs.itNailgun;
            other.ammo_nails += 30;
        } else if (classname === "weapon_supernailgun") {
            hadammo = other.ammo_rockets;
            new_ = Defs.itSuperNailgun;
            other.ammo_nails += 30;
        } else if (classname === "weapon_supershotgun") {
            hadammo = other.ammo_rockets;
            new_ = Defs.itSuperShotgun;
            other.ammo_shells += 5;
        } else if (classname === "weapon_rocketlauncher") {
            hadammo = other.ammo_rockets;
            new_ = Defs.itRocketLauncher;
            other.ammo_rockets += 5;
        } else if (classname === "weapon_grenadelauncher") {
            hadammo = other.ammor_rockets;
            new_ = Defs.itGrenadeLauncher;
            other.ammo_rockets += 5;
        } else if (classname === "weapon_lightning") {
            hadammo = other.ammor_rockets;
            new_ = Defs.itLightning;
            other.ammo_cells += 15;
        } else {
            console.log("weapon_touch: unknown classname");
        }

        ui.conPrint(`You got the ${netname}\n`);
        noise.play();
        game.stuffcmd("bf\n");

        bound_other_ammo();

        other.items |= new_;
        other.weapon = new_;
        other.setCurrentAmmo();

        solid = false;
        visible = false;

        activator = other;
        useTargets();
    }

    function ammo_touch() {
        if (other.classname !== "player")
            return;
        if (other.health <= 0)
            return;

        const best = other.bestWeapon();
        // shotgun
        if (weapon === 1) {
            if (other.ammo_shells >= 100)
                return;
            other.ammo_shells += aflag;
        }
        // spikes
        else if (weapon === 2) {
            if (other.ammo_nails >= 200)
                return;
            other.ammo_nails += aflag;
        }
        // rockets
        else if (weapon === 3) {
            if (other.ammo_rockets >= 100)
                return;
            other.ammo_rockets += aflag;
        }
        // cells
        else if (weapon === 4) {
            if (other.ammo_cells >= 100)
                return;
            other.ammo_cells += aflag;
        }

        bound_other_ammo();

        ui.conPrint(`You got the ${netname}\n`);
        noise.play();
        game.stuffcmd("bf\n");

        if (other.weapon === best)
            other.weapon = other.bestWeapon();

        other.setCurrentAmmo();

        solid = false;
        visible = false;

        activator = other;
        useTargets();
    }

    function powerup_touch() {
        if (other.classname !== "player")
            return;
        if (other.health <= 0)
            return;

        ui.conPrint(`You got the ${netname}\n`);
        noise.play();
        game.stuffcmd("bf\n");
        solid = false;
        visible = false;
        other.items |= items;

        if (classname === "item_artifact_envirosuit") {
            other.rad_time = 1;
            other.radsuit_finished = time + 30;
        } else if (classname === "item_artifact_invulnerability") {
            other.invincible_time = 1;
            other.invincible_finished = time + 30;
        } else if (classname == "item_artifact_invisibility") {
            other.invisible_time = 1;
            other.invisible_finished = time + 30;
        } else if (classname === "item_artifact_super_damage") {
            other.super_time = 1;
            other.super_damage_finished = time + 30;
        }

        activator = other;
        useTargets();
    }

    function key_touch() {
        if (other.classname !== "player")
            return;
        if (other.health <= 0)
            return;
        if (other.items & items)
            return;

        ui.conPrint(`You got the ${netname}\n`);
        noise.play();
        game.stuffcmd("bf\n");
        other.items |= items;

        solid = false;
        visible = false;

        activator = other;
        useTargets();
    }

    function key_setsounds() {
        switch (world.worldtype) {
        case 0:
            noise.source = "qrc:/Assets/sounds/misc/medkey.wav";
            break;
        case 1:
            noise.source = "qrc:/Assets/sounds/misc/runekey.wav";
            break;
        case 2:
            noise.source = "qrc:/Assets/sounds/misc/basekey.wav";
            break;
        }
    }
}
