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
    Q_INVOKABLE qreal getBattery();
    Q_INVOKABLE qreal getTravelableDis();
    Q_INVOKABLE void sendToDBus(const QVariant &data);

signals:
    void batteryChanged(qreal battery);
    void travelableDisChanged(qreal travelableDis);

private:
    QDBusConnection m_bus;
    QDBusInterface* m_interface;
    QDBusInterface* m_location_interface;
    qreal m_battery;
    qreal m_travelableDis;
    qreal m_travelableDis_2;

};
#endif // DBUSMANAGER_H
