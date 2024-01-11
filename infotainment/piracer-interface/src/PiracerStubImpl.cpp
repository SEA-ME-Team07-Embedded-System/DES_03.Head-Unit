// PiracerStubImpl.cpp
#include "PiracerStubImpl.hpp"

PiracerStubImpl::PiracerStubImpl() { 
    _battery = 0;
    _gear = 0;
    _mode = 5;

}
PiracerStubImpl::~PiracerStubImpl() { }

// Method Call function
void PiracerStubImpl::modeSelect(const std::shared_ptr<CommonAPI::ClientId> _client, uint8_t mode, modeSelectReply_t _reply) {
  std::cout << "Mode Select : " << int(mode) << std::endl;

  _mode = mode;

  _reply("Mode Change Success!");
  
  return;
}

void PiracerStubImpl::gearSelect(const std::shared_ptr<CommonAPI::ClientId> _client, uint8_t gear, modeSelectReply_t _reply) {
  std::cout << "Gear Select : " << int(gear) << std::endl;

  _gear = gear;

  _reply("Gear Change Success!");
  
  return;
}

uint8_t PiracerStubImpl::getMode() {
  // send mode data to service
  return _mode;
}

uint8_t PiracerStubImpl::getGear() {
  // send mode data to service
  return _gear;
}

// Attribute function
void PiracerStubImpl::batteryPublisher(const uint8_t  battery) {
  if (_battery != battery) {
    _battery = battery;
    setBatteryAttribute(_battery);
    std::cout <<  "New Battery Data = " << int(_battery) << "!" << std::endl;
  }
  return;
}

void PiracerStubImpl::gearPublisher(const uint8_t gear) {
  if (_gear != gear) {
    //_gear = gear;
    setGearAttribute(_gear);
    std::cout <<  "New Gear Data = " << int(_gear) << "!" << std::endl;
  }
  return;
}

void PiracerStubImpl::modePublisher(const uint8_t mode) {
  if (_mode != mode) {
    //_mode = mode;
    setModeAttribute(_mode);
    std::cout <<  "New Mode Data = " << int(_mode) << "!" << std::endl;
  }
  return;
}
