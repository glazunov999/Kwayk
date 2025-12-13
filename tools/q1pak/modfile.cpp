#include <QFile>
#include <QFileInfo>
#include <QDir>
#include <QImage>
#include <QPainter>
#include <QTextStream>
#include <QVector3D>
#include <QMatrix4x4>
#include <QVariant>
#include <QMetaType>
#include <QDebug>

#include <map>

#include <assimp/Exporter.hpp>
#include <assimp/scene.h>
#include <assimp/postprocess.h>
#include <assimp/Exceptional.h>

#include "modfile.h"
#include "palettefile.h"
#include "geometryhelpers.h"

using namespace Qt::Literals::StringLiterals;

enum {
    PlaneX = 0,
    PlaneY = 1,
    PlaneZ = 2,
    PlaneAnyX = 3,
    PlaneAnyY = 4,
    PlaneAnyZ = 5
};

enum {
    Entities = 0,
    Planes = 1,
    Textures = 2,
    Vertexes = 3,
    Visibility = 4,
    Nodes = 5,
    TexInfos = 6,
    Faces = 7,
    Lighting = 8,
    ClipNodes = 9,
    Leafs = 10,
    MarkSurfaces = 11,
    Edges = 12,
    SurfaceEdges = 13,
    Models =  14
};

enum Ev {
    Bad = -1,
    Void = 0,
    String = 1,
    Float = 2,
    Vector = 3,
    Entity = 4,
    Field = 5,
    Function = 6,
    Pointer = 7
};

enum SpriteFrameType : qint32 {
    Single = 0,
    Group
};

[[nodiscard]] static inline constexpr quint32 makeMagic(const char *string)
{
    return ((uint32_t)((string[0] << 24) + (string[1] << 16) + (string[2] << 8) + string[3]));
}

static constexpr quint32 IdpoMagic = makeMagic("OPDI");
static constexpr quint32 PsdiMagic = makeMagic("PSDI");

static constexpr qint32 AliasVersion = 6;
static constexpr qint32 MaxSkins = 32;

static constexpr qint32 LMBLOCK_WIDTH = 1024;
static constexpr qint32 LMBLOCK_HEIGHT = 1024;

ModFile::ModFile(const PaletteFile *paletteFile)
    : m_paletteFile{paletteFile}
{
}

QString ModFile::import(QByteArray data, const QString &outputFile, QStringList *generatedFiles)
{
    QFileInfo fileInfo(outputFile);

    m_name = fileInfo.baseName();

    QDataStream stream(&data, QIODevice::ReadOnly);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream.setFloatingPointPrecision(QDataStream::SinglePrecision);

    qint32 version;
    stream >> version;

    QString errorMsg;

    switch (version) {
    case IdpoMagic:
        loadAliasModel(stream);
        errorMsg = saveAlias(outputFile, generatedFiles);
        break;
    case PsdiMagic:
        loadSpriteModel(stream);
        errorMsg = saveSprite(outputFile, generatedFiles);
        break;
    default:
        loadBrushModel(stream);
        errorMsg = saveBrush(outputFile, generatedFiles);
        break;
    }

    return errorMsg;
}

static bool checkFullbrights(const QByteArray &pixels)
{
    for (int i = 0; i < pixels.size(); ++i) {
        if (static_cast<quint8>(pixels[i]) > 223)
            return true;
    }

    return false;
}

QString ModFile::saveAlias(const QString &outputFile, QStringList *generatedFiles)
{
    const QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath()  + u"/skins/"_s;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    for (int i = 0; i < m_skins.length(); ++i) {
        const auto &image = m_skins[i];
        auto fileName = fileInfo.baseName();
        if (i > 0)
            fileName += u"_%1"_s.arg(i);
        const auto &outputFilePath = outputDirectory.absolutePath() + "/" + fileName + u".png"_s;
        if (!image.save(outputFilePath, "png"))
            return u"File open error %1.png"_s.arg(fileInfo.baseName());

        if (generatedFiles)
            *generatedFiles << outputFilePath;
    }

    return QString();
}

void ModFile::loadAliasModel(QDataStream &stream)
{
    stream >> m_aliasHeader.version
        >> m_aliasHeader.scale[0]
        >> m_aliasHeader.scale[1]
        >> m_aliasHeader.scale[2]
        >> m_aliasHeader.scaleOrigin[0]
        >> m_aliasHeader.scaleOrigin[1]
        >> m_aliasHeader.scaleOrigin[2]
        >> m_aliasHeader.boundingradius
        >> m_aliasHeader.eyeposition[0]
        >> m_aliasHeader.eyeposition[1]
        >> m_aliasHeader.eyeposition[2]
        >> m_aliasHeader.numskins
        >> m_aliasHeader.skinwidth
        >> m_aliasHeader.skinheight
        >> m_aliasHeader.numverts
        >> m_aliasHeader.numtris
        >> m_aliasHeader.numframes
        >> m_aliasHeader.synctype
        >> m_aliasHeader.flags
        >> m_aliasHeader.size;

    loadAllSkins(stream);
}

void ModFile::loadAllSkins(QDataStream &stream)
{
    if (m_aliasHeader.numskins < 1 || m_aliasHeader.numskins > MaxSkins)
        qWarning("ModFile::loadAllSkins: Invalid # of skins %d", m_aliasHeader.numskins);

    m_skins.resize(m_aliasHeader.numskins);

    const auto size = m_aliasHeader.skinwidth * m_aliasHeader.skinheight;
    for (qint32 i = 0; i < m_aliasHeader.numskins; ++i) {
        AliasSkinTypes skinType;
        stream >> skinType;
        if (skinType == AliasSkinSingle) {
            QByteArray pixels;
            pixels.resize(size);
            stream.readRawData(pixels.data(), pixels.size());

            const auto skin = createTexture(pixels, m_aliasHeader.skinwidth, m_aliasHeader.skinheight);
            m_skins[i] = skin;
        }
    }
}

