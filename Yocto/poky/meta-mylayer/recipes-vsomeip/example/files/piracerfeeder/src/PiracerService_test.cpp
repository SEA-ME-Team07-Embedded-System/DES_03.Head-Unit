#include "PiracerClass.hpp"
#include "GamePad.hpp"
#include <CommonAPI/CommonAPI.hpp>
#include "PiracerStubImpl.hpp"
#include <iostream>
#include <thread>
#include <vector>
#include <chrono>
#include <mutex>

int main() {

    // SOME/IP initialize
    std::shared_ptr<CommonAPI::Runtime> runtime = CommonAPI::Runtime::get();
    std::string domain = "local";
    std::string instance = "Piracer"; // instance id
    std::shared_ptr<PiracerStubImpl> PiracerService = std::make_shared<PiracerStubImpl>();
    while (!runtime->registerService(domain, instance, PiracerService))
    {
        std::cout << "Register Service failed, trying again in 100 milliseconds..." << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    std::cout << "Successfully Registered Service!" << std::endl;

    uint8_t gear = 0;
    uint8_t mode = 0; // Start with mode 3
    uint8_t battery = 0;
    
    int i = 0;

    while(true) {

        // Publish Data
        PiracerService->batteryPublisher(i);
        PiracerService->gearPublisher(i);
        PiracerService->modePublisher(i);

        std::this_thread::sleep_for(std::chrono::milliseconds(100));

        i++;
        if(i > 10)
            i = 0;
    }

    return 0;
}
