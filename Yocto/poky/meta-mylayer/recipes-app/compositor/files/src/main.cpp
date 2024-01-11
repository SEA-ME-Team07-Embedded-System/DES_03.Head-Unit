#include <QtCore/QUrl>
#include <QtCore/QDebug>
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QQmlContext>
#include "piracersomeipmanager.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

   //SOMEIP Attribute for Piracer
    PiracerSomeIPManager piracersomeipManager;
    piracersomeipManager.initVsomeipClient();
    piracersomeipManager.startSubscribeBattery();
    piracersomeipManager.startSubscribeGear();
    piracersomeipManager.startSubscribeMode();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    // Expose objects to QML
    engine.rootContext()->setContextProperty("piracersomeipManager", &piracersomeipManager);

    engine.load(url);

    return app.exec();
}
