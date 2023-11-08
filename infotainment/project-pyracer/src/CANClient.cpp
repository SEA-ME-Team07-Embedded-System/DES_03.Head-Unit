// CANClient.cpp
#include "CANClient.hpp"

CANClient::CANClient() {
	_rpm = 0;
	_rdis = 0;
	_fdis = 0;
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

void CANClient::startSubscribeRDis() { 
	proxy->getRdisAttribute().getValue(callStatus, _rdis);
	if (callStatus != CommonAPI::CallStatus::SUCCESS) {
        std::cout << "Error to get attribute Rear Distance value: " << std::endl;
    }
    else {
		std::cout << "Got attribute Rear Distance value: " << int(_rdis) << std::endl;
		proxy->getRdisAttribute().getChangedEvent().subscribe([&](const uint8_t& rdis) {
			std::cout << "Received change Rear Distance message: " << int(rdis) << std::endl;
		});
	}
}

void CANClient::startSubscribeFDis() {
	proxy->getFdisAttribute().getValue(callStatus, _fdis);
	if (callStatus != CommonAPI::CallStatus::SUCCESS) {
        std::cout << "Error to get attribute Front Distance value: " << std::endl;
    }
    else {
		std::cout << "Got attribute Front Distance value: " << int(_fdis) << std::endl;
		proxy->getFdisAttribute().getChangedEvent().subscribe([&](const uint8_t& fdis) {
			std::cout << "Received change Front Distance message: " << int(fdis) << std::endl;
		});
	}
}


int main() {
	CANClient canClient;
	canClient.initVsomeipClient();

	canClient.startSubscribeRDis();
	canClient.startSubscribeFDis();
	canClient.startSubscribeRPM();

	while (true) {
		std::cout << "Waiting data ... " << std::endl;
		std::this_thread::sleep_for(std::chrono::seconds(10));
	}
	
	return 0;
}