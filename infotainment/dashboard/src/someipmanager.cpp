#include "someipmanager.h"

SomeIPManager::SomeIPManager(QObject *parent)
    : QObject{parent}, m_rpm(0), m_fdis(0), m_rdis(0), m_odo(0), m_latitude(0), m_longitude(0)
{
    std::cout << "can client initialize" << std::endl;
    qRegisterMetaType<uint8_t>("uint8_t");
}

uint8_t SomeIPManager::rpm() const
{
    return m_rpm;
}

void SomeIPManager::setRpm(uint8_t newRpm)
{
    //calculate raw data
    //m_speed = qRound(newRpm * 2.5 * 3.14 / 60); //cm
    //std::cout << "m_speed type & value : " << typeid(m_speed).name() << " " << m_speed << std::endl;
    m_rpm = newRpm * 2.5 / 6.8; //car wheel rpm (2.5cm & 6.8cm for each wheel radius)
    //m_odo += m_speed * 0.1;

    emit rpmChanged(m_rpm);
    //std::cout << "setRpm: " << int(m_rpm) << std::endl;
}

uint8_t SomeIPManager::fdis() const
{
    return m_fdis;
}

uint8_t SomeIPManager::rdis() const
{
    return m_rdis;
}

void SomeIPManager::setFDis(uint8_t newFDis)
{
    m_fdis = newFDis;
    emit fdisChanged(m_fdis);
    //std::cout << "setFDis: " << int(m_fdis) << std::endl;
}

void SomeIPManager::setRDis(uint8_t newRDis)
{
    m_rdis = newRDis;
    emit rdisChanged(m_rdis);
    //std::cout << "setRDis: " << int(m_rdis) << std::endl;
}

void SomeIPManager::initVsomeipClient()
{
    runtime = CommonAPI::Runtime::get();
    proxy = runtime->buildProxy<CANProxy>("local", "can");

    if (!proxy) {
        std::cerr << "Proxy is null!" << std::endl;
        return;
    }

    // std::cout << "Checking availability!" << std::endl;
    // while (!proxy->isAvailable()){
    //     std::this_thread::sleep_for(std::chrono::microseconds(10));
    // }
}

void SomeIPManager::startSubscribeRPM()
{
    proxy->getRpmAttribute().getChangedEvent().subscribe([&](const uint8_t& rpm) {
        setRpm(rpm);
        setSpeed(rpm);
        setOdo(rpm);
        setLatitude(rpm);
        setLongitude(rpm);
        //std::cout << "Received change RPM message: " << int(rpm) << std::endl;
    });
}

void SomeIPManager::startSubscribeRDis()
{
    proxy->getRdisAttribute().getChangedEvent().subscribe([&](const uint8_t& rdis) {
        setRDis(rdis);
        //std::cout << "Received change Rear Distance message: " << int(dis) << std::endl;
    });
}

void SomeIPManager::startSubscribeFDis()
{
    proxy->getFdisAttribute().getChangedEvent().subscribe([&](const uint8_t& fdis) {
        setFDis(fdis);
        //std::cout << "Received change Front Distance message: " << int(dis) << std::endl;
    });
}

uint8_t SomeIPManager::speed() const
{
    return m_speed;
}

void SomeIPManager::setSpeed(uint8_t newSpeed)
{
    m_speed = newSpeed * 2.5 * 3.14 / 60; //cm
    //std::cout << "m_speed type & value : " << typeid(m_speed).name() << " " << int(m_speed) << std::endl;
    //std::cout << "m_rpm type & value : " << typeid(m_rpm).name() << " " << int(m_rpm) << std::endl;
    emit speedChanged(m_speed);
}

qreal SomeIPManager::odo() const
{
    return m_odo;
}

void SomeIPManager::setOdo(qreal newOdo)
{
    m_odo += m_speed * 0.1;
    m_odo *= 10;
    m_odo = qRound(m_odo);
    m_odo /= 10;

    //std::cout << "m_odo type & value : " << typeid(m_odo).name() << " " << int(m_odo) << std::endl;
    emit odoChanged(m_odo);
}


qreal SomeIPManager::latitude() const
{
    return m_latitude;
}

void SomeIPManager::setLatitude(qreal newLatitude)
{
    if (m_latitude == newLatitude)
        return;
    m_latitude = newLatitude;
    emit latitudeChanged(m_latitude);
}

qreal SomeIPManager::longitude() const
{
    return m_longitude;
}

void SomeIPManager::setLongitude(qreal newLongitude)
{
    if (m_longitude == newLongitude)
        return;
    m_longitude = newLongitude;
    emit longitudeChanged(m_longitude);
}
