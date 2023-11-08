from pydbus import SessionBus
import time
#from gi.repository import GLib

# Connect to the session bus
bus = SessionBus()
remote_object = bus.get('com.example.dbusService',"/com/example/dbusService")


while(1):
    
    print(remote_object.vol())
