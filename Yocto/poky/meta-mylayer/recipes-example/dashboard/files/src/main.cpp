#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtGui/QFont>
#include <QtGui/QFontDatabase>
#include <QQmlContext>
#include "dbusmanager.h"
#include "someipmanager.h"
#include <QCoreApplication>
#include <QDBusConnection>
#include <QDBusInterface>

int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP","threaded");
    QGuiApplication app(argc, argv);

    //DBus
    qmlRegisterType<DBusManager>("com.example", 1, 0, "DBusManager");
    DBusManager dbusManager; // Create an instance of the RPMManager class

    //SOMEIP
    SomeIPManager someipManager;
    someipManager.initVsomeipClient();
    someipManager.startSubscribeRPM();
    someipManager.startSubscribeDis();
    qmlRegisterType<SomeIPManager>("someip", 1, 0, "SomeIPManager");

    QFontDatabase::addApplicationFont(":/fonts/DejaVuSans.ttf");
    app.setFont(QFont("DejaVu Sans"));

    QQmlApplicationEngine engine(QUrl("qrc:/qml/dashboard.qml"));

    // Expose objects to QML
    //engine.rootContext()->setContextProperty("dbusManager", &dbusManager);
    engine.rootContext()->setContextProperty("someipManager", &someipManager);





    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
