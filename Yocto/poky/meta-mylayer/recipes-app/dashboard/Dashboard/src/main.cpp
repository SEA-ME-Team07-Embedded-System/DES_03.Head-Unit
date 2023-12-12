#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtGui/QFont>
#include <QtGui/QFontDatabase>
#include <QQmlContext>
#include "someipmanager.h"
#include "methodcallsomeipmanager.h"
#include "piracersomeipmanager.h"
#include <QCoreApplication>

int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP","threaded");
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


    QFontDatabase::addApplicationFont(":/fonts/DejaVuSans.ttf");
    app.setFont(QFont("DejaVu Sans"));

    QQmlApplicationEngine engine(QUrl("qrc:/qml/dashboard.qml"));

    // Expose objects to QML
    engine.rootContext()->setContextProperty("someipManager", &someipManager);
    engine.rootContext()->setContextProperty("piracersomeipManager", &piracersomeipManager);

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
