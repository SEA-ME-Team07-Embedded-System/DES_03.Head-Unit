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
    Q_PROPERTY(uint8_t dis READ dis WRITE setDis NOTIFY disChanged FINAL)
    Q_PROPERTY(uint8_t speed READ speed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(qreal odo READ odo WRITE setOdo NOTIFY odoChanged FINAL)
//    Q_PROPERTY(qreal travelableDis READ travelableDis WRITE setTravelableDis NOTIFY travelableDisChanged FINAL)
    Q_PROPERTY(qreal latitude READ latitude WRITE setLatitude NOTIFY latitudeChanged FINAL)
    Q_PROPERTY(qreal longitude READ longitude WRITE setLongitude NOTIFY longitudeChanged FINAL)


    //getter
    uint8_t rpm() const;
    uint8_t dis() const;
    uint8_t speed() const;
    qreal odo() const;
//    qreal travelableDis() const;
    qreal latitude() const;
    qreal longitude() const;

    //setter
    void setRpm(uint8_t newRpm);
    void setDis(uint8_t newDis);
    void setSpeed(uint8_t newSpeed);
    void setOdo(qreal newOdo);
//    void setTravelableDis(qreal newTravelableDis);
    void setLatitude(qreal newLatitude);
    void setLongitude(qreal newLongitude);


    // CommonAPI vSomeIP func()
    void initVsomeipClient();
    void startSubscribeDis();
    void startSubscribeRPM();

signals:
    void rpmChanged(uint8_t rpm);
    void disChanged(uint8_t dis);
    void speedChanged(uint8_t speed);
    void odoChanged(qreal odo);
//    void travelableDisChanged(qreal travelableDis);
    void latitudeChanged(qreal latitude);
    void longitudeChanged(qreal longitude);

private:
    // CommonAPI vSomeIP var
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<CANProxy<>> proxy;
    CommonAPI::CallStatus callStatus;

    uint8_t m_rpm;
    uint8_t m_dis;
    uint8_t m_speed;
    qreal m_odo;
//    qreal m_travelableDis;
    qreal m_latitude;
    qreal m_longitude;
};

#endif // SOMEIPMANAGER_H
