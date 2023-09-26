import os
import time
import random
from pydbus import SessionBus
from gi.repository import GLib
from geopy.geocoders import Nominatim


class dbusService:
    """
        <node>
            <interface name='com.example.dbusService'>
                <method name='get_rpm'>
                    <arg type='s' name='rpm' direction='out'/>
                </method>
                <method name='get_distance'>
		            <arg type='s' name='distance' direction='out'/>
		        </method>
                <method name='energy_report'>
		            <arg type='s' name='battery' direction='out'/>
		        </method>
                <method name='mode_select'>
		            <arg type='i' name='value' direction='in'/>
		        </method>
            </interface>
        </node>
    """
    def __init__(self):
        self.battery=0
        self.rpm=0
        self.cnt=1
        self.geolocator = 0
        self.mode = 0.5

    def get_rpm(self):
        self.rpm+=5*self.cnt
        if self.rpm > 200:
            self.rpm=1
        return str(self.rpm)

    def get_distance(self):
        distance = 20
        return str(distance)

    def energy_report(self):
        self.battery += self.cnt
        if self.battery > 100:
            self.battery=1
        return str(self.battery)
    
    def mode_select(self, value:int):
        self.mode = value / 10
        print(self.mode)




loop = GLib.MainLoop()
bus = SessionBus()

bus.publish("com.example.dbusService", dbusService())
loop.run()