#include "PiracerClass.hpp"
#include <iostream>
PiracerClass::PiracerClass()
{
    Py_Initialize();
    pVehicleModule = PyImport_ImportModule("piracer.vehicles");
    pVehicleClass = PyObject_GetAttrString(pVehicleModule, "PiRacerStandard");
    pVehicleInstance = PyObject_CallObject(pVehicleClass, NULL);

    m_voltageLevel = 0;
    m_batteryLevel = 0;
}

PiracerClass::~PiracerClass()
{
    // Release Python objects and finalize the Python interpreter
    Py_DECREF(pVehicleModule);
    Py_DECREF(pVehicleClass);
    Py_DECREF(pVehicleInstance);
    Py_DECREF(pSetThrottle);
    Py_DECREF(pSetSteering);
    Py_DECREF(pVoltage);
    Py_Finalize();
}

uint8_t PiracerClass::getBattery()
{
    pVoltage = PyObject_CallMethod(pVehicleInstance, "get_battery_voltage", NULL);
    m_voltageLevel = PyFloat_AsDouble(pVoltage);
    m_batteryLevel = (uint8_t) ((m_voltageLevel - 2.8 * 3.0) / (12.3 - 2.8 * 3.0) * 100.0);
    
    return m_batteryLevel;
}

void PiracerClass::setThrottle(float throttle)
{
    pSetThrottle = PyObject_CallMethod(pVehicleInstance, "set_throttle_percent", "f", throttle);
    if (pSetThrottle == NULL) {
        PyErr_Print(); // Print the error details
    }
}

void PiracerClass::setSteering(float steering)
{
    pSetSteering = PyObject_CallMethod(pVehicleInstance, "set_steering_percent", "f", steering);
    if (pSetSteering == NULL) {
        PyErr_Print(); // Print the error details
    }
}
