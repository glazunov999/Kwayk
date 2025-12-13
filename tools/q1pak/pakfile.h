#ifndef PAKFILE_H
#define PAKFILE_H

#include <QString>
#include <QDir>
#include <QHash>
#include <QDataStream>

#include "palettefile.h"

class PakFile
{
public:
    struct PakHeader {
        qint32 ident;
        qint32 offset;
        qint32 numFiles;
    };

    struct PakEntry {
        char data[56];
        qint32 offset;
        qint32 size;
    };

    QString import(const QString &sourceFile, const QDir &outputPath, QStringList *generatedFiles);

private:
    void loadPakEntries(QDataStream &stream);
    QString loadPaletteFile(const QString &inputPath);

    PakHeader m_pakHeader;
    QHash<QString, PakEntry> m_pakEntries;
    QStringList m_generatedFiles;
};

QDataStream &operator>>(QDataStream &stream, PakFile::PakHeader &header);
QDataStream &operator>>(QDataStream &stream, PakFile::PakEntry &entry);

#endif // PAKFILE_H
