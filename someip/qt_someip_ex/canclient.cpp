#include "canclient.h"

CANClient::CANClient(QObject *parent) : QObject(parent), m_rpm(0), m_dis(0)
{
    qDebug() << "success init can client";
}

uint8_t CANClient::rpm() const
{
    return m_rpm;
}

uint8_t CANClient::dis() const
{
    return m_dis;
}

void CANClient::initVsomeipClient()
{
    runtime = CommonAPI::Runtime::get();
    proxy = runtime->buildProxy<CANProxy>("local", "can");
    qDebug() << "Checking availability!";
    while (!proxy->isAvailable())
        std::this_thread::sleep_for(std::chrono::microseconds(10));
}

void CANClient::startSubscribeDis()
{
    proxy->getDisAttribute().getValue(callStatus, m_dis);
    if (callStatus != CommonAPI::CallStatus::SUCCESS) {
        std::cout << "Error to get attribute Distance value: " << std::endl;
    }
    else {
        std::cout << "Got attribute Distance value: " << int(m_dis) << std::endl;
        proxy->getDisAttribute().getChangedEvent().subscribe([&](const uint8_t& dis) {
            std::cout << "Received change Distance message: " << int(dis) << std::endl;
        });
    }
}

void CANClient::startSubscribeRPM()
{
    proxy->getRpmAttribute().getValue(callStatus, m_rpm);
    if (callStatus != CommonAPI::CallStatus::SUCCESS) {
        std::cout << "Error to get attribute RPM value: " << std::endl;
    }
    else {
        std::cout << "Got attribute RPM value: " << int(m_rpm) << std::endl;
        proxy->getRpmAttribute().getChangedEvent().subscribe([&](const uint8_t& rpm) {
            std::cout << "Received change RPM message: " << int(rpm) << std::endl;
        });
    }
}

void CANClient::setRpm(uint8_t rpm)
{
    if (m_rpm == rpm)
        return;

    m_rpm = rpm;
    emit rpmChanged(m_rpm);
}

void CANClient::setDis(uint8_t dis)
{
    if (m_dis == dis)
        return;

    m_dis = dis;
    emit disChanged(m_dis);
}
