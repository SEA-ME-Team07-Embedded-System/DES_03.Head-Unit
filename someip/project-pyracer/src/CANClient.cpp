// CANClient.cpp
#include "CANClient.hpp"

CANClient::CANClient() {
	_rpm = 0;
	_dis = 0;
	std::cout << "success init can client" << std::endl;
}

CANClient::~CANClient() {
	std::cout << "close can client" << std::endl;
}

void CANClient::initVsomeipClient() {
	runtime = CommonAPI::Runtime::get();
    proxy = runtime->buildProxy<CANProxy>("local", "can");
    std::cout << "Checking availability!" << std::endl;
    while (!proxy->isAvailable())
        std::this_thread::sleep_for(std::chrono::microseconds(10));
}

void CANClient::startSubscribeRPM() {
	proxy->getRpmAttribute().getValue(callStatus, _rpm);
	if (callStatus != CommonAPI::CallStatus::SUCCESS) {
        std::cout << "Error to get attribute RPM value: " << std::endl;
    }
    else {
		std::cout << "Got attribute RPM value: " << int(_rpm) << std::endl;
		proxy->getRpmAttribute().getChangedEvent().subscribe([&](const uint8_t& rpm) {
			std::cout << "Received change RPM message: " << int(rpm) << std::endl;
		});
	}
}

void CANClient::startSubscribeDis() {
	proxy->getDisAttribute().getValue(callStatus, _dis);
	if (callStatus != CommonAPI::CallStatus::SUCCESS) {
        std::cout << "Error to get attribute Distance value: " << std::endl;
    }
    else {
		std::cout << "Got attribute Distance value: " << int(_dis) << std::endl;
		proxy->getDisAttribute().getChangedEvent().subscribe([&](const uint8_t& dis) {
			std::cout << "Received change Distance message: " << int(dis) << std::endl;
		});
	}
}


int main() {
	CANClient canClient;
	canClient.initVsomeipClient();

	canClient.startSubscribeDis();
	canClient.startSubscribeRPM();

	while (true) {
		std::cout << "Waiting data ... " << std::endl;
		std::this_thread::sleep_for(std::chrono::seconds(10));
	}
	
	return 0;
}