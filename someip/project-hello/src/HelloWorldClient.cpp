// HelloWorldClient.cpp
#include <iostream>
#include <string>
#include <unistd.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/HelloWorldProxy.hpp>

unsigned int microsecond = 1000000;


using namespace v1_0::commonapi;

int main() {
    //make proxy to connect service
    std::shared_ptr < CommonAPI::Runtime > runtime = CommonAPI::Runtime::get();
    std::shared_ptr<HelloWorldProxy<>> myProxy =
    	runtime->buildProxy<HelloWorldProxy>("local", "test"); //test is client id

    std::cout << "Checking availability!" << std::endl;
    while (!myProxy->isAvailable())
        usleep(10);
    std::cout << "Available..." << std::endl;

    //call method and receive message
    CommonAPI::CallStatus callStatus;
    std::string returnMessage;

    while(true) {
        usleep(3 * microsecond);//sleeps for 3 second
        myProxy->sayHello("Kim", callStatus, returnMessage);
        std::cout << "Got message: '" << returnMessage << "'\n";
    }
    
    return 0;
}
