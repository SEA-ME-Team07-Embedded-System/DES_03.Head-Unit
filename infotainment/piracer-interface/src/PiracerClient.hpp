#ifndef PiracerClient_H
#define PiracerClient_H

#include <iostream>
#include <string>
#include <unistd.h>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/PiracerProxy.hpp>
#include <v1/commonapi/PiracerProxyBase.hpp>

// CommonAPI definition
using namespace v1::commonapi;

class PiracerClient
{
public:
  PiracerClient();
  ~PiracerClient();

  // CommonAPI vSomeIP func()
  void initVsomeipClient();

  void startSubscribeBattery();
  void startSubscribeGear();
  void startSubscribeMode();
  void modeSelectCall(uint8_t mode);
  void gearSelectCall(uint8_t gear);

private:
  // CommonAPI vSomeIP var
  std::shared_ptr<CommonAPI::Runtime> runtime;
  std::shared_ptr<PiracerProxy<>> proxy;
  CommonAPI::CallStatus callStatus;
  std::string returnMessage;

  uint8_t _battery;
  uint8_t _gear;
  uint8_t _mode;
};

#endif // CANClient_H