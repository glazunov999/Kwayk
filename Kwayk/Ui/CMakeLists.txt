qt6_add_library(kwayk_ui STATIC)

qt6_add_qml_module(kwayk_ui
    URI "Kwayk.Ui"
    VERSION 1.0
    QML_FILES
        CenterString.qml
        Conback.qml
        Console/Console.qml
        Console/EditLine.qml
        Controls/Label.qml
        Controls/ScrollBar.qml
        Controls/Slider.qml
        Crosshair.qml
        FinaleOverlay.qml
        IntermissionOverlay.qml
        Menu/Delegates/KeyBindingDelegate.qml
        Menu/Delegates/LabelDelegate.qml
        Menu/Delegates/SectionDelegate.qml
        Menu/Delegates/SelectDelegate.qml
        Menu/Delegates/SliderDelegate.qml
        Menu/Menu.qml
        Menu/MenuDot.qml
        Menu/Views/CustomizeBindingsView.qml
        Menu/Views/DisplayView.qml
        Menu/Views/GameplayView.qml
        Menu/Views/HelpView.qml
        Menu/Views/InputView.qml
        Menu/Views/MainMenuView.qml
        Menu/Views/MpMenuView.qml
        Menu/Views/NewGameConfirmView.qml
        Menu/Views/OptionsView.qml
        Menu/Views/QuitView.qml
        Menu/Views/SoundView.qml
        Menu/Views/SpMenuView.qml
        Menu/Views/VideoSettingsView.qml
        Sbar/Ammo.qml
        Sbar/SbArmor.qml
        Sbar/Char.qml
        Sbar/Face.qml
        Sbar/Inventory.qml
        Sbar/Num.qml
        Sbar/Sbar.qml
        Scoreboard.qml
        Ui.qml
        WeaponWheel/InvAxe.qml
        WeaponWheel/WeaponWheel.qml
        WeaponWheel/InvGrenadeLauncher.qml
        WeaponWheel/InvLightning.qml
        WeaponWheel/InvNailgun.qml
        WeaponWheel/InvRocketLauncher.qml
        WeaponWheel/InvShotgun.qml
        WeaponWheel/InvSuperNailgun.qml
        WeaponWheel/InvSuperShotgun.qml
        WeaponWheel/WheelBackground.qml
    RESOURCE_PREFIX "/"
)

qt6_add_shaders(kwayk_ui "weaponwheel_shaders"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    PREFIX "/Kwayk/Ui"
    FILES
        WeaponWheel/shaders/backgroundMask.vert
        WeaponWheel/shaders/backgroundMask.frag
)
