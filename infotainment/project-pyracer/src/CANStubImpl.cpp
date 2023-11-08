// CANStubImpl.cpp
#include "CANStubImpl.hpp"

CANStubImpl::CANStubImpl() { 
    _rdis = 0;
    _fdis = 0;
    _rpm = 0;
}

CANStubImpl::~CANStubImpl() {}

void CANStubImpl::rdisPublisher(const uint8_t  rdis) {
  if (_rdis != rdis) {
    _rdis = rdis;
    setRdisAttribute(_rdis);
    std::cout <<  "New CAN Rear Distance Data = " << int(_rdis) << "!" << std::endl;
  }
}

void CANStubImpl::fdisPublisher(const uint8_t  fdis) {
  if (_fdis != fdis) {
    _fdis = fdis;
    setFdisAttribute(_fdis);
    std::cout <<  "New CAN Front Distance Data = " << int(_fdis) << "!" << std::endl;
  }
}

void CANStubImpl::rpmPublisher(const uint8_t rpm) {
  if (_rpm != rpm) {
    _rpm = rpm;
    setRpmAttribute(_rpm);
    std::cout <<  "New CAN RPM Data = " << int(_rpm) << "!" << std::endl;
  }
}
