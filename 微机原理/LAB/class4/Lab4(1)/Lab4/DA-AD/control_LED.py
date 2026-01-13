import smbus
import RPi.GPIO as GPIO
import time
bus = smbus.SMBus(1)

try:
    while True:
        user_input = input("Voltage:")
        voltage = int(user_input)
        if voltage>=0 and voltage<=5:
            number = voltage*255/5
            brightness = int(number)
            bus.write_byte_data(0x48,0x40,brightness)
            print(f"Voltage is:{voltage},Brightness is:{brightness}")
        else:
            print("Invalid Value")
except ValueError:
    print("Error Value,Not int")