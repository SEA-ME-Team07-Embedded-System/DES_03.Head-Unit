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
                <arg type='i' name='distance' direction='out'/>
            </method>
        </interface>
    </node>
    """

    def __init__(self):
        os.system(f'sudo ifconfig {CAN_ID} down')
        os.system(f'sudo ip link set {CAN_ID} up type can bitrate 125000 dbitrate 8000000 restart-ms 1000 berr-reporting on fd on')
        self.can = can.interface.Bus(channel = CAN_ID, bustype = 'socketcan')

    def getDistance(self) -> int:
        msg = self.can.recv();
        if msg is None:
            return "No message recieved"
        distance = msg.data[2]
        return distance
            

bus = SessionBus()
bus.publish("com.example.dbusService", dbusService())

loop = GLib.MainLoop()
loop.run()
