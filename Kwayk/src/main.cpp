#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSurfaceFormat>
#include <QQuick3D>
#include <QQmlContext>

#include "import_qml_plugins.h"

#include "mousecontroller.h"
#include "keycontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MouseController mouseController;
    KeyController keyController;
    keyController.install(&app);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QGuiApplication::quit);
    engine.rootContext()->setContextProperty("mouseController", &mouseController);
    engine.rootContext()->setContextProperty("keyController", &keyController);
    engine.rootContext()->setContextProperty("BUILD_TIME", __TIME__);
    engine.rootContext()->setContextProperty("BUILD_DATE", __DATE__);

    QSurfaceFormat::setDefaultFormat(QQuick3D::idealSurfaceFormat());

    engine.addImportPath(QStringLiteral(":/"));
    const QUrl url(QStringLiteral("qrc:/Kwayk/App.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
