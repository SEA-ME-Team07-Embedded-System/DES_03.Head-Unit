#include "dbusmanager.h"
#include <QObject>
#include <QDebug>
#include <QTimer>
#include <QString>
#include <QQmlEngine>
//dbus library
#include <QtDBus/QDBusInterface>
#include <QtDBus/QDBusConnection>
#include <QtDBus/QDBusMessage>
#include <QtDBus/QDBusPendingCall>


DBusManager::DBusManager(QObject* parent) : QObject(parent),
    m_bus(QDBusConnection::sessionBus()),
    m_travelableDis(0),
    m_mode(0),
    m_gear(0)
{

    qmlRegisterType<DBusManager>("com.example", 1, 0, "DBusManager");

    QTimer *timer = new QTimer(this);
    connect(timer, &QTimer::timeout, this, &DBusManager::fetchData);
    timer->start(100);

    //connect to dbus
    m_interface = new QDBusInterface("com.example.dbusService", "/com/example/dbusService", "com.example.dbusService");

    //check if dbus is valid
    if(!m_interface->isValid()){
        qDebug() << "Interface not valid: " << qPrintable(m_interface->lastError().message());
        exit(1);
    }

}


void DBusManager::fetchData() {

    //method call to dbus
    QDBusMessage battery = m_interface->call("energy_report");
    QDBusMessage mode = m_interface->call("get_mode");
    QDBusMessage gear = m_interface->call("get_gear");


    // check if the call was successful
    if(mode.type() == QDBusMessage::ErrorMessage || gear.type() == QDBusMessage::ErrorMessage || battery.type() == QDBusMessage::ErrorMessage ) {
        qDebug() << "Error: " << qPrintable(battery.errorMessage());
        qDebug() << "Error: " << qPrintable(gear.errorMessage());
        qDebug() << "Error: " << qPrintable(mode.errorMessage());
        exit(1);
    }

    //calculate raw data
    m_battery = battery.arguments().at(0).toInt();
    m_travelableDis = (1950/100)*(m_battery);
    m_gear = gear.arguments().at(0).toInt();
    m_mode = mode.arguments().at(0).toInt();


    //emit signals
    emit batteryChanged(m_battery);
    emit gearChanged(m_gear);
    emit modeChanged(m_mode);
    emit travelableDisChanged(m_travelableDis);
}

qreal DBusManager::getBattery() {
    //qDebug() << "get battery: " << m_battery;
    return m_battery;
}

qreal DBusManager::getMode()
{
    qDebug() << "get mode: " << m_mode;
    return m_mode;
}

qreal DBusManager::getGear()
{
    qDebug() << "get gear: " << m_gear;
    return m_gear;
}

qreal DBusManager::getTravelableDis() {
    //qDebug() << "get m_travelableDistance: " << m_travelableDis;
    m_travelableDis_2 = QString::number(m_travelableDis,'f',1).toDouble();
    return m_travelableDis_2;
}

void DBusManager::mode_select(const QVariant &data) {
    qDebug() << "mode data : " << data;

    QDBusMessage message = QDBusMessage::createMethodCall(
        "com.example.dbusService",          // target service name
        "/com/example/dbusService",   // path to the remote object
        "com.example.dbusService", // the interface
        "mode_select"                     // the method of interface
        );
    //qDebug() << "mode data : " << data;
    message.setArguments(QList<QVariant>() << data);

    QDBusPendingCall call = QDBusConnection::sessionBus().asyncCall(message);
}

void DBusManager::gear_select(const QVariant &data)
{
    qDebug() << "gear data : " << data;

    QDBusMessage message = QDBusMessage::createMethodCall(
        "com.example.dbusService",          // target service name
        "/com/example/dbusService",   // path to the remote object
        "com.example.dbusService", // the interface
        "gear_select"                     // the method of interface
        );
    //qDebug() << "gear data : " << data;
    message.setArguments(QList<QVariant>() << data);

    QDBusPendingCall call = QDBusConnection::sessionBus().asyncCall(message);
}