QString ModFile::saveSprite(const QString &outputFile, QStringList *generatedFiles)
{
    const QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath()  + u"/sprites/"_s;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    QImage sprite(m_frames.size() * m_spriteHeader.width, m_spriteHeader.height, QImage::Format_RGBA8888);
    sprite.fill(Qt::transparent);
    QPainter painter(&sprite);

    for (int i = 0; i < m_frames.length(); ++i) {
        const auto &image = m_frames[i];
        painter.drawImage(i * m_spriteHeader.width, 0, image);
    }
    painter.end();

    auto fileName = fileInfo.baseName();
    fileName += u"_sprite"_s;
    const auto &outputFilePath = outputDirectory.absolutePath() + "/" + fileName + u".png"_s;
    if (!sprite.save(outputFilePath, "png"))
        return u"File open error %1.png"_s.arg(fileInfo.baseName());

    if (generatedFiles)
        *generatedFiles << outputFilePath;

    return QString();
}

void ModFile::loadSpriteModel(QDataStream &stream)
{
    stream >> m_spriteHeader.version
        >> m_spriteHeader.type
        >> m_spriteHeader.boundingradius
        >> m_spriteHeader.width
        >> m_spriteHeader.height
        >> m_spriteHeader.numframes
        >> m_spriteHeader.beamlength
        >> m_spriteHeader.synctype;

    if (m_spriteHeader.version != 1) {
        qWarning("%s has wrong version number (%d should be %d)", qPrintable(m_name), m_spriteHeader.version, 1);
        return;
    }

    if (m_spriteHeader.numframes < 1) {
        qWarning("loadSpriteModel: invalid # of frames: %d", m_spriteHeader.numframes);
        return;
    }

    m_frames.resize(m_spriteHeader.numframes);

    for (qint32 i = 0; i < m_spriteHeader.numframes; ++i) {
        SpriteFrameType type;
        stream >> type;

        if (type == SpriteFrameType::Single)
            loadSpriteFrame(stream, m_frames[i]);
    }
}

void ModFile::loadSpriteFrame(QDataStream &stream, QImage &frame)
{
    struct {
        qint32 origin[2];
        qint32 width;
        qint32 height;
    } in;

    stream >> in.origin[0]
        >> in.origin[1]
        >> in.width
        >> in.height;

    qint32 size = in.width * in.height;

    QByteArray pixels;
    pixels.resize(size);
    stream.readRawData(pixels.data(), pixels.size());

    frame = createTexture(pixels, in.width, in.height);
}

QString ModFile::saveBrush(const QString &outputFile, QStringList *generatedFiles)
{
    QString errorString;

    errorString = saveTextures(outputFile, generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    errorString = saveLightmaps(outputFile, generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    errorString = saveScene(outputFile, generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    errorString = saveHullScene(outputFile, generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    errorString = saveEntitiesString(outputFile, generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    errorString = saveSubModelsExtents(outputFile, generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    return errorString;
}

QString ModFile::saveTextures(const QString &outputFile, QStringList *generatedFiles)
{
    QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath() + "/" + m_name + u"/images"_s;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    for (const auto &texture : std::as_const(m_textures)) {
        const auto &image = texture.image;
        if (texture.name.isEmpty())
            continue;

        const auto &outputFilePath = outputDirectory.absolutePath() + "/" + texture.name + u".png"_s;
        if (!image.save(outputFilePath, "png"))
            return u"File open error %1.png"_s.arg(m_name);

        if (generatedFiles)
            *generatedFiles << outputFilePath;
    }

    return QStringLiteral();
}

QString ModFile::saveLightmaps(const QString &outputFile, QStringList *generatedFiles)
{
    QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath() + "/" + m_name + u"/images"_s;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    const auto image = QImage(reinterpret_cast<const quint8 *>(m_lightmaps.data()), LMBLOCK_WIDTH, LMBLOCK_HEIGHT, QImage::Format_RGBA8888);
    const auto &outputFilePath = outputDirectory.absolutePath() + u"/lightmap.png"_s;
    if (!image.save(outputFilePath, "png"))
        return u"File open error %1.png"_s.arg(outputFilePath);

    if (generatedFiles)
        *generatedFiles << outputFilePath;

    return QStringLiteral();
}

QString ModFile::saveScene(const QString &outputFile, QStringList *generatedFiles)
{
    const QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath() + "/" + m_name;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    QVector<aiNode *> nodes;
    QVector<aiMesh *> meshes;
    QVector<aiMaterial *> materials;

    for (qint32 i = 0; i < m_subModels.length(); ++i) {
        const auto &subModel = m_subModels[i];
        addSceneMeshes(subModel.subsets[0], u"solid_%1"_s.arg(i), nodes, meshes, materials);
        if (i == 0) {
            addSceneMeshes(subModel.subsets[1], u"lava"_s, nodes, meshes, materials);
            addSceneMeshes(subModel.subsets[2], u"slime"_s, nodes, meshes, materials);
            addSceneMeshes(subModel.subsets[3], u"tele"_s, nodes, meshes, materials);
            addSceneMeshes(subModel.subsets[4], u"water"_s, nodes, meshes, materials);
            addSceneMeshes(subModel.subsets[5], u"sky"_s, nodes, meshes, materials);
        }
    }

    aiScene *scene = new aiScene();
    scene->mName.Set(m_name.toStdString());

    scene->mNumMeshes = meshes.size();
    scene->mMeshes = new aiMesh*[scene->mNumMeshes];

    scene->mRootNode = new aiNode();

    scene->mNumMaterials = materials.size();
    scene->mMaterials = new aiMaterial*[scene->mNumMaterials];

    scene->mRootNode->mNumChildren = nodes.size();
    scene->mRootNode->mChildren = new aiNode*[scene->mRootNode->mNumChildren];
    scene->mRootNode->mName.Set(m_name.toStdString());

    for (unsigned int i = 0; i < scene->mRootNode->mNumChildren; ++i)
        scene->mRootNode->mChildren[i] = nodes[i];

    for (unsigned int i = 0; i < scene->mNumMeshes; ++i)
        scene->mMeshes[i] = meshes[i];

    for (unsigned int i = 0; i < scene->mNumMaterials; ++i)
        scene->mMaterials[i] = materials[i];

    QString errorString;

    try {
        Assimp::Exporter exporter;
        auto outputFilePath = outputDirectory.absolutePath() + "/" + m_name + u"_map.dae"_s;
        exporter.Export(scene, "collada", outputFilePath.toStdString(), aiProcess_OptimizeMeshes | aiProcess_FlipWindingOrder | aiProcess_FlipUVs);

        if (generatedFiles)
            *generatedFiles << outputFilePath;
    } catch (DeadlyErrorBase &) {
        errorString = u"BSP export error."_s;
    }

    delete scene;

    return errorString;
}

void ModFile::addSceneMeshes(QVector<Subset> subsets, const QString &name, QVector<aiNode *> &nodes, QVector<aiMesh *> &meshes, QVector<aiMaterial *> &materials)
{
    if (subsets.empty())
        return;

    std::sort(subsets.begin(), subsets.end(), [](auto a, auto b) {
        return a.texInfo->texture->name < b.texInfo->texture->name;
    });

    QMatrix4x4 rot;
    rot.rotate(-90, 1, 0, 0);

    auto *node = new aiNode();
    node->mNumMeshes = subsets.size();
    node->mMeshes = new unsigned [node->mNumMeshes];
    node->mName.Set(name.toStdString());
    nodes.push_back(node);

    for (int i = 0; i < subsets.size(); ++i) {
        const auto &subset = subsets[i];
        const auto *texInfo = subset.texInfo;

        auto *mesh = new aiMesh();
        mesh->mName.Set(name.toStdString());
        mesh->mNumVertices = subset.vertexes.size();
        mesh->mVertices = new aiVector3D[mesh->mNumVertices];
        mesh->mTextureCoords[0] = new aiVector3D[mesh->mNumVertices];
        mesh->mTextureCoords[1] = new aiVector3D[mesh->mNumVertices];
        mesh->mColors[0] = new aiColor4D[mesh->mNumVertices];
        for (unsigned int j = 0; j < mesh->mNumVertices; ++j) {
            const auto &vertex = subset.vertexes[j];
            const auto &position = rot.map(vertex.position / 100.0f);
            mesh->mVertices[j] = aiVector3D(position.x(), position.y(), position.z());
            const auto &texCoords = vertex.texCoords;
            mesh->mTextureCoords[0][j] = aiVector3D(texCoords[0].x(), texCoords[0].y(), 0);
            mesh->mTextureCoords[1][j] = aiVector3D(texCoords[1].x(), texCoords[1].y(), 0);
            mesh->mColors[0][j] = aiColor4D(vertex.styles[0] / 255.0f, vertex.styles[1] / 255.0f, vertex.styles[2] / 255.0f, vertex.styles[3] / 255.0f);
        }

        mesh->mNumFaces = mesh->mNumVertices / 3;
        mesh->mFaces = new aiFace[mesh->mNumFaces];

        mesh->mNumUVComponents[0] = 2;
        mesh->mPrimitiveTypes = aiPrimitiveType_TRIANGLE;
        for (unsigned int j = 0; j < mesh->mNumFaces; ++j) {
            mesh->mFaces[j].mNumIndices = 3;
            mesh->mFaces[j].mIndices = new unsigned [3] { j * 3, j * 3 + 1, j * 3 + 2 };
        }

        auto *material = new aiMaterial();

        aiString matName;
        matName.Set(texInfo->texture->name.toStdString());
        material->AddProperty(&matName, AI_MATKEY_NAME);

        auto texName = u"images/%1.png"_s.arg(texInfo->texture->name);
        matName.Set(texName.toStdString());
        material->AddProperty(&matName, AI_MATKEY_TEXTURE_DIFFUSE(0));

        mesh->mMaterialIndex = materials.size();
        node->mMeshes[i] = meshes.size();

        materials.push_back(material);
        meshes.push_back(mesh);
    }
}

QString ModFile::saveHullScene(const QString &outputFile, QStringList *generatedFiles)
{
    const QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath() + "/" + m_name;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    QString errorString;

    QVector<aiNode *> nodes;
    QVector<aiMesh *> meshes;
    QVector<aiMaterial *> materials;

    for (int i = 0; i < m_subModels.length(); ++i) {
        const auto &subModel = m_subModels[i];
        const auto &hull = subModel.hull0;
        addSceneHullMeshes(hull.subsets[0], u"solid_%1_hull0"_s.arg(i), nodes, meshes, materials);
        if (i == 0) {
            addSceneHullMeshes(hull.subsets[1], u"lava_hull0"_s, nodes, meshes, materials);
            addSceneHullMeshes(hull.subsets[2], u"slime_hull0"_s, nodes, meshes, materials);
            addSceneHullMeshes(hull.subsets[3], u"water_hull0"_s, nodes, meshes, materials);
            addSceneHullMeshes(hull.subsets[4], u"sky_hull0"_s, nodes, meshes, materials);
        }
    }

    aiScene *scene = new aiScene();
    scene->mName.Set(m_name.toStdString());

    scene->mNumMeshes = meshes.size();
    scene->mMeshes = new aiMesh*[scene->mNumMeshes];

    scene->mRootNode = new aiNode();

    scene->mNumMaterials = materials.size();
    scene->mMaterials = new aiMaterial*[scene->mNumMaterials];

    scene->mRootNode->mNumChildren = nodes.size();
    scene->mRootNode->mChildren = new aiNode*[scene->mRootNode->mNumChildren];
    scene->mRootNode->mName.Set(m_name.toStdString());

    for (unsigned int i = 0; i < scene->mRootNode->mNumChildren; ++i)
        scene->mRootNode->mChildren[i] = nodes[i];

    for (unsigned int i = 0; i < scene->mNumMeshes; ++i)
        scene->mMeshes[i] = meshes[i];

    for (unsigned int i = 0; i < scene->mNumMaterials; ++i)
        scene->mMaterials[i] = materials[i];

    try {
        Assimp::Exporter exporter;
        auto outputFilePath = outputDirectory.absolutePath() + "/" + m_name + u"_map_hull0.dae"_s;
        exporter.Export(scene, "collada", outputFilePath.toStdString(), aiProcess_OptimizeMeshes);

        if (generatedFiles)
            *generatedFiles << outputFilePath;
    } catch (DeadlyErrorBase &) {
        errorString = u"BSP export error."_s;
    }

    delete scene;

    return errorString;
}

QString ModFile::saveEntitiesString(const QString &outputFile, QStringList *generatedFiles)
{
    const QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath() + "/" + m_name;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    const auto outputFilePath = outputDirectory.absolutePath() + "/" + m_name + u".txt"_s;

    QFile file(outputFilePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
        return u"Failed to open file for writing: %1"_s.arg(outputFilePath);

    QTextStream stream(&file);
    stream << m_entitiesString;
    file.close();

    if (generatedFiles)
        *generatedFiles << outputFilePath;

    return QString();
}

QString ModFile::saveSubModelsExtents(const QString &outputFile, QStringList *generatedFiles)
{
    const QFileInfo fileInfo(outputFile);
    const QDir outputDirectory = fileInfo.absoluteDir().absolutePath() + "/" + m_name;
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory: %1"_s.arg(outputDirectory.absolutePath());
    }

    const auto outputFilePath = outputDirectory.absolutePath() + "/" + m_name + u"_extents.txt"_s;

    QMatrix4x4 rot;
    rot.rotate(-90, 1, 0, 0);

    QFile file(outputFilePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
        return u"Failed to open file for writing: %1"_s.arg(outputFilePath);

    QTextStream stream(&file);

    for (int i = 0; i < m_subModels.size(); ++i) {
        const auto &subModel = m_subModels[i];

        const auto p1 = rot.map(subModel.mins / 100.0f);
        const auto p2 = rot.map(subModel.maxs / 100.0f);

        auto mins = QVector3D(qMin(p1.x(), p2.x()), qMin(p1.y(), p2.y()), qMin(p1.z(), p2.z()));
        auto maxs = QVector3D(qMax(p1.x(), p2.x()), qMax(p1.y(), p2.y()), qMax(p1.z(), p2.z()));

        const auto position = (maxs + mins) / 2;
        mins -= position;
        maxs -= position;

        stream << i << u'\n'
               << u"    position: Qt.vector3d("_s << position.x() << u", "_s << position.y() << u", "_s << position.z() << u")\n"_s
               << u"    mins: Qt.vector3d("_s << mins.x() << u", "_s << mins.y() << u", "_s << mins.z() << u")\n"_s
               << u"    maxs: Qt.vector3d("_s << maxs.x() << u", "_s << maxs.y() << u", "_s << maxs.z() << u")\n"_s;
    }

    file.close();

    if (generatedFiles)
        *generatedFiles << outputFilePath;

    return QString();
}

void ModFile::addSceneHullMeshes(const QVector<Polyhedron> &subsets, const QString &name, QVector<aiNode *> &nodes, QVector<aiMesh *> &meshes, QVector<aiMaterial *> &materials)
{
    if (subsets.isEmpty())
        return;

    QMatrix4x4 rot;
    rot.rotate(-90, 1, 0, 0);

    auto *node = new aiNode();
    node->mNumMeshes = subsets.size();
    node->mMeshes = new unsigned [node->mNumMeshes];
    node->mName.Set(name.toStdString());
    nodes.push_back(node);

    for (int i = 0; i < subsets.size(); ++i) {
        const auto &polyhedron = subsets[i];

        auto *mesh = new aiMesh();
        mesh->mName.Set(name.toStdString());
        mesh->mNumVertices = polyhedron.size_of_vertices();
        mesh->mVertices = new aiVector3D[mesh->mNumVertices];

        std::map<Polyhedron::Vertex_const_handle, int> vertex_index_map;

        int idx = 0;
        for (auto v = polyhedron.vertices_begin(); v != polyhedron.vertices_end(); ++v, ++idx) {
            const Point_3 &p = v->point();
            const auto &position = rot.map(QVector3D(p.x(), p.y(), p.z()) / 100.0f);
            vertex_index_map[v] = idx;
            mesh->mVertices[idx] = aiVector3D(position.x(), position.y(), position.z());
        }

        mesh->mNumFaces = polyhedron.size_of_facets();
        mesh->mFaces = new aiFace[mesh->mNumFaces];

        mesh->mPrimitiveTypes = aiPrimitiveType_TRIANGLE;

        int face = 0;
        for (auto f = polyhedron.facets_begin(); f != polyhedron.facets_end(); ++f, ++face) {
            auto halfedge = f->halfedge();
            std::vector<int> face_indices;

            do {
                int v_index = vertex_index_map[halfedge->vertex()];
                face_indices.push_back(v_index);
                halfedge = halfedge->next();
            } while (halfedge != f->halfedge());

            if (face_indices.size() == 3) {
                mesh->mFaces[face].mNumIndices = 3;
                mesh->mFaces[face].mIndices = new unsigned [3] { face_indices[0], face_indices[1], face_indices[2] };
            }
        }

        auto *material = new aiMaterial();

        mesh->mMaterialIndex = materials.size();
        node->mMeshes[i] = meshes.size();

        materials.push_back(material);
        meshes.push_back(mesh);
    }
}

void ModFile::loadBrushModel(QDataStream &stream)
{
    Lump lumps[15];
    for (quint32 i = 0; i < 15; ++i) {
        Lump lump;
        stream >> lump.offset >> lump.size;
        lumps[i] = lump;
    }

    loadVertexes(stream, lumps[Vertexes]);
    loadEdges(stream, lumps[Edges]);
    loadSurfaceEdges(stream, lumps[SurfaceEdges]);
    loadTextures(stream, lumps[Textures]);
    loadLighting(stream, lumps[Lighting]);
    loadPlanes(stream, lumps[Planes]);
    loadTexInfo(stream, lumps[TexInfos]);
    loadFaces(stream, lumps[Faces]);
    loadEntities(stream, lumps[Entities]);
    loadLeafs(stream, lumps[Leafs]);
    loadNodes(stream, lumps[Nodes]);
    loadClipNodes(stream, lumps[ClipNodes]);
    makeHull0();
    loadSubModels(stream, lumps[Models]);

    for (int i = 0; i < m_subModels.size(); ++i) {
        auto &bm = m_subModels[i];
        if (bm.subsets[0].size() > 0) {
            const auto &name = bm.subsets[0].first().texInfo->texture->name.toLower();
            if (name.startsWith(u"trigger"))
                continue;
        }

        QVector<aiPlane> planes;
        planes.push_back(aiPlane(-1,  0,  0, -bm.mins[0]));
        planes.push_back(aiPlane( 0, -1,  0, -bm.mins[1]));
        planes.push_back(aiPlane( 0,  0, -1, -bm.mins[2]));
        planes.push_back(aiPlane( 1,  0,  0, bm.maxs[0]));
        planes.push_back(aiPlane( 0,  1,  0, bm.maxs[1]));
        planes.push_back(aiPlane( 0,  0,  1, bm.maxs[2]));
        calculateHullShapes(&bm.hull0, bm.hull0.firstclipnode, planes);
    }

    buildLightmaps();
}

void ModFile::loadVertexes(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        float points[3];
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadVertexes: funny lump size in: %s.bsp", qPrintable(m_name));
    m_vertexes.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_vertexes.size(); ++i)
        stream >> m_vertexes[i];
}

void ModFile::loadEdges(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        quint16 v[2];
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadEdges: funny lump size in: %s.bsp", qPrintable(m_name));
    m_edges.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_edges.size(); ++i) {
        stream >> in.v[0] >> in.v[1];
        Edge &out = m_edges[i];
        out.v[0] = in.v[0];
        out.v[1] = in.v[1];
    }
}

void ModFile::loadSurfaceEdges(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    qint32 in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadSurfaceEdges: funny lump size in: %s.bsp", qPrintable(m_name));
    m_surfaceEdges.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_surfaceEdges.size(); ++i)
        stream >> m_surfaceEdges[i];
}

void ModFile::loadTextures(QDataStream &stream, const Lump &lump)
{
    qint32 nummiptex = 0;
    if (!lump.size) {
        qWarning("ModFile::loadTextures: no textures in bsp file");
    } else {
        stream.device()->seek(lump.offset);
        stream >> nummiptex;
    }

    constexpr auto MIPLEVELS = 4;

    m_textures.resize(nummiptex);

    auto dataofs = stream.device()->pos();
    for (int i = 0; i < nummiptex; ++i) {
        stream.device()->seek(dataofs);

        qint32 miptexofs;
        stream >> miptexofs;
        dataofs = stream.device()->pos();
        if (miptexofs == -1)
            continue;

        stream.device()->seek(lump.offset + miptexofs);

        struct {
            char name[16];
            quint32 width;
            quint32 height;
            quint32 offsets[4];
        } mt;

        stream.readRawData(mt.name, 16);
        stream >> mt.width;
        stream >> mt.height;
        for (int j = 0; j < MIPLEVELS; ++j)
            stream >> mt.offsets[j];

        const auto &name = QString::fromLatin1(mt.name);
        if (mt.width == 0 || mt.height == 0) {
            qWarning("Zero sized texture %s in %s.bsp!", qPrintable(name), qPrintable(m_name));
            continue;
        }

        if ((mt.width & 15) || (mt.height & 15))
            qWarning("Texture %s (%d x %d) is not aligned", qPrintable(name), mt.width, mt.height);

        QByteArray pixels;
        pixels.resize(mt.width * mt.height);
        stream.readRawData(pixels.data(), pixels.size());

        Texture texture;

        if (!name.startsWith("*") && checkFullbrights(pixels)) {
            texture.name = name;
            texture.image = createTexture(pixels, mt.width, mt.height, TexPref::NoBright);
            m_textures[i] = texture;

            texture.name = u"%1_glow"_s.arg(name);
            texture.image = createTexture(pixels, mt.width, mt.height, TexPref::Fullbright);
            m_textures.push_back(texture);
        } else {
            texture.name = name;
            texture.image = createTexture(pixels, mt.width, mt.height);
            m_textures[i] = texture;
        }

        if (name.startsWith("sky")) {
            skyLoadTexture(texture);
            continue;
        }
    }
}

void ModFile::loadPlanes(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        float normal[3];
        float dist;
        qint32 type;
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadPlanes: funny lump size in: %s.bsp", qPrintable(m_name));

    m_planes.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_planes.size(); ++i) {
        stream >> in.normal[0] >> in.normal[1] >> in.normal[2]
            >> in.dist
            >> in.type;
        Plane &out = m_planes[i];
        out.signbits = 0;
        for (int j = 0; j < 3; ++j) {
            if (in.normal[j] < 0)
                out.signbits |= 1 << j;
        }
        out.normal = QVector3D(in.normal[0], in.normal[1], in.normal[2]);
        out.type = in.type;
        out.dist = in.dist;
    }
}

void ModFile::loadTexInfo(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        float vecs[2][4];
        qint32 miptex;
        qint32 flags;
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadTexInfo: funny lump size in: %s.bsp", qPrintable(m_name));

    m_texInfos.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_texInfos.size(); ++i) {
        stream >> in.vecs[0][0] >> in.vecs[0][1] >> in.vecs[0][2] >> in.vecs[0][3]
            >> in.vecs[1][0] >> in.vecs[1][1] >> in.vecs[1][2] >> in.vecs[1][3]
            >> in.miptex
            >> in.flags;

        TexInfo &out = m_texInfos[i];

        out.flags = in.flags;

        for (int j = 0; j < 4; ++j) {
            out.vecs[0][j] = in.vecs[0][j];
            out.vecs[1][j] = in.vecs[1][j];
        }
        out.texture = m_textures.data() + in.miptex;
    }
}

void ModFile::loadFaces(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        qint16 planenum;
        qint16 side;
        qint32 firstedge;
        qint16 numedges;
        qint16 texinfo;
        quint8 styles[4];
        qint32 lightofs;
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadFaces: funny lump size in: %s.bsp", qPrintable(m_name));

    m_surfaces.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_surfaces.size(); ++i) {
        stream >> in.planenum
            >> in.side
            >> in.firstedge
            >> in.numedges
            >> in.texinfo
            >> in.styles[0] >> in.styles[1] >> in.styles[2] >> in.styles[3]
            >> in.lightofs;
        Surface &out = m_surfaces[i];
        out.firstedge = in.firstedge;
        out.numedges = in.numedges;

        for (int i = 0; i < 4; ++i)
            out.styles[i] = in.styles[i];

        out.flags = 0;
        out.texinfo = m_texInfos.data() + in.texinfo;

        if (in.side)
            out.flags |= DrawFlag::PlaneBack;

        calculateSurfaceExtents(out);

        Q_ASSERT(!m_lightData.isEmpty());

        if (in.lightofs == -1)
            out.samples = nullptr;
        else
            out.samples = reinterpret_cast<quint8 *>(m_lightData.data()) + in.lightofs;

        if (out.texinfo->texture->name.startsWith(u"sky") || out.texinfo->texture->name.startsWith(u"*"))
            out.flags |= DrawFlag::Tiled;
    }
}

void ModFile::loadLighting(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    if (!lump.size)
        return;

    m_lightData.resize(lump.size);
    stream.readRawData(m_lightData.data(), lump.size);
}

void ModFile::loadSubModels(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        float mins[3];
        float maxs[3];
        float origin[3];
        qint32 headnode[MAX_MAP_HULLS];
        qint32 visleafs;
        qint32 firstface;
        qint32 numfaces;
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadSubModels: funny lump size in: %s.bsp", qPrintable(m_name));
    m_subModels.resize(lump.size / sizeof(in));
    for (int i = 0; i < m_subModels.size(); ++i) {
        stream >> in.mins[0] >> in.mins[1] >> in.mins[2]
            >> in.maxs[0] >> in.maxs[1] >> in.maxs[2]
            >> in.origin[0] >> in.origin[1] >> in.origin[2]
            >> in.headnode[0] >> in.headnode[1] >> in.headnode[2] >> in.headnode[3]
            >> in.visleafs
            >> in.firstface
            >> in.numfaces;
        SubModel &out = m_subModels[i];
        out.mins = QVector3D(in.mins[0] - 1, in.mins[1] - 1, in.mins[2] - 1);
        out.maxs = QVector3D(in.maxs[0] + 1, in.maxs[1] + 1, in.maxs[2] + 1);
        out.firstface = in.firstface;
        out.numfaces = in.numfaces;
        out.visleafs = in.visleafs;

        out.hull0 = m_hull0;
        out.hull0.firstclipnode = in.headnode[0];
    }
}

void ModFile::loadEntities(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    QByteArray entities;
    entities.resize(lump.size);
    stream.readRawData(entities.data(), entities.size());
    m_entitiesString = QString::fromLatin1(entities.data());
}

void ModFile::loadLeafs(QDataStream &stream, const Lump &lump)
{
    static constexpr int NUM_AMBIENTS = 4;

    stream.device()->seek(lump.offset);
    struct {
        int contents;
        int visofs;
        qint16 mins[3];
        qint16 maxs[3];
        quint16 firstmarksurface;
        quint16 nummarksurfaces;
        quint8 ambient_level[NUM_AMBIENTS];
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadLeafs: funny lump size in: %s", qPrintable(m_name));

    m_leafs.resize(lump.size / sizeof(in));

    if (m_leafs.size() > 32767)
        qFatal("ModFile::loadLeafs: %d leafs exceeds limit of 32767.", m_leafs.size());

    for (int i = 0; i < m_leafs.size(); ++i) {
        stream >> in.contents
            >> in.visofs
            >> in.mins[0] >> in.mins[1] >> in.mins[2]
            >> in.maxs[0] >> in.maxs[1] >> in.maxs[2]
            >> in.firstmarksurface
            >> in.nummarksurfaces
            >> in.ambient_level[0]
            >> in.ambient_level[1]
            >> in.ambient_level[2]
            >> in.ambient_level[3];

        Leaf &out = m_leafs[i];

        out.mins = QVector3D(in.mins[0], in.mins[1], in.mins[2]);
        out.maxs = QVector3D(in.maxs[0], in.maxs[1], in.maxs[2]);

        out.contents = static_cast<Contents>(in.contents);
        out.parent = nullptr;
    }
}

static inline void setNodeParent(ModFile::Node *node, const ModFile::Node *parent)
{
    node->parent = parent;
    if (static_cast<qint32>(node->contents) < 0)
        return;

    setNodeParent(node->children[0], node);
    setNodeParent(node->children[1], node);
}

void ModFile::loadNodes(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        int planenum;
        qint16 children[2];
        qint16 mins[3];
        qint16 maxs[3];
        quint16 firstface;
        quint16 numfaces;
    } in;
    if (lump.size % sizeof(in))
        qFatal("Mod::loadNodes: funny lump size in: %s.bsp", qPrintable(m_name));

    m_nodes.resize(lump.size / sizeof(in));

    for (int i = 0; i < m_nodes.size(); ++i) {
        stream >> in.planenum
            >> in.children[0] >> in.children[1]
            >> in.mins[0] >> in.mins[1] >> in.mins[2]
            >> in.maxs[0] >> in.maxs[1] >> in.maxs[2]
            >> in.firstface
            >> in.numfaces;

        Node out;
        out.contents = static_cast<Contents>(0);
        out.parent = nullptr;
        out.plane = m_planes.data() + in.planenum;

        for (auto j = 0; j < 2; ++j) {
            quint16 p = in.children[j];
            if (p < m_nodes.size()) {
                out.children[j] = m_nodes.data() + p;
            } else {
                p = 65535 - p;
                if (p < m_leafs.size()) {
                    out.children[j] = reinterpret_cast<Node *>(m_leafs.data() + p);
                } else {
                    qDebug("Mod::loadNodes: invalid leaf index %d (file has only %d leafs)", p, m_leafs.size());
                    out.children[j] = reinterpret_cast<Node *>(m_leafs.data());
                }
            }
        }

        m_nodes[i] = out;
    }

    setNodeParent(m_nodes.data(), nullptr);
}

void ModFile::loadClipNodes(QDataStream &stream, const Lump &lump)
{
    stream.device()->seek(lump.offset);
    struct {
        int planenum;
        short children[2];
    } in;
    if (lump.size % sizeof(in))
        qFatal("ModFile::loadClipNodes: funny lump size in: %s.bsp", qPrintable(m_name));

    auto &clipNodes = m_clipNodes[1];
    clipNodes.resize(lump.size / sizeof(in));
    if (clipNodes.size() > 32767)
        qWarning("%d clipnodes exceeds standard limit of 32767.", clipNodes.size());

    for (int i = 0; i < clipNodes.size(); ++i) {
        stream >> in.planenum
            >> in.children[0] >> in.children[1];
        ClipNode &out = clipNodes[i];
        out.planenum = in.planenum;
        if (out.planenum < 0 || out.planenum >= m_planes.size())
            qFatal("ModFile::loadClipNodes: planenum out of bounds");

        out.children[0] = in.children[0];
        out.children[1] = in.children[1];

        if (out.children[0] >= clipNodes.size())
            out.children[0] -= 65536;
        if (out.children[1] >= clipNodes.size())
            out.children[1] -= 65536;
    }
}

void ModFile::skyLoadTexture(const Texture &texture)
{
    const auto &image = texture.image;
    if (image.width() != 256 || image.height() != 128) {
        qWarning("Sky texture %s is %d x %d, expected 256 x 128",
                 qPrintable(texture.name), image.width(), image.height());
        if (image.width() < 2 || image.height() < 1)
            return;
    }

    Texture texture1;
    texture1.name = texture.name + u"_front"_s;
    texture1.image = image.copy(0, 0, 128, 128);

    for (int i = 0; i < texture1.image.width(); ++i) {
        for (int j = 0; j < texture1.image.height(); ++j) {
            if (texture1.image.pixelColor(i, j) == QColor(Qt::black))
                texture1.image.setPixelColor(i, j, QColor(Qt::transparent));
        }
    }

    Texture texture2;
    texture2.name = texture.name + u"_back"_s;
    texture2.image = image.copy(128, 0, 128, 128);

    m_textures.push_back(texture1);
    m_textures.push_back(texture2);
}

void ModFile::buildLightmaps()
{
    m_lightmaps.resize(LMBLOCK_WIDTH * LMBLOCK_HEIGHT * sizeof(qint32));
    m_lightmaps.fill(0);

    m_allocated.resize(LMBLOCK_WIDTH);
    m_allocated.fill(0);

    for (int i = 0; i < m_subModels.size(); ++i) {
        auto &subModel = m_subModels[i];
        QHash<const Texture *, Subset> subsets;
        for (int i = subModel.firstface; i < subModel.firstface + subModel.numfaces; ++i) {
            auto &surface = m_surfaces[i];
            if (surface.numedges <= 2)
                continue;

            auto &subset = subsets[surface.texinfo->texture];
            subset.texInfo = surface.texinfo;
            subset.flags = surface.flags;

            if (!(surface.flags & DrawFlag::Tiled))
                createSurfaceLightmap(surface);

            buildSurfaceDisplayList(surface, subset);
        }

        const bool worldModel = i == 0;
        for (const auto &subset : subsets.values()) {
            const auto &name = subset.texInfo->texture->name.toLower();
            if (name.startsWith(u"*") && worldModel) {
                if (name.startsWith(u"*lava"))
                    subModel.subsets[1].push_back(subset);
                else if (name.startsWith("*slime"))
                    subModel.subsets[2].push_back(subset);
                else if (name.startsWith("*tele"))
                    subModel.subsets[3].push_back(subset);
                else
                    subModel.subsets[4].push_back(subset);
            } else if (name.startsWith(u"sky") && worldModel) {
                subModel.subsets[5].push_back(subset);
            } else {
                subModel.subsets[0].push_back(subset);
            }
        }
    }
}

void ModFile::allocBlock(int w, int h, int *x, int *y)
{
    qint32 best = LMBLOCK_HEIGHT;

    for (int i = 0; i < LMBLOCK_WIDTH - w; ++i) {
        qint32 best2 = 0;
        qint32 j = 0;
        for (j = 0; j < w; ++j) {
            if (m_allocated[i + j] >= best)
                break;
            if (m_allocated[i + j] > best2)
                best2 = m_allocated[i + j];
        }
        if (j == w) {
            *x = i;
            *y = best = best2;
        }
    }

    if (best + h > LMBLOCK_HEIGHT)
        qWarning("AllocBlock: full");

    for (int i = 0; i < w; ++i)
        m_allocated[*x + i] = best + h;
}

void ModFile::buildLightMap(const Surface &surface, quint8 *data, int offset, int stride)
{
    const qint32 smax = (surface.extents[0] >> 4) + 1;
    const qint32 tmax = (surface.extents[1] >> 4) + 1;

    const auto *lightmap = surface.samples;

    static constexpr qint32 MAX_LIGHTMAPS = 4;

    if (lightmap) {
        int maps = 0;
        for (; maps < MAX_LIGHTMAPS && surface.styles[maps] != 255; ++maps) {
            auto *dest = data + offset + maps;
            for (int i = 0; i < tmax; ++i) {
                for (int j = 0; j < smax; ++j)
                    dest[j * sizeof(qint32)] = lightmap[j];
                lightmap += smax;
                dest += stride;
            }
        }

        for (; maps < MAX_LIGHTMAPS; ++maps) {
            auto *dest = data + offset + maps;
            for (int i = 0; i < tmax; ++i) {
                for (int j = 0; j < smax; ++j)
                    dest[j * sizeof(qint32)] = 0;
                dest += stride;
            }
        }
    }
}

void ModFile::createSurfaceLightmap(Surface &surface)
{
    const qint32 smax = (surface.extents[0] >> 4) + 1;
    const qint32 tmax = (surface.extents[1] >> 4) + 1;

    allocBlock(smax, tmax, &surface.light_s, &surface.light_t);
    auto *base = reinterpret_cast<quint8 *>(m_lightmaps.data());
    auto offset = (surface.light_t * LMBLOCK_WIDTH + surface.light_s) * sizeof(qint32);
    buildLightMap(surface, base, offset, LMBLOCK_WIDTH * sizeof(qint32));
}

void ModFile::buildSurfaceDisplayList(const Surface &surface, Subset &subset)
{
    float s0 = 0.0f;
    float t0 = 0.0f;
    float sdiv = 128.0f;
    float tdiv = 128.0f;

    if (!(surface.flags & DrawFlag::Tiled)) {
        s0 = surface.texinfo->vecs[0][3];
        t0 = surface.texinfo->vecs[1][3];
        sdiv = surface.texinfo->texture->image.width();
        tdiv = surface.texinfo->texture->image.height();
    }

    const auto *texInfo = surface.texinfo;
    QVector<Vertex> vertexes;
    for (int j = 0; j < surface.numedges; ++j) {
        const auto index = m_surfaceEdges[surface.firstedge + j];

        QVector3D position;
        if (index > 0)
            position = m_vertexes[m_edges[index].v[0]];
        else
            position = m_vertexes[m_edges[-index].v[1]];

        auto u = QVector3D::dotProduct(position, QVector3D(texInfo->vecs[0][0], texInfo->vecs[0][1], texInfo->vecs[0][2]));
        u += s0;

        auto v = QVector3D::dotProduct(position, QVector3D(texInfo->vecs[1][0], texInfo->vecs[1][1], texInfo->vecs[1][2]));
        v += t0;

        if (j >= 3) {
            vertexes.push_back(vertexes[0]);
            vertexes.push_back(vertexes[vertexes.length() - 2]);
        }

        QVector2D texCoords[2];
        texCoords[1].setX(u / sdiv);
        texCoords[1].setY(v / tdiv);
        if (!(surface.flags & DrawFlag::Tiled)) {
            texCoords[0].setX((u - surface.texturemins[0] + surface.light_s * 16 + 8) / (LMBLOCK_WIDTH * 16));
            texCoords[0].setY((v - surface.texturemins[1] + surface.light_t * 16 + 8) / (LMBLOCK_HEIGHT * 16));
        } else {
            texCoords[0] = texCoords[1];
        }

        Vertex vertex;
        vertex.position = position;
        vertex.texCoords[0] = texCoords[0];
        vertex.texCoords[1] = texCoords[1];

        for (int i = 0; i < 4; ++i) {
            float style = surface.styles[i];
            vertex.styles[i] = style != 255 ? style : 0.0f;
        }

        vertexes.push_back(vertex);
    }

    subset.vertexes.append(vertexes);
}

void ModFile::calculateSurfaceExtents(Surface &surface) const
{
    float mins[2];
    float maxs[2];

    mins[0] = mins[1] = std::numeric_limits<float>::max();
    maxs[0] = maxs[1] = -std::numeric_limits<float>::max();

    const auto *tex = surface.texinfo;

    for (int i = 0; i < surface.numedges; ++i) {
        const auto e = m_surfaceEdges[surface.firstedge + i];
        const QVector3D *v;
        if (e >= 0)
            v = &m_vertexes[m_edges[e].v[0]];
        else
            v = &m_vertexes[m_edges[-e].v[1]];

        for (int j = 0; j < 2; ++j) {
            float val = v->x() * tex->vecs[j][0] +
                        v->y() * tex->vecs[j][1] +
                        v->z() * tex->vecs[j][2] + tex->vecs[j][3];
            if (val < mins[j])
                mins[j] = val;
            if (val > maxs[j])
                maxs[j] = val;
        }
    }

    int bmins[2];
    int bmaxs[2];

    for (int i = 0; i < 2; ++i) {
        bmins[i] = qFloor(mins[i] / 16);
        bmaxs[i] = qCeil(maxs[i] / 16);
        surface.texturemins[i] = bmins[i] * 16;
        surface.extents[i] = (bmaxs[i] - bmins[i]) * 16;
    }
}

void ModFile::makeHull0()
{
    auto &clipNodes = m_clipNodes[0];
    clipNodes.resize(m_nodes.size());

    m_hull0.lastclipnode = clipNodes.size() - 1;
    m_hull0.clipnodes = clipNodes.data();
    m_hull0.planes = m_planes.data();

    for (int i = 0; i < clipNodes.size(); ++i) {
        const Node &node = m_nodes[i];
        ClipNode &out = clipNodes[i];
        out.planenum = node.plane - m_planes.data();
        for (int j = 0; j < 2; ++j) {
            auto &child = node.children[j];
            if (static_cast<qint32>(child->contents) < 0)
                out.children[j] = static_cast<qint32>(child->contents);
            else
                out.children[j] = child - m_nodes.data();
        }
    }
}

void ModFile::calculateHullShapes(Hull *hull, int nodeNum, QVector<aiPlane> &planes)
{
    // check for empty
    if (nodeNum < 0) {
        if (nodeNum != static_cast<int>(Contents::Empty)) {
            const auto &points = compute_convex_mesh_points(planes);
            if (points.size() < 3)
                return;

            QVector<Point_3> vertexes;
            for (const auto &p : std::as_const(points))
                vertexes.push_back(Point_3(p.x, p.y, p.z));

            Polyhedron polyhedron;
            CGAL::convex_hull_3(vertexes.begin(), vertexes.end(), polyhedron);

            const auto contents = static_cast<Contents>(nodeNum);
            if (contents == Contents::Lava)
                hull->subsets[1].push_back(polyhedron);
            else if (contents == Contents::Slime)
                hull->subsets[2].push_back(polyhedron);
            else if (contents == Contents::Water)
                hull->subsets[3].push_back(polyhedron);
            else if (contents == Contents::Sky)
                hull->subsets[4].push_back(polyhedron);
            else if (contents == Contents::Solid)
                hull->subsets[0].push_back(polyhedron);
        }

        return; // empty
    }

    const ClipNode &node = hull->clipnodes[nodeNum];
    Plane plane = hull->planes[node.planenum];

    planes.push_back(aiPlane(-plane.normal.x(), -plane.normal.y(), -plane.normal.z(), -plane.dist));
    calculateHullShapes(hull, node.children[0], planes);
    planes.pop_back();

    planes.push_back(aiPlane(plane.normal.x(), plane.normal.y(), plane.normal.z(), plane.dist));
    calculateHullShapes(hull, node.children[1], planes);
    planes.pop_back();
}

static inline int nextPowerOfTwo(int value)
{
    int power = 1;
    while (power < value)
        power *= 2;
    return power;
}

QImage ModFile::createTexture(const QByteArray &pixels, int width, int height, TexPref flags) const
{
    Q_ASSERT(m_paletteFile != nullptr);

    QVector<quint32> table;
    switch (flags) {
    case TexPref::Fullbright:
        table = m_paletteFile->d8to24tableFbright();
        break;
    case TexPref::NoBright:
        table = m_paletteFile->d8to24tableNobright();
        break;
    case TexPref::None:
    default:
        table = m_paletteFile->d8to24table();
        break;
    }

    quint8 *imageData = new quint8[pixels.size() * 4];
    auto *out = reinterpret_cast<quint32 *>(imageData);
    for (int i = 0; i < pixels.size(); ++i) {
        const quint8 index = pixels[i];
        *out++ = table[index];
    }

    QImage img(imageData, width, height, QImage::Format_RGBA8888, [](void *ptr) { delete reinterpret_cast<quint8 *>(ptr); } );
    
    int scaledWidth = nextPowerOfTwo(width);
    int scaledHeight = nextPowerOfTwo(height);
    
    if (scaledWidth != width || scaledHeight != height)
        img = img.scaled(scaledWidth, scaledHeight, Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    
    return img;
}
