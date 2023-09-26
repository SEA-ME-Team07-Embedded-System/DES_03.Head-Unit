#ifndef MYINTERFACE_H
#define MYINTERFACE_H
#include <QObject>
#include <QtDBus/QDBusInterface>
#include <QtDBus/QDBusConnection>
#include <QtDBus/QDBusMessage>
#include <QtDBus/QDBusReply>
#include <QRandomGenerator>
#include <QTimer>
#include <QDebug>

#define DBUSNAME "com.example.dbusService"
#define DBUSPATH "/com/example/dbusService"

class MyInterface : public QObject
{
    Q_OBJECT

public:
    explicit MyInterface(QObject *parent = nullptr);

    Q_PROPERTY(double speed READ getSpeed WRITE setSpeed NOTIFY speedChanged);

    double getSpeed() const;

public slots:
    void setSpeed(qreal speed);
    void fetchSpeed();

signals:
    void speedChanged(qreal speed);

private:
    QDBusConnection m_bus;
    QDBusInterface* m_interface;
    qreal m_speed;
};

#endif // MYINTERFACE_H
