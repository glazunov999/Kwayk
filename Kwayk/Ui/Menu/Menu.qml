import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects

import "Views"

Item {
    id: root

    width: 320
    height: 200

    anchors.centerIn: parent

    scale: Math.min(parent.width / 320, parent.height / 200) * scaleFactor
    transformOrigin: Item.Center

    readonly property alias depth: stackView.depth

    Component {
        id: mainMenuViewComponent
        MainMenuView {}
    }

    Component {
        id: spMenuViewComponent
        SpMenuView {}
    }

    Component {
        id: newGameConfirmViewComponent
        NewGameConfirmView {}
    }

    Component {
        id: mpMenuViewComponent
        MpMenuView {}
    }

    Component {
        id: optionsViewComponent
        OptionsView {}
    }

    Component {
        id: helpViewComponent
        HelpView {}
    }

    Component {
        id: quitViewComponent
        QuitView {}
    }

    Component {
        id: inputViewComponent
        InputView {}
    }

    Component {
        id: gameplayViewComponent
        GameplayView {}
    }

    Component {
        id: soundViewComponent
        SoundView {}
    }

    Component {
        id: customizeBindingsViewComponent
        CustomizeBindingsView {}
    }

    Component {
        id: displayViewComponent
        DisplayView {}
    }

    Component {
        id: videoSettingsViewComponent
        VideoSettingsView {}
    }

    StackView {
        id: stackView
        initialItem: mainMenuViewComponent

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 500
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 500
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 500
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 500
            }
        }
    }

    function clear() {
        stackView.popToIndex(0, StackView.Immediate);
    }

    function processInput() {
        const currentItem = stackView.currentItem;
        currentItem.processInput();
    }
}
