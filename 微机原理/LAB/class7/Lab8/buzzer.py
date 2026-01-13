import RPi.GPIO as GPIO
import time

channel = 12

GPIO.setmode(GPIO.BOARD)
GPIO.setup(channel, GPIO.OUT)

pi_pwm = GPIO.PWM(channel, 440)

pi_pwm.start(0)

notes = {
    'C3': 130.81,
    'C#3': 138.59, 'Db3': 138.59,
    'D3': 146.83,
    'D#3': 155.56, 'Eb3': 155.56,
    'E3': 164.81,
    'F3': 174.61,
    'F#3': 185.00, 'Gb3': 185.00,
    'G3': 196.00,
    'G#3': 207.65, 'Ab3': 207.65,
    'A3': 220.00,
    'A#3': 233.08, 'Bb3': 233.08,
    'B3': 246.94,
    'C4': 261.63,
    'C#4': 277.18, 'Db4': 277.18,
    'D4': 293.66,
    'D#4': 311.13, 'Eb4': 311.13,
    'E4': 329.63,
    'F4': 349.23,
    'F#4': 369.99, 'Gb4': 369.99,
    'G4': 392.00,
    'G#4': 415.30, 'Ab4': 415.30,
    'A4': 440.00,
    'A#4': 466.16, 'Bb4': 466.16,
    'B4': 493.88,
    'C5': 523.25,
    'C#5': 554.37, 'Db5': 554.37,
    'D5': 587.33,
    'D#5': 622.25, 'Eb5': 622.25,
    'E5': 659.25,
    'F5': 698.46,
    'F#5': 739.99, 'Gb5': 739.99,
    'G5': 783.99,
    'G#5': 830.61, 'Ab5': 830.61,
    'A5': 880.00,
    'A#5': 932.33, 'Bb5': 932.33,
    'B5': 987.77,
    'C6': 1046.50
}

melody = [
    ('D#5',0.31),('C#5',0.31),('B4',0.31),('C#5',0.31),
    ('D#5',0.47),('E5',0.31),('D#5',0.31),('C#5',0.47),

    ('D#5',0.31),('C#5',0.31),('B4',0.31),('C#5',0.31),
    ('D#5',0.47),('E5',0.31),('D#5',0.31),('C#5',0.47),

    ('B4',0.31),('B4',0.31),('D#5',0.31),('E5',0.31),
    ('C#5',0.31),('B4',0.31),('C#5',0.31),('E5',0.31),

    ('B4',0.31),('C#5',0.31),('B4',0.31),('A#5',0.31),
    ('F#5',0.31),('E5',0.31),('D#5',0.31),('C#5',0.31)
]

def play_note(note,duration):
    pi_pwm.ChangeFrequency(notes[note])
    pi_pwm.ChangeDutyCycle(1)
    time.sleep(duration)
    pi_pwm.ChangeDutyCycle(0)
    time.sleep(0.05)



try:
    for note, duration in melody:
        play_note(note,duration)
except KeyboardInterrupt:
    print("Stop")
finally:
    GPIO.remove_event_detect(echo)
    GPIO.cleanup()
    print("Out")