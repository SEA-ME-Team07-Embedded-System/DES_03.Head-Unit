import os
import can
import time
from piracer.vehicles import PiRacerStandard
from piracer.gamepads import ShanWanGamepad
from pydbus import SessionBus
from gi.repository import GLib
from threading import Thread


CAN_ID = "can0"
        
class dbusService(object):
    """
        <node>
            <interface name='com.example.dbusService'>
                <method name='energy_report'>
		            <arg type='s' name='battery' direction='out'/>
		        </method>
                <method name='mode_select'>
		            <arg type='i' name='smode' direction='in'/>
		        </method>
                <method name='gear_select'>
		            <arg type='i' name='sgear' direction='in'/>
		        </method>
                <method name='get_mode'>
		            <arg type='i' name='mode' direction='out'/>
		        </method>
                <method name='get_gear'>
		            <arg type='i' name='gear' direction='out'/>
		        </method>
            </interface>
        </node>
    """

    def rc_control_thread(self):
        while True:
            self.gamepad_input = self.gamepad.read_data()
            self.throttle = self.gamepad_input.analog_stick_right.y * self.mode
            self.steering = -self.gamepad_input.analog_stick_left.x

            #print(f'throttle={throttle}, steering={steering}')

            self.piracer.set_throttle_percent(self.throttle)
            self.piracer.set_steering_percent(self.steering)
    
    def __init__(self):
        os.system(f'sudo ifconfig {CAN_ID} down')
        os.system(f'sudo ip link set {CAN_ID} up type can bitrate 125000 dbitrate 8000000 restart-ms 1000 berr-reporting on fd on')
        self.can = can.interface.Bus(channel = CAN_ID, bustype = 'socketcan')
        self.piracer = PiRacerStandard()
        self.gamepad = ShanWanGamepad()
        self.throttle = 0
        self.steering = 0

        rc_thread = Thread(target=self.rc_control_thread)
        #rc_thread.start()

        self.mode = 0.5
        self.gear = 0

    
    def get_mode(self):
        return self.mode * 10
    
    def get_gear(self):
        return self.gear
        
    def energy_report(self):
        battery_voltage = self.piracer.get_battery_voltage()
        battery = str(round((battery_voltage - 9) / 3.2 * 100))
        print(battery)
        return battery
    
    def mode_select(self, smode:int):
        self.mode = smode / 10
        print("set mode: ", self.mode)

    def gear_select(self, sgear:int):
        self.gear = sgear
        print("set gear: ", self.gear)

if __name__ == "__main__":
    loop = GLib.MainLoop()
    bus = SessionBus()
    bus.publish("com.example.dbusService", dbusService())
    
    try:
        loop.run()
    except KeyboardInterrupt:
        os.system(f'sudo ifconfig {CAN_ID} down')
        loop.quit()

