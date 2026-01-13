import smbus
import time
import RPi.GPIO as GPIO

#设备地址
DEVICE_ADDR = 0x48

#0对Y，1对X
CH_VRX = 1
CH_VRY = 0

CENTER   = 128
DEADZONE = 10

GPIO.setmode(GPIO.BCM)

PIN_RED   = 18
PIN_GREEN = 19

GPIO.setup(PIN_RED, GPIO.OUT)
GPIO.setup(PIN_GREEN, GPIO.OUT)

pwm_red = GPIO.PWM(PIN_RED, 2000)
pwm_green = GPIO.PWM(PIN_GREEN, 2000)

bus = smbus.SMBus(1)

def read_adc(channel: int) -> int:
    ctrl_byte = channel
    bus.write_byte(DEVICE_ADDR, ctrl_byte)
    bus.read_byte(DEVICE_ADDR)
    return bus.read_byte(DEVICE_ADDR)

def brightness(raw: int) -> float:

    return max(0.0, min(100.0, raw / 255.0 * 100.0))

mode = "RED"
red_bri = 50.0
green_bri = 0.0

pwm_red.start(red_bri)
pwm_green.start(green_bri)

print(f"State=Neutral(RED), X=?, Y=?, Red={red_bri:.1f}%, Green={green_bri:.1f}%")


try:
    while True:
        vrx = read_adc(CH_VRX)
        vry = read_adc(CH_VRY)

        dx = vrx - CENTER
        dy = vry - CENTER

        state = "Neutral"

        if abs(dx) > abs(dy) and abs(dx) > DEADZONE:
            mode = "GREEN"

            green_bri = brightness(255 - vrx)
            red_bri = 0.0

            if dx < 0:
                state = "Left"
            else:
                state = "Right"

        elif abs(dy) > DEADZONE:
            mode = "RED"

            red_bri = brightness(255 - vry)
            green_bri = 0.0

            if dy < 0:
                state = "Up"
            else:
                state = "Down"

        else:
            if mode == "RED":
                state = "center(RED)"
                red_bri = 50.0
                green_bri = 0.0
            else:
                state = "center(GREEN)"
                red_bri = 0.0
                green_bri = 50.0

        pwm_red.ChangeDutyCycle(red_bri)
        pwm_green.ChangeDutyCycle(green_bri)

        print(
            f"place={state}, "
            f"X={vrx:3d}, Y={vry:3d}, "
            f"Red={red_bri:6.1f}%, Green={green_bri:6.1f}%"
        )

        time.sleep(0.1)

except KeyboardInterrupt:
    print("Exit by Ctrl+C")
finally:
    pwm_red.stop()
    pwm_green.stop()
GPIO.cleanup()
