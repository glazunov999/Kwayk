#include "palettefile.h"

#include <QFile>
#include <QDataStream>

using namespace Qt::Literals::StringLiterals;

QVector<quint32> PaletteFile::d8to24table() const
{
    return m_d8to24table;
}

QVector<quint32> PaletteFile::d8to24tableConchars() const
{
    return m_d8to24tableConchars;
}

QVector<quint32> PaletteFile::d8to24tableFbright() const
{
    return m_d8to24tableFbright;
}

QVector<quint32> PaletteFile::d8to24tableNobright() const
{
    return m_d8to24tableNobright;
}

QString PaletteFile::loadFromFile(const QString &inputPath)
{
    const auto &fileName = inputPath + u"gfx/palette.lmp"_s;
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly))
        return u"gfx/palette.lmp open error"_s;

    QDataStream stream(&file);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream.setFloatingPointPrecision(QDataStream::SinglePrecision);

    m_d8to24table.resize(256);
    for (int i = 0; i < 256; ++i) {
        quint8 r;
        quint8 g;
        quint8 b;

        stream >> r >> g >> b;

        quint32 v = (255 << 24) + (r << 0) + (g << 8) + (b << 16);
        m_d8to24table[i] = v;
    }

    m_d8to24table[255] &= 0x00ffffff;

    m_d8to24tableConchars = m_d8to24table;
    m_d8to24tableConchars[0] &= 0x00ffffff;

    m_d8to24tableFbright = m_d8to24table;
    for (int i = 0; i < 224; ++i)
        m_d8to24tableFbright[i] = (255 << 24);

    m_d8to24tableNobright = m_d8to24table;
    for (int i = 224; i < 256; ++i)
        m_d8to24tableNobright[i] = (255 << 24);

    return QString();
}
