#ifndef MDL_H
#define MDL_H

#include <QObject>
#include <QUrl>
#include <QQmlEngine>
#include <QVector3D>
#include <QVector2D>
#include <QtQml/qqmlparserstatus.h>

struct Vertex
{
    QVector3D position;
    QVector3D normal;
    QVector2D texCoord;
};

class MdlData;

class Mdl : public QObject, public QQmlParserStatus
{
    Q_OBJECT
    Q_INTERFACES(QQmlParserStatus)

    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)
    QML_ELEMENT

public:
    explicit Mdl(QObject *parent = nullptr);
    ~Mdl() override;

    struct AliasVertex {
        quint8 v[3];
        quint8 lightnormalindex;
    };

    struct AliasFrame {
        int firstpose;
        int numposes;
        float interval;
        AliasVertex bboxmin;
        AliasVertex bboxmax;
        char name[16];
    };

    QUrl source() const;
    void setSource(const QUrl &source);

    QVector<AliasFrame> frames() const;
    QVector<Vertex> poseVertexes() const;
    int vertexesCount() const;

    void classBegin() override;
    void componentComplete() override;

Q_SIGNALS:
    void sourceChanged();
    void loaded();
    void error(const QString &errorString);

private:
    void loadFromSource();
    bool loadAliasModel(QDataStream &stream);
    bool skipAllSkins(QDataStream &stream);
    void loadAliasFrame(QDataStream &stream, AliasFrame &frame, QVector<AliasVertex> &verts);
    void loadAliasGroup(QDataStream &stream, AliasFrame &frame, QVector<AliasVertex> &verts);

    bool m_complete = false;
    QUrl m_source;
    QString m_errorString;
    MdlData *d = nullptr;
};

#endif // MDL_H
