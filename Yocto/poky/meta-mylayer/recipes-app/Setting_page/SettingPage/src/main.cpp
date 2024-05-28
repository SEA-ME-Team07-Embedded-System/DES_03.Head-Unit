#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "someipmanager.h"
#include "methodcallsomeipmanager.h"
#include "piracersomeipmanager.h"
#include <QQmlContext>
#include <QCoreApplication>

int main(int argc, char *argv[])
{

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

    //SOMEIP Attribute for Piracer
    PiracerSomeIPManager piracersomeipManager;
    piracersomeipManager.initVsomeipClient();
    piracersomeipManager.startSubscribeBattery();
    piracersomeipManager.startSubscribeGear();
    piracersomeipManager.startSubscribeMode();

    //SOMEIP MethodCall for Piracer
    MethodCallSomeIPManager methodcallsomeipmanager;
    qmlRegisterType<MethodCallSomeIPManager>("com.example", 1, 0, "PiracerSomeIPManager");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/Settingpage.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    // Expose objects to QML
    engine.rootContext()->setContextProperty("someipManager", &someipManager);
    engine.rootContext()->setContextProperty("piracersomeipManager", &piracersomeipManager);

    engine.load(url);

    return app.exec();
}
