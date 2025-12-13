#include <QFileInfo>
#include <QString>
#include <QDirIterator>

#include "pakfile.h"
#include "modfile.h"
#include "palettefile.h"
#include "wadfile.h"
#include "lmpfile.h"

using namespace Qt::Literals::StringLiterals;

[[nodiscard]] static inline constexpr quint32 makeMagic(const char *string)
{
    return ((uint32_t)((string[0] << 24) + (string[1] << 16) + (string[2] << 8) + string[3]));
}

static constexpr quint32 PackMagic = makeMagic("KCAP");

QString PakFile::import(const QString &sourceFile, const QDir &outputPath, QStringList *generatedFiles)
{
    QFileInfo fileInfo(sourceFile);
    if (!fileInfo.exists())
        return u"File does not exist"_s;

    m_generatedFiles.clear();

    QFile file(sourceFile);
    if (!file.open(QIODevice::ReadOnly))
        return u"File open error"_s;

    QDataStream stream(&file);
    stream.setByteOrder(QDataStream::LittleEndian);
    stream >> m_pakHeader;
    if (m_pakHeader.ident != PackMagic)
        return u"Incorrect PACK ident %1"_s.arg(m_pakHeader.ident);

    loadPakEntries(stream);

    auto filePath = outputPath.absolutePath();
    if (!filePath.endsWith("/"))
        filePath += "/";

    QString errorString;

    for (auto it = m_pakEntries.begin(); it != m_pakEntries.end(); ++it) {
        const auto &outputFilePath = filePath + it.key();
        QFileInfo outputFileInfo(outputFilePath);
        auto outputDirectory = outputFileInfo.absoluteDir();
        if (!outputDirectory.exists()) {
            if (!outputDirectory.mkpath("."))
                return u"Failed to create directory for file: %1"_s.arg(outputFilePath);
        }

        const auto &pakEntry = it.value();
        file.seek(pakEntry.offset);
        const auto &fileData = file.read(pakEntry.size);

        QFile outputFile(outputFilePath);
        if (outputFile.open(QIODevice::WriteOnly)) {
            outputFile.write(fileData);
            m_generatedFiles << outputFilePath;
        } else {
            return u"File %1 open error"_s.arg(outputFilePath);
        }
    }

    PaletteFile paletteFile;
    errorString = paletteFile.loadFromFile(filePath);
    if (!errorString.isEmpty())
        return errorString;

    WadFile wadFile(&paletteFile);
    errorString = wadFile.loadFromFile(filePath, &m_generatedFiles);
    if (!errorString.isEmpty())
        return errorString;

    QDirIterator it(filePath, {"start.bsp", "e1m1.bsp", "e1m2.bsp", "e1m7.bsp", "*.mdl", "*.spr", "*.lmp"}, QDir::Files | QDir::NoDotAndDotDot, QDirIterator::Subdirectories);
    while (it.hasNext()) {
        const auto outputFilePath = it.next();
        QFile file(outputFilePath);
        if (!file.open(QIODevice::ReadOnly))
            return u"%1 open error"_s.arg(fileInfo.fileName());

        const auto &fileData = file.readAll();
        const auto suffix = QFileInfo(outputFilePath).suffix();
        const auto baseName = QFileInfo(outputFilePath).baseName();

        if (suffix != u"lmp") {
            ModFile modFile(&paletteFile);
            errorString = modFile.import(fileData, outputFilePath, &m_generatedFiles);
        } else if (baseName != u"colormap" && baseName != u"palette") {
            LmpFile lmpFile(&paletteFile);
            errorString = lmpFile.import(fileData, outputFilePath, &m_generatedFiles);
        }
    }

    if (generatedFiles)
        *generatedFiles = m_generatedFiles;

    return errorString;
}

void PakFile::loadPakEntries(QDataStream &stream)
{
    stream.device()->seek(m_pakHeader.offset);
    for (qint32 i = 0; i < m_pakHeader.numFiles / 64; ++i) {
        PakEntry pakEntry;
        stream >> pakEntry;
        const auto &path = QString::fromLatin1(pakEntry.data);
        m_pakEntries[path] = pakEntry;
    }
}

QDataStream &operator>>(QDataStream &stream, PakFile::PakHeader &header)
{
    stream >> header.ident >> header.offset >> header.numFiles;
    return stream;
}

QDataStream &operator>>(QDataStream &stream, PakFile::PakEntry &entry)
{
    stream.readRawData(entry.data, sizeof(entry.data));
    stream >> entry.offset >> entry.size;
    return stream;
}
