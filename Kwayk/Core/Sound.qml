import QtQuick
import QtQuick3D
import QtQuick3D.SpatialAudio

import Backend

Node {
    id: root

    property var ent: null
    property bool autoPlay: false
    property int loops: 1
    property string source: ""
    property real volume: 1.0
    property int attenuationType: 0

    readonly property bool spatial: !!ent && ent.classname !== "player"
    readonly property bool looping: loops < 0

    readonly property real attenuation: {
        if (!ent || ent.classname === "player" || attenuationType === 0)
            return 1.0;

        let dist = ent.position.minus(view.camera.position).length() * 100;
        dist *= attenuationType / 1000;
        return Math.max(0, (1.0 - dist));
    }

    onAttenuationChanged: {
        if (status.playing && !status.slot && attenuation > 0)
            acquire();
    }

    onSourceChanged: {
        if (status.playing)
            play();
    }

    QtObject {
        id: status

        property var slot: null
        property bool playing: false
    }

    Timer {
        id: releaseTimer
        interval: 500
        running: status.playing && !!status.slot && root.attenuation <= 0
        onTriggered: root.release()
    }

    Timer {
        id: oneShotTimer
        interval: 1500
        running: !!status.slot && !root.looping
        onTriggered: root.stop()
    }

    Timer {
        id: retryTimer
        interval: 1000
        repeat: true
        running: status.playing && !status.slot && root.looping && root.attenuation > 0
        onTriggered: root.acquire()
    }

    function acquire() {
        if (view?.scene)
            status.slot = SoundPool.acquire(root, view.scene);
    }

    function release() {
        SoundPool.release(status.slot, root);
        status.slot = null;
    }

    function slotRevoked() {
        status.slot = null;
    }

    function play() {
        status.playing = true;
        release();
        acquire();
    }

    function stop() {
        status.playing = false;
        release();
    }

    Component.onCompleted: {
        if (autoPlay)
            play();
    }

    Component.onDestruction: {
        stop();
    }
}
