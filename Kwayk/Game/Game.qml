import QtQuick
import QtQuick3D

import Backend

Item {
    id : root

    property var parms: []
    property string nextmap: ""
    property string mapname: ""

    readonly property var scripts: ({
        "quake.rc": quakeCmd.text,
        "default.cfg": defaultCmd.text,
    })

    Cmd {
        id: quakeCmd
        source: "qrc:/Assets/quake.rc"
    }

    Cmd {
        id: defaultCmd
        source: "qrc:/Assets/default.cfg"
    }

    Mdl { source: "qrc:/Assets/progs/eyes.mdl" }
    Mdl { source: "qrc:/Assets/progs/h_player.mdl" }
    Mdl { source: "qrc:/Assets/progs/gib1.mdl" }
    Mdl { source: "qrc:/Assets/progs/gib2.mdl" }
    Mdl { source: "qrc:/Assets/progs/gib3.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_axe.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_shot.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_nail.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_rock.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_shot2.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_nail2.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_rock2.mdl" }
    Mdl { source: "qrc:/Assets/progs/bolt.mdl" }
    Mdl { source: "qrc:/Assets/progs/bolt2.mdl" }
    Mdl { source: "qrc:/Assets/progs/bolt3.mdl" }
    Mdl { source: "qrc:/Assets/progs/lavalball.mdl" }
    Mdl { source: "qrc:/Assets/progs/missile.mdl" }
    Mdl { source: "qrc:/Assets/progs/grenade.mdl" }
    Mdl { source: "qrc:/Assets/progs/spike.mdl" }
    Mdl { source: "qrc:/Assets/progs/s_spike.mdl" }
    Mdl { source: "qrc:/Assets/progs/backpack.mdl" }
    Mdl { source: "qrc:/Assets/progs/zom_gib.mdl" }
    Mdl { source: "qrc:/Assets/progs/v_light.mdl" }

    Component.onCompleted: {
        cmds.functions["map"] = map;
        cmds.functions["restart"] = restart;
        cmds.functions["changelevel"] = changelevel;
        cmds.functions["impulse"] = impulse;
        cmds.functions["god"] = god;
        cmds.functions["notarget"] = notarget;
        cmds.functions["disconnect"] = disconnect;

        cmds.command = "exec quake.rc\n";

        // Start in menu state
        currentState = menuState;
    }

    function disconnect() {
        worldLoader.source = "";
        currentState = menuState;
    }

    function map(argv) {
        if (argv.length < 2) {
            ui.conPrint(`Current map: ${name}\n`)
            return;
        }

        setNewParms();

        start(argv[1]);
    }

    function start(name) {
        let currentSkill = Math.floor(vars.skill.value + 0.5);
        currentSkill = Math.max(0, Math.min(currentSkill, 3));

        vars.val = { name: "skill", value: currentSkill };

        currentState = loadingState;

        mapname = name;
        const fileName = name[0].toUpperCase() + name.slice(1);
        const path = "qrc:/Kwayk/Game/Maps/" + fileName + ".qml";

        let grabbed = false;

        loop.running = false;

        if (view.width && view.height) {
            grabbed = view.grabToImage(result => {
                view.transitionEffect.source = result.url;
                worldLoader.source = "";
                worldLoader.source = path;
            });
        }

        if (!grabbed) {
            worldLoader.source = "";
            worldLoader.source = path;
        }
    }

    function restart() {
        if (!player)
            return;

        start(mapname);
    }

    function changelevel(argv) {
        if (argv.length < 2) {
            ui.conPrint("changelevel <levelname> : continue game on a new level\n");
            return;
        }

        if (player)
            player.setChangeParms();

        start(argv[1]);
    }

    function impulse(argv) {
        if (argv.length < 2) {
            ui.conPrint("impulse <number> : send an impulse number\n");
            return;
        }

        if (player)
            player.impulse = parseInt(argv[1]);
    }

    function god(argv) {
        if (!player)
            return;

        player.godMode = !player.godMode;
        if (!player.godMode)
            ui.conPrint("godmode OFF\n");
        else
            ui.conPrint("godmode ON\n");
    }

    function notarget(argv) {
        if (!player)
            return;

        player.noTarget = !player.noTarget;
        if (!player.noTarget)
            ui.conPrint("notarget OFF\n");
        else
            ui.conPrint("notarget ON\n");
    }

    function setNewParms() {
        parms[0] = Defs.itShotgun | Defs.itAxe;
        parms[1] = 100;
        parms[2] = 0;
        parms[3] = 25;
        parms[4] = 0
        parms[5] = 0;
        parms[6] = 0;
        parms[7] = 1;
        parms[8] = 0;
    }

    function stuffcmd(cmd) {
        cmds.command = cmd;
    }
}
