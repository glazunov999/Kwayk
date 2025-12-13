import QtQuick
import QtQuick3D

import Kwayk.Game

MultipleTrigger {
    id: root

    classname: "trigger_secret"

    wait: -1

    sounds: 1
    message: "You found a secret area!"

    Component.onCompleted: {
        total_secrets++;
    }
}
