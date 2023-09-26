#ifndef DBUSMANAGER_H
#define DBUSMANAGER_H

#include <QObject>
#include <QtDBus/QDBusInterface>
#include <QtDBus/QDBusConnection>

class DBusManager : public QObject
{
    Q_OBJECT
public:
    explicit DBusManager(QObject* parent = nullptr);

    Q_INVOKABLE void fetchData(); // fetch Rpm from Dbus
    Q_INVOKABLE qreal getSpeed();
    Q_INVOKABLE qreal getDistance();
    Q_INVOKABLE qreal getBattery();
    Q_INVOKABLE qreal getRPM();
    Q_INVOKABLE qreal getODO();
    Q_INVOKABLE qreal getTravelableDis();
    Q_INVOKABLE qreal getLatitude();
    Q_INVOKABLE qreal getLongitude();
    Q_INVOKABLE void sendToDBus(const QVariant &data);

signals:
    void speedChanged(qreal speed);
    void distanceChanged(qreal distance);
    void batteryChanged(qreal battery);
    void odoChanged(qreal odo);
    void travelableDisChanged(qreal travelableDis);
    void latitudeChanged(qreal latitude);
    void longitudeChanged(qreal longitude);

private:
    QDBusConnection m_bus;
    QDBusInterface* m_interface;
    QDBusInterface* m_location_interface;
    qreal m_rpm;
    qreal m_battery;
    qreal m_distance;
    qreal m_speed;
    qreal m_odo;
    qreal m_odo2;
    qreal m_travelableDis;
    qreal m_travelableDis_2;
    qreal m_latitude;
    qreal m_longitude;
};
#endif // DBUSMANAGER_H
