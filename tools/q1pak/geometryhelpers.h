#ifndef GEOMETRYHELPERS_H
#define GEOMETRYHELPERS_H

#include <assimp/scene.h>

#include <QVector>
#include <QVector3D>

bool intersect_3(const aiPlane &plane0, const aiPlane &plane1, const aiPlane &plane2, aiVector3D *result);
QVector<aiVector3D> compute_convex_mesh_points(const QVector<aiPlane> &planes);

#endif // GEOMETRYHELPERS_H
