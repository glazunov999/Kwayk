#ifndef DECALGEOMETRY_H
#define DECALGEOMETRY_H

#include <QQuick3DGeometry>
#include <QVector3D>

class DecalGeometry : public QQuick3DGeometry
{
    Q_OBJECT
    QML_ELEMENT
public:
    DecalGeometry();

    Q_INVOKABLE void setTriangles(const QVector<QVector3D> &vertices,
                                  const QVector<QVector2D> &texCoords,
                                  const QVector<float> &fades);

private:
    void updateData();

private:
    QVector<QVector3D> m_vertices;
    QVector<QVector3D> m_normals;
    QVector<QVector2D> m_texCoords;
    QVector<float> m_fades;
};

#endif // DECALGEOMETRY_H
