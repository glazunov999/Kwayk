#include "wadfile.h"
#include "palettefile.h"

#include <QIODevice>
#include <QImage>
#include <QDir>

using namespace Qt::Literals::StringLiterals;

[[nodiscard]] static inline constexpr quint32 makeMagic(const char *string)
{
    return ((uint32_t)((string[0] << 24) + (string[1] << 16) + (string[2] << 8) + string[3]));
}

static constexpr quint32 Wad2Magic = makeMagic("2DAW");

WadFile::WadFile(const PaletteFile *paletteFile)
    : m_paletteFile{paletteFile}
{
}

QString WadFile::loadFromFile(const QString &inputPath, QStringList *generatedFiles)
{
    const auto &fileName = inputPath + u"gfx.wad"_s;
    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly))
        return u"gfx.wad open error"_s;

    QDataStream stream(&file);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream.setFloatingPointPrecision(QDataStream::SinglePrecision);

    WadHeader header;
    stream >> header;
    if (header.ident != Wad2Magic)
        return u"Incorrect WAD2 ident: %1"_s.arg(header.ident);

    QString outputPath = inputPath;
    if (!outputPath.endsWith("/"))
        outputPath += "/";

    outputPath += u"gfxwad/"_s;
    QDir outputDirectory(outputPath);
    if (!outputDirectory.exists()) {
        if (!outputDirectory.mkpath("."))
            return u"Failed to create directory for file: %1"_s.arg(outputPath);
    }

    stream.device()->seek(header.offset);
    for (qint32 i = 0; i < header.numLumps; ++i) {
        LumpEntry entry;
        stream >> entry;

        const auto offset = file.pos();

        const QString &name = QString::fromLatin1(entry.data);
        QString outputFilePath = outputPath + name + u".png"_s;
        importEntry(file, entry, name, outputFilePath);

        if (generatedFiles)
            *generatedFiles << outputFilePath;

        file.seek(offset);
    }

    return loadConcharsFromFile(inputPath, generatedFiles);
}

QString WadFile::importEntry(QFile &file, const LumpEntry &entry, const QString &name, const QString &outputFilePath)
{
    file.seek(entry.offset);

    QDataStream stream(&file);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream.setFloatingPointPrecision(QDataStream::SinglePrecision);

    int width;
    int height;

    QVector<quint32> table;

    if (name == u"CONCHARS") {
        width = height = 128;
        table = m_paletteFile->d8to24tableConchars();
    } else {
        stream >> width >> height;
        table = m_paletteFile->d8to24table();
    }

    QByteArray pic;
    pic.resize(width * height);
    stream.readRawData(pic.data(), pic.size());

    QByteArray imageData;
    imageData.resize(4 * pic.size());
    auto *out = reinterpret_cast<quint32 *>(imageData.data());
    for (int i = 0; i < pic.size(); ++i) {
        const quint8 index = pic[i];
        *out++ = table[index];
    }

    QImage img(reinterpret_cast<const quint8 *>(imageData.data()), width, height, QImage::Format_RGBA8888);
    if (!img.save(outputFilePath, "png"))
        return u"Could not save gfx: %1.png"_s.arg(outputFilePath);

    return QString();
}

QString WadFile::loadConcharsFromFile(const QString &inputPath, QStringList *generatedFiles)
{
    const auto &fileName = inputPath + u"gfxwad/CONCHARS.png"_s;

    QImage img;
    if (!img.load(fileName))
        return u"CONCHARS.png open error"_s;

    for (int i = 0; i < 16; ++i) {
        for (int j = 0; j < 16; ++j) {
            const auto img2 = img.copy(j * 8, i * 8, 8, 8);
            const auto outputFilePath = inputPath + u"gfxwad/CONCHARS_%1.png"_s.arg(i * 16 + j);
            if (!img2.save(outputFilePath, "png"))
                return u"Failed to save file: %1"_s.arg(outputFilePath);

            if (generatedFiles)
                *generatedFiles << outputFilePath;
        }
    }

    return QString();
}

QDataStream &operator>>(QDataStream &stream, WadFile::WadHeader &header)
{
    stream >> header.ident >> header.numLumps >> header.offset;
    return stream;
}

QDataStream &operator>>(QDataStream &stream, WadFile::LumpEntry &entry)
{
    stream >> entry.offset >> entry.diskSize >> entry.size
           >> entry.type >> entry.compression >> entry.pad[0] >> entry.pad[1];
    stream.readRawData(entry.data, 16);
    return stream;
}
