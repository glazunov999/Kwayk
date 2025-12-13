import QtQuick
import QtQuick3D

import Kwayk.Game

Trigger {
    id: root

    readonly property int noMessage: 1

    property int count: 2

    classname: "trigger_counter"

    wait: -1

    use: counter_use

    visible: false

    function counter_use() {
        count--;

        if (count < 0)
            return;

        if (count != 0) {
            if (activator.classname === "player" && !(spawnflags & noMessage)) {
                if (count >= 4)
                    ui.centerprint("There are more to go...");
                else if (count === 3)
                    ui.centerprint("Only 3 more to go...");
                else if (count === 2)
                    ui.centerprint("Only 2 more to go...");
                else
                    ui.centerprint("Only 1 more to go...");
            }

            return;
        }

        if (activator.classname === "player" && !(spawnflags & noMessage))
            ui.centerprint("Sequence completed!");

        enemy = activator;
        multi_trigger();
    }
}
