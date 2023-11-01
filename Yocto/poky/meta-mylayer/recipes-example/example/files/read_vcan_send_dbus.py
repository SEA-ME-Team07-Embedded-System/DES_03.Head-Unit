import os
import can
from pydbus import SessionBus
from gi.repository import GLib

CAN_ID = "vcan0"

class dbusService:
    '''
    DBus Service Example
    '''
    dbus = """
    <node>
        <interface name='com.example.dbusService'>
            <method name='get_rpm'>
                <arg type='i' name='speed' direction='out'/>
            </method>
            <method name='get_fuel'>
                <arg type='d' name='battery' direction='out'/>
            </method>
        </interface>
    </node>
    """
    
    def __init__(self):
        self.can = can.interface.Bus(channel = CAN_ID, bustype = 'socketcan')
        self.fuel = 0.0
        self.cnt = 0.1

    def get_rpm(self) -> int:
        msg = self.can.recv();
        if msg is None:
            return "No message recieved"
        distance = msg.data[2]
        return distance
        
    def get_fuel(self) -> float:
        if self.fuel >= 0.85:
            self.cnt = -0.1
        elif self.fuel <= 0.15:
            self.cnt = 0.1
        self.fuel += self.cnt
        
        return self.fuel
            

bus = SessionBus()
bus.publish("com.example.dbusService", dbusService())

loop = GLib.MainLoop()
loop.run()
