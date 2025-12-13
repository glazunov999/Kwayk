import QtQuick

Connections {
    id: root

    enabled: flags && !velocity.fuzzyEquals(Qt.vector3d(0, 0, 0))
    property var accumulator: ({ value: 0 })
    property vector3d oldorg: Qt.vector3d(0, 0, 0)
    property int pass: 0
    function onPositionChanged() {
        if (pass > 1) {
            if (flags & Defs.rocket)
                particles.rocketTrail(oldorg, position, accumulator, 0);
            else if (flags & Defs.grenade)
                particles.rocketTrail(oldorg, position, accumulator, 1);
            else if (flags & Defs.gib)
                particles.rocketTrail(oldorg, position, accumulator, 2);
            else if (flags & Defs.tracer)
                particles.rocketTrail(oldorg, position, accumulator, 3);
            else if (flags & Defs.zomgib)
                particles.rocketTrail(oldorg, position, accumulator, 4);
            else if (flags & Defs.tracer2)
                particles.rocketTrail(oldorg, position, accumulator, 5);
            else if (flags & Defs.tracer3)
                particles.rocketTrail(oldorg, position, accumulator, 6);
        }
        pass++;
        oldorg = Qt.vector3d(position.x, position.y, position.z);
    }
}
