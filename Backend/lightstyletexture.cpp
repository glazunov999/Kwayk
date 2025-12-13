#include "lightstyletexture.h"

#include <QByteArray>
#include <QSize>
#include <QDateTime>

static constexpr int MAX_LIGHTSTYLES = 64;

LightStyleTexture::LightStyleTexture()
{
    setSize(QSize(MAX_LIGHTSTYLES, 1));
    setFormat(QQuick3DTextureData::RGBA8);
    setHasTransparency(false);
    updateTexture();
}

QStringList LightStyleTexture::styles() const
{
    return m_styles;
}

void LightStyleTexture::setStyles(const QStringList &styles)
{
    if (m_styles == styles)
        return;

    m_styles = styles;
    emit stylesChanged(m_styles);
    updateTexture();
}

void LightStyleTexture::animateLights(qreal time)
{
    m_time = time;
    updateTexture();
}

void LightStyleTexture::updateTexture()
{
    QByteArray imageData;
    imageData.resize(MAX_LIGHTSTYLES * 4);
    imageData.fill(0);

    quint8 *data = reinterpret_cast<quint8 *>(imageData.data());

    int i = m_time * 10.0f;
    for (int j = 0; j < MAX_LIGHTSTYLES; ++j) {
        quint16 value;
        if (j >= m_styles.size() || m_styles[j].isEmpty()) {
            value = 256;
        } else {
            int k = i % m_styles[j].size();
            k = m_styles[j].at(k).toLatin1() - 'a';
            k *= 22;
            value = k;
        }

        data[j * 4 + 0] = value & 0xFF;
        data[j * 4 + 1] = (value >> 8) & 0xFF;
        data[j * 4 + 2] = 0;
        data[j * 4 + 3] = 255;
    }

    setTextureData(imageData);
}
