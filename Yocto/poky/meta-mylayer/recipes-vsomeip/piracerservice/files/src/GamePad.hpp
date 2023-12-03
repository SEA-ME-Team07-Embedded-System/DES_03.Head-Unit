#ifndef GAMEPAD_HPP
#define GAMEPAD_HPP

#include <stdint.h>
#include <Python.h>

class GamePad
{
private:
    PyObject *pModule, *pClass, *pInstance, *pInput, *pThrottle, *pSteering;
    
    double throttle;  // Stores the throttle value
    double steering;  // Stores the steering value
    
    bool button_p;
    bool button_r;
    bool button_n;
    bool button_d;

public:
    GamePad();
    ~GamePad();

    void readControl();

    double getThrottle();
    double getSteering();
    
    bool getButtonP();
    bool getButtonR();
    bool getButtonN();
    bool getButtonD();
};

#endif
