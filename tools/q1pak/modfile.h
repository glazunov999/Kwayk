#ifndef MODFILE_H
#define MODFILE_H

#include <QVector>
#include <QVector3D>
#include <QDir>
#include <QImage>
#include <QHash>
#include <QVariant>

#include <assimp/scene.h>

#include <CGAL/Polyhedron_3.h>
#include <CGAL/convex_hull_3.h>
#include <CGAL/Plane_3.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

class PaletteFile;

struct aiNode;
struct aiMesh;
struct aiMaterial;

typedef CGAL::Exact_predicates_inexact_constructions_kernel K;
typedef CGAL::Polyhedron_3<K> Polyhedron;
typedef K::Point_3 Point_3;
typedef K::Plane_3 Plane_3;

class ModFile
{
public:
    enum AliasSkinTypes : qint32
    {
        AliasSkinSingle = 0,
        AliasSkinGroup
    };

    struct AliasHeader
    {
        qint32 ident;
        qint32 version;
        float scale[3];
        float scaleOrigin[3];
        float boundingradius;
        float eyeposition[3];
        qint32 numskins;
        qint32 skinwidth;
        qint32 skinheight;
        qint32 numverts;
        qint32 numtris;
        qint32 numframes;
        qint32 synctype;
        qint32 flags;
        float size;
    };

    struct SpriteHeader
    {
        qint32 ident;
        qint32 version;
        qint32 type;
        float boundingradius;
        qint32 width;
        qint32 height;
        qint32 numframes;
        float beamlength;
        qint32 synctype;
    };

    struct Lump
    {
        quint32 offset;
        quint32 size;
    };

    struct Edge
    {
        quint32 v[2];
        quint32 cachededgeoffset;
    };

    struct Texture
    {
        QString name;
        QImage image;
        bool warped;
    };

    struct Plane
    {
        QVector3D normal;
        float dist;
        quint8 type;
        quint8 signbits;
    };

    struct TexInfo
    {
        float vecs[2][4];
        Texture *texture;
        qint32 flags;
    };

    enum DrawFlag
    {
        PlaneBack = 0x2,
        Sky = 0x4,
        Sprite = 0x8,
        Turbulent = 0x10,
        Tiled = 0x20,
        Lava = 0x400,
        Slime = 0x800,
        Teleport = 0x1000,
        Water = 0x2000
    };

    struct Surface
    {
        qint32 visframe;
        qint32 flags;
        qint32 firstedge;
        qint32 numedges;
        qint16 texturemins[2];
        qint16 extents[2];
        quint8 styles[4];
        quint8 *samples;
        qint32 light_s;
        qint32 light_t;
        const TexInfo *texinfo;
    };

    enum class Contents : qint32
    {
        Empty = -1,
        Solid = -2,
        Water = -3,
        Slime = -4,
        Lava = -5,
        Sky = -6,
        Origin = -7,
        Clip = -8,
        Current0 = -9,
        Current90 = -10,
        Current180 = -11,
        Current270 = -12,
        CurrentUp = -13,
        CurrentDown = -14
    };

    struct Vertex
    {
        QVector3D position;
        QVector2D texCoords[2];
        float styles[4];
    };

    struct Subset {
        const TexInfo *texInfo;
        qint32 flags;
        QVector<Vertex> vertexes;
    };

    struct Node
    {
        Contents contents;
        qint32 visframe;
        QVector3D mins;
        QVector3D maxs;
        const Node *parent;
        const Plane *plane;
        Node *children[2];
    };

    struct Leaf
    {
        Contents contents;
        qint32 visframe;
        QVector3D mins;
        QVector3D maxs;
        const Node *parent;
    };

    struct ClipNode
    {
        qint32 planenum;
        qint32 children[2];
    };

    struct Hull
    {
        const ClipNode *clipnodes;
        const Plane *planes;
        qint32 firstclipnode;
        qint32 lastclipnode;
        QVector<Polyhedron> subsets[5]; // 0: solid, 1: lava, 2: slime, 3: water, 4: sky
    };

    static constexpr qint32 MAX_MAP_HULLS = 4;

    struct SubModel
    {
        QVector3D origin;
        QVector3D mins;
        QVector3D maxs;
        qint32 firstface;
        qint32 numfaces;
        qint32 visleafs;
        QVector<Subset> subsets[6]; // 0: solid, 1: lava, 2: slime, 3: tele, 4: water, 5: sky
        Hull hull0;
    };

