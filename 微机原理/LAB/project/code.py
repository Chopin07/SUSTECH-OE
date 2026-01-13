
from __future__ import print_function
import imutils
import time
import cv2
import numpy as np
import RPi.GPIO as GPIO
import Adafruit_PCA9685

# --- 1. 硬件初始化 ---
# 初始化LED
redLed = 21
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(redLed, GPIO.OUT)

#初始化PWM驱动板
pwm = Adafruit_PCA9685.PCA9685()
#设定频率60Hz
pwm.set_pwm_freq(60)

# --- 2. 舵机通道配置---
PAN_CHANNEL = 5   # 左右
TILT_CHANNEL = 4  # 上下

# 限制范围，保护舵机
SERVO_MIN = 150
SERVO_MAX = 600
SERVO_CENTER = 325

current_pan = SERVO_CENTER
current_tilt = SERVO_CENTER

#步长设定为6
STEP = 6

# --- 3. 颜色字典 ---
colors = {
    #红色拆分为两段，解决跨区间问题
    "Red_1": ((0, 160, 100), (10, 255, 255), (0, 0, 255)),
    "Red_2": ((170, 160, 100), (180, 255, 255), (0, 0, 255)),

    #黄色提高S和V下限140，确保只识别到鲜艳明亮的目标
    "Blue": ((100, 150, 120), (130, 255, 255), (255, 0, 0)),
    "Yellow": ((20, 140, 140), (35, 255, 255), (0, 255, 255))
}

#设置舵机脉冲宽度，方便控制转动角度
def set_servo_pulse(channel, pulse):
    pulse = int(pulse)
    if pulse < SERVO_MIN: pulse = SERVO_MIN
    if pulse > SERVO_MAX: pulse = SERVO_MAX
    pwm.set_pwm(channel, 0, pulse)

#打开摄像头，使用linux的V4L2驱动，设置分辨率640*480
print("[INFO] Camera Warming up...")
vs = cv2.VideoCapture(0, cv2.CAP_V4L2)
vs.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
vs.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

# 强制归位
set_servo_pulse(PAN_CHANNEL, SERVO_CENTER)
set_servo_pulse(TILT_CHANNEL, SERVO_CENTER)
time.sleep(1)

print("[INFO] Ready. Tracking YELLOW.")

try:
    while True:
        ret, frame = vs.read()
        if not ret or frame is None:
            continue

        frame = imutils.resize(frame, width=640)

        #高斯模糊预处理，去噪
        blurred = cv2.GaussianBlur(frame, (11, 11), 0)

        #转换色彩空间
        hsv = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
        
        yellow_target_center = None 
        
        # 遍历颜色
        for color_key, (lower, upper, draw_color) in colors.items():
            #生成掩膜，进行腐蚀、膨胀
            mask = cv2.inRange(hsv, lower, upper)
            mask = cv2.erode(mask, None, iterations=2)
            mask = cv2.dilate(mask, None, iterations=2)
            cnts_info = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

            #提取轮廓，筛选最大面积
            cnts = imutils.grab_contours(cnts_info)

            if len(cnts) > 0:
                c = max(cnts, key=cv2.contourArea)
                if cv2.contourArea(c) > 600:
                    ((x, y), radius) = cv2.minEnclosingCircle(c)
                    M = cv2.moments(c)
                    if M["m00"] != 0:
                        center = (int(M["m10"] / M["m00"]), int(M["m01"] / M["m00"]))
                        display_name = "Red" if "Red" in color_key else color_key
                        cv2.circle(frame, (int(x), int(y)), int(radius), draw_color, 2)
                        cv2.putText(frame, display_name, (int(x), int(y)-10), 
                                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, draw_color, 2)
                        

                        #逻辑判断，仅锁定黄色
                        if color_key == "Yellow":
                            yellow_target_center = center
                            cv2.circle(frame, center, 5, (0, 0, 255), -1)

        # --- 舵机追踪 ---
        if yellow_target_center is not None:
            obj_x, obj_y = yellow_target_center
            center_x = 320
            center_y = 240
            #死区锁定，防抖
            margin = 40 

            # X轴
            if obj_x < center_x - margin:
                current_pan += STEP
            elif obj_x > center_x + margin:
                current_pan -= STEP

            # Y轴 (上下)
            if obj_y < center_y - margin:
                # 物体在上方 -> 舵机数值减小 (抬头)
                # 如果方向反了，把这里改成 += STEP
                current_tilt -= STEP
                # print("Moving UP") # 调试用
            elif obj_y > center_y + margin:
                # 物体在下方 -> 舵机数值增加 (低头)
                current_tilt += STEP
                # print("Moving DOWN")

            # 限制范围，防止卡死
            current_pan = max(SERVO_MIN, min(SERVO_MAX, current_pan))
            current_tilt = max(SERVO_MIN, min(SERVO_MAX, current_tilt))

            set_servo_pulse(PAN_CHANNEL, current_pan)
            set_servo_pulse(TILT_CHANNEL, current_tilt)
            #执行动作
            
            GPIO.output(redLed, GPIO.HIGH)
        else:
            GPIO.output(redLed, GPIO.LOW)
            #LED状态反馈

        cv2.imshow("Force Tilt Track", frame)
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break

except KeyboardInterrupt:
    pass

set_servo_pulse(PAN_CHANNEL, SERVO_CENTER)
set_servo_pulse(TILT_CHANNEL, SERVO_CENTER)
GPIO.cleanup()
cv2.destroyAllWindows()
vs.release()
