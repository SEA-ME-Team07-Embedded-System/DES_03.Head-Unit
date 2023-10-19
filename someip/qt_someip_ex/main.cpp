#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "canclient.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    CANClient canClient;
    canClient.initVsomeipClient();
    canClient.startSubscribeDis();
    canClient.startSubscribeRPM();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    engine.rootContext()->setContextProperty("canData", &canClient);

    return app.exec();
}
