#ifndef PIRACERSOMEIPMANAGER_H
#define PIRACERSOMEIPMANAGER_H

#include <QObject>
#include <QVariant>
#include <iostream>
#include <string>
#include <unistd.h>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiracerProxy.hpp>
#include <v1/commonapi/PiracerProxyBase.hpp>

// CommonAPI definition
using namespace v1::commonapi;

class PiracerSomeIPManager : public QObject
{
    Q_OBJECT
public:
    explicit PiracerSomeIPManager(QObject *parent = nullptr);

    Q_PROPERTY(uint8_t battery READ battery WRITE setBattery NOTIFY batteryChanged FINAL)
    Q_PROPERTY(uint8_t gear READ gear WRITE setGear NOTIFY gearChanged FINAL)
    Q_PROPERTY(uint8_t mode READ mode WRITE setMode NOTIFY modeChanged FINAL)

    //getter
    uint8_t battery() const;
    uint8_t gear() const;
    uint8_t mode() const;

    //setter
    void setBattery(uint8_t newBattery);
    void setGear(uint8_t newGear);
    void setMode(uint8_t newMode);

    // CommonAPI vSomeIP func()
    void initVsomeipClient();
    void startSubscribeBattery(); //subscribe
    void startSubscribeGear();
    void startSubscribeMode();

public Q_SLOTS:
    Q_INVOKABLE void modeSelectCall(const quint8 &data); //method call


signals:
    void batteryChanged(uint8_t battery);
    void gearChanged(uint8_t gear);
    void modeChanged(uint8_t mode);

private:
    // CommonAPI vSomeIP var
    std::shared_ptr<CommonAPI::Runtime> runtime;
    std::shared_ptr<PiracerProxy<>> proxy;
    CommonAPI::CallStatus callStatus;
    std::string returnMessage;

    uint8_t m_battery;
    uint8_t m_gear;
    uint8_t m_mode;
    uint8_t newMode;

signals:

};

#endif // PIRACERSOMEIPMANAGER_H
