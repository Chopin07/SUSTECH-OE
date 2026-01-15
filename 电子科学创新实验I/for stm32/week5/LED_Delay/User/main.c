/*********************************
芯片：STM32F103ZET6
实现功能：LED灯闪烁（低电平点亮，高电平熄灭）
引脚：PB5
*************************************/

#include "stm32f10x.h" 
#include "led.h"

uint32_t count;

void Delay( uint32_t count )
{
	for(; count!=0; count--);
}


int main(void)
{
		LED_GPIO_Config();
	  while(1)
		{
		    LED_ON();
			Delay(0xffffff);		
			LED_OFF();	
			Delay(0xffffff);
		}
}






