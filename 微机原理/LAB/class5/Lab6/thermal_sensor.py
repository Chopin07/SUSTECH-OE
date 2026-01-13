import smbus
import RPi.GPIO as GPIO
import time
import math
bus = smbus.SMBus(1)


try:
    while True:
        number = bus.read_byte_data(0x48, 0x00)
        voltage = float(number)*5/255
        thermal_resistance = 10000*voltage/(5-voltage)
        temprature = 3950*(298.15)/(3950+298.15*math.log(thermal_resistance/10000))
        celsius = temprature - 273.15
        print(f"Temprature is:{celsius} Celsius")
        time.sleep(0.3)
except KeyboardInterrupt:
    print("Stop Sampling")