#include "lmpfile.h"
#include "palettefile.h"

#include <QDataStream>
#include <QFileInfo>
#include <QImage>

using namespace Qt::Literals::StringLiterals;

LmpFile::LmpFile(const PaletteFile *paletteFile)
    : m_paletteFile{paletteFile}
{
}

QString LmpFile::import(QByteArray data, const QString &outputFile, QStringList *generatedFiles)
{
    QDataStream stream(data);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream.setFloatingPointPrecision(QDataStream::SinglePrecision);

    int width;
    int height;

    stream >> width >> height;

    QByteArray pic;
    pic.resize(width * height);
    stream.readRawData(pic.data(), pic.size());

    const auto &table = m_paletteFile->d8to24table();

    QByteArray imageData;
    imageData.resize(4 * pic.size());
    auto *out = reinterpret_cast<quint32 *>(imageData.data());
    for (int i = 0; i < pic.size(); ++i) {
        const quint8 index = pic[i];
        *out++ = table[index];
    }

    QFileInfo fi(outputFile);
    const auto outputFilePath = fi.absolutePath() + "/" + fi.baseName() + u".png"_s;

    QImage img(reinterpret_cast<const quint8 *>(imageData.data()), width, height, QImage::Format_RGBA8888);
    if (!img.save(outputFilePath, "png"))
        return u"Could not save gfx: %1"_s.arg(outputFilePath);

    if (generatedFiles)
        *generatedFiles << outputFilePath;

    return QString();
}
