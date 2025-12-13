import QtQuick
import QtQuick3D

Item {
    id: root

    property string movetype: ""

    property int frame: 0
    property var think: null
    property real nextthink: 0

    property alias running: conn.enabled

    signal physics()

    Connections {
        id: conn
        target: main
        function onPhysics() {
            physics();
            if (movetype !== "push")
                runThink();
        }
    }

    function runThink() {
        if (nextthink <= 0.0 || nextthink > time + frameTime)
            return;

        nextthink = 0.0;
        if (think !== null)
            think();
    }

    function nextFrame(frame, think, interval = 0.1) {
        root.frame = frame;
        root.think = think;
        nextthink = time + interval;
    }
}
