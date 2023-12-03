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
  virtual void rdisPublisher(const uint8_t  rdis);
  virtual void fdisPublisher(const uint8_t  fdis);

private:
  uint8_t  _rdis;
  uint8_t  _fdis;
  uint8_t  _rpm;
};
#endif /* CANSTUBIMPL_H_ */