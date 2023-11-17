#include "piracersomeipmanager.h"

PiracerSomeIPManager::PiracerSomeIPManager(QObject *parent)
    : QObject{parent}, m_battery(0), m_gear(0), m_mode(0), newMode(0)
{
    std::cout << "piracer client initialize" << std::endl;
    qRegisterMetaType<uint8_t>("uint8_t");
}

uint8_t PiracerSomeIPManager::battery() const
{
    return m_battery;
}

uint8_t PiracerSomeIPManager::gear() const
{
    return m_gear;
}

uint8_t PiracerSomeIPManager::mode() const
{
    return m_mode;
}

void PiracerSomeIPManager::setBattery(uint8_t newBattery)
{
    m_battery = newBattery;
    emit batteryChanged(m_battery);
}

void PiracerSomeIPManager::setGear(uint8_t newGear)
{
    m_gear = newGear;
    emit gearChanged(m_gear);
}

void PiracerSomeIPManager::setMode(uint8_t newMode)
{
    m_mode = newMode;
    emit modeChanged(m_mode);
}

void PiracerSomeIPManager::initVsomeipClient()
{
    runtime = CommonAPI::Runtime::get();

    proxy = runtime->buildProxy<PiracerProxy>("local", "Piracer");
//    std::cout << "Checking availability from PiracerProxy!" << std::endl;

//    while (!proxy->isAvailable())
//        std::this_thread::sleep_for(std::chrono::microseconds(10));
}

void PiracerSomeIPManager::startSubscribeBattery()
{
    proxy->getBatteryAttribute().getChangedEvent().subscribe([&](const uint8_t& battery) {
        setBattery(battery);
        //std::cout << "Received change Battery message: " << int(dis) << std::endl;
    });
}

void PiracerSomeIPManager::startSubscribeGear()
{
    proxy->getGearAttribute().getChangedEvent().subscribe([&](const uint8_t& gear) {
        setGear(gear);
        //std::cout << "Received change Gear message: " << int(gear) << std::endl;
    });
}

void PiracerSomeIPManager::startSubscribeMode()
{
    proxy->getModeAttribute().getChangedEvent().subscribe([&](const uint8_t& mode) {
        setMode(mode);
        //std::cout << "Received change Mode message: " << int(mode) << std::endl;
    });
}

void PiracerSomeIPManager::modeSelectCall(const quint8 &data)
{
    proxy->modeSelect(data, callStatus, returnMessage);
    std::cout << "Got Return Message: '" << returnMessage << "Sent Message: "<< (int)data << "'\n";
}

