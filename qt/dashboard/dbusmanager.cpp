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
    m_rpm(0),
    m_odo(0),
    m_travelableDis(0),
    m_latitude(52.424455),
    m_longitude(10.792025)
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
    QDBusMessage rpm = m_interface->call("get_rpm");
    QDBusMessage distance = m_interface->call("get_distance");
    QDBusMessage battery = m_interface->call("energy_report");

    // check if the call was successful
    if(rpm.type() == QDBusMessage::ErrorMessage || distance.type() == QDBusMessage::ErrorMessage || battery.type() == QDBusMessage::ErrorMessage ) {
        qDebug() << "Error: " << qPrintable(rpm.errorMessage());
        exit(1);
    }

    //calculate raw data
    m_rpm = rpm.arguments().at(0).toInt();
    m_speed = qRound(m_rpm * 2.5 * 3.14 / 60); //cm
    m_rpm = m_rpm * 2.5 / 6.8; //car wheel rpm (2.5cm & 6.8cm for each wheel radius)
    m_distance = distance.arguments().at(0).toInt();
    m_battery = battery.arguments().at(0).toInt();
    m_odo += m_speed*0.1;
    m_travelableDis = (1950/100)*(m_battery);


    //emit signals
    emit speedChanged(m_rpm);
    emit distanceChanged(m_distance);
    emit batteryChanged(m_battery);
    emit odoChanged(m_odo);
    emit travelableDisChanged(m_travelableDis);
    emit latitudeChanged(m_latitude);
    emit longitudeChanged(m_longitude);
}

qreal DBusManager::getSpeed() {
    //qDebug() << "get speed: " << m_speed;
    return m_speed;
}

qreal DBusManager::getDistance() {
    //qDebug() << "get distance: " << m_distance;
    return m_distance;
}

qreal DBusManager::getBattery() {
    //qDebug() << "get battery: " << m_battery;
    return m_battery;
}

qreal DBusManager::getRPM() {
    //qDebug() << "get rpm: " << m_rpm;
    return m_rpm;
}

qreal DBusManager::getODO() {
    //qDebug() << "get odo: " << m_odo;
    m_odo2 = QString::number(m_odo/100,'f',1).toDouble();
    return m_odo2;
}

qreal DBusManager::getTravelableDis() {
    //qDebug() << "get m_travelableDistance: " << m_travelableDis;
    m_travelableDis_2 = QString::number(m_travelableDis,'f',1).toDouble();
    return m_travelableDis_2;
}
qreal DBusManager::getLatitude() {
    //qDebug() << "get latitude: " << m_latitude;
    return m_latitude;
}

qreal DBusManager::getLongitude() {
    //qDebug() << "get longitude: " << m_longitude;
    return m_longitude;
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


