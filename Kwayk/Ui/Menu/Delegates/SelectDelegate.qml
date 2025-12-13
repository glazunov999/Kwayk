import QtQuick
import QtQuick.Layouts

import "../../Controls" as C

RowLayout {
    id: root

    required property var options

    property alias name: selectLabel.text
    readonly property alias optionLabel: optionLabel
    property alias value: optionLabel.text

    property int currentIndex: -1

    width: parent.width

    C.Label {
        id: selectLabel
        light: true
        Layout.alignment: Qt.AlignLeft
        Layout.fillWidth: true
    }

    C.Label {
        id: optionLabel
        Layout.alignment: Qt.AlignRight
        light: true
    }

    onCurrentIndexChanged: {
        if (currentIndex >= 0 && currentIndex < options.count)
            value = options.get(currentIndex).name;
        else
            value = "";
    }

    function increase() {
        let c = currentIndex + 1;
        if (c > options.count - 1)
            c = 0;
        currentIndex = c;
    }

    function decrease() {
        let c = currentIndex - 1;
        if (c < 0)
            c = options.count - 1;
        currentIndex = c;
    }

    Component.onCompleted: {
        if (currentIndex !== -1)
            return;

        for (let i = 0; i < options.count; ++i) {
            if (options.get(i).name === root.value) {
                currentIndex = i;
                return;
            }
        }
        currentIndex = 0;
    }
}
