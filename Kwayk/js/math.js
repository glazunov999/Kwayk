function crandom() {
    return 2 * (Math.random() - 0.5);
}

function smoothstep(t) {
    const x = Math.min(1, Math.max(0, t));
    return x * x * (3 - 2 * x);
}

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

function vecLerp(a, b, t) {
    return Qt.vector3d(a.x + (b.x - a.x) * t,
                       a.y + (b.y - a.y) * t,
                       a.z + (b.z - a.z) * t);
}

function quatSlerp(a, b, t) {
    let bx = b.x, by = b.y, bz = b.z, bw = b.scalar;
    let dot = a.dotProduct(b);
    if (dot < 0) {
        bx = -bx; by = -by; bz = -bz; bw = -bw;
        dot = -dot;
    }
    if (dot > 0.9995) {
        const x = a.x + (bx - a.x) * t;
        const y = a.y + (by - a.y) * t;
        const z = a.z + (bz - a.z) * t;
        const w = a.scalar + (bw - a.scalar) * t;
        const inv = 1.0 / Math.sqrt(x * x + y * y + z * z + w * w);
        return Qt.quaternion(w * inv, x * inv, y * inv, z * inv);
    }
    const theta0 = Math.acos(Math.min(1, Math.max(-1, dot)));
    const theta = theta0 * t;
    const sinTheta = Math.sin(theta);
    const sinTheta0 = Math.sin(theta0);
    const s0 = Math.cos(theta) - dot * sinTheta / sinTheta0;
    const s1 = sinTheta / sinTheta0;
    return Qt.quaternion(a.scalar * s0 + bw * s1,
                         a.x * s0 + bx * s1,
                         a.y * s0 + by * s1,
                         a.z * s0 + bz * s1);
}
