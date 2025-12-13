function anglemod(v) {
    while (v >= 360)
        v = v - 360;
    while (v < 0)
        v = v + 360;

    return v;
}

function vectoyaw(dir) {
    return Quaternion.lookAt(Qt.vector3d(0, 0, 0), dir).toEulerAngles().y;
}

function vectoangles(dir) {
    return Quaternion.lookAt(Qt.vector3d(0, 0, 0), dir).toEulerAngles();
}

function makevectors(angles) {
    const q = Quaternion.fromEulerAngles(angles);

    return {
        forward: q.times(Qt.vector3d(0, 0, -1)),
        up: q.times(Qt.vector3d(0, 1, 0)),
        right: q.times(Qt.vector3d(1, 0, 0))
    }
}
