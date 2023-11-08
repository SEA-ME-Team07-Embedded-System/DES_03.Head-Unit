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
                <arg type='i' name='distance' direction='out'/>
            </method>
        </interface>
    </node>
    """
    def __init__(self):
    	self.value = 100
    
    def vol(self) -> int:
        self.value += 1
        return self.value
            

bus = SessionBus()
bus.publish("com.example.dbusService", dbusService())
loop = GLib.MainLoop()
loop.run()
