import time
import can
import random

bustype = 'socketcan'
channel = 'vcan0'

def producer():
    """:param id: Spam the bus with messages including the data id."""
    bus = can.Bus(channel=channel, interface=bustype)
    while(1):
        a = random.randrange(0,110)
        msg = can.Message(arbitration_id=0xc0ffee, data=[a, a, a, a, 3, 1, 4, 1], is_extended_id=False)
        bus.send(msg)
        time.sleep(0.1)

producer()