    enum TexPref
    {
        None = 0,
        Fullbright = 1,
        NoBright = 2
    };

    explicit ModFile(const PaletteFile *paletteFile);

    QString import(QByteArray data, const QString &outputFile, QStringList *generatedFiles = nullptr);

private:
    QString saveAlias(const QString &outputFile, QStringList *generatedFiles);

    void loadAliasModel(QDataStream &stream);
    void loadAllSkins(QDataStream &stream);

    QString saveSprite(const QString &outputFile, QStringList *generatedFiles);

    void loadSpriteModel(QDataStream &stream);
    void loadSpriteFrame(QDataStream &stream, QImage &frame);

    QString saveBrush(const QString &outputFile, QStringList *generatedFiles);
    QString saveTextures(const QString &outputFile, QStringList *generatedFiles);
    QString saveLightmaps(const QString &outputFile, QStringList *generatedFiles);

    QString saveScene(const QString &outputFile, QStringList *generatedFiles);
    QString saveHullScene(const QString &outputFile, QStringList *generatedFiles);

    QString saveEntitiesString(const QString &outputFile, QStringList *generatedFiles);
    QString saveSubModelsExtents(const QString &outputFile, QStringList *generatedFiles);

    void addSceneMeshes(QVector<Subset> subsets, const QString &name, QVector<aiNode *> &nodes, QVector<aiMesh *> &meshes, QVector<aiMaterial *> &materials);
    void addSceneHullMeshes(const QVector<Polyhedron> &subsets, const QString &name, QVector<aiNode *> &nodes, QVector<aiMesh *> &meshes, QVector<aiMaterial *> &materials);

    void loadBrushModel(QDataStream &stream);
    void loadVertexes(QDataStream &stream, const Lump &lump);
    void loadEdges(QDataStream &stream, const Lump &lump);
    void loadSurfaceEdges(QDataStream &stream, const Lump &lump);
    void loadTextures(QDataStream &stream, const Lump &lump);
    void loadPlanes(QDataStream &stream, const Lump &lump);
    void loadTexInfo(QDataStream &stream, const Lump &lump);
    void loadFaces(QDataStream &stream, const Lump &lump);
    void loadLighting(QDataStream &stream, const Lump &lump);
    void loadSubModels(QDataStream &stream, const Lump &lump);
    void loadEntities(QDataStream &stream, const Lump &lump);
    void loadLeafs(QDataStream &stream, const Lump &lump);
    void loadNodes(QDataStream &stream, const Lump &lump);
    void loadClipNodes(QDataStream &stream, const Lump &lump);

    void skyLoadTexture(const Texture &texture);
    void buildLightmaps();
    void allocBlock(int w, int h, int *x, int *y);
    void buildLightMap(const Surface &surface, quint8 *data, int offset, int stride);
    
    void createSurfaceLightmap(Surface &surface);
    void buildSurfaceDisplayList(const Surface &surface, Subset &subset);
    void calculateSurfaceExtents(Surface &surface) const;

    void makeHull0();
    void calculateHullShapes(Hull *hull, int num, QVector<aiPlane> &planes);

    QImage createTexture(const QByteArray &pixels, int width, int height, TexPref flags = TexPref::None) const;

    const PaletteFile *m_paletteFile = nullptr;

    QString m_name;
    AliasHeader m_aliasHeader;
    QVector<QImage> m_skins;
    SpriteHeader m_spriteHeader;
    QVector<QImage> m_frames;
    QVector<QVector3D> m_vertexes;
    QVector<Edge> m_edges;
    QVector<qint32> m_surfaceEdges;
    QVector<Surface> m_surfaces;
    QVector<Texture> m_textures;
    QVector<Plane> m_planes;
    QVector<TexInfo> m_texInfos;
    QByteArray m_lightData;
    QVector<SubModel> m_subModels;
    QVector<Leaf> m_leafs;
    QVector<Node> m_nodes;
    QVector<ClipNode> m_clipNodes[2];
    Hull m_hull0;
    QString m_entitiesString;
    QByteArray m_lightmaps;
    QVector<qint32> m_allocated;
};

#endif // MODFILE_H
