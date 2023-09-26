// CANStubImpl.hpp
#ifndef CANSTUBIMPL_H_
#define CANSTUBIMPL_H_
#include <iostream>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <linux/can.h>
#include <CommonAPI/CommonAPI.hpp>
#include <v1/commonapi/CANStubDefault.hpp>

class CANStubImpl: public v1::commonapi::CANStubDefault {
public:
  CANStubImpl();
  virtual ~CANStubImpl();
  virtual void rpmPublisher(const uint8_t rpm);
  virtual void disPublisher(const uint8_t  dis);

private:
  uint8_t  _dis;
  uint8_t  _rpm;
};
#endif /* CANSTUBIMPL_H_ */