#ifndef CANCLIENT_H
#define CANCLIENT_H

#include <QtDebug>
#include <QObject>
#include <iostream>
#include <string>
#include <unistd.h>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/CANProxy.hpp>
#include <v1/commonapi/CANProxyBase.hpp>

// CommonAPI definition
using namespace v1::commonapi;

class CANClient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(uint8_t rpm READ rpm WRITE setRpm NOTIFY rpmChanged)
    Q_PROPERTY(uint8_t dis READ dis WRITE setDis NOTIFY disChanged)

public:
    explicit CANClient(QObject *parent = nullptr);
    uint8_t rpm() const;
    uint8_t dis() const;

    // CommonAPI vSomeIP func()
    void initVsomeipClient();
    void startSubscribeDis();
    void startSubscribeRPM();

private:
    uint8_t m_rpm;
    uint8_t m_dis;

    // CommonAPI vSomeIP var
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<CANProxy<>> proxy;
    CommonAPI::CallStatus callStatus;

signals:
    void rpmChanged(uint8_t rpm);
    void disChanged(uint8_t dis);

public slots:
    void setRpm(uint8_t rpm);
    void setDis(uint8_t dis);

};

#endif // CANCLIENT_H
