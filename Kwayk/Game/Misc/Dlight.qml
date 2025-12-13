import QtQuick
import QtQuick3D

import Kwayk.Game

PointLight {
    id: root

    constantFade: 0.1
    linearFade: 10
    quadraticFade: 2500
    castsShadow: false

    visible: false

    Think {
        id: die
        think: () => root.visible = false;
    }

    function update() {
        visible = true;
        brightness = 1 + Math.random() * 1;
        die.nextthink = time + 0.1;
    }
}
