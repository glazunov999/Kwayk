import QtQuick
import QtQuick.Effects
import QtQuick3D
import QtQuick3D.JoltPhysics
import QtQuick3D.SpatialAudio

import Backend
import Kwayk.Ui as Ui
import Kwayk.Game as Game

import "../js/keys.js" as Key

Item {
    id: root

    readonly property int noneState: 0
    readonly property int loadingState: 1
    readonly property int gameState: 2
    readonly property int menuState: 3

    readonly property alias loop: loop
    readonly property alias view: view
    readonly property alias ui: ui
    readonly property alias physicsSystem: physicsSystem
    readonly property alias contactListener: contactListener
    readonly property alias playerController: playerController
    readonly property alias audioEngine: audioEngineLoader.item
    readonly property alias worldLoader: view.worldLoader
    readonly property alias viewModelRenderer: viewModelRenderer

    readonly property var cmds : cmds
    readonly property var vars : vars
    readonly property var game : game

    property int explicitTextureWidth: 1024
    property int explicitTextureHeight: 768

    readonly property real aspectRatio: explicitTextureWidth / explicitTextureHeight

    property var world: null
    property var player: null

    property real time: 0
    property real frameTime: 0
    property real timeFactor: 1.0

    property real brightness: 0.0
    property real contrast: 0.0
    property real saturation: 0.0

    property int serverflags: 0
    property int currentState: noneState

    property var keysDown: ({})
    property var keyBindings: ({})

    signal physics();

    focus: true

    layer.enabled: true
    layer.effect: MultiEffect {
        brightness: root.brightness
        contrast: root.contrast
        saturation: root.saturation
    }

    onCurrentStateChanged: {
        if (currentState === gameState)
            mouseController.grabMouse(app);
        else
            mouseController.releaseMouse(app);
    }

    TapHandler {
        enabled: currentState === gameState && !mouseController.grabbed
        onTapped: mouseController.grabMouse(app)
    }

    Behavior on timeFactor {
        NumberAnimation { duration: 400; easing.type: Easing.OutQuad }
    }

    Game.Game {
        id: game
    }

    Image {
        anchors.fill: parent
        source: "qrc:/Assets/images/BACKTILE.png"
        fillMode: Image.Tile
    }

    View {
        id: view

        anchors.centerIn: parent

        width: Math.min(root.width, root.height * root.aspectRatio)
        height: Math.min(root.height, root.width / root.aspectRatio)

        explicitTextureWidth: root.explicitTextureWidth
        explicitTextureHeight: root.explicitTextureHeight

        layer.enabled: currentState === menuState
        layer.effect: MultiEffect {
            brightness: -0.2
            blurMax: 64
            blurEnabled: true
            blur: 1
        }

        extensions: [ ViewModelRenderExtension {
                id: viewModelRenderer
            }
        ]
    }

    Ui.Ui {
        id: ui
        anchors.fill: view
    }

    Cmds {
        id: cmds
    }

    Vars {
        id: vars
    }

    ObjectLayerPairFilter {
        id: objectLayerPairFilter
    }

    BroadPhaseLayer {
        id: broadPhaseLayer
    }

    ObjectVsBroadPhaseLayerFilter {
        id: objectVsBroadPhaseLayerFilter
    }

    ContactListener {
        id: contactListener
    }

    PhysicsSystem {
        id: physicsSystem
        scene: view.scene
        running: false
        time: loop.time * 1000
        gravity: Qt.vector3d(0, -vars.sv_gravity.value / 100, 0)
        contactListener: contactListener
        objectLayerPairFilter: objectLayerPairFilter
        broadPhaseLayer: broadPhaseLayer
        objectVsBroadPhaseLayerFilter: objectVsBroadPhaseLayerFilter
        onBeforeFrameDone: (deltaTime) => hostFrame(deltaTime)
        collisionSteps: 4
    }

    Component {
        id: audioEngineComponent
        AudioEngine {
            outputMode: AudioEngine.Stereo
        }
    }

    Component {
        id: webAudioEngineComponent
        WebAudioEngine {}
    }

    Loader {
        id: audioEngineLoader
        sourceComponent: Qt.platform.os !== "wasm" ? audioEngineComponent : webAudioEngineComponent
    }

    Component {
        id: audioListenerComponent
        AudioListener {}
    }

    Component {
        id: webAudioListenerComponent
        WebAudioListener {}
    }

    Loader3D {
        position: view.camera.position.times(100); // convert to cm
        eulerRotation: view.camera.eulerRotation
        sourceComponent: Qt.platform.os !== "wasm" ? audioListenerComponent : webAudioListenerComponent
    }

    FrameAnimation {
        id: loop
        property real time: 0
        running: true
        onFrameTimeChanged: {
            mouseController.update();
            switch (currentState) {
            case gameState:
                loop.time += loop.frameTime * root.timeFactor;
                break;
            case menuState:
                ui.processInput();
            }
        }
    }

    PlayerController {
        id: playerController
    }

    Connections {
        target: worldLoader

        function onStatusChanged() {
            time = 0;
            frameTime = 0;
            world = null;
            player = null;
            playerController.reset();
            view.blendEffect.color = Qt.rgba(0, 0, 0, 0);
            view.particles.reset();
            ui.menu.clear();
            ui.centerString.clear();
            ui.centerStringIntermission.clear();
            switch (worldLoader.status) {
            case Loader3D.Ready:
                world = worldLoader.item;
                player = world?.player;
                if (!player) {
                    console.log("no player on level");
                    currentState = menuState;
                    worldLoader.source = "";
                    return;
                }
                world.name = game.mapname;
                view.transitionEffect.start();
                currentState = gameState;
                ui.conPrint("--------------------------------------------------------------\n", "system")
                ui.conPrint(" \n");
                ui.conPrint(`${world.displayName}\n`, "system")
                console.log("Host started.");
                loop.running = true;
                break;
            case Loader3D.Loading:
                console.log("world is loading");
                currentState = loadingState;
                break;
            case Loader3D.Null:
                currentState = menuState;
                loop.running = true;
                break;
            case Loader3D.Error:
                ui.conPrint(`Couldn't load map ${game.mapname}\n`, "warning")
                currentState = menuState;
                loop.running = true;
                break;
            }
        }
    }

    function hostFrame(timestamp) {
        frameTime = timestamp * timeFactor;
        time += frameTime;

        playerController.processInput();
        ui.processInput();

        physics();
    }

    Connections {
        target: keyController
        function onKeyPressed(key, keyCode, repeat) {
            if (!repeat)
                handleKeyEvent(keyCode, true);
        }
        function onKeyReleased(key, keyCode) {
            handleKeyEvent(keyCode, false);
        }
    }

    Connections {
        target: mouseController
        function onMouseButtonPressed(button) {
            handleKeyEvent(button, true);
        }
        function onMouseButtonReleased(button) {
            handleKeyEvent(button, false);
        }
    }

    function handleKeyEvent(key, down) {
        if (down) {
            if (key !== Qt.Key_Backspace && keysDown[key])
                return;
        }

        keysDown[key] = down;

        if (key === Qt.Key_Escape) {
            if (!down)
                return;
            if (currentState === menuState)
                ui.handleKeyEvent({ key: key }, down);
            else
                ui.toggleMenu();
            return;
        }

        let kb;
        if (!down) {
            kb = keyBindings[key];
            if (kb && kb[0] === "+") {
                const cmd = `-${kb.substring(1)} ${key}\n`;
                cmds.command = cmd;
            }
            return;
        }

        if ((currentState === gameState && (!ui.consoleVisible || !Key.consoleKeys.has(key)))
                || (currentState === menuState && !Key.consoleKeys.has(key))) {
            kb = keyBindings[key];
            if (kb) {
                if (kb[0] === "+") {
                    const cmd = `${kb} ${key}\n`;
                    cmds.command = cmd;
                } else {
                    const cmd = `${kb}\n`;
                    cmds.command = cmd;
                }
                return;
            }
        }

        if (!down)
            return;

        if (currentState === menuState && !ui.consoleVisible)
            ui.handleKeyEvent({ key: key });
    }
}
