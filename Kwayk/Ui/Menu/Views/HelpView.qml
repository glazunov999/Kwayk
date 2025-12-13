import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

StackLayout {
    id: root

    Image {
        source: "qrc:/Assets/images/help0.png"
    }

    Image {
        source: "qrc:/Assets/images/help1.png"
    }

    Image {
        source: "qrc:/Assets/images/help2.png"
    }

    Image {
        source: "qrc:/Assets/images/help3.png"
    }

    Image {
        source: "qrc:/Assets/images/help4.png"
    }

    Image {
        source: "qrc:/Assets/images/help5.png"
    }

    function processInput() {
        if (currentKey === Qt.Key_Left) {
            currentIndex = (currentIndex - 1 + 6) % 6;
            return;
        }

        if (currentKey === Qt.Key_Right) {
            currentIndex = (currentIndex + 1 + 6) % 6;
            return;
        }

        if (currentKey === Qt.Key_Escape) {
            stackView.pop();
            return;
        }
    }
}
