import os
import can
from pydbus import SessionBus
from gi.repository import GLib

CAN_ID = "can0"

class dbusService:
    '''
    DBus Service Example
    '''
    dbus = """
    <node>
        <interface name='com.example.dbusService'>
            <method name='getDistance'>
                <arg type='f' name='distance' direction='out'/>
            </method>
            <method name='getSpeed'>
                <arg type='f' name='speed' direction='out'/>
            </method>
        </interface>
    </node>
    """

    def __init__(self):
        os.system(f'sudo ifconfig {CAN_ID} down')
        os.system(f'sudo ip link set {CAN_ID} up type can bitrate 500000 dbitrate 8000000 restart-ms 1000 berr-reporting on fd on')
        self.can = can.interface.Bus(channel = CAN_ID, bustype = 'socketcan')

    def rpm2speed(self, rpm) -> float:
        #TODO:add some equation here
        speed = rpm 
        return speed

    def getDistance(self) -> float:
        msg = self.can.recv();
        if msg is None:
            return "No message recieved"
        distance = msg.data[2] + msg.data[3]*256
        return distance

    def getSpeed(self) -> float:
        msg = self.can.recv();
        if msg is None:
            return "No message recieved"
        rpm = msg.data[0] + msg.data[1]*256
        speed = self.rpm2speed(rpm)
        return speed
            

bus = SessionBus()
bus.publish("com.example.dbusService", dbusService())

loop = GLib.MainLoop()
loop.run()