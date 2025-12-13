#ifndef PALETTEFILE_H
#define PALETTEFILE_H

#include <QVector>
#include <QByteArray>

class PaletteFile
{
public:
    QVector<quint32> d8to24table() const;
    QVector<quint32> d8to24tableConchars() const;
    QVector<quint32> d8to24tableFbright() const;
    QVector<quint32> d8to24tableNobright() const;

    QString loadFromFile(const QString &inputPath);

private:
    QVector<quint32> m_d8to24table;
    QVector<quint32> m_d8to24tableConchars;
    QVector<quint32> m_d8to24tableFbright;
    QVector<quint32> m_d8to24tableNobright;
};

#endif // PALETTEFILE_H
