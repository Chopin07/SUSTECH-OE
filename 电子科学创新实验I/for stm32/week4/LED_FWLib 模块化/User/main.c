/*********************************
芯片：STM32F103VET6
实现功能：LED灯闪烁
引脚：PB5(红),PB0(绿),PB1(蓝) (RGB) 000-111(八种状态）
*************************************/

#include "stm32f10x.h"
#include "led.h"
#include "delay.h"

int main(void)
{

	  LED_GPIO_G_Config();

	
	  delay_init();
	
   
}





