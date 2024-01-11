#ifndef SOMEIPMANAGER_H
#define SOMEIPMANAGER_H

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

class SomeIPManager : public QObject
{
    Q_OBJECT
public:
    explicit SomeIPManager(QObject *parent = nullptr);

    Q_PROPERTY(uint8_t rpm READ rpm WRITE setRpm NOTIFY rpmChanged FINAL)
    Q_PROPERTY(uint8_t fdis READ fdis WRITE setFDis NOTIFY fdisChanged FINAL)
    Q_PROPERTY(uint8_t rdis READ rdis WRITE setRDis NOTIFY rdisChanged FINAL)
    Q_PROPERTY(uint8_t speed READ speed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(qreal odo READ odo WRITE setOdo NOTIFY odoChanged FINAL)
    Q_PROPERTY(qreal latitude READ latitude WRITE setLatitude NOTIFY latitudeChanged FINAL)
    Q_PROPERTY(qreal longitude READ longitude WRITE setLongitude NOTIFY longitudeChanged FINAL)


    //getter
    uint8_t rpm() const;
    uint8_t fdis() const;
    uint8_t rdis() const;
    uint8_t speed() const;
    qreal odo() const;
    //    qreal travelableDis() const;
    qreal latitude() const;
    qreal longitude() const;

    //setter
    void setRpm(uint8_t newRpm);
    void setFDis(uint8_t newFDis);
    void setRDis(uint8_t newRDis);
    void setSpeed(uint8_t newSpeed);
    void setOdo(qreal newOdo);
    void setLatitude(qreal newLatitude);
    void setLongitude(qreal newLongitude);


    // CommonAPI vSomeIP func()
    void initVsomeipClient();
    void startSubscribeFDis();
    void startSubscribeRDis();
    void startSubscribeRPM();

signals:
    void rpmChanged(uint8_t rpm);
    void fdisChanged(uint8_t fdis);
    void rdisChanged(uint8_t rdis);
    void speedChanged(uint8_t speed);
    void odoChanged(qreal odo);
    void latitudeChanged(qreal latitude);
    void longitudeChanged(qreal longitude);

private:
    // CommonAPI vSomeIP var
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<CANProxy<>> proxy;
    CommonAPI::CallStatus callStatus;

    uint8_t m_rpm;
    uint8_t m_fdis;
    uint8_t m_rdis;
    uint8_t m_speed;
    qreal m_odo;
    qreal m_latitude;
    qreal m_longitude;
};

#endif // SOMEIPMANAGER_H