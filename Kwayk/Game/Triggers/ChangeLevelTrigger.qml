import QtQuick
import QtQuick3D

import Kwayk.Game

Trigger {
    id: root

    property string map: ""

    touch: changelevel_touch

    function changelevel_touch() {
        if (other.classname !== "player")
            return;

        game.nextmap = root.map;

        useTargets();

        touch = null;

        if (spawnflags & 1) {
            // NO INTERMISSION
            player.gotoNextMap();
            return;
        }

        th.think = execute_changelevel;
        th.nextthink = time + 0.1;
    }

    function execute_changelevel() {
        intermission_running = 1;
        intermission_exittime = time + 2;

        const ent = findIntermission();

        player.view_ofs = Qt.vector3d(0, 0, 0);
        player.angles = ent.eulerRotation;
        player.th.nextthink = time + 0.5;
        player.takedamage = Defs.damageNo;
        player.solid = false;
        player.th.movetype = "";
        player.position = ent.position;
        player.viewModel.visible = false;
    }

    function findIntermission() {
        const spots = world.find("classname", "info_intermission");
        if (spots.length) {
            const cyc = Math.floor(Math.random() * spots.length);
            return spots[cyc];
        }

        return null;
    }
}
