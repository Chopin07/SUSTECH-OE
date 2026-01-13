import smbus
import RPi.GPIO as GPIO
import time
bus = smbus.SMBus(1)

user_input = input("Initial Brightness:")

try:
    number = int(user_input)
    increasing = True

    while True:
        bus.write_byte_data(0x48,0x40,number)
        print(f"Brightness is:{number}")
        if increasing:
            number += 2
            if number >= 120:
                increasing = False
        else:
            number -= 2
            if number <= 90:
                increasing = True
        time.sleep(0.1)
except ValueError:
    print("Error Value,Not int")
