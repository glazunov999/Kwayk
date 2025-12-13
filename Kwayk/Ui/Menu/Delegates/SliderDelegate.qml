import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

import "../../Controls" as C

RowLayout {
    id: root

    property alias name: sliderLabel.text
    property alias from: slider.from
    property alias to: slider.to
    property alias stepSize: slider.stepSize
    property alias value: slider.value

    width: parent.width

    function displayNumber(val) {
        let digits = 0;
        const n = stepSize - Math.floor(stepSize);
        if (n > 0) {
            const str = n.toString();
            const idx = str.indexOf(".");
            if (idx !== -1)
                digits = str.length - 1 - idx;
        }
        return val.toFixed(digits);
    }

    C.Label {
        id: sliderLabel
        light: true
        Layout.alignment: Qt.AlignLeft
        Layout.fillWidth: true
    }

    C.Label {
        Layout.alignment: Qt.AlignRight
        text: displayNumber(slider.value)
        light: true
    }

    C.Slider {
        id: slider
        focusPolicy: Qt.NoFocus
        Layout.alignment: Qt.AlignRight
        Layout.preferredWidth: 100
        topPadding: 0
        bottomPadding: 0
    }

    function change() {
        slider.increase();
    }

    function increase() {
        slider.increase();
    }

    function decrease() {
        slider.decrease();
    }
}
