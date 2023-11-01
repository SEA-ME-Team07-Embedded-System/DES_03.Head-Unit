# Copyright (C) 2022 twyleg
import time
import math
from piracer.vehicles import PiRacerStandard
from pydbus import SessionBus
from gi.repository import GLib

class dbusService:
    '''
    DBus Service Example
    '''
    dbus = """
    <node>
        <interface name='com.example.dbusService'>
            <method name='vol'>
                <arg type='d' name='voltage' direction='out'/>
            </method>
            <method name='cur'>
                <arg type='s' name='current' direction='out'/>
            </method>
        </interface>
    </node>
    """

    def __init__(self)->str:
        self.piracer = PiRacerStandard()
        self.voltage =0
        

    def vol(self)->float:    
        self.piracer = PiRacerStandard()
        self.voltage = self.piracer.get_battery_voltage()
        self.voltage = 49.76*math.sin(1.546*self.voltage + 1.001) + 48.31
        #volt = '{0:0>6.3f}'.format(self.voltage)
        return self.voltage

    def cur(self):
        return self.current
            

bus = SessionBus()
bus.publish("com.example.dbusService", dbusService())
loop = GLib.MainLoop()
loop.run()
