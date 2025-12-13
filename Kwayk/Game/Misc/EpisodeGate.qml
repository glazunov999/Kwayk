import QtQuick

import Kwayk.Game

Pusher {
    id: root

    classname: "func_episodegate"

    solid: serverflags & spawnflags
    visible: solid
}
