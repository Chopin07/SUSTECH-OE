import RPi.GPIO as GPIO
import time
import threading
from collections import deque

trig = 11
echo = 12

GPIO.setmode(GPIO.BOARD)
GPIO.setup(trig, GPIO.OUT)
GPIO.setup(echo, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

def trig_once():
    GPIO.output(trig, GPIO.HIGH)
    time.sleep(0.00002)   # 20 us
    GPIO.output(trig, GPIO.LOW)

_start_ns = None
_lock = threading.Lock()
latest_distance_m = None
distances = deque(maxlen=50)
SPEED_OF_SOUND = 343.0  # m/s

def echo_edge(channel):
    global _start_ns, latest_distance_m
    level = GPIO.input(channel)
    if level == GPIO.HIGH:
        _start_ns = time.monotonic_ns()
    else:
        if _start_ns is None:
            return
        dur_ns = time.monotonic_ns() - _start_ns
        _start_ns = None
        dur_s = dur_ns / 1e9
        distance_m = (SPEED_OF_SOUND * dur_s) / 2.0
        with _lock:
            latest_distance_m = distance_m
            distances.append(distance_m)

GPIO.output(trig, GPIO.LOW)
time.sleep(0.05)
GPIO.add_event_detect(echo, GPIO.BOTH, callback=echo_edge)

try:
    while True:
        trig_once()
        time.sleep(0.1)

        with _lock:
            if distances:
                d = latest_distance_m
                avg = sum(distances) / len(distances)
            else:
                d = None
                avg = None

        if d is not None:
            print(f"Distance: {d*100:.1f} cm | Avg(50): {avg*1000:.1f} mm")

except KeyboardInterrupt:
    print("Stop")
finally:
    GPIO.remove_event_detect(echo)
    GPIO.cleanup()
    print("Out")