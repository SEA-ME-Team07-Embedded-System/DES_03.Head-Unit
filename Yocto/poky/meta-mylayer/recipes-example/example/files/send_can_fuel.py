# Copyright (C) 2022 twyleg
import time
import math
import can
import os
from piracer.vehicles import PiRacerStandard
from pydbus import SessionBus
from gi.repository import GLib

CAN_ID = 'can0'

class dbusService:
    '''
    DBus Service Example
    '''
    dbus = """
    <node>
        <interface name='com.example.dbusService'>
            <method name='get_fuel'>
                <arg type='d' name='voltage' direction='out'/>
            </method>
            <method name='get_rpm'>
                <arg type='i' name='rpm' direction='out'/>
            </method>
            <method name='get_dis'>
                <arg type='i' name='distance' direction='out'/>
            </method>
        </interface>
    </node>
    """

    def __init__(self):
        self.piracer = PiRacerStandard()
        self.voltage =0
        os.system(f'sudo ifconfig {CAN_ID} down')
        os.system(f'sudo ip link set {CAN_ID} up type can bitrate 500000 dbitrate 8000000 restart-ms 1000 berr-reporting on fd on')
        self.can = can.interface.Bus(channel = CAN_ID, bustype = 'socketcan')
        

    def get_fuel(self)->float:    
        self.voltage = self.piracer.get_battery_voltage()
        self.voltage = 0.498*math.sin(1.546*self.voltage + 1.001) + 0.48
        return self.voltage


    def get_rpm(self) -> int:
        msg = self.can.recv();
        if msg is None:
            return "No message recieved"
        rpm = msg.data[0] + msg.data[1]*256
        return rpm   

    def get_dis(self) -> int:
        msg = self.can.recv();
        if msg is None:
            return "No message recieved"
        distance = msg.data[2] + msg.data[3]*256
        return distance         

bus = SessionBus()
bus.publish("com.example.dbusService", dbusService())
loop = GLib.MainLoop()
loop.run()
