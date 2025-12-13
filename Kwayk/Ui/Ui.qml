import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick3D
import QtQuick3D.SpatialAudio

import "Console"
import "Menu"
import "Sbar"
import "WeaponWheel"

import Kwayk.Game as G
import Kwayk.Core

Item {
    id: root

    property int currentKey: -1
    property bool scoreboardVisible: false
    property bool weaponWheelVisible: false
    property bool consoleVisible: false

    property real scaleFactor: 0.75

    readonly property alias menu: menu
    readonly property alias centerString: centerString
    readonly property alias centerStringIntermission: centerStringIntermission

    Component.onCompleted: {
        cmds.functions["+showscores"] = showScoreboard;
        cmds.functions["-showscores"] = hideScoreboard;
        cmds.functions["toggleconsole"] = toggleConsole;
        cmds.functions["togglemenu"] = toggleMenu;
        cmds.functions["+weaponwheel"] = showWeaponWheel;
        cmds.functions["-weaponwheel"] = hideWeaponWheel;
        cmds.functions["clear"] = clear;
        cmds.functions["version"] = version;
    }

    Image {
        anchors.centerIn: parent
        scale: Math.min(parent.width / 320, parent.height / 200)
        transformOrigin: Item.Center
        source: "qrc:/Assets/images/loading.png"
        visible: currentState === loadingState
    }

    Crosshair {
        id: crosshair
        visible: currentState === gameState && (world?.intermission_running ?? 0) === 0
        state: !weaponWheelVisible ? "shown" : "hidden"
    }

    CenterString {
        id: centerString
        visible: currentState === gameState && world?.intermission_running === 0
    }

    WeaponWheel {
        id: weaponWheel
        visible: currentState === gameState && world?.intermission_running === 0
    }

    Conback {
        visible: currentState === menuState && !player
    }

    Menu {
        id: menu
        visible: currentState === menuState
    }

    Sbar {
        id: sbar
        visible: currentState === gameState && world?.intermission_running === 0
        state: scoreboardVisible || player?.health <= 0 ? "hidden" : "shown"
    }

    IntermissionOverlay {
        visible: currentState === gameState && world?.intermission_running === 1
    }

    FinaleOverlay {
        visible: currentState === gameState && world?.intermission_running === 2
    }

    CenterString {
        id: centerStringIntermission
        intermission: true
        visible: currentState === gameState && world?.intermission_running === 2
    }

    Scoreboard {
        id: scoreboard
        visible: currentState === gameState
        state: scoreboardVisible || player?.health <= 0 ? "shown" : "hidden"
    }

    ListModel {
        id: consoleLog
        property bool append: false
    }

    Console {
        visible: consoleVisible
    }

    Sound {
        id: menu1Sound
        source: "qrc:/Assets/sounds/misc/menu1.wav"
    }

    Sound {
        id: menu2Sound
        source: "qrc:/Assets/sounds/misc/menu2.wav"
    }

    Sound {
        id: menu3Sound
        source: "qrc:/Assets/sounds/misc/menu3.wav"
    }

    Connections {
        target: vars
        function onValueChanged(name, value) {
            handleVarsChange(name, value);
        }
    }

    function toggleMenu() {
        menu2Sound.stop();
        menu2Sound.play();
        currentState = menuState;
    }
    
    function processInput() {
        const dm = mouseController.delta;
        switch (currentState) {
        case menuState:
            const useMouse = mouseController.consumeMouseMoved();
            if (currentKey >= 0 || useMouse) {
                if (useMouse)
                    mouseController.setCursorVisible(true);
                menu.processInput();
                currentKey = -1;
            }
            break;
        case gameState:
            if (player) {
                sbar.update();
                weaponWheel.update();
                weaponWheel.processInput(dm);
            }
            break;
        }
    }

    function handleKeyEvent(event) {
        if (event.key === Qt.Key_Escape && menu.depth === 1 && player) {
            currentState = gameState;
            return;
        }
        currentKey = event.key;
        mouseController.setCursorVisible(false);
    }

    function centerprint(text) {
        centerString.text = text;
        centerString.show();
    }

    function centerprintIntermission(text) {
        centerStringIntermission.text = text;
        centerStringIntermission.show();
    }

    function showScoreboard() {
        scoreboardVisible = true;
    }

    function hideScoreboard() {
        scoreboardVisible = false;
    }

    function toggleConsole() {
        consoleVisible = !consoleVisible;
    }

    function showWeaponWheel() {
        weaponWheelVisible = true;
        weaponWheel.show();
    }

    function hideWeaponWheel() {
        weaponWheelVisible = false
        weaponWheel.hide();
    }

    readonly property var messageTypeColors: ({
        "text": "#ffffff",
        "command": "#b0b0b0",
        "info": "#00f000",
        "warning": "#ffff00",
        "system": "#ff00ff",
    })

    function conPrint(message, type = "text") {
        if (!message)
            return;

        const color = messageTypeColors[type] || messageTypeColors["text"];

        let append = consoleLog.append;

        let i = 0;

        while (i < message.length) {
            const c = message[i++];

            if (c === '\n') {
                append = false;
                continue;
            }

            if (append && consoleLog.count > 0) {
                const text = consoleLog.get(0).text + c;
                consoleLog.setProperty(0, "text", text);
            } else {
                consoleLog.insert(0, { text: c, textColor: color });
                append = true;
            }
        }

        consoleLog.append = append;
    }

    function clear() {
        consoleLog.clear();
    }

    function version() {
        conPrint(`Kwayk Version ${G.Defs.version}\n`);
        conPrint(`Exe: ${BUILD_TIME} ${BUILD_DATE}\n`);
    }

    function handleVarsChange(name, value) {
        switch (name) {
        case "r_brightness":
            brightness = (vars.r_brightness.value - 10) / 100;
            break;
        case "r_contrast":
            contrast = (vars.r_contrast.value - 10) / 100;
            break;
        case "r_saturation":
            saturation = (vars.r_saturation.value - 10) / 100;
            break;
        case "r_fov":
            view.camera.fieldOfView = vars.r_fov.value;
            break;
        case "crosshair_style":
            crosshair.updateCrosshairStyle();
            break;
        case "crosshair_red":
        case "crosshair_green":
        case "crosshair_blue":
            crosshair.updateCrosshairColor();
            break;
        case "r_hdrbloomtonemap":
            view.env.effects[0] = vars.r_hdrbloomtonemap.value !== 0 ? view.hdrBloomTonemap : null;
            break;
        case "r_depthoffield":
            view.env.effects[1] = vars.r_depthoffield.value !== 0 ? view.depthOfField : null;
            break;
        case "r_teleporteffect":
            view.env.effects[4] = vars.r_teleporteffect.value !== 0 ? view.teleportEffect : null;
            break;
        case "r_transitioneffect":
            view.env.effects[5] = vars.r_transitioneffect.value !== 0 ? view.transitionEffect : null;
            break;
        case "r_antialiasing":
            if (vars.r_antialiasing.value === 0)
                view.env.antialiasingMode = SceneEnvironment.NoAA;
            else if (vars.r_antialiasing.value === 1)
                view.env.antialiasingMode = SceneEnvironment.SSAA;
            else if (vars.r_antialiasing.value === 2)
                view.env.antialiasingMode = SceneEnvironment.MSAA;
            else
                view.env.antialiasingMode = SceneEnvironment.ProgressiveAA;
            break;
        case "r_antialiasingquality":
            if (vars.r_antialiasingquality.value === 0)
                view.env.antialiasingQuality = SceneEnvironment.Medium;
            else if (vars.r_antialiasingquality.value === 1)
                view.env.antialiasingQuality = SceneEnvironment.High;
            else
                view.env.antialiasingQuality = SceneEnvironment.VeryHigh;
            break;
        case "r_fxaa":
            view.env.fxaaEnabled = vars.r_fxaa.value !== 0;
            break;
        case "r_ambientocclusion":
            view.env.aoEnabled = vars.r_ambientocclusion.value !== 0;
            break;
        case "r_dithering":
            view.env.ditheringEnabled = vars.r_dithering.value !== 0;
            break;
        case "r_colorlightmaps":
            if (world)
                world.lightmapEnabled = vars.r_colorlightmaps.value !== 0;
            break;
        case "r_fog":
            view.env.fog.enabled = vars.r_fog.value !== 0;
            break;
        case "r_decals":
            view.decals.clear();
            break;
        case "r_dynamicshadows":
            view.light.castsShadow = vars.r_dynamicshadows.value !== 0;
            break;
        case "r_shadowmapquality":
            if (vars.r_shadowmapquality.value === 0)
                view.light.shadowMapQuality = Light.ShadowMapQualityLow;
            else if (vars.r_shadowmapquality.value === 1)
                view.light.shadowMapQuality = Light.ShadowMapQualityMedium;
            else if (vars.r_shadowmapquality.value === 2)
                view.light.shadowMapQuality = Light.ShadowMapQualityHigh;
            else if (vars.r_shadowmapquality.value === 3)
                view.light.shadowMapQuality = Light.ShadowMapQualityVeryHigh;
            else
                view.light.shadowMapQuality = Light.ShadowMapQualityUltra;
            break;
        case "v_width":
            main.explicitTextureWidth = vars.v_width.value;
            break;
        case "v_height":
            main.explicitTextureHeight = vars.v_height.value;
            break;
        case "v_fullscreen":
            if (vars.v_fullscreen.value !== 0)
                app.showFullScreen();
            else
                app.showNormal();
            break;
        case "snd_volume":
            audioEngine.masterVolume = vars.snd_volume.value / 20;
            break;
        case "sv_gravity":
            physicsSystem.gravity = Qt.vector3d(0, -vars.sv_gravity.value / 100, 0)
            break;
        }
    }
}
