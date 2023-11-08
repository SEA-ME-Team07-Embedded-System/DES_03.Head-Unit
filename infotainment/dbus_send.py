import os
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
        shanwan_gamepad = ShanWanGamepad()
        while True:
            gamepad_input = shanwan_gamepad.read_data()
            throttle = gamepad_input.analog_stick_right.y * self.mode
            steering = -gamepad_input.analog_stick_left.x
            #print(f'mode={self.mode}, gear={self.gear}')
            print(f'throttle={throttle}, steering={steering}')

            # P R N D = 0 1 2 3
            if throttle == 0: # Park
                if steering:
                    self.gear = 2 # Neutral
                self.gear = 0
            elif throttle < 0: # Rear
                self.gear = 1
            elif throttle > 0: # Drive
                self.gear = 3
            
            # Gear Select
            if gamepad_input.button_y + gamepad_input.button_x + gamepad_input.button_a + gamepad_input.button_b == 1:
                if gamepad_input.button_y:
                    self.gear = 0
                elif gamepad_input.button_x:
                    self.gear = 1
                elif gamepad_input.button_a:
                    self.gear = 2
                elif gamepad_input.button_b:
                    self.gear = 3

            self.piracer.set_throttle_percent(throttle)
            self.piracer.set_steering_percent(steering)

    def __init__(self):
        os.system(f'sudo ifconfig {CAN_ID} down')
        os.system(f'sudo ip link set {CAN_ID} up type can bitrate 125000 dbitrate 8000000 restart-ms 1000 berr-reporting on fd on')
        self.piracer = PiRacerStandard()

        rc_thread = Thread(target=self.rc_control_thread)
        rc_thread.start()

        self.battery_voltage = 0
        self.battery = 0

        self.mode = 0.5
        self.gear = 0


    def get_mode(self):
        return self.mode * 10

    def get_gear(self):
        return self.gear

    def energy_report(self):
        self.battery_voltage = self.piracer.get_battery_voltage()
        self.battery = round((self.battery_voltage - 9) / 3.2 * 100)
        if self.battery < 0:
            self.battery = 0
        return str(self.battery)

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