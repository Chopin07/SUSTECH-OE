/*********************************
芯片：STM32F103ZET6
实现功能：低电平点亮LED灯
引脚：PB5
*************************************/

#include "stm32f10x.h" 
#include "led.h"

int main(void)
{
		LED_GPIO_Config();
	  LED_ON();
	  //LED_OFF();	
}






