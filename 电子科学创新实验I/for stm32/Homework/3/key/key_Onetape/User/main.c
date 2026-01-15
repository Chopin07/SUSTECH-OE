/*********************************
芯片：STM32F103VET6
实现功能：LED灯按键闪烁（红灯）
引脚：PB5(红),key1按键
1. include stm32f10.h、led.h
2. 准备 delay 函数
3. 准备 key_scan 函数
4. 打开对应端口
5. 设置初始值
6. 进入循环 while(1)
7. 检测到按键，翻转灯的状态
*************************************/

#include "stm32f10x.h"
#include "led.h"
#include "delay.h"
#include "key.h"

#define KEY_ON  1
#define KEY_OFF 0

int main(void)
{
    /* LED 端口初始化 */
    LED_GPIO_R_Config();

    /*初始化按键*/
    Key_GPIO_Config();
	
	  LED_R_OFF();

    /* 轮询按键状态，若按键按下则反转LED */
    while (1) 
		{
        if ( Key_Scan(KEY1_GPIO_PORT,GPIO_Pin_0) == KEY_ON  ) 
				{
					  
            LED_R_TOGGLE();
        }

        if ( Key_Scan(KEY2_GPIO_PORT,GPIO_Pin_13) == KEY_ON)//作为重置按钮，回到红灯状态
				{
					
            LED_R_ON();
					
        }
    }
}





