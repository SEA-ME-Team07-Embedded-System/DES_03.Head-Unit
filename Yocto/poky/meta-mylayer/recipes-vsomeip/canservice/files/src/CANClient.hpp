#ifndef CANClient_H
#define CANClient_H

#include <iostream>
#include <string>
#include <unistd.h>
#include <thread>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/CANProxy.hpp>
#include <v1/commonapi/CANProxyBase.hpp>

// CommonAPI definition
using namespace v1::commonapi;

class CANClient
{
public:
  CANClient();
  ~CANClient();

  // CommonAPI vSomeIP func()
  void initVsomeipClient();

  void startSubscribeRDis();
  void startSubscribeFDis();
  void startSubscribeRPM();

private:
  // CommonAPI vSomeIP var
  std::shared_ptr<CommonAPI::Runtime> runtime;
  std::shared_ptr<CANProxy<>> proxy;
  CommonAPI::CallStatus callStatus;

  uint8_t _rdis;
  uint8_t _fdis;
  uint8_t _rpm;
};

#endif // CANClient_H