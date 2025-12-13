import QtQuick

Item {
    id: root

    property var val: null
    property var command: null

    property var cl_backspeed
    property var cl_bob
    property var cl_bobcycle
    property var cl_bobup
    property var cl_forwardspeed
    property var cl_maxpitch
    property var cl_minpitch
    property var cl_movespeedkey
    property var cl_rollangle
    property var cl_rollspeed
    property var cl_sidespeed
    property var cl_upspeed
    property var cl_yawspeed
    property var cl_anglespeedkey
    property var cl_pitchspeed
    property var crosshair_blue
    property var crosshair_green
    property var crosshair_red
    property var crosshair_style
    property var edgefriction
    property var m_forward
    property var m_pitch
    property var m_yaw
    property var scr_centertime
    property var scr_printspeed
    property var sensitivity
    property var skill
    property var sv_accelerate
    property var sv_friction
    property var sv_gravity
    property var sv_maxspeed
    property var sv_stopspeed
    property var temp1
    property var v_ipitch_cycle
    property var v_ipitch_level
    property var v_iroll_cycle
    property var v_iroll_level
    property var v_iyaw_cycle
    property var v_iyaw_level
    property var v_kickpitch
    property var v_kickroll
    property var v_kicktime
    property var r_brightness
    property var r_contrast
    property var r_saturation
    property var r_colorlightmaps
    property var r_fov
    property var r_hdrbloomtonemap
    property var r_antialiasing
    property var r_antialiasingquality
    property var r_fxaa
    property var r_ambientocclusion
    property var r_depthoffield
    property var r_teleporteffect
    property var r_transitioneffect
    property var r_dithering
    property var r_fog
    property var r_decals
    property var r_dynamicshadows
    property var r_shadowmapquality
    property var v_width
    property var v_height
    property var v_fullscreen
    property var snd_volume

    readonly property var vars: ({})

    Component.onCompleted: {
        cl_backspeed = registerVariable("cl_backspeed", 400);
        cl_bob = registerVariable("cl_bob", 0.02);
        cl_bobcycle = registerVariable("cl_bobcycle", 0.6);
        cl_bobup = registerVariable("cl_bobup", 0.5);
        cl_forwardspeed = registerVariable("cl_forwardspeed", 400);
        cl_maxpitch = registerVariable("cl_maxpitch", 90);
        cl_minpitch = registerVariable("cl_minpitch", -90);
        cl_movespeedkey = registerVariable("cl_movespeedkey", 2.0);
        cl_rollangle = registerVariable("cl_rollangle", 2.0);
        cl_rollspeed = registerVariable("cl_rollspeed", 200);
        cl_sidespeed = registerVariable("cl_sidespeed", 350);
        cl_upspeed = registerVariable("cl_upspeed", 200);
        cl_yawspeed = registerVariable("cl_yawspeed", 140);
        cl_anglespeedkey = registerVariable("cl_anglespeedkey", 1.5);
        cl_pitchspeed = registerVariable("cl_pitchspeed", 150);
        crosshair_blue = registerVariable("crosshair_blue", 255);
        crosshair_green = registerVariable("crosshair_green", 255);
        crosshair_red = registerVariable("crosshair_red", 255);
        crosshair_style = registerVariable("crosshair_style", "+");
        edgefriction = registerVariable("edgefriction", 2);
        m_forward = registerVariable("m_forward", 1);
        m_pitch = registerVariable("m_pitch", 0.022);
        m_yaw = registerVariable("m_yaw", 0.022);
        scr_centertime = registerVariable("scr_centertime", 5);
        scr_printspeed = registerVariable("scr_printspeed", 8);
        sensitivity = registerVariable("sensitivity", 5);
        skill = registerVariable("skill", 1);
        sv_accelerate = registerVariable("sv_accelerate", 10);
        sv_friction = registerVariable("sv_friction", 4);
        sv_gravity = registerVariable("sv_gravity", 800);
        sv_maxspeed = registerVariable("sv_maxspeed", 320);
        sv_stopspeed = registerVariable("sv_stopspeed", 100);
        temp1 = registerVariable("temp1", 0);
        v_ipitch_cycle = registerVariable("v_ipitch_cycle", 1);
        v_ipitch_level = registerVariable("v_ipitch_level", 0.3);
        v_iroll_cycle = registerVariable("v_iroll_cycle", 0.5);
        v_iroll_level = registerVariable("v_iroll_level", 0.1);
        v_iyaw_cycle = registerVariable("v_iyaw_cycle", 2);
        v_iyaw_level = registerVariable("v_iyaw_level", 0.3);
        v_kickpitch = registerVariable("v_kickpitch", 0.6);
        v_kickroll = registerVariable("v_kickroll", 0.6);
        v_kicktime = registerVariable("v_kicktime", 0.5);
        r_brightness = registerVariable("r_brightness", 10)
        r_contrast = registerVariable("r_contrast", 10)
        r_saturation = registerVariable("r_saturation", 10)
        r_fov = registerVariable("r_fov", 75)
        r_hdrbloomtonemap = registerVariable("r_hdrbloomtonemap", 1)
        r_antialiasing = registerVariable("r_antialiasing", 1)
        r_antialiasingquality = registerVariable("r_antialiasingquality", 0)
        r_fxaa = registerVariable("r_fxaa", 1)
        r_ambientocclusion = registerVariable("r_ambientocclusion", 1)
        r_depthoffield = registerVariable("r_depthoffield", 1)
        r_teleporteffect = registerVariable("r_teleporteffect", 1)
        r_transitioneffect = registerVariable("r_transitioneffect", 1)
        r_dithering = registerVariable("r_dithering", 1)
        r_colorlightmaps = registerVariable("r_colorlightmaps", Qt.platform.os !== "wasm" ? 1 : 0)
        r_fog = registerVariable("r_fog", 1)
        r_decals = registerVariable("r_decals", 1)
        r_dynamicshadows = registerVariable("r_dynamicshadows", 1)
        r_shadowmapquality = registerVariable("r_shadowmapquality", 2)
        v_width = registerVariable("v_width", 1024)
        v_height = registerVariable("v_height", 768)
        v_fullscreen = registerVariable("v_fullscreen", 0)
        snd_volume = registerVariable("snd_volume", 10)
    }

    signal valueChanged(string name, var value)

    onValChanged: {
        if (!vars[val.name])
            return;

        const v = vars[val.name];

        if (v.value !== val.value) {
            v.value = val.value;
            valueChanged(val.name, val.value);
        }
    }

    onCommandChanged: {
        const argv = command.argv;
        if (!vars[argv[0]]) {
            ui.conPrint(`Unknown command ${argv[0]}\n`, "warning");
            return;
        }

        const v = vars[argv[0]];

        if (argv.length === 1) {
            ui.conPrint(`"${argv[0]}" is "${v.value}"\n`, "info");
            return;
        }

        if (v.value !== argv[1]) {
            v.value = argv[1];
            valueChanged(argv[0], argv[1]);
        }
    }

    function completeVariable(partial) {
        if (!partial.length)
            return;
        for (let key in vars) {
            if (key.startsWith(partial))
                return key;
        }
        return null;
    }

    function registerVariable(name, value) {
        if (vars[name]) {
            ui.conPrint(`Can't register variable ${name}, allready defined\n`, "warning")
            return;
        }

        vars[name] = { value: value }

        Qt.callLater(() => valueChanged(name, value));

        return vars[name];
    }
}
