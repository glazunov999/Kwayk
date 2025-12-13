qt6_add_library(kwayk_core STATIC)

qt6_add_qml_module(kwayk_core
    URI "Kwayk.Core"
    VERSION 1.0
    QML_FILES
        Cmds.qml
        Decals.qml
        Main.qml
        View.qml
        Particles.qml
        PlayerController.qml
        Sound.qml
        Vars.qml
        Effects/BlendEffect.qml
        Effects/TeleportEffect.qml
        Effects/TransitionEffect.qml
        Effects/WarpEffect.qml
        Materials/AliasMaterial.qml
        Materials/DecalMaterial.qml
        Materials/BrushMaterial.qml
        Materials/SkyLayerMaterial.qml
        Materials/TurbulentMaterial.qml
    RESOURCES
        shaders/alias.frag
        shaders/blend.frag
        shaders/brush.frag
        shaders/brush.vert
        shaders/decal.frag
        shaders/decal.vert
        shaders/skylayer.frag
        shaders/skylayer.vert
        shaders/teleport.frag
        shaders/transition.frag
        shaders/turbulent.frag
        shaders/warp.frag
    RESOURCE_PREFIX "/"
)
