#include "dbusmanager.h"
#include <QDebug>
#include <QTimer>
#include <QString>
#include <QQmlEngine>

#include <QDBusConnection>
#include <QDBusMessage>
#include <QDBusPendingCall>
#include <QObject>

DBusManager::DBusManager(QObject* parent) : QObject(parent),
    m_bus(QDBusConnection::sessionBus()),
    m_travelableDis(0)
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

    // check if the call was successful
    if(battery.type() == QDBusMessage::ErrorMessage ) {
        qDebug() << "Error: " << qPrintable(battery.errorMessage());
        exit(1);
    }

    //calculate raw data
    m_battery = battery.arguments().at(0).toInt();
    m_travelableDis = (1950/100)*(m_battery);


    //emit signals
    emit batteryChanged(m_battery);
    emit travelableDisChanged(m_travelableDis);
}

qreal DBusManager::getBattery() {
    //qDebug() << "get battery: " << m_battery;
    return m_battery;
}

qreal DBusManager::getTravelableDis() {
    //qDebug() << "get m_travelableDistance: " << m_travelableDis;
    m_travelableDis_2 = QString::number(m_travelableDis,'f',1).toDouble();
    return m_travelableDis_2;
}

void DBusManager::sendToDBus(const QVariant &data) {
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


