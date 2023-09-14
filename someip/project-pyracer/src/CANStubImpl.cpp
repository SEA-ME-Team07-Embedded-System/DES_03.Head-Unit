// CANStubImpl.cpp
#include "CANStubImpl.hpp"

CANStubImpl::CANStubImpl() { 
    _dis = 0;
    _rpm = 0;
}

CANStubImpl::~CANStubImpl() {}

void CANStubImpl::disPublisher(const uint8_t  dis) {
  if (_dis != dis) {
    _dis = dis;
    setDisAttribute(_dis);
    std::cout <<  "New CAN Distance Data = " << int(_dis) << "!" << std::endl;
  }
}

void CANStubImpl::rpmPublisher(const uint8_t rpm) {
  if (_rpm != rpm) {
    _rpm = rpm;
    setRpmAttribute(_rpm);
    std::cout <<  "New CAN RPM Data = " << int(_rpm) << "!" << std::endl;
  }
}
