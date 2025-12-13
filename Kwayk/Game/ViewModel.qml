import QtQuick
import QtQuick3D

import Kwayk.Game

Node {
    id: root

    property int weapon
    property int weaponframe

    readonly property alias axe: axe
    readonly property alias shot: shot
    readonly property alias shot2: shot2
    readonly property alias nail: nail
    readonly property alias nail2: nail2
    readonly property alias rock: rock
    readonly property alias rock2: rock2
    readonly property alias lightning: lightning

    readonly property var activeModel: {
        if (weapon === Defs.itAxe) return axe.model;
        if (weapon === Defs.itShotgun) return shot.model;
        if (weapon === Defs.itSuperShotgun) return shot2.model;
        if (weapon === Defs.itNailgun) return nail.model;
        if (weapon === Defs.itSuperNailgun) return nail2.model;
        if (weapon === Defs.itGrenadeLauncher) return rock.model;
        if (weapon === Defs.itRocketLauncher) return rock2.model;
        if (weapon === Defs.itLightning) return lightning.model;
        return null;
    }

    onActiveModelChanged: main.viewModelRenderer.model = activeModel

    Axe {
        id: axe
        active: visible
        visible: weapon === Defs.itAxe
        frame: visible ? weaponframe : 0
    }

    Shotgun {
        id: shot
        active: visible
        visible: weapon === Defs.itShotgun
        frame: visible ? weaponframe : 0
    }

    SuperShotgun {
        id: shot2
        active: visible
        visible: weapon === Defs.itSuperShotgun
        frame: visible ? weaponframe : 0
    }

    Nailgun {
        id: nail
        active: visible
        visible: weapon === Defs.itNailgun
        frame: visible ? weaponframe : 0
    }

    SuperNailgun {
        id: nail2
        active: visible
        visible: weapon === Defs.itSuperNailgun
        frame: visible ? weaponframe : 0
    }

    GrenadeLauncher {
        id: rock
        active: visible
        visible: weapon === Defs.itGrenadeLauncher
        frame: visible ? weaponframe : 0
    }

    RocketLauncher {
        id: rock2
        active: visible
        visible: weapon === Defs.itRocketLauncher
        frame: visible ? weaponframe : 0
    }

    Lightning {
        id: lightning
        active: visible
        visible: weapon === Defs.itLightning
        frame: visible ? weaponframe : 0
    }
}
