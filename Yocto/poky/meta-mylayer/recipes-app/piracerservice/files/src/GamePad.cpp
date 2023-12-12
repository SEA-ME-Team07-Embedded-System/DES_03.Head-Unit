#include "GamePad.hpp"
#include <iostream>

GamePad::GamePad()
{
    Py_Initialize();
    pModule = PyImport_ImportModule("piracer.gamepads");
    pClass = PyObject_GetAttrString(pModule, "ShanWanGamepad");
    pInstance = PyObject_CallObject(pClass, NULL);
    
    throttle = 0.0;
    steering = 0.0;
    
    button_p = false;
    button_r = false;
    button_n = false;
    button_d = false;
}

GamePad::~GamePad()
{
    Py_DECREF(pThrottle);
    Py_DECREF(pSteering);
    Py_DECREF(pInput);
    Py_DECREF(pInstance);
    Py_DECREF(pClass);
    Py_DECREF(pModule);
    Py_Finalize();
}

// Read control input from the gamepad
void GamePad::readControl()
{
    // Call the "read_data" method on the gamepad instance
    pInput = PyObject_CallMethod(pInstance, "read_data", NULL);
    
    pThrottle = PyObject_GetAttrString(pInput, "analog_stick_right");
    pThrottle = PyObject_GetAttrString(pThrottle, "y");
    throttle = PyFloat_AsDouble(pThrottle);
    
    pSteering = PyObject_GetAttrString(pInput, "analog_stick_left");
    pSteering = PyObject_GetAttrString(pSteering, "x");
    steering = PyFloat_AsDouble(pSteering);
    
    button_p = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_y"));
    button_r = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_x"));
    button_n = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_a"));
    button_d = PyObject_IsTrue(PyObject_GetAttrString(pInput, "button_b"));
}

// Get the current throttle value
double GamePad::getThrottle()
{
    return throttle;
}

// Get the current steering value
double GamePad::getSteering()
{
    return steering;
}

bool GamePad::getButtonP()
{
    return button_p;
}

bool GamePad::getButtonR()
{
    return button_r;
}

bool GamePad::getButtonN()
{
    return button_n;
}

bool GamePad::getButtonD()
{
    return button_d;
}
