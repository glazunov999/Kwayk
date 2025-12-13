const EPSILON = 0.00001;

function distanceToPoint(plane, point) {
    return plane.n.dotProduct(point) + plane.d;
}

function clip(v0, v1, plane) {
    const d0 = distanceToPoint(plane, v0);
    const d1 = distanceToPoint(plane, v1);
    const s = d0 / (d0 - d1);
    const v = Qt.vector3d(v0.x + s * (v1.x - v0.x),
                          v0.y + s * (v1.y - v0.y),
                          v0.z + s * (v1.z - v0.z));
    return v;
}

function clipFace(points, plane) {
    if (points < 3)
        return [];

    const vertices = [];
    for (let i = 0; i < points.length; i += 3) {
        const d1 = distanceToPoint(plane, points[i + 0]);
        const d2 = distanceToPoint(plane, points[i + 1]);
        const d3 = distanceToPoint(plane, points[i + 2]);

        const v1Out = d1 > 0;
        const v2Out = d2 > 0;
        const v3Out = d3 > 0;

        const total = v1Out + v2Out + v3Out;

        let nV1;
        let nV2;
        let nV3;
        let nV4;

        switch (total) {
        case 0:
            vertices.push(points[i], points[i + 1], points[i + 2]);
            break;
        case 1:
            if (v1Out) {
                nV1 = points[i + 1];
                nV2 = points[i + 2];
                nV3 = clip(points[i], nV1, plane);
                nV4 = clip(points[i], nV2, plane);
            }
            if (v2Out) {
                nV1 = points[i];
                nV2 = points[i + 2];
                nV3 = clip(points[i + 1], nV1, plane);
                nV4 = clip(points[i + 1], nV2, plane);
                vertices.push(nV3, nV2, nV1, nV2, nV3, nV4);
                break;
            }
            if (v3Out) {
                nV1 = points[i];
                nV2 = points[i + 1];
                nV3 = clip(points[i + 2], nV1, plane);
                nV4 = clip(points[i + 2], nV2, plane);
            }
            vertices.push(nV1, nV2, nV3, nV4, nV3, nV2);
            break;
        case 2:
            if (!v1Out) {
                nV1 = points[i];
                nV2 = clip(nV1, points[i + 1], plane);
                nV3 = clip(nV1, points[i + 2], plane);
                vertices.push(nV1, nV2, nV3);
            }
            if (!v2Out) {
                nV1 = points[i + 1];
                nV2 = clip(nV1, points[i + 2], plane);
                nV3 = clip(nV1, points[i], plane);
                vertices.push(nV1, nV2, nV3);
            }
            if (!v3Out) {
                nV1 = points[i + 2];
                nV2 = clip(nV1, points[i], plane);
                nV3 = clip(nV1, points[i + 1], plane);
                vertices.push(nV1, nV2, nV3);
            }
            break;
        case 3:
            break;
        }
    }

    return vertices;
}
