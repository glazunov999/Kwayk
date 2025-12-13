#ifndef LMPFILE_H
#define LMPFILE_H

#include <QString>

class PaletteFile;

class LmpFile
{
public:
    explicit LmpFile(const PaletteFile *paletteFile);

    QString import(QByteArray data, const QString &outputFile, QStringList *generatedFiles = nullptr);

private:
    const PaletteFile *m_paletteFile;
};

#endif // LMPFILE_H
