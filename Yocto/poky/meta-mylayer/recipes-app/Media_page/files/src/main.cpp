#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QCoreApplication>
#include <QtWebEngine/QtWebEngine>


int main(int argc, char *argv[])
{
    qputenv("QSG_RENDER_LOOP","threaded");
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    
    QGuiApplication app(argc, argv);
    QtWebEngine::initialize();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/Musicpage.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
