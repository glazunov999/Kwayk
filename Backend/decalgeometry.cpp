#include "decalgeometry.h"

DecalGeometry::DecalGeometry()
{
    updateData();
}

void DecalGeometry::setTriangles(const QVector<QVector3D> &vertices,
                                 const QVector<QVector2D> &texCoords,
                                 const QVector<float> &fades)
{
    m_vertices = vertices;
    m_texCoords = texCoords;
    m_fades = fades;

    m_normals.clear();
    m_normals.reserve(vertices.size());
    
    for (int i = 0; i < vertices.size(); i += 3) {
        if (i + 2 < vertices.size()) {
            const QVector3D &v0 = vertices[i];
            const QVector3D &v1 = vertices[i + 1];
            const QVector3D &v2 = vertices[i + 2];

            QVector3D edge1 = v1 - v0;
            QVector3D edge2 = v2 - v0;
            QVector3D normal = QVector3D::crossProduct(edge1, edge2).normalized();

            m_normals.append(normal);
            m_normals.append(normal);
            m_normals.append(normal);
        }
    }
    
    updateData();
    update();
}

void DecalGeometry::updateData()
{
    clear();

    constexpr int kStride = sizeof(QVector3D) + sizeof(QVector3D) + sizeof(QVector2D) + 4 * sizeof(float);
    QByteArray vertexData(m_vertices.size() * kStride, Qt::Initialization::Uninitialized);
    float *p = reinterpret_cast<float *>(vertexData.data());

    for (int i = 0; i < m_vertices.size(); ++i) {
        *p++ = m_vertices[i].x();
        *p++ = m_vertices[i].y();
        *p++ = m_vertices[i].z();

        if (i < m_normals.size()) {
            *p++ = m_normals[i].x();
            *p++ = m_normals[i].y();
            *p++ = m_normals[i].z();
        } else {
            *p++ = 0.0f;
            *p++ = 0.0f;
            *p++ = 1.0f;
        }

        if (i < m_texCoords.size()) {
            *p++ = m_texCoords[i].x();
            *p++ = m_texCoords[i].y();
        } else {
            *p++ = 0.0f;
            *p++ = 0.0f;
        }

        float fade = (i < m_fades.size()) ? m_fades[i] : 1.0f;
        *p++ = 1.0f;
        *p++ = 1.0f;
        *p++ = 1.0f;
        *p++ = fade;
    }

    setVertexData(vertexData);
    setStride(kStride);
    setPrimitiveType(QQuick3DGeometry::PrimitiveType::Triangles);
    
    addAttribute(QQuick3DGeometry::Attribute::PositionSemantic, 0,
                 QQuick3DGeometry::Attribute::F32Type);
    addAttribute(QQuick3DGeometry::Attribute::NormalSemantic, 3 * sizeof(float),
                 QQuick3DGeometry::Attribute::F32Type);
    addAttribute(QQuick3DGeometry::Attribute::TexCoordSemantic, 6 * sizeof(float),
                 QQuick3DGeometry::Attribute::F32Type);
    addAttribute(QQuick3DGeometry::Attribute::ColorSemantic, 8 * sizeof(float),
                 QQuick3DGeometry::Attribute::F32Type);
}
