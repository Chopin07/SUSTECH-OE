import smbus
import RPi.GPIO as GPIO
import time
bus = smbus.SMBus(1)

try:
    while True:
        number = bus.read_byte_data(0x48, 0x00)
        voltage = number*5/255
        print(f"Voltage is:{voltage}V")
        time.sleep(0.05)
except KeyboardInterrupt:
    print("Stop Sampling")