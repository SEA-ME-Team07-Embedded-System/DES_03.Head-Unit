#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "someipmanager.h"
#include <QQmlContext>
#include "dbusmanager.h"
#include "someipmanager.h"
#include <QCoreApplication>
#include <QtDBus/QDBusConnection>
#include <QtDBus/QDBusInterface>



int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //DBus
    qmlRegisterType<DBusManager>("com.example", 1, 0, "DBusManager");
    DBusManager dbusManager; // Create an instance of the RPMManager class

    //SOMEIP
    SomeIPManager someipManager;
    someipManager.initVsomeipClient();
    someipManager.startSubscribeRPM();
    someipManager.startSubscribeFDis();
    someipManager.startSubscribeRDis();
    qmlRegisterType<SomeIPManager>("someip", 1, 0, "SomeIPManager");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    //connect qml with c++ class
    engine.rootContext()->setContextProperty("someipManager", &someipManager);
    engine.load(url);



    return app.exec();
}
