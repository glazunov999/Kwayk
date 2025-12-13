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

    readonly property real attenuation: {
        if (!ent || ent.classname === "player" || attenuationType === 0)
            return 1.0;

        let dist = ent.position.minus(view.camera.position).length() * 100;
        dist *= attenuationType / 1000;
        return Math.max(0, (1.0 - dist));
    }

    onAttenuationChanged: {
        if (!status.isPlaying)
            return;

        if (attenuation <= 0 && status.sound) {
            status.sound.destroy();
            status.sound = null;
        } else if (attenuation > 0 && !status.sound) {
            createSound();
        }
    }

    Component {
        id: spatialSoundComponent
        SpatialSound {
            distanceModel: WebSpatialSound.ManualAttenuation
            distanceCutoff: 10000
            manualAttenuation: root.attenuation
            source: root.source
            loops: root.loops
            autoPlay: true

            Timer {
                interval: 1500
                running: root.loops !== WebSpatialSound.Infinite
                onTriggered: root.stop();
            }
        }
    }

    Component {
        id: webSpatialSoundComponent
        WebSpatialSound {
            distanceModel: WebSpatialSound.ManualAttenuation
            distanceCutoff: 10000
            manualAttenuation: root.attenuation
            source: root.source
            loops: root.loops
            autoPlay: true

            Timer {
                interval: 1500
                running: root.loops !== WebSpatialSound.Infinite
                onTriggered: root.stop();
            }
        }
    }

    Component {
        id: ambientSoundComponent
        AmbientSound {
            source: root.source
            loops: root.loops
            autoPlay: true
            volume: root.volume
        }
    }

    Component {
        id: webAmbientSoundComponent
        WebAmbientSound {
            source: root.source
            loops: root.loops
            autoPlay: true
            volume: root.volume
        }
    }

    QtObject {
        id: status
        property var sound: null
        property bool isPlaying: false
    }

    function createSound() {
        status.sound?.destroy();
        status.sound = null;

        if (attenuation <= 0)
            return;

        if (ent && ent.classname !== "player") {
            if (Qt.platform.os !== "wasm")
                status.sound = spatialSoundComponent.createObject(view.scene);
            else
                status.sound = webSpatialSoundComponent.createObject(view.scene);
            // convert to cm
            status.sound.position = Qt.binding(function() {
                return ent.position.times(100);
            });
        } else {
            if (Qt.platform.os !== "wasm")
                status.sound = ambientSoundComponent.createObject(view.scene);
            else
                status.sound = webAmbientSoundComponent.createObject(view.scene);
        }
    }

    function play() {
        status.isPlaying = true;
        createSound();
    }

    function stop() {
        status.isPlaying = false;
        status.sound?.destroy()
        status.sound = null;
    }

    Component.onCompleted: {
        if (autoPlay)
            play();
    }

    Component.onDestruction: {
        stop();
    }
}
