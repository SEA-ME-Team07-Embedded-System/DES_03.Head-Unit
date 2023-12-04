# DES03_Head Unit

# Overview

## Introduction

This document presents a comprehensive overview of a project focused on integrating sensor data with a Raspberry Pi and make middleware for displaying it through a QT application for enhanced vehicle monitoring and control.

## Project Overview

https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/1a77c456-2abf-41be-afb0-0cd81750854e

1. The project starts with an Arduino setup to collect real-time data such as RPM, front distance, and rear distance from sensors. 
2. This data is then transmitted to a Raspberry Pi using the CAN protocol, ensuring efficient and reliable communication.
3. The Raspberry Pi hosts a SOME/IP service, which publishes various car parameters (RPM, distance, battery status, gear, and mode) and is ready to respond to method calls from the car's dashboard and head unit QT application
4. The backend of the QT application acts as a client, retrieving the published data and displaying it on the GUI frontend. This interface is designed for easy interaction and clear visualization of the vehicle's status.
5. Interaction with the QT application, such as touch inputs, not only triggers signals but also initiates method calls. These method calls are essential for implementing changes in the car's operational mode.

# Project Structure

## Hardware Architecture

![DES03_hardwarearichitecture drawio](https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/4d9710af-88d0-4060-ba2c-95ff1299cfbe)

## Data Flow

![DES03_Dataflow drawio](https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/fd5095f4-0e6e-4763-a675-de7eda0e4e17)

## Software Architecture

![DES03_softwarearchitecture drawio](https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/117686e4-ed3a-49b3-b2d2-4a8b19b238bb)

1. **Microcontroller (MCU)**: An Arduino board collecting sensor data like RPM and distances.
2. **Microcontroller Abstraction Layer**: Contains Arduino software (.ino files) that provides an interface to the hardware functionalities.
3. **ECU Abstraction Layer**: Houses the PiRacer Python package, serving as a bridge between the vehicle's electronic control units (ECU) and the higher software layers.
4. **Service Layer**: Utilizes SOME/IP libraries for inter-device communication within the vehicle system.
5. **Runtime Environment**: The operational setting for the SOME/IP service middleware on the Raspberry Pi, managing service communications.
6. **Application Layer**: The QT5 GUI application, which displays vehicle data and sends commands back to the vehicle when interacted with.

# Dashboard & HU Application

## Application architecture

![DES03_Dash Head_flow drawio](https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/1813efdf-9925-4e8d-8f97-ff29885a72d9)
This represents the flow within the Dashboard and Head Unit Qt application. Let's focus on the Feeder component. The 'getDataAttribute' functions retrieve data from the middleware, which publishes data via someip services. Subsequently, the application's backend, including the someip client, receives and stores this data using 'setData' functions. When the 'setData' function is executed, it triggers a signal and slot interaction. 

Simultaneously, within 'valuesource.qml,' which manages all data for GUI display, the 'onDataChange' function activates to fetch and store the data. It's then presented within the application. If you touch the screen to modify the car mode and adjust the throttle rate, an 'onClicked' signal is generated. This signal triggers the execution of the 'modeSelectCall' function, which requests a method call to someip service. Subsequently, it adjusts the throttle data and provides a response indicating whether the mode change was successful or not.

## Head Unit

https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/753fa946-4e91-4aca-b700-7fdc8ba7c7ad

- Features
    - **Map**
    - **Music Player**
    - **Video Player**
    - **PDC**
    - **Car Mode Change**
    - **Ambient Light**
## Dashboard

https://github.com/SEA-ME-Team07-Embedded-System/DES_03.Head-Unit/assets/73748884/463d4db3-611a-4e3e-a88a-e79107cf220c

- Features
    - **Map**
    - **Car Mode Change**
    - **Current Status display**
  
## References

* CommonAPI C++ Core Runtime
https://github.com/COVESA/capicxx-core-runtime
* CommonAPI C++ SOME/IP Runtime
https://github.com/COVESA/capicxx-someip-runtime
* vsomeip
https://github.com/COVESA/vsomeip
