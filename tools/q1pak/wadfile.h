#ifndef WADFILE_H
#define WADFILE_H

#include <QString>
#include <QByteArray>
#include <QDataStream>
#include <QFile>

class PaletteFile;

class WadFile
{
public:
    struct WadHeader {
        qint32 ident;
        qint32 numLumps;
        qint32 offset;
    };

    struct LumpEntry {
        quint32 offset;
        quint32 diskSize;
        quint32 size;
        quint8 type;
        quint8 compression;
        quint8 pad[2];
        char data[16];
    };

    explicit WadFile(const PaletteFile *paletteFile);

    QString loadFromFile(const QString &inputPath, QStringList *generatedFiles);

private:
    QString importEntry(QFile &file, const LumpEntry &entry, const QString &name, const QString &outputFilePath);
    QString loadConcharsFromFile(const QString &inputPath, QStringList *generatedFiles);

    const PaletteFile *m_paletteFile = nullptr;
};

QDataStream &operator>>(QDataStream &stream, WadFile::WadHeader &header);
QDataStream &operator>>(QDataStream &stream, WadFile::LumpEntry &entry);

#endif // WADFILE_H
