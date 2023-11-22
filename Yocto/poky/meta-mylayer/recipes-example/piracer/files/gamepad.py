# Copyright (C) 2022 twyleg
from piracer.vehicles import PiRacerStandard, PiRacerPro
from piracer.gamepads import ShanWanGamepad

if __name__ == '__main__':

    shanwan_gamepad = ShanWanGamepad()
    # piracer = PiRacerPro()
    piracer = PiRacerStandard()

    while True:
        gamepad_input = shanwan_gamepad.read_data()

        throttle = gamepad_input.analog_stick_right.y * 0.5
        steering = -gamepad_input.analog_stick_left.x
        
        print(f'throttle={throttle}, steering={steering}')
       
        if gamepad_input.button_y:
            print("Y pressed")
        if gamepad_input.button_x:
            print("X pressed")
        if gamepad_input.button_a:
            print("A pressed")
        if gamepad_input.button_b:
            print("B pressed")

        piracer.set_throttle_percent(throttle)
        piracer.set_steering_percent(steering)
