import random
from pydbus import SessionBus
from gi.repository import GLib

class dbusService:
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
    def __init__(self):
        self.battery=0
        self.rpm=0
        self.cnt=1
        # 0.3 0.5 0.9 -> echo, normal, sport
        self.mode = 0.5
        # 0 1 2 3 -> P R N D
        self.gear = 0

    def get_mode(self):
        return self.mode * 10
    
    def get_gear(self):
        # self.gear = random.randint(0,3)
        return self.gear

    def energy_report(self):
        self.battery += self.cnt
        if self.battery > 100:
            self.battery=1
        return str(self.battery)
    
    def mode_select(self, smode:int):
        self.mode = smode / 10
        print("set mode: ", self.mode)

    def gear_select(self, sgear:int):
        self.gear = sgear
        print("set gear: ", self.gear)


loop = GLib.MainLoop()
bus = SessionBus()

bus.publish("com.example.dbusService", dbusService())
loop.run()