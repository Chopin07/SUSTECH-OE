import RPi.GPIO as GPIO
import time
led = (7, 8, 10)
key = 12
led_state = 0
GPIO.setmode(GPIO.BOARD)
GPIO.setup(led, GPIO.OUT)
GPIO.setup(key, GPIO.IN)
try:
    while True:
        if GPIO.input(12)==GPIO.LOW:
            time.sleep(0.02)
            if GPIO.input(12)==GPIO.LOW:
                if led_state==0:
                    led_state=1
                    print("RED")
                elif led_state==1:
                    led_state=2
                    print("RED Shrink")
                elif led_state==2:
                    led_state=3
                    print("GREEN")
                elif led_state==3:
                    led_state=4
                    print("GREEN Shrink")
                elif led_state==4:
                    led_state=5
                    print("BLUE")
                elif led_state==5:
                    led_state=6
                    print("BLUE Shrink")
                elif led_state==6:
                    led_state=0
                    print("OFF")
            time.sleep(0.5)
        if led_state==0:
            GPIO.output(led[0], GPIO.LOW)
            GPIO.output(led[1], GPIO.LOW)
            GPIO.output(led[2], GPIO.LOW)
        elif led_state==1:
            GPIO.output(led[0], GPIO.HIGH)
            GPIO.output(led[1], GPIO.LOW)
            GPIO.output(led[2], GPIO.LOW)
        elif led_state==2:
            GPIO.output(led[0], GPIO.HIGH)
            GPIO.output(led[1], GPIO.LOW)
            GPIO.output(led[2], GPIO.LOW)
            time.sleep(0.5)
            GPIO.output(led[0], GPIO.LOW)
            time.sleep(0.5)
            GPIO.output(led[0], GPIO.HIGH)
        elif led_state==3:
            GPIO.output(led[0], GPIO.LOW)
            GPIO.output(led[1], GPIO.HIGH)
            GPIO.output(led[2], GPIO.LOW)
        elif led_state==4:
            GPIO.output(led[0], GPIO.LOW)
            GPIO.output(led[1], GPIO.HIGH)
            GPIO.output(led[2], GPIO.LOW)
            time.sleep(0.5)
            GPIO.output(led[1], GPIO.LOW)
            time.sleep(0.5)
            GPIO.output(led[1], GPIO.HIGH)
        elif led_state==5:
            GPIO.output(led[0], GPIO.LOW)
            GPIO.output(led[1], GPIO.LOW)
            GPIO.output(led[2], GPIO.HIGH)
        elif led_state==6:
            GPIO.output(led[0], GPIO.LOW)
            GPIO.output(led[1], GPIO.LOW)
            GPIO.output(led[2], GPIO.HIGH)
            time.sleep(0.5)
            GPIO.output(led[2], GPIO.LOW)
            time.sleep(0.5)
            GPIO.output(led[2], GPIO.HIGH)
except KeyboardInterrupt:
    print("Stop")
finally:
    GPIO.cleanup()
    print("Out")