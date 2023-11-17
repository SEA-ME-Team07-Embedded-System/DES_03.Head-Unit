#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtGui/QFont>
#include <QtGui/QFontDatabase>
#include <QQmlContext>
//#include "dbusmanager.h"
#include "someipmanager.h"
#include "piracersomeipmanager.h"
#include <QCoreApplication>
#include <QDBusConnection>
#include <QDBusInterface>

int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP","threaded");
    QGuiApplication app(argc, argv);

    //DBus
    //qmlRegisterType<DBusManager>("com.example", 1, 0, "DBusManager");
    //DBusManager dbusManager; // Create an instance of the RPMManager class

    //SOMEIP for CAN
    SomeIPManager someipManager;
    someipManager.initVsomeipClient();
    someipManager.startSubscribeRPM();
    someipManager.startSubscribeFDis();
    someipManager.startSubscribeRDis();
    qmlRegisterType<SomeIPManager>("com.example", 1, 0, "SomeIPManager");

    //SOMEIP for Piracer
    PiracerSomeIPManager piracersomeipManager;
    piracersomeipManager.initVsomeipClient();
    piracersomeipManager.startSubscribeBattery();
    piracersomeipManager.startSubscribeGear();
    piracersomeipManager.startSubscribeMode();
    piracersomeipManager.modeSelectCall(3);
    piracersomeipManager.modeSelectCall(5);
    piracersomeipManager.modeSelectCall(9);
    qmlRegisterType<PiracerSomeIPManager>("com.example", 1, 0, "PiracerSomeIPManager");

    QFontDatabase::addApplicationFont(":/fonts/DejaVuSans.ttf");
    app.setFont(QFont("DejaVu Sans"));

    QQmlApplicationEngine engine(QUrl("qrc:/qml/dashboard.qml"));

    // Expose objects to QML
    //engine.rootContext()->setContextProperty("dbusManager", &dbusManager);
    engine.rootContext()->setContextProperty("someipManager", &someipManager);
    engine.rootContext()->setContextProperty("piracersomeipManager", &piracersomeipManager);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
