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
    LED_GPIO_R_Config(); 
	  LED_GPIO_G_Config();
    LED_GPIO_B_Config();	
	
	  delay_init();
	
    while(1)
   {
     LED_R_OFF();
		 LED_G_OFF();
		 LED_B_OFF();//000
		 delay_ms(1000);//不亮
		 
		 LED_B_ON();//001
		 delay_ms(1000);//蓝色
		 
		 LED_G_ON();
		 LED_B_OFF();//010
		 delay_ms(1000);//绿色
		 
		 LED_B_ON();//011
		 delay_ms(1000);//绿+蓝
		 
		 LED_R_ON();
		 LED_G_OFF();
		 LED_B_OFF();//100
		 delay_ms(1000);//红色
		 
		 LED_B_ON();//101
		 delay_ms(1000);//红+蓝
		 
		 LED_G_ON();
		 LED_B_OFF();//110
		 delay_ms(1000);//红+绿
		 
		 LED_B_ON();//111
		 delay_ms(1000);//白色
		 
		 
   }
}





