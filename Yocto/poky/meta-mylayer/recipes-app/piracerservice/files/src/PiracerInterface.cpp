#include "PiracerClass.hpp"
#include "GamePad.hpp"
#include <CommonAPI/CommonAPI.hpp>
#include "PiracerStubImpl.hpp"
#include <iostream>
#include <thread>
#include <vector>
#include <chrono>
#include <mutex>

std::mutex mtx;
bool keepRunning = true; // Global flag to control thread execution

struct GearState {
    bool gearP = false;
    bool gearR = false;
    bool gearN = false;
    bool gearD = false;
};
void piracer_publish(std::shared_ptr<PiracerStubImpl>& PiracerService, GearState& gearstate, uint8_t& mode, uint8_t& batteryLevel) {

    try {
        uint8_t gear = 0;
        uint8_t battery = 0;

        while(keepRunning){ // Use keepRunning flag
            {   
                std::lock_guard<std::mutex> lock(mtx);

                // Get Gear
                if(gearstate.gearP) {std::cout << "Gear : P" << std::endl; gear = 0;}
                if(gearstate.gearR) {std::cout << "Gear : R" << std::endl; gear = 1;}
                if(gearstate.gearN) {std::cout << "Gear : N" << std::endl; gear = 2;}
                if(gearstate.gearD) {std::cout << "Gear : D" << std::endl; gear = 3;}
                
                // Get Mode
                mode = PiracerService->getMode();

                // Get Battery
                battery = batteryLevel;
            }
            // Sleep to reduce CPU usage
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
            // Debug Battery 
            //if(battery > 100)
            //    battery = 100;
            //if(battery < 0)
            //    battery = 0;
            //std::cout << "Battery: " << int(battery) << std::endl;

            // Publish Data
            PiracerService->batteryPublisher(battery);
            PiracerService->gearPublisher(gear);
            PiracerService->modePublisher(mode);
        }
    } catch (const std::exception& e) {
        std::cerr << "Exception in piracer_publish: " << e.what() << std::endl;
        keepRunning = false; // Signal other threads to stop
    }
}
void piracer_source(GamePad& gamepad, PiracerClass& piracer, GearState& gearstate, uint8_t& mode, uint8_t& batteryLevel)  {
    try {
        float throttle = 0;
        float steering = 0;

        while(keepRunning) {
            gamepad.readControl();

            // Get throttle and steering
            throttle = gamepad.getThrottle();
            steering = gamepad.getSteering();

            {
                std::lock_guard<std::mutex> lock(mtx);
                
                // Battery change
                batteryLevel = piracer.getBattery();

                // Set Piracer throttle and steering
                piracer.setThrottle(throttle * int(mode) * 0.1);
                piracer.setSteering(steering);
		//std::this_thread::sleep_for(std::chrono::milliseconds(10));
            }
	    std::cout << "Battery :" << (int)batteryLevel << std::endl;
	    std::cout << "Throttle :" << throttle << std::endl;
	    std::cout << "Steering :" << steering << std::endl;
        }
    } catch (const std::exception& e) {
        std::cerr << "Exception in piracer_source: " << e.what() << std::endl;
        keepRunning = false;
    }
}

int main() {
    std::cout << "someip initailzing start" << std::endl;
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


    // Piracer Python Binding
    std::cout << "binding initializing start" << std::endl;
    PiracerClass piracer;
    std::cout << "piracer spawned instance" << std::endl;
    GamePad gamepad;
    std::cout << "gameapd spawned instance" << std::endl;
    GearState gearstate;
    uint8_t mode = 5;
    uint8_t batteryLevel;

    // Create threads for fetching data
    std::vector<std::thread> threads;
    
    
    try {   
        threads.emplace_back(piracer_source, std::ref(gamepad), std::ref(piracer), std::ref(gearstate), std::ref(mode), std::ref(batteryLevel));
	std::cout << "thread piracer_source executed..." << std::endl;
        //threads.emplace_back(piracer_publish, std::ref(PiracerService), std::ref(gearstate), std::ref(mode), std::ref(batteryLevel));
	//std::cout << "thread piracer_publish executed..." << std::endl;

        // Wait for threads to finish
        for (auto& t : threads) {
            if (t.joinable()) {
                t.join();
            }
        }
    } catch (const std::exception& e) {
        std::cerr << "Exception in main: " << e.what() << std::endl;
    }
    
    return 0;
}
