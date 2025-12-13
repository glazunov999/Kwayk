#include "geometryhelpers.h"

#include <QtNumeric>

#include <assimp/cimport.h>

static constexpr float CMP_EPSILON = 0.00001;

bool intersect_3(const aiPlane &plane0, const aiPlane &plane1, const aiPlane &plane2, aiVector3D *result)
{
    aiVector3D normal0 = aiVector3D(plane0.a, plane0.b, plane0.c);
    aiVector3D normal1 = aiVector3D(plane1.a, plane1.b, plane1.c);
    aiVector3D normal2 = aiVector3D(plane2.a, plane2.b, plane2.c);

    aiVector3D cross;
    aiVector3CrossProduct(&cross, &normal0, &normal1);

    float denom = aiVector3DotProduct(&cross, &normal2);

    if (qFuzzyIsNull(denom))
        return false;

    if (result) {
        aiVector3D cross1;
        aiVector3CrossProduct(&cross1, &normal1, &normal2);
        aiVector3D cross2;
        aiVector3CrossProduct(&cross2, &normal2, &normal0);
        aiVector3D cross3;
        aiVector3CrossProduct(&cross3, &normal0, &normal1);

        *result = ((cross1 * plane0.d) + (cross2 * plane1.d) + (cross3 * plane2.d)) / denom;
    }

    return true;
}

QVector<aiVector3D> compute_convex_mesh_points(const QVector<aiPlane> &planes)
{
    QVector<aiVector3D> points;

    for (int i = planes.size() - 1; i >= 0; i--) {
        for (int j = i - 1; j >= 0; j--) {
            for (int k = j - 1; k >= 0; k--) {
                aiVector3D convex_shape_point;
                if (intersect_3(planes[i], planes[j], planes[k], &convex_shape_point)) {
                    bool excluded = false;
                    for (int n = 0; n < planes.size(); n++) {
                        if (n != i && n != j && n != k) {
                            aiVector3D normal = aiVector3D(planes[n].a, planes[n].b, planes[n].c);
                            float dp = aiVector3DotProduct(&normal, &convex_shape_point);
                            if (dp - planes[n].d > (float)CMP_EPSILON) {
                                excluded = true;
                                break;
                            }
                        }
                    }

                    if (!excluded)
                        points.push_back(convex_shape_point);
                }
            }
        }
    }

    return points;
}
