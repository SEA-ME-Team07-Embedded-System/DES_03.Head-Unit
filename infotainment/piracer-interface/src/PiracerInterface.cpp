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

void piracer_publish(std::shared_ptr<PiracerStubImpl>& PiracerService, uint8_t& gear, uint8_t& mode, uint8_t& batteryLevel) {

    try {
        uint8_t battery = 0;

        while(keepRunning){ // Use keepRunning flag
            {   
                std::lock_guard<std::mutex> lock(mtx);

                // Get Mode
                mode = PiracerService->getMode();
                // Get Gear
                gear = PiracerService->getGear();
                // Get Battery
                battery = batteryLevel;
            }
            // Sleep to reduce CPU usage
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
            
            // Limit Battery under 100
            if(battery > 100)
                battery = 100;
            if(battery < 0)
                battery = 0;

            // Debug Battery Gear Mode
            std::cout << "Battery: " << int(battery) << std::endl;
            std::cout << "Gear: " << int(gear) << std::endl;
            std::cout << "Mode: " << int(mode) << std::endl;

            // Publish Data to Client
            PiracerService->batteryPublisher(battery);
            PiracerService->gearPublisher(gear);
            PiracerService->modePublisher(mode);
        }
    } catch (const std::exception& e) {
        std::cerr << "Exception in piracer_publish: " << e.what() << std::endl;
        keepRunning = false; // Signal other threads to stop
    }
}
void piracer_source(GamePad& gamepad, PiracerClass& piracer, uint8_t& gear, uint8_t& mode, uint8_t& batteryLevel)  {
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
            }
            // Set Piracer throttle and steering based on gear
            // Gear values: 0 (P), 1 (R), 2 (N), 3 (D)
            switch(gear) {
                case 0: // P (Park)
                    // No throttle, no steering
                    piracer.setThrottle(0);
                    piracer.setSteering(0);
                    break;
                case 1: // R (Reverse)
                    // Steering enabled, throttle < 0
                    piracer.setThrottle(throttle < 0 ? throttle : 0);
                    piracer.setSteering(steering);
                    break;
                case 2: // N (Neutral)
                    // Steering enabled, no throttle
                    piracer.setThrottle(0);
                    piracer.setSteering(steering);
                    break;
                case 3: // D (Drive)
                    // Steering enabled, throttle > 0
                    piracer.setThrottle(throttle > 0 ? throttle : 0);
                    piracer.setSteering(steering);
                    break;
                default:
                    // Invalid gear, no operation
                    piracer.setThrottle(0);
                    piracer.setSteering(0);
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

    // SOME/IP initialize
    std::cout << "someip initailzing start" << std::endl;
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

    uint8_t mode = 5;
    uint8_t gear = 0;
    uint8_t batteryLevel;

    // Create threads for fetching data
    std::vector<std::thread> threads;    
    
    try {   
        threads.emplace_back(piracer_source, std::ref(gamepad), std::ref(piracer), std::ref(gear), std::ref(mode), std::ref(batteryLevel));
	    std::cout << "thread piracer_source executed..." << std::endl;
        threads.emplace_back(piracer_publish, std::ref(PiracerService), std::ref(gear), std::ref(mode), std::ref(batteryLevel));
	    std::cout << "thread piracer_publish executed..." << std::endl;

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
