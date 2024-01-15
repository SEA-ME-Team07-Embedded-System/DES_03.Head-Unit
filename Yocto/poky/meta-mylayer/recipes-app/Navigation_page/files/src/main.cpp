#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "someipmanager.h"
#include <QQmlContext>
#include <QCoreApplication>
#include <QtWebEngine/QtWebEngine>


int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP","threaded");

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //SOMEIP for CAN
    SomeIPManager someipManager;
    someipManager.initVsomeipClient();
    someipManager.startSubscribeRPM();
    someipManager.startSubscribeFDis();
    someipManager.startSubscribeRDis();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/Navipage.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    // Expose objects to QML
    engine.rootContext()->setContextProperty("someipManager", &someipManager);

    engine.load(url);

    return app.exec();
}
