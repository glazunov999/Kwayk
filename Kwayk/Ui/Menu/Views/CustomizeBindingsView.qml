import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../../Controls" as C
import "../Delegates"
import "../../../js/keys.js" as Key

Item {
    id: root

    property bool bindGrab: false

    ListModel {
        id: bindNames
        ListElement { name: "attack"; command: "+attack"; keys: []; bindGrab: false; }
        ListElement { name: "change weapon"; command: "impulse 10"; keys: []; bindGrab: false; }
        ListElement { name: "jump / swim up"; command: "+jump"; keys: []; bindGrab: false; }
        ListElement { name: "walk forward"; command: "+forward"; keys: []; bindGrab: false; }
        ListElement { name: "backpedal"; command: "+back"; keys: []; bindGrab: false; }
        ListElement { name: "turn left"; command: "+left"; keys: []; bindGrab: false; }
        ListElement { name: "turn right"; command: "+right"; keys: []; bindGrab: false; }
        ListElement { name: "run"; command: "+speed"; keys: []; bindGrab: false; }
        ListElement { name: "step left"; command: "+moveleft"; keys: []; bindGrab: false; }
        ListElement { name: "step right"; command: "+moveright"; keys: []; bindGrab: false; }
        ListElement { name: "sidestep"; command: "+strafe"; keys: []; bindGrab: false; }
        ListElement { name: "look up"; command: "+lookup"; keys: []; bindGrab: false; }
        ListElement { name: "look down"; command: "+lookdown"; keys: []; bindGrab: false; }
        ListElement { name: "weaponwheel"; command: "+weaponwheel"; keys: []; bindGrab: false; }
        ListElement { name: "center view"; command: "centerview"; keys: []; bindGrab: false; }
        ListElement { name: "swim up"; command: "+moveup"; keys: []; bindGrab: false; }
        ListElement { name: "swim down"; command: "+movedown"; keys: []; bindGrab: false; }
    }

    Image {
        source: "qrc:/Assets/images/qplaque.png"
        x: 16
        y: 4
    }

    Image {
        source: "qrc:/Assets/images/ttl_cstm.png"
        x: 160 - implicitWidth / 2
        y: 4
    }

    Component.onCompleted: {
        updateBindNames();
    }

    Connections {
        target: cmds
        function onBindFinished(cmd) {
            updateBindNames();
        }
    }

    function findKeysForCommand(command) {
        const twokeys = [];
        for (let key in keyBindings) {
            if (keyBindings[key] === command) {
                twokeys[twokeys.length] = { "key": parseInt(key) };
                if (twokeys.length === 2)
                    return twokeys;
            }
        }

        return twokeys;
    }

    function unbindCommand(command) {
        for (let key in keyBindings) {
            if (keyBindings[key] === command)
                keyBindings[key] = null;
        }
        updateBindNames();
    }

    function updateBindNames() {
        for (let i = 0; i < bindNames.count; ++i) {
            const bindName = bindNames.get(i);
            const keys = findKeysForCommand(bindName.command);
            bindNames.set(i, { "name" : bindName.name, "keys" : keys });
        }
    }

    ListView {
        id: listView

        x: 70
        y: 32

        width: 320 - x
        height: 176 - y

        contentWidth: width - 8

        boundsBehavior: Flickable.StopAtBounds
        boundsMovement: Flickable.StopAtBounds

        clip: true

        model: bindNames

        delegate: KeyBindingDelegate {
            width: ListView.view.width - 8;
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: !bindGrab
            acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
            onPressed: (mouse) => {
                if (bindGrab) {
                    const keyNum = Key.mouseButtonToKeynum(mouse.button);
                    bindKey(keyNum);
                    mouse.accepted = true;
                    return;
                }
                enter();
                mouse.accepted = false;
            }
            onPositionChanged: (mouse) => {
                const index = listView.indexAt(listView.contentX + mouse.x, listView.contentY + mouse.y);
                if (index < 0)
                    return;
                listView.currentIndex = index;
            }
        }

        ScrollBar.vertical: C.ScrollBar {}
    }

    C.Label {
        text: "Escape: Back"
        light: true
        x: 16
        y: 200 - implicitHeight
    }

    C.Label {
        text: "Enter: Select"
        light: true
        x: 320 - implicitWidth
        y: 200 - implicitHeight
    }

    C.Label {
        text: "Backspace: Unbind"
        light: true
        x: 16
        y: 216 - implicitHeight
    }

    C.Label {
        text: "\r"
        x: 62
        y: listView.currentItem ? 32 + listView.currentItem.y - listView.contentY : 0

        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { from: 0; to: 1; duration: 250 }
            NumberAnimation { from: 1; to: 0; duration: 250 }
        }

        visible: y >= 28 && y <= listView.height + 28 && !bindGrab
    }

    function enter() {
        menu2Sound.stop();
        menu2Sound.play();

        const bindName = bindNames.get(listView.currentIndex);
        const keys = findKeysForCommand(bindName.command);
        if (keys.length === 2)
            unbindCommand(bindName.command);
        bindNames.setProperty(listView.currentIndex, "bindGrab", true);
        bindGrab = true;
    }

    function bindKey(keyNum) {
        if (keyNum === -1)
            return;

        const command = bindNames.get(listView.currentIndex).command;
        const cmd = 'bind "' + Key.keynumToString(keyNum) + '" "' + command + '"\n';
        cmds.command = cmd;

        bindNames.setProperty(listView.currentIndex, "bindGrab", false);
        bindGrab = false;
    }

    function processInput() {
        if (bindGrab) {
            if (currentKey !== Qt.Key_Escape)
                bindKey(currentKey);
            return;
        }

        if (currentKey === Qt.Key_Up || currentKey === Qt.Key_Left) {
            menu1Sound.stop();
            menu1Sound.play();
            listView.decrementCurrentIndex();
            return
        }

        if (currentKey === Qt.Key_Down || currentKey === Qt.Key_Right) {
            menu1Sound.stop();
            menu1Sound.play();
            listView.incrementCurrentIndex();
            return;
        }

        if (currentKey === Qt.Key_Return) {
            enter();
            return;
        }

        if (currentKey === Qt.Key_Backspace) {
            const cmd = bindNames.get(listView.currentIndex).command;
            unbindCommand(cmd);
            return;
        }

        if (currentKey === Qt.Key_Escape) {
            stackView.pop();
            return;
        }
    }
}
