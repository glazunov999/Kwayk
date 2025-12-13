import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.JoltPhysics
import QtQuick3D.JoltPhysics.Helpers

import Backend
import Kwayk.Game
import Kwayk.Core

import "../js/math.js" as M

Walker {
    id: root

    readonly property var grenadeComponent: Qt.createComponent("Flies/Grenade.qml")
    readonly property var missileComponent: Qt.createComponent("Flies/Missile.qml")
    readonly property var shaftComponent: Qt.createComponent("Weapons/Shaft.qml")

    readonly property var deathBubblesComponent: Qt.createComponent("Misc/DeathBubbles.qml")

    property var viewModel: null
    property int weaponframe: 0
    property var shaft: null
    property real t_width: 0
    property bool inWater: false
    property bool jumpReleased: true
    property bool waterJump: false
    property bool godMode: false
    property bool noTarget: false
    property real jump_flag: 0
    property real show_hostile: 0
    property real dmgtime: 0
    property real bob: 0
    property real roll: 0
    property real pitch: 0
    property real dmgTime: 0
    property real dmgRoll: 0
    property real dmgPitch: 0
    property real oldY: 0
    property int deadflag: Defs.deadNo;
    property int impulse: 0

    property real dmg_take: 0
    property real dmg_save: 0
    property var dmg_inflictor: null

    property real invisible_finished: 0
    property real invisible_sound: 0
    property real invincible_finished: 0
    property real invincible_sound: 0
    property real super_damage_finished: 0
    property real super_sound: 0
    property real radsuit_finished: 0

    property real invincible_time: 0
    property real invisible_time: 0
    property real super_time: 0
    property real rad_time: 0
    property real faceanimtime: 0

    property real air_finished: 0
    property real water_finished: 0

    readonly property alias protect3Sound: protect3Sound

    readonly property var cshifts: [
        { destcolor: [0, 0, 0], percent: 0 },
        { destcolor: [0, 0, 0], percent: 0 },
        { destcolor: [0, 0, 0], percent: 0 },
        { destcolor: [0, 0, 0], percent: 0 }
    ]

    readonly property var prev_cshifts: [
        { destcolor: [0, 0, 0], percent: 0 },
        { destcolor: [0, 0, 0], percent: 0 },
        { destcolor: [0, 0, 0], percent: 0 },
        { destcolor: [0, 0, 0], percent: 0 }
    ]

    mins: Qt.vector3d(-0.16, -0.24, -0.16)
    maxs: Qt.vector3d(0.16, 0.32, 0.16)
    classname: "player"
    view_ofs: Qt.vector3d(0, 0.22, 0)
    weapon: Defs.itShotgun
    takedamage: Defs.damageAim
    health: 100
    max_health: 100
    dmg: 2

    th_pain: player_pain
    th_die: playerDie

    headComponent: Component {
        Alias {
            mdl.source: "qrc:/Assets/progs/h_player.mdl"
            skin.source: "qrc:/Assets/progs/skins/h_player.png"
            active: false
        }
    }

    Component.onCompleted: {
        playerController.playerRotation = eulerRotation;
        eulerRotation = Qt.binding(function() { return playerController.playerRotation });

        viewModel = viewModelComponent.createObject(world);

        shaft = shaftComponent.createObject(world, { type: 2 });
        shaft.position = Qt.binding(function() { return position });

        cmds.functions["bf"] = blend.bonusFlash;

        spawn();
    }

    Binding {
        target: camera
        property: "eulerRotation"
        value: Qt.vector3d(eulerRotation.x - pitch - punchangle.x,
                           eulerRotation.y - punchangle.y,
                           eulerRotation.z - roll - punchangle.z)
    }

    Binding {
        target: camera
        property: "position"
        value: Qt.vector3d(position.x, position.y + bob + view_ofs.y, position.z)
    }

    Component {
        id: viewModelComponent

        ViewModel {
            position: root.position.plus(root.forward.times(bob * 0.4)).plus(Qt.vector3d(0, bob + view_ofs.y, 0));
            eulerRotation: root.eulerRotation
            weapon: root.weapon
            weaponframe: root.weaponframe
        }
    }

    Sound {
        id: ax1Sound
        source: "qrc:/Assets/sounds/weapons/ax1.wav"
    }

    Sound {
        id: guncockSound
        source: "qrc:/Assets/sounds/weapons/guncock.wav"
    }

    Sound {
        id: shotgn2Sound
        source: "qrc:/Assets/sounds/weapons/shotgn2.wav"
    }

    Sound {
        id: rocket1iSound
        source: "qrc:/Assets/sounds/weapons/rocket1i.wav"
    }

    Sound {
        id: spike2Sound
        source: "qrc:/Assets/sounds/weapons/spike2.wav"
    }

    Sound {
        id: grenadeSound
        source: "qrc:/Assets/sounds/weapons/grenade.wav"
    }

    Sound {
        id: sgun1Sound
        source: "qrc:/Assets/sounds/weapons/sgun1.wav"
    }

    Sound {
        id: lhitSound
        source: "qrc:/Assets/sounds/weapons/lhit.wav"
    }

    Sound {
        id: jumpSound
        source: "qrc:/Assets/sounds/player/plyrjmp8.wav"
    }

    Sound {
        id: protect3Sound
        source: "qrc:/Assets/sounds/items/protect3.wav"
        ent: parent
    }

    th.onPhysics: {
        move.dropPunchAngle();
        if (health > 0) {
            if (root.waterJump)
                move.waterJump();
            else if (waterlevel >= 2)
                move.waterMove();
            else
                move.airMove();
        }
        playerPreThink();
        if (th.movetype === "bounce" || th.movetype === "toss") {
            physicsToss();
        } else if (th.movetype === "walk") {
            if (!move.checkWater() && !root.waterJump)
                addGravity();
            move.walkMove();
        }
        playerPostThink();
        if (intermission_running)
            calcIntermissionRefdef();
        else
            calcRefdef();

        blend.updateScreen();
    }

    function spawn() {
        air_finished = time + 12;
        attack_finished = time;

        decodeLevelParms();

        setCurrentAmmo();

        player_stand1();

        // TODO: spawn_tdeath ???
    }

    function setChangeParms() {
        if (health <= 0) {
            setNewParms();
            return;
        }

        items = items - (items & (Defs.itKey1 | Defs.itKey2 | Defs.itInvisibility | Defs.itInvulnerability | Defs.itSuit | Defs.itQuad));

        if (health > 100)
            health = 100;
        else if (health < 50)
            health = 50;

        game.parms[0] = items;
        game.parms[1] = health;
        game.parms[2] = armorvalue;
        if (ammo_shells < 25)
            game.parms[3] = 25;
        else
            game.parms[3] = ammo_shells;
        game.parms[4] = ammo_nails;
        game.parms[5] = ammo_rockets;
        game.parms[6] = ammo_cells;
        game.parms[7] = weapon;
        game.parms[8] = armortype * 100;
    }

    function decodeLevelParms() {
        if (serverflags) {
            if (world.name === "start")
                setNewParms();
        }

        items = game.parms[0];
        health = game.parms[1];
        armorvalue = game.parms[2];
        ammo_shells = game.parms[3];
        ammo_nails = game.parms[4];
        ammo_rockets = game.parms[5];
        ammo_cells = game.parms[6];
        weapon = game.parms[7];
        armortype = game.parms[8] * 0.01;

        items |= serverflags << 28;
    }

    Sound {
        id: gasp2Sound
        source: "qrc:/Assets/sounds/player/gasp2.wav"
    }

    Sound {
        id: gasp1Sound
        source: "qrc:/Assets/sounds/player/gasp1.wav"
    }

    Sound {
        id: outwaterSound
        source: "qrc:/Assets/sounds/misc/outwater.wav"
    }

    Sound {
        id: inlavaSound
        source: "qrc:/Assets/sounds/player/inlava.wav"
    }

    Sound {
        id: inh2oSound
        source: "qrc:/Assets/sounds/player/inh2o.wav"
    }

    Sound {
        id: slimbrn2Sound
        source: "qrc:/Assets/sounds/player/slimbrn2.wav"
    }

    function waterMove() {
        if (health < 0)
            return;

        if (waterlevel !== 3) {
            if (air_finished < time)
                gasp2Sound.play();
            else if (air_finished < (time + 9))
                gasp1Sound.play();
            air_finished = time + 12;
            dmg = 2;
        } else if (air_finished < time) {
            if (pain_finished < time) {
                dmg += 2;
                if (dmg > 15)
                    dmg = 10
                weapons.t_damage(self, world, world, dmg);
                pain_finished = time + 1;
            }
        }

        if (!waterlevel) {
            if (inWater && water_finished < time) {
                outwaterSound.play();
                water_finished = time + 1;
                inWater = false;
            }
            return;
        }

        if (watertype === Defs.contentsLava) {
            // do damage
            if (dmgtime < time) {
                if (radsuit_finished > time)
                    dmgtime = time + 1;
                else
                    dmgtime = time + 0.2;

                weapons.t_damage(root, world, world, 10 * waterlevel);
            }
        } else if (watertype === Defs.contentsSlime) {
            // do damage
            if (dmgtime < time && radsuit_finished < time) {
                dmgtime = time + 1;
                weapons.t_damage(root, world, world, 4 * waterlevel);
            }
        }

        if (!inWater) {
            if (watertype === Defs.contentsLava)
                inlavaSound.play();
            else if (watertype === Defs.contentsWater)
                inh2oSound.play();
            else if (watertype === Defs.contentsSlime)
                slimbrn2Sound.play();

            inWater = true;
            dmgtime = 0;
        }

        if (!root.waterJump)
            velocity = velocity.minus(velocity.times(0.8 * waterlevel * frameTime));
    }

    function playerPreThink() {
        if (intermission_running) {
            intermissionThink()
            return;
        }

        if (view_ofs === Qt.vector3d(0, 0, 0))
            return;

        waterMove();

        if (waterlevel === 2)
            move.checkWaterJump();

        if (deadflag >= Defs.deadDead) {
            playerDeathThink();
            return;
        }

        if (deadflag === Defs.deadDying)
            return;

        if (playerController.button2) {
            playerJump();
        } else {
            jumpReleased = true;
        }

        if (time < pausetime)
            velocity = Qt.vector3d(0, 0, 0);

        if (time > attack_finished && currentammo === 0 && weapon !== Defs.itAxe) {
            weapon = bestWeapon();
            setCurrentAmmo();
        }
    }

    function gotoNextMap() {
        cmds.command = "changelevel " + game.nextmap;
    }

    function intermissionThink() {
        if (time < intermission_exittime)
            return;

        if (!playerController.button0 && !playerController.button1 && !playerController.button2)
            return;

        exitIntermission();
    }

    function exitIntermission() {
        intermission_exittime = time + 1;
        intermission_running++;

        if (intermission_running === 2) {
            if (world.name === "e1m7") {
                ui.centerprintIntermission("As the corpse of the monstrous entity\nChthon sinks back into the lava whence\nit rose, you grip the Rune of Earth\nMagic tightly. Now that you have\nconquered the Dimension of the Doomed,\nrealm of Earth Magic, you are ready to\ncomplete your task. A Rune of magic\npower lies at the end of each haunted\nland of Quake. Go forth, seek the\ntotality of the four Runes!");
                return;
            }

            if (world.name === "e2m6") {
                ui.centerprintIntermission("The Rune of Black Magic throbs evilly in\nyour hand and whispers dark thoughts\ninto your brain. You learn the inmost\nlore of the Hell-Mother; Shub-Niggurath!\nYou now know that she is behind all the\nterrible plotting which has led to so\nmuch death and horror. But she is not\ninviolate! Armed with this Rune, you\nrealize that once all four Runes are\ncombined, the gate to Shub-Niggurath's\nPit will open, and you can face the\nWitch-Goddess herself in her frightful\notherworld cathedral.");
                return;
            }

            if (world.name === "e3m6") {
                ui.centerprintIntermission("The charred viscera of diabolic horrors\nbubble viscously as you seize the Rune\nof Hell Magic. Its heat scorches your\nhand, and its terrible secrets blight\nyour mind. Gathering the shreds of your\ncourage, you shake the devil's shackles\nfrom your soul, and become ever more\nhard and determined to destroy the\nhideous creatures whose mere existence\nthreatens the souls and psyches of all\nthe population of Earth.");
                return;
            }

            if (world.name === "e4m7") {
                ui.centerprintIntermission("Despite the awful might of the Elder\nWorld, you have achieved the Rune of\nElder Magic, capstone of all types of\narcane wisdom. Beyond good and evil,\nbeyond life and death, the Rune\npulsates, heavy with import. Patient and\npotent, the Elder Being Shub-Niggurath\nweaves her dire plans to clear off all\nlife from the Earth, and bring her own\nfoul offspring to our world! For all the\ndwellers in these nightmare dimensions\nare her descendants! Once all Runes of\nmagic power are united, the energy\nbehind them will blast open the Gateway\nto Shub-Niggurath, and you can travel\nthere to foil the Hell-Mother's plots\nin person.");
                return;
            }
        }

        if (intermission_running === 3) {
            if ((serverflags & 15) === 15) {
                ui.centerprintIntermission("Now, you have all four Runes. You sense\ntremendous invisible forces moving to\nunseal ancient barriers. Shub-Niggurath\nhad hoped to use the Runes Herself to\nclear off the Earth, but now instead,\nyou will use them to enter her home and\nconfront her as an avatar of avenging\nEarth-life. If you defeat her, you will\nbe remembered forever as the savior of\nthe planet. If she conquers, it will be\nas if you had never been born.");
                return;
            }
        }

        gotoNextMap();
    }

    Sound {
        id: inv3Sound
        source: "qrc:/Assets/sounds/items/inv3.wav"
    }

    Sound {
        id: inv2Sound
        source: "qrc:/Assets/sounds/items/inv2.wav"
    }

    Sound {
        id: protect2Sound
        source: "qrc:/Assets/sounds/items/protect2.wav"
    }

    Sound {
        id: damage2Sound
        source: "qrc:/Assets/sounds/items/damage2.wav"
    }

    Sound {
        id: suit2Sound
        source: "qrc:/Assets/sounds/items/suit2.wav"
    }

    function checkPowerups() {
        if (health <= 0)
            return;

        if (invisible_finished) {
            if (invisible_sound < time) {
                inv3Sound.play();
                invisible_sound = time + ((Math.random() * 3) + 1);
            }

            if (invisible_finished < (time + 3)) {
                if (invisible_time === 1) {
                    ui.conPrint("Ring of Shadows magic is fading\n");
                    game.stuffcmd("bf\n");
                    inv2Sound.play();
                    invisible_time = time + 1;
                } else if (invisible_time < time) {
                    invisible_time = time + 1;
                    game.stuffcmd("bf\n");
                }
            }

            if (invisible_finished < time) {
                items -= Defs.itInvisibility;
                invisible_finished = 0;
                invisible_time = false;
            }
        }

        if (invincible_finished) {
            if (invincible_finished < (time + 3)) {
                if (invincible_time === 1) {
                    ui.conPrint("Protection is almost burned out\n");
                    game.stuffcmd("bf\n");
                    protect2Sound.play();
                    invincible_time = time + 1;
                } else if (invincible_time < time) {
                    invincible_time = time + 1;
                    game.stuffcmd("bf\n");
                }
            }

            if (invincible_finished < time) {
                items -= Defs.itInvulnerability;
                invincible_time = false;
                invincible_finished = 0;
            }

            if (invincible_finished > time)
                effects = effects | Defs.efDimlight;
            else
                effects = effects - (effects & Defs.efDimlight);
        }

        if (super_damage_finished) {
            if (super_damage_finished < (time + 3)) {
                if (super_time === 1) {
                    ui.conPrint("Quad Damage is wearing off\n");
                    game.stuffcmd("bf\n");
                    damage2Sound.play();
                    super_time = time + 1;
                } else if (super_time < time) {
                    super_time = time + 1;
                    game.stuffcmd("bf\n");
                }
            }

            if (super_damage_finished < time) {
                items -= Defs.itQuad;
                super_damage_finished = 0;
                super_time = 0;
            }

            if (super_damage_finished > time)
                effects = effects | Defs.efDimlight;
            else
                effects = effects - (effects & Defs.efDimlight);
        }

        if (radsuit_finished) {
            air_finished = time + 12;

            if (radsuit_finished < (time + 3)) {
                if (rad_time === 1) {
                    ui.conPrint("Air supply in Biosuit expiring\n");
                    game.stuffcmd("bf\n");
                    suit2Sound.play();
                    rad_time = time + 1;
                } else if (rad_time < time) {
                    rad_time = time + 1;
                    game.stuffcmd("bf\n");
                }
            }

            if (radsuit_finished < time) {
                items -= Defs.itSuit;
                rad_time = 0;
                radsuit_finished = 0;
            }
        }
    }

    Sound {
        id: h2ojumpSound
        source: "qrc:/Assets/sounds/player/h2ojump.wav"
    }

    Sound {
        id: land2Sound
        source: "qrc:/Assets/sounds/player/land2.wav"
    }

    Sound {
        id: landSound
        source: "qrc:/Assets/sounds/player/land.wav"
    }

    function respawn() { game.restart(); }

    function playerPostThink() {
        if (view_ofs === Qt.vector3d(0, 0, 0))
            return; // intermission or finale

        if (deadflag)
            return;

        weaponFrame();

        if (jump_flag < -3 && onGround && health > 0) {
            if (watertype === Defs.contentsWater) {
                h2ojumpSound.play();
            } else if (jump_flag < -6.5) {
                weapons.t_damage(self, world, world, 5);
                land2Sound.play();
            } else {
                landSound.play();
            }

            jump_flag = 0;
        }

        if (!onGround)
            jump_flag = velocity.y;

        checkPowerups();
    }

    function playerDeathThink() {
        if (onGround) {
            let forward = velocity.length();
            forward -= 2;
            if (forward <= 0)
                velocity = Qt.vector3d(0, 0, 0);
            else
                velocity = velocity.normalized().times(forward);
        }

        if (deadflag === Defs.deadDead) {
            if (playerController.button0
                    || playerController.button1
                    || playerController.button2) {
                return;
            }

            deadflag = Defs.deadRespawnable;
            return;
        }

        if (!playerController.button2
                && !playerController.button1
                && !playerController.button0) {
            return;
        }

        playerController.button0 = 0;
        playerController.button1 = 0;
        playerController.button2 = 0;

        respawn();
    }

    function playerJump() {
        if (root.waterJump)
            return;

        if (waterlevel >= 2) {
            if (watertype === Defs.contentsWater)
                velocity.y = 1.0;
            else if (watertype == Defs.contentsSlime)
                velocity.y = 0.8;
            else
                velocity.y = 0.5;

            return;
        }

        if (!onGround)
            return;

        if (!jumpReleased)
            return;

        jumpReleased = false;
        onGround = false;

        jumpSound.play();
        playerController.button2 = 0;
        velocity.y += 2.70;
    }

    function setCurrentAmmo() {
        player_run();

        items = items - (items & (Defs.itShells | Defs.itNails | Defs.itRockets | Defs.itCells));

        if (weapon == Defs.itAxe) {
            currentammo = 0;
            weaponframe = 0;
        } else if ((weapon === Defs.itShotgun) || (weapon === Defs.itSuperShotgun)) {
            currentammo = ammo_shells;
            weaponframe = 0;
            items |= Defs.itShells;
        } else if ((weapon === Defs.itNailgun) || (weapon === Defs.itSuperNailgun)) {
            currentammo = ammo_nails;
            weaponframe = 0;
            items |= Defs.itNails;
        } else if ((weapon === Defs.itGrenadeLauncher) || (weapon === Defs.itRocketLauncher)) {
            currentammo = ammo_rockets;
            weaponframe = 0;
            items |= Defs.itRockets;
        } else if (weapon === Defs.itLightning) {
            currentammo = ammo_cells;
            weaponframe = 0;
            items |= Defs.itCells;
        } else {
            currentammo = 0;
            weaponframe = 0;
        }
    }

    function bestWeapon() {
        if (waterlevel <= 1 && ammo_cells >= 1 && (items & Defs.itLightning))
            return Defs.itLightning;
        if (ammo_nails >= 2 && (items & Defs.itSuperNailgun))
            return Defs.itSuperNailgun;
        if (ammo_shells >= 2 && (items & Defs.itSuperShotgun))
            return Defs.itSuperShotgun;
        if (ammo_nails >= 1 && (items & Defs.itNailgun))
            return Defs.itNailgun;
        if (ammo_shells >= 1 && (items & Defs.itShotgun))
            return Defs.itShotgun;

        return Defs.itAxe;
    }

    function checkNoAmmo() {
        if (currentammo > 0)
            return true;

        if (weapon === Defs.itAxe)
            return true;

        weapon = bestWeapon();

        setCurrentAmmo();

        return false;
    }

    function attack() {
        show_hostile = time + 1;

        switch (weapon) {
        case Defs.itAxe:
            ax1Sound.play();
            const r = Math.random();
            if (r < 0.25)
                player_axe1();
            else if (r < 0.5)
                player_axeb1();
            else if (r < 0.75)
                player_axec1();
            else
                player_axed1();
            attack_finished = time + 0.5;
            break;
        case Defs.itShotgun:
            player_shot1();
            fireShotgun();
            attack_finished = time + 0.5;
            break;
        case Defs.itSuperShotgun:
            player_shot1();
            fireSuperShotgun();
            attack_finished = time + 0.7;
            break;
        case Defs.itNailgun:
            player_nail1();
            break;
        case Defs.itSuperNailgun:
            player_nail1();
            break;
        case Defs.itGrenadeLauncher:
            player_rocket1();
            fireGrenade();
            attack_finished = time + 0.6;
            break;
        case Defs.itRocketLauncher:
            player_rocket1();
            fireRocket();
            attack_finished = time + 0.8;
            break;
        case Defs.itLightning:
            player_light1();
            attack_finished = time + 0.1;
            break;
        }
    }

    function changeWeapon() {
        let fl = 0;
        let am = false;

        switch (impulse) {
        case 1:
            fl = Defs.itAxe;
            break;
        case 2:
            fl = Defs.itShotgun;
            am = ammo_shells < 1;
            break;
        case 3:
            fl = Defs.itSuperShotgun;
            am = ammo_shells < 2;
            break;
        case 4:
            fl = Defs.itNailgun;
            am = ammo_nails < 1;
            break;
        case 5:
            fl = Defs.itSuperNailgun;
            am = ammo_nails < 2;
            break;
        case 6:
            fl = Defs.itGrenadeLauncher;
            am = ammo_rockets < 1;
            break;
        case 7:
            fl = Defs.itRocketLauncher;
            am = ammo_rockets < 1;
            break;
        case 8:
            fl = Defs.itLightning;
            am = ammo_cells < 1;
            break;
        }

        impulse = 0;

        if (!(items & fl)) {
            console.log("no weapon.");
            return;
        }

        if (am) {
            console.log("not enough ammo.");
            return;
        }

        weapon = fl;
        setCurrentAmmo();
    }

    function cycleWeaponCommand() {
        impulse = 0;

        let fl = weapon;

        while (true) {
            let am = false;

            switch (fl) {
            case Defs.itLightning:
                fl = Defs.itAxe;
                break;
            case Defs.itAxe:
                fl = Defs.itShotgun;
                if (ammo_shells < 1)
                    am = true;
                break;
            case Defs.itShotgun:
                fl = Defs.itSuperShotgun;
                if (ammo_shells < 2)
                    am = true;
                break;
            case Defs.itSuperShotgun:
                fl = Defs.itNailgun;
                if (ammo_nails < 1)
                    am = true;
                break;
            case Defs.itNailgun:
                fl = Defs.itSuperNailgun;
                if (ammo_nails < 2)
                    am = true;
                break;
            case Defs.itSuperNailgun:
                fl = Defs.itGrenadeLauncher;
                if (ammo_rockets < 1)
                    am = true;
                break;
            case Defs.itGrenadeLauncher:
                fl = Defs.itRocketLauncher;
                if (ammo_rockets < 1)
                    am = true;
                break;
            case Defs.itRocketLauncher:
                fl = Defs.itLightning;
                if (ammo_cells < 1)
                    am = true;
                break;
            }

            if ((items & fl) && !am) {
                weapon = fl;
                setCurrentAmmo();
                return;
            }
        }
    }

    function cycleWeaponReverseCommand() {
        impulse = 0;

        let fl = weapon;

        while (true) {
            let am = false;

            switch (fl) {
            case Defs.itLightning:
                fl = Defs.itRocketLauncher;
                if (ammo_rockets < 1)
                    am = true;
                break;
            case Defs.itAxe:
                fl = Defs.itLightning;
                if (ammo_cells < 1)
                    am = true;
                break;
            case Defs.itShotgun:
                fl = Defs.itAxe;
                break;
            case Defs.itSuperShotgun:
                fl = Defs.itShotgun;
                if (ammo_shells < 1)
                    am = true;
                break;
            case Defs.itNailgun:
                fl = Defs.itSuperShotgun;
                if (ammo_shells < 2)
                    am = true;
                break;
            case Defs.itSuperNailgun:
                fl = Defs.itNailgun;
                if (ammo_nails < 1)
                    am = true;
                break;
            case Defs.itGrenadeLauncher:
                fl = Defs.itSuperNailgun;
                if (ammo_nails < 2)
                    am = true;
                break;
            case Defs.itRocketLauncher:
                fl = Defs.itGrenadeLauncher;
                if (ammo_rockets < 1)
                    am = true;
                break;
            }

            if ((items & fl) && !am) {
                weapon = fl;
                setCurrentAmmo();
                return;
            }
        }
    }

    function cheatCommand() {
        ammo_rockets = 100;
        ammo_nails = 200;
        ammo_shells = 100;

        items = items | Defs.itAxe
                      | Defs.itShotgun
                      | Defs.itSuperShotgun
                      | Defs.itNailgun
                      | Defs.itSuperNailgun
                      | Defs.itGrenadeLauncher
                      | Defs.itRocketLauncher
                      | Defs.itKey1
                      | Defs.itKey2;

        armortype = 0.8;
        armorvalue = 200;
        items |= Defs.itArmor3;

        ammo_cells = 200;
        items |= Defs.itLightning;

        weapon = Defs.itRocketLauncher;
        impulse = 0;
        setCurrentAmmo();
    }

    function serverflagsCommand() {
        serverflags = serverflags * 2 + 1;
    }

    Connections {
        target: main
        function onServerflagsChanged() {
            items |= serverflags << 28;
        }
    }

    function quadCheat() {
        super_time = 1;
        super_damage_finished = time + 30;
        items |= Defs.itQuad;
    }

    function impulseCommands() {
        if (impulse >= 1 && impulse <= 8)
            changeWeapon();
        else if (impulse === 9)
            cheatCommand();
        else if (impulse === 10)
            cycleWeaponCommand();
        else if (impulse === 11)
            serverflagsCommand();
        else if (impulse === 12)
            cycleWeaponReverseCommand();
        else if (impulse === 255)
            quadCheat();

        impulse = 0;
    }

    function weaponFrame() {
        if (time < attack_finished)
            return;

        impulseCommands();

        if (playerController.button0) {
            superDamageSound();
            attack();
        }
    }

    Sound {
        id: damage3Sound
        source: "qrc:/Assets/sounds/items/damage3.wav"
    }

    function superDamageSound() {
        if (super_damage_finished > time) {
            if (super_sound < time) {
                super_sound = time + 1;
                damage3Sound.play();
            }
        }
    }

    Sound {
        id: axhit2Sound
        source: "qrc:/Assets/sounds/player/axhit2.wav"
    }

    function fireAxe() {
        const source = position.plus(Qt.vector3d(0, 0.16, 0));
        const trace = physicsSystem.castRay(source, forward.times(0.64), Layers.Normal, [body]);
        if (trace.fraction >= 1.0)
            return;

        const org = trace.position.minus(forward.times(0.04));

        if (trace?.body && trace.body.ent.takedamage) {
            weapons.spawnBlood(org, Qt.vector3d(0, 0, 0), 20);
            weapons.t_damage(trace.body.ent, self, self, 20);
        } else {
            axhit2Sound.play();
        }
    }

    function fireShotgun() {
        guncockSound.play();

        punchangle.x -= 2;
        currentammo = ammo_shells = ammo_shells - 1;
        weapons.fireBullets(6, forward, Qt.vector3d(0.04, 0.04, 0));
    }

    function fireSuperShotgun() {
        if (currentammo === 1) {
            fireShotgun();
            return;
        }

        shotgn2Sound.play();

        punchangle.x -= 4;
        currentammo = ammo_shells = ammo_shells - 2;
        weapons.fireBullets(14, forward, Qt.vector3d(0.14, 0.08, 0));
    }

    function fireSpikes(ox) {
        if (ammo_nails >= 2 && weapon === Defs.itSuperNailgun) {
            fireSuperSpikes();
            return;
        }

        if (ammo_nails < 1) {
            weapon = bestWeapon();
            setCurrentAmmo();
            return;
        }

        rocket1iSound.play();

        attack_finished = time + 0.2;

        const org = position.plus(forward.times(0.08)).plus(Qt.vector3d(0, 0.16, 0)).plus(right.times(ox));
        currentammo = ammo_nails = ammo_nails - 1;
        weapons.launch_spike(org, forward, forward.times(10), 0);

        punchangle.x = -2;
    }

    function fireSuperSpikes() {
        spike2Sound.play();

        attack_finished = time + 0.2;

        const org = position.plus(forward.times(0.08)).plus(Qt.vector3d(0, 0.16, 0));
        currentammo = ammo_nails = ammo_nails - 2;
        weapons.launch_spike(org, forward, forward.times(10), 1);

        punchangle.x = -2;
    }

    function fireGrenade() {
        grenadeSound.play();

        punchangle.x = -2;

        let velocity;
        if (eulerRotation.x) {
            velocity = forward.times(6).plus(up.times(2)).plus(right.times(0.1 * M.crandom())).plus(up.times(0.1 * M.crandom()));
        } else {
            velocity = forward.times(6);
            velocity.y = 2;
        }

        const settings = {
            position: position.plus(forward.times(0.16)),
            velocity: velocity,
            avelocity: Qt.vector3d(3, 3, 3),
            owner: self
        }

        grenadeComponent.createObject(world, settings);
        currentammo = ammo_rockets = ammo_rockets - 1;
    }

    function fireRocket() {
        sgun1Sound.play();

        punchangle.x = -2;

        const settings = {
            position: position.plus(forward.times(0.08)).plus(Qt.vector3d(0, 0.16, 0)),
            velocity: forward.times(10),
            owner: self
        }

        missileComponent.createObject(world, settings);
        currentammo = ammo_rockets = ammo_rockets - 1;
    }

    function fireLightning() {
        if (ammo_cells < 1) {
            weapon = bestWeapon();
            setCurrentAmmo();
            return;
        }

        // explode if under water
        if (waterlevel > 1) {
            const cells = ammo_cells;
            ammo_cells = 0;
            setCurrentAmmo();
            weapons.t_radiusDamage(self, self, 35 * cells, world);
            return;
        }

        if (t_width < time) {
            lhitSound.play();
            t_width = time + 0.6;
        }

        punchangle.x = -2;
        currentammo = ammo_cells = ammo_cells - 1;

        const org = position.plus(Qt.vector3d(0, 0.16, 0));
        const end = org.plus(forward.times(6));

        const trace = physicsSystem.castRay(org, end.minus(org), Layers.Normal, [body]);
        const endpos = trace.fraction >= 1.0 ? end : trace.position;

        shaft.endpos = endpos
        shaft.fire();

        weapons.lightningDamage(position, endpos.plus(forward.times(0.04)), self, 30);
    }

    function player_stand1() { th.nextFrame(0, player_stand1); weaponframe = 0; }
    function player_run() { th.nextFrame(0, player_run); weaponframe = 0; }

    function player_shot1() { th.nextFrame(0, player_shot2); weaponframe = 1; effects |= Defs.efMuzzleflash; viewModel.shot.interpolate = false;  }
    function player_shot2() { th.nextFrame(0, player_shot3); weaponframe = 2; viewModel.shot.interpolate = true;  }
    function player_shot3() { th.nextFrame(0, player_shot4); weaponframe = 3; }
    function player_shot4() { th.nextFrame(0, player_shot5); weaponframe = 4; }
    function player_shot5() { th.nextFrame(0, player_shot6); weaponframe = 5; }
    function player_shot6() { th.nextFrame(0, player_run); weaponframe = 6; }

    function player_axe1() { th.nextFrame(0, player_axe2); weaponframe = 1; }
    function player_axe2() { th.nextFrame(0, player_axe3); weaponframe = 2; }
    function player_axe3() { th.nextFrame(0, player_axe4); weaponframe = 3; fireAxe(); }
    function player_axe4() { th.nextFrame(0, player_run); weaponframe = 4; }

    function player_axeb1() { th.nextFrame(0, player_axeb2); weaponframe = 5; }
    function player_axeb2() { th.nextFrame(0, player_axeb3); weaponframe = 6; }
    function player_axeb3() { th.nextFrame(0, player_axeb4); weaponframe = 7; fireAxe(); }
    function player_axeb4() { th.nextFrame(0, player_run); weaponframe = 8; }

    function player_axec1() { th.nextFrame(0, player_axec2); weaponframe = 1; }
    function player_axec2() { th.nextFrame(0, player_axec3); weaponframe = 2; }
    function player_axec3() { th.nextFrame(0, player_axec4); weaponframe = 3; fireAxe(); }
    function player_axec4() { th.nextFrame(0, player_run); weaponframe = 4; }

    function player_axed1() { th.nextFrame(0, player_axed2); weaponframe = 5; }
    function player_axed2() { th.nextFrame(0, player_axed3); weaponframe = 6; }
    function player_axed3() { th.nextFrame(0, player_axed4); weaponframe = 7; fireAxe(); }
    function player_axed4() { th.nextFrame(0, player_run); weaponframe = 8; }

    function player_nail1() {
        effects = self.effects | Defs.efMuzzleflash;

        th.nextFrame(0, player_nail2);

        if (!playerController.button0) {
            player_run();
            return;
        }

        weaponframe++;

        if (weaponframe === 9)
            weaponframe = 1;

        superDamageSound();
        fireSpikes(0.04);

        attack_finished = time + 0.2;
    }

    function player_nail2() {
        effects = self.effects | Defs.efMuzzleflash;

        th.nextFrame(0, player_nail1);

        if (!playerController.button0) {
            player_run();
            return;
        }

        weaponframe++;

        if (weaponframe === 9)
            weaponframe = 1;

        superDamageSound();
        fireSpikes(-0.04);

        attack_finished = time + 0.2;
    }

    function player_rocket1() {
        th.nextFrame(0, player_rocket2);
        weaponframe = 1;
        effects = effects | Defs.efMuzzleflash;
        viewModel.rock.interpolate = false;
        viewModel.rock2.interpolate = false;
    }
    function player_rocket2() {
        th.nextFrame(0, player_rocket3);
        weaponframe = 2;
        viewModel.rock.interpolate = true;
        viewModel.rock2.interpolate = true;
    }
    function player_rocket3() { th.nextFrame(0, player_rocket4); weaponframe = 3; }
    function player_rocket4() { th.nextFrame(0, player_rocket5); weaponframe = 4; }
    function player_rocket5() { th.nextFrame(0, player_rocket6); weaponframe = 5; }
    function player_rocket6() { th.nextFrame(0, player_run); weaponframe = 6; }

    function player_light1() {
        effects = effects | Defs.efMuzzleflash;

        th.nextFrame(0, player_light2);

        if (!playerController.button0) {
            player_run();
            return;
        }

        weaponframe++;

        if (weaponframe === 5)
            weaponframe = 1;

        superDamageSound();
        fireLightning();

        attack_finished = time + 0.2;
    }

    function player_light2() {
        effects = effects | Defs.efMuzzleflash;

        th.nextFrame(0, player_light1);

        if (!playerController.button0) {
            player_run();
            return;
        }

        weaponframe++;

        if (weaponframe === 5)
            weaponframe = 1;

        superDamageSound();
        fireLightning();

        attack_finished = time + 0.2;
    }

    Sound {
        id: drown1Sound
        source: "qrc:/Assets/sounds/player/drown1.wav"
    }

    Sound {
        id: drown2Sound
        source: "qrc:/Assets/sounds/player/drown2.wav"
    }

    Sound {
        id: lburn1Sound
        source: "qrc:/Assets/sounds/player/lburn1.wav"
    }

    Sound {
        id: lburn2Sound
        source: "qrc:/Assets/sounds/player/lburn2.wav"
    }

    Sound {
        id: pain1Sound
        source: "qrc:/Assets/sounds/player/pain1.wav"
    }

    Sound {
        id: pain2Sound
        source: "qrc:/Assets/sounds/player/pain2.wav"
    }

    Sound {
        id: pain3Sound
        source: "qrc:/Assets/sounds/player/pain3.wav"
    }

    Sound {
        id: pain4Sound
        source: "qrc:/Assets/sounds/player/pain4.wav"
    }

    Sound {
        id: pain5Sound
        source: "qrc:/Assets/sounds/player/pain5.wav"
    }

    Sound {
        id: pain6Sound
        source: "qrc:/Assets/sounds/player/pain6.wav"
    }

    Sound {
        id: teledth1Sound
        source: "qrc:/Assets/sounds/player/teledth1.wav"
    }

    Sound {
        id: h2odeathSound
        source: "qrc:/Assets/sounds/player/h2odeath.wav"
    }

    Sound {
        id: death1Sound
        source: "qrc:/Assets/sounds/player/death1.wav"
    }

    Sound {
        id: death2Sound
        source: "qrc:/Assets/sounds/player/death2.wav"
    }

    Sound {
        id: death3Sound
        source: "qrc:/Assets/sounds/player/death3.wav"
    }

    Sound {
        id: death4Sound
        source: "qrc:/Assets/sounds/player/death4.wav"
    }

    Sound {
        id: death5Sound
        source: "qrc:/Assets/sounds/player/death5.wav"
    }

    Sound {
        id: gibSound
        source: "qrc:/Assets/sounds/player/gib.wav"
    }

    Sound {
        id: udeathSound
        source: "qrc:/Assets/sounds/player/udeath.wav"
    }

    function painSound() {
        if (health < 0)
            return;

        if (damage_attacker.classname === "teledeath") {
            teledth1Sound.play();
            return;
        }

        // water pain sounds
        if (watertype === Defs.contentsWater && waterlevel === 3) {
            deathBubblesComponent.createObject(world, { owner: root, bubble_count: 1 })
            if (Math.random() > 0.5)
                drown1Sound.play();
            else
                drown2Sound.play();
            return;
        }

        // slime pain sounds
        if (watertype === Defs.contentsSlime) {
            if (Math.random() > 0.5)
                lburn1Sound.play();
            else
                lburn2Sound.play();
            return;
        }

        if (watertype === Defs.contentsLava) {
            if (Math.random() > 0.5)
                lburn1Sound.play();
            else
                lburn2Sound.play();
            return;
        }

        pain_finished = time + 0.5;

        const rs = Math.random((Math.random() * 5) + 1);

        switch (rs) {
        case 1:
            pain1Sound.play();
            break;
        case 2:
            pain2Sound.play();
            break;
        case 3:
            pain3Sound.play();
            break;
        case 4:
            pain4Sound.play();
            break;
        case 5:
            pain5Sound.play();
            break;
        default:
            pain6Sound.play();
            break;
        }
    }

    function player_pain1() { th.nextFrame(0, player_pain2); painSound(); weaponframe = 0; }
    function player_pain2() { th.nextFrame(0, player_pain3); }
    function player_pain3() { th.nextFrame(0, player_pain4); }
    function player_pain4() { th.nextFrame(0, player_pain5); }
    function player_pain5() { th.nextFrame(0, player_pain6); }
    function player_pain6() { th.nextFrame(0, player_run); }

    function player_axpain1() { th.nextFrame(0, player_axpain2); painSound(); weaponframe = 0; }
    function player_axpain2() { th.nextFrame(0, player_axpain3); }
    function player_axpain3() { th.nextFrame(0, player_axpain4); }
    function player_axpain4() { th.nextFrame(0, player_axpain5); }
    function player_axpain5() { th.nextFrame(0, player_axpain6); }
    function player_axpain6() { th.nextFrame(0, player_run); }

    function player_pain() {
        if (weaponframe)
            return;
        if (invisible_finished > time)
            return;
        if (weapon)
            player_axpain1();
        else
            player_pain1();
    }

    function deathSound() {
        // water death sounds
        if (waterlevel === 3) {
            deathBubblesComponent.createObject(world, { owner: root, bubble_count: 20 })
            h2odeathSound.play();
            return;
        }

        const rs = Math.round((Math.random() * 4) + 1);
        switch (rs) {
        case 1:
            death1Sound.play();
            break;
        case 2:
            death2Sound.play();
            break;
        case 3:
            death3Sound.play();
            break;
        case 4:
            death4Sound.play();
            break;
        case 5:
            death5Sound.play();
            break;
        }
    }

    function playerDead() {
        th.nextthink = -1;
        // allow respawn after a certain time
        deadflag = Defs.deadDead;
    }

    function gibPlayer() {
        throwHead(health);
        throwGib("gib1", health);
        throwGib("gib2", health);
        throwGib("gib3", health);

        deadflag = Defs.deadDead;

        if (damage_attacker.classname === "teledeath") {
            teledth1Sound.play();
            return;
        }

        if (damage_attacker.classname === "teledeath2") {
            teledth1Sound.play();
            return;
        }

        if (Math.random() < 0.5)
            gibSound.play();
        else
            udeathSound.play();
    }

    function playerDie() {
        invisible_finished = 0;
        invincible_finished = 0;
        super_damage_finished = 0;
        radsuit_finished = 0;

        viewModel.destroy();
        view_ofs = Qt.vector3d(0, -0.08, 0);

        deadflag = Defs.deadDying;
        solid = false;
        th.movetype = "toss";
        if (velocity.y < 1) {
            velocity.y += Math.random() * 3;
            physicsToss();
        }

        if (health < -40) {
            gibPlayer();
            return;
        }

        deathSound();

        eulerRotation.x = 0;
        eulerRotation.z = 0;

        if (weapon == Defs.itAxe) {
            player_die_ax1();
            return;
        }

        const i = 1 + Math.floor(Math.random() * 6);
        if (i === 1)
            player_diea1();
        else if (i === 2)
            player_dieb1();
        else if (i == 3)
            player_diec1();
        else if (i === 4)
            player_died1();
        else
            player_diee1();
    }

    function player_diea1() { th.nextFrame(0, player_diea2); }
    function player_diea2() { th.nextFrame(0, player_diea3); }
    function player_diea3() { th.nextFrame(0, player_diea4); }
    function player_diea4() { th.nextFrame(0, player_diea5); }
    function player_diea5() { th.nextFrame(0, player_diea6); }
    function player_diea6() { th.nextFrame(0, player_diea7); }
    function player_diea7() { th.nextFrame(0, player_diea8); }
    function player_diea8() { th.nextFrame(0, player_diea9); }
    function player_diea9() { th.nextFrame(0, player_diea10); }
    function player_diea10() { th.nextFrame(0, player_diea11); }
    function player_diea11() { th.nextFrame(0, player_diea11); playerDead(); }

    function player_dieb1() { th.nextFrame(0, player_dieb2); }
    function player_dieb2() { th.nextFrame(0, player_dieb3); }
    function player_dieb3() { th.nextFrame(0, player_dieb4); }
    function player_dieb4() { th.nextFrame(0, player_dieb5); }
    function player_dieb5() { th.nextFrame(0, player_dieb6); }
    function player_dieb6() { th.nextFrame(0, player_dieb7); }
    function player_dieb7() { th.nextFrame(0, player_dieb8); }
    function player_dieb8() { th.nextFrame(0, player_dieb9); }
    function player_dieb9() { th.nextFrame(0, player_dieb9); playerDead(); }

    function player_diec1() { th.nextFrame(0, player_diec2); }
    function player_diec2() { th.nextFrame(0, player_diec3); }
    function player_diec3() { th.nextFrame(0, player_diec4); }
    function player_diec4() { th.nextFrame(0, player_diec5); }
    function player_diec5() { th.nextFrame(0, player_diec6); }
    function player_diec6() { th.nextFrame(0, player_diec7); }
    function player_diec7() { th.nextFrame(0, player_diec8); }
    function player_diec8() { th.nextFrame(0, player_diec9); }
    function player_diec9() { th.nextFrame(0, player_diec10); }
    function player_diec10() { th.nextFrame(0, player_diec11); }
    function player_diec11() { th.nextFrame(0, player_diec12); }
    function player_diec12() { th.nextFrame(0, player_diec13); }
    function player_diec13() { th.nextFrame(0, player_diec14); }
    function player_diec14() { th.nextFrame(0, player_diec15); }
    function player_diec15() { th.nextFrame(0, player_diec15); playerDead(); }

    function player_died1() { th.nextFrame(0, player_died2); }
    function player_died2() { th.nextFrame(0, player_died3); }
    function player_died3() { th.nextFrame(0, player_died4); }
    function player_died4() { th.nextFrame(0, player_died5); }
    function player_died5() { th.nextFrame(0, player_died6); }
    function player_died6() { th.nextFrame(0, player_died7); }
    function player_died7() { th.nextFrame(0, player_died8); }
    function player_died8() { th.nextFrame(0, player_died9); }
    function player_died9() { th.nextFrame(0, player_died9); playerDead(); }

    function player_diee1() { th.nextFrame(0, player_diee2); }
    function player_diee2() { th.nextFrame(0, player_diee3); }
    function player_diee3() { th.nextFrame(0, player_diee4); }
    function player_diee4() { th.nextFrame(0, player_diee5); }
    function player_diee5() { th.nextFrame(0, player_diee6); }
    function player_diee6() { th.nextFrame(0, player_diee7); }
    function player_diee7() { th.nextFrame(0, player_diee8); }
    function player_diee8() { th.nextFrame(0, player_diee9); }
    function player_diee9() { th.nextFrame(0, player_diee9); playerDead(); }

    function player_die_ax1() { th.nextFrame(0, player_die_ax2); }
    function player_die_ax2() { th.nextFrame(0, player_die_ax3); }
    function player_die_ax3() { th.nextFrame(0, player_die_ax4); }
    function player_die_ax4() { th.nextFrame(0, player_die_ax5); }
    function player_die_ax5() { th.nextFrame(0, player_die_ax6); }
    function player_die_ax6() { th.nextFrame(0, player_die_ax7); }
    function player_die_ax7() { th.nextFrame(0, player_die_ax8); }
    function player_die_ax8() { th.nextFrame(0, player_die_ax9); }
    function player_die_ax9() { th.nextFrame(0, player_die_ax9); playerDead(); }

    function calcBob() {
        if (!vars.cl_bobcycle.value)
            return 0.0;

        let cycle = time - Math.floor(time / vars.cl_bobcycle.value) * vars.cl_bobcycle.value;
        cycle /= vars.cl_bobcycle.value;
        if (cycle < vars.cl_bobup.value)
            cycle = Math.PI * cycle / vars.cl_bobup.value;
        else
            cycle = Math.PI + Math.PI * (cycle - vars.cl_bobup.value) / (1.0 - vars.cl_bobup.value);

        let bob = Math.sqrt(velocity.x * velocity.x + velocity.z * velocity.z) * vars.cl_bob.value;
        bob = bob * 0.3 + bob * 0.7 * Math.sin(cycle);
        if (bob > 4.0)
            bob = 4.0;
        else if (bob < -7.0)
            bob = -7.0;
        return bob;
    }

    function calcRoll() {
        if (!vars.cl_rollangle.value)
            return 0.0;

        let side = velocity.dotProduct(root.right);
        const sign = side < 0 ? -1 : 1;
        side = Math.abs(side);

        if (side < vars.cl_rollspeed.value)
            return side * sign * vars.cl_rollangle.value / vars.cl_rollspeed.value * 100;

        return vars.cl_rollangle.value * sign;
    }

    function calcIntermissionRefdef() {
        eulerRotation.x = angles.x + Math.sin(time * vars.v_ipitch_cycle.value) * vars.v_ipitch_level.value;
        eulerRotation.y = angles.y + Math.sin(time * vars.v_iyaw_cycle.value) * vars.v_iyaw_level.value;
        eulerRotation.z = angles.z + Math.sin(time * vars.v_iroll_cycle.value) * vars.v_iroll_level.value;
    }

    function calcRefdef() {
        bob = calcBob();
        roll = calcRoll();

        if (dmgTime > 0) {
            if (vars.v_kicktime.value !== 0.0) {
                roll += dmgTime / vars.v_kicktime.value * dmgRoll;
                pitch = dmgTime / vars.v_kicktime.value * dmgPitch;
            }
            dmgTime -= frameTime;
        }

        if (health <= 0)
            eulerRotation.z = -80;

        if (onGround && (position.y - oldY) > 0.0) {
            oldY += frameTime * 0.8;
            if (oldY > position.y)
                oldY = position.y;
            else if ((position.y - oldY) > 0.18)
                oldY = position.y - 0.18;
            position.y += oldY - position.y;
        } else {
            oldY = position.y;
        }
    }

    QtObject {
        id: move

        function walkMove() {
            const isJumping = (!onGround && waterlevel === 0) || root.waterJump;
            updateSettings.walkStairsStepUp = Qt.vector3d(0, isJumping ? 0 : 0.12, 0);
            updateSettings.stickToFloorStepDown = Qt.vector3d(0, isJumping ? 0 : -0.05, 0);
            updatePosition();
        }

        function checkWater() {
            const point = root.position.plus(Qt.vector3d(0, mins.y + 0.01, 0));

            waterlevel = 0;
            watertype = Defs.contentsEmpty;
            let cont = pointContents(point);
            if (cont <= Defs.contentsWater) {
                watertype = cont;
                waterlevel = 1;
                point.y = root.position.y + (mins.y + maxs.y) / 2;
                cont = pointContents(point);
                if (cont <= Defs.contentsWater) {
                    waterlevel = 2;
                    point.y = root.position.y + view_ofs.y;
                    cont = pointContents(point);
                    if (cont <= Defs.contentsWater)
                        waterlevel = 3;
                }
            }

            return waterlevel > 1;
        }

        function checkWaterJump() {
            let start = Qt.vector3d(position.x, position.y, position.z);
            start.y += 0.08;
            let fwd = Qt.vector3d(forward.x, 0, forward.z);
            fwd = fwd.normalized();
            let end = start.plus(fwd.times(0.24));
            let trace = physicsSystem.castRay(start, end.minus(start), Layers.NoMonsters, [body]);

            if (trace.fraction < 1) {
                // solid at waist
                start.y += maxs.y - 0.08;
                end = start.plus(fwd.times(0.24));
                trace = physicsSystem.castRay(start, end.minus(start), Layers.NoMonsters, [body]);

                if (trace.fraction >= 1) {
                    // open at eye level
                    root.waterJump = true;
                    velocity.y = 2.25;
                    jumpReleased = false;
                }
            }
        }

        function userFriction() {
            const speed = Math.sqrt(velocity.x * velocity.x + velocity.z * velocity.z)
            if (!speed)
                return;

            const start = Qt.vector3d(position.x + velocity.x / speed * 0.16,
                                      position.y + mins.y,
                                      position.z + velocity.z / speed * 0.16);

            const hit = physicsSystem.castRay(start, Qt.vector3d(0, -0.34, 0), Layers.NoMonsters, [body]);

            let friction;
            if (hit.fraction >= 1.0)
                friction = vars.sv_friction.value * vars.edgefriction.value;
            else
                friction = vars.sv_friction.value;

            const control = speed < vars.sv_stopspeed.value / 100 ? vars.sv_stopspeed.value / 100 : speed;
            let newSpeed = speed - frameTime * control * friction;

            if (newSpeed < 0)
                newSpeed = 0;
            newSpeed /= speed;

            velocity = velocity.times(newSpeed);
        }

        function accelerate(wishSpeed, wishDir) {
            const currentSpeed = velocity.dotProduct(wishDir);
            const addSpeed = wishSpeed - currentSpeed;
            if (addSpeed <= 0)
                return;
            let accelSpeed = vars.sv_accelerate.value * frameTime * wishSpeed;
            if (accelSpeed > addSpeed)
                accelSpeed = addSpeed;
            velocity = velocity.plus(wishDir.times(accelSpeed));
        }

        function airAccelerate(wishSpeed, wishVel) {
            let wishSpd = wishVel.length();
            wishVel = wishVel.normalized();
            if (wishSpd > 0.3)
                wishSpd = 0.3;
            const currentSpeed = velocity.dotProduct(wishVel);
            const addSpeed = wishSpd - currentSpeed;
            if (addSpeed <= 0)
                return;
            let accelSpeed = vars.sv_accelerate.value * frameTime * wishSpeed;
            if (accelSpeed > addSpeed)
                accelSpeed = addSpeed;

            velocity = velocity.plus(wishVel.times(accelSpeed));
        }

        function dropPunchAngle() {
            let len = punchangle.length() - 10.0 * frameTime;
            punchangle = punchangle.normalized();
            if (len < 0)
                len = 0;
            punchangle = punchangle.times(len);
        }

        function waterMove() {
            const forwardMove = playerController.forwardMove;
            const sideMove = playerController.sideMove;
            const upMove = playerController.upMove;

            const q = Quaternion.fromEulerAngles(0, root.eulerRotation.y, 0);
            const forward = q.times(Qt.vector3d(0, 0, -1));
            const right = q.times(Qt.vector3d(1, 0, 0));

            let wishVel = forward.times(forwardMove).plus(right.times(sideMove));
            if (forwardMove === 0.0 && sideMove === 0.0 && upMove === 0.0)
                wishVel.y -= 0.6;
            else
                wishVel.y += upMove;

            let wishSpeed = wishVel.length();
            if (wishSpeed > vars.sv_maxspeed.value / 100) {
                wishVel = wishVel.times(vars.sv_maxspeed.value / 100 / wishSpeed);
                wishSpeed = vars.sv_maxspeed.value / 100;
            }
            wishSpeed *= 0.7;
            //
            // water friction
            //
            const speed = velocity.length();
            let newSpeed = 0;
            if (speed) {
                newSpeed = speed - frameTime * speed * vars.sv_friction.value;
                if (newSpeed < 0)
                    newSpeed = 0;
                velocity = velocity.times(newSpeed / speed);
            }
            //
            // water acceleration
            //
            if (!wishSpeed)
                return;

            const addSpeed = wishSpeed - newSpeed;
            if (addSpeed <= 0)
                return;

            wishVel = wishVel.normalized();
            let accelSpeed = vars.sv_accelerate.value * frameTime * wishSpeed;
            if (accelSpeed > addSpeed)
                accelSpeed = addSpeed;

            velocity = velocity.plus(wishVel.times(accelSpeed));
        }

        function waterJump() {
            if (waterlevel === 0) {
                root.waterJump = false;
            }
            velocity.x = 0;
            velocity.z = 0;
        }

        function airMove() {
            const forwardMove = playerController.forwardMove;
            const sideMove = playerController.sideMove;

            const q = Quaternion.fromEulerAngles(0, root.eulerRotation.y, 0);
            const forward = q.times(Qt.vector3d(0, 0, -1));
            const right = q.times(Qt.vector3d(1, 0, 0));

            let wishVel = forward.times(forwardMove).plus(right.times(sideMove));
            let wishDir = Qt.vector3d(wishVel.x, wishVel.y, wishVel.z);
            let wishSpeed = wishDir.length();
            wishDir = wishDir.normalized();
            if (wishSpeed > vars.sv_maxspeed.value / 100) {
                wishVel = wishVel.times(vars.sv_maxspeed.value / 100 / wishSpeed);
                wishSpeed = vars.sv_maxspeed.value / 100;
            }

            if (onGround) {
                userFriction();
                accelerate(wishSpeed, wishDir);
            } else {
                airAccelerate(wishSpeed, wishVel);
            }
        }
    }

    QtObject {
        id: blend

        readonly property var cshiftEmpty: ({ destcolor: [130, 80, 50], percent: 0 })
        readonly property var cshiftWater: ({ destcolor: [130, 80, 50], percent: 128})
        readonly property var cshiftSlime: ({ destcolor: [0, 25, 5], percent: 150})
        readonly property var cshiftLava: ({ destcolor: [255, 80, 0], percent: 150})

        readonly property int cshiftContents: 0
        readonly property int cshiftDamage: 1
        readonly property int cshiftBonus: 2
        readonly property int cshiftPowerUp: 3

        readonly property int numCshifts: 4

        property color blendColor: Qt.rgba(0, 0, 0, 0)

        readonly property var fogEmpty: ({ color: "#c088c0", density: 0.2, near: 5, far: 10 })
        readonly property var fogWater: ({ color: "#204080", density: 0.5, near: 3, far: 9 })
        readonly property var fogSlime: ({ color: "#408040", density: 0.9, near: 0.5, far: 5 })
        readonly property var fogLava: ({ color: "#ff4010", density: 0.3, near: 4, far: 8 })

        function updateFog(contents) {
            let fogSettings;
            switch (contents) {
            case Defs.contentsSlime:
                fogSettings = fogSlime;
                break;
            case Defs.contentsLava:
                fogSettings = fogLava;
                break;
            case Defs.contentsWater:
                fogSettings = fogWater;
                break;
            default:
                fogSettings = fogEmpty;
                break;
            }

            view.env.fog.color = fogSettings.color;
            view.env.fog.density = fogSettings.density;
            view.env.fog.depthNear = fogSettings.near;
            view.env.fog.depthFar = fogSettings.far;
        }

        function bonusFlash() {
            cshifts[cshiftBonus] = { destcolor: [215, 186, 69], percent: 50 };
        }

        function setContentsColor(contents) {
            switch (contents) {
            case Defs.contentsLava:
                cshifts[cshiftContents] = cshiftLava;
                break;
            case Defs.contentsSlime:
                cshifts[cshiftContents] = cshiftSlime;
                break;
            case Defs.contentsWater:
                cshifts[cshiftContents] = cshiftWater;
                break
            default:
                cshifts[cshiftContents] = cshiftEmpty;
                break;
            }
        }

        function calcBlend() {
            let r = 0;
            let g = 0;
            let b = 0;
            let a = 0;

            for (let j = 0; j < numCshifts; ++j) {
                const cshift = cshifts[j];
                if (!cshift)
                    continue;

                let a2 = ((cshift.percent * 100) / 100.0) / 255.0;
                if (!a2)
                    continue;

                a = a + a2 * (1 - a);
                a2 = a2 / a;
                r = r * (1 - a2) + cshift.destcolor[0] * a2;
                g = g * (1 - a2) + cshift.destcolor[1] * a2;
                b = b * (1 - a2) + cshift.destcolor[2] * a2;
            }

            blendColor.r = Math.max(0.0, Math.min(r, 255.0)) / 255.0;
            blendColor.g = Math.max(0.0, Math.min(g, 255.0)) / 255.0;
            blendColor.b = Math.max(0.0, Math.min(b, 255.0)) / 255.0;
            blendColor.a = Math.max(0.0, Math.min(a, 1.0));
        }

        function calcPowerupCshift() {
            if (items & Defs.itQuad) {
                cshifts[cshiftPowerUp].destcolor[0] = 0;
                cshifts[cshiftPowerUp].destcolor[1] = 0;
                cshifts[cshiftPowerUp].destcolor[2] = 255;
                cshifts[cshiftPowerUp].percent = 30;
            } else if (items & Defs.itSuit) {
                cshifts[cshiftPowerUp].destcolor[0] = 0;
                cshifts[cshiftPowerUp].destcolor[1] = 255;
                cshifts[cshiftPowerUp].destcolor[2] = 0;
                cshifts[cshiftPowerUp].percent = 20;
            } else if (items & Defs.itInvisibility) {
                cshifts[cshiftPowerUp].destcolor[0] = 100;
                cshifts[cshiftPowerUp].destcolor[1] = 100;
                cshifts[cshiftPowerUp].destcolor[2] = 100;
                cshifts[cshiftPowerUp].percent = 100;
            } else if (items & Defs.itInvulnerability) {
                cshifts[cshiftPowerUp].destcolor[0] = 255;
                cshifts[cshiftPowerUp].destcolor[1] = 255;
                cshifts[cshiftPowerUp].destcolor[2] = 0;
                cshifts[cshiftPowerUp].percent = 30;
            } else {
                cshifts[cshiftPowerUp].percent = 0;
            }
        }

        function parseDamage() {
            const armor = dmg_save;
            const blood = dmg_take;

            if (armor === 0.0 && blood === 0)
                return;

            let count = blood * 0.5 + armor * 0.5;
            if (count < 10)
                count = 10;

            faceanimtime = time + 0.2;

            const cshift = cshifts[cshiftDamage];

            cshift.percent += 3 * count;
            if (cshift.percent < 0.0)
                cshift.percent = 0;
            if (cshift.percent > 150)
                cshift.percent = 150;

            if (armor > blood) {
                cshift.destcolor[0] = 200;
                cshift.destcolor[1] = 100;
                cshift.destcolor[2] = 100;
            } else if (armor) {
                cshift.destcolor[0] = 220;
                cshift.destcolor[1] = 50;
                cshift.destcolor[2] = 50;
            } else {
                cshift.destcolor[0] = 255;
                cshift.destcolor[1] = 0;
                cshift.destcolor[2] = 0;
            }

            //
            // calculate view angle kicks
            //

            let from = Qt.vector3d(position.x, position.y, position.z);
            from = from.normalized();

            let side = from.dotProduct(right);
            dmgRoll = count * side * vars.v_kickroll.value;

            side = from.dotProduct(forward);
            dmgPitch = count * side * vars.v_kickpitch.value;

            dmgTime = vars.v_kicktime.value;

            dmg_save = 0;
            dmg_take = 0;
        }

        function updateBlend() {
            calcPowerupCshift();

            let blendChanged = false;

            for (let i = 0; i < numCshifts; ++i) {
                if (cshifts[i].percent !== prev_cshifts[i].percent) {
                    blendChanged = true;
                    prev_cshifts[i].percent = cshifts[i].percent;
                }
                for (let j = 0; j < 3; ++j) {
                    if (cshifts[i].destcolor[j] !== prev_cshifts[i].destcolor[j]) {
                        blendChanged = true;
                        prev_cshifts[i].destcolor[j] = cshifts[i].destcolor[j];
                    }
                }
            }

            // drop the damage value
            cshifts[cshiftDamage].percent -= frameTime * 150;
            if (cshifts[cshiftDamage].percent <= 0)
                cshifts[cshiftDamage].percent = 0;

            // drop the bonus value
            cshifts[cshiftBonus].percent -= frameTime * 100;
            if (cshifts[cshiftBonus].percent <= 0)
                cshifts[cshiftBonus].percent = 0;

            if (blendChanged)
                calcBlend();

            blendEffect.color = blendColor;
        }

        function updateScreen() {
            world.lightStyleTextureData.animateLights(time);
            const contents = pointContents(camera.position);

            setContentsColor(contents);
            warpEffect.warped = (contents === Defs.contentsWater)
                    || (contents === Defs.contentsSlime)
                    || (contents === Defs.contentsLava);

            updateFog(contents);

            parseDamage();

            updateBlend();
        }
    }
}
