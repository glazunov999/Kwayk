#include <QCoreApplication>
#include <QCommandLineParser>
#include <QScopedPointer>
#include <QDir>
#include <QDebug>

#include "modfile.h"
#include "pakfile.h"

using namespace Qt::Literals::StringLiterals;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // Setup command line arguments
    QCommandLineParser cmdLineParser;
    cmdLineParser.addHelpOption();
    cmdLineParser.addPositionalArgument(u"sourceFilename"_s, u"Asset file to be imported"_s);
    QCommandLineOption outputPathOption({ "outputPath", "o" }, u"Sets the location to place the generated file(s). Default is the current directory"_s, u"outputPath"_s, QDir::currentPath());
    cmdLineParser.addOption(outputPathOption);

    cmdLineParser.process(app);

    QDir outputDirectory = QDir::currentPath();
    if (cmdLineParser.isSet(outputPathOption)) {
        outputDirectory = QDir(cmdLineParser.value(outputPathOption));
        if (!outputDirectory.exists()) {
            if (!outputDirectory.mkpath(QStringLiteral("."))) {
                qCritical() << "Failed to create export directory: " << outputDirectory.path();
                return 2;
            }
        }
    }

    const auto &pakFileNames = cmdLineParser.positionalArguments();
    // if there is nothing to do show help
    if (pakFileNames.isEmpty())
        cmdLineParser.showHelp();

    // Convert each pak is possible
    for (const auto &pakFileName : pakFileNames) {
        QStringList generatedFiles;
        PakFile pakFileImporter;
        auto errorMsg = pakFileImporter.import(pakFileName, outputDirectory, &generatedFiles);

        for (const auto &file : generatedFiles)
            qDebug() << "generated file:" << file;

        if (!errorMsg.isEmpty())
            qDebug() << "Failed to import file with error: " << errorMsg;
    }

    return 0;
}
