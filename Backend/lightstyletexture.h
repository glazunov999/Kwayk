#ifndef LIGHTSTYLETEXTURE_H
#define LIGHTSTYLETEXTURE_H

#include <QQuick3DTextureData>
#include <QStringList>

class LightStyleTexture : public QQuick3DTextureData
{
    Q_OBJECT
    Q_PROPERTY(QStringList styles READ styles WRITE setStyles NOTIFY stylesChanged)
    QML_ELEMENT

public:
    LightStyleTexture();

    QStringList styles() const;
    void setStyles(const QStringList &styles);

    Q_INVOKABLE void animateLights(qreal time);

signals:
    void stylesChanged(const QStringList &styles);

private:
    void updateTexture();

    QStringList m_styles;
    qreal m_time = 0.0f;
};

#endif // LIGHTSTYLETEXTURE_H
