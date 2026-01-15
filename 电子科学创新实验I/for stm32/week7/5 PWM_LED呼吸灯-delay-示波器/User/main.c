/*********************************
芯片：STM32F103ZET6
实现功能：使用通用定时器TIM1实现PWM输出（）；
引脚：TIM3 CH1---PA6;  
*************************************/

#include "stm32f10x.h" 
#include "timer_pwm.h"
//#include "led.h"

void Delay_nms(__IO uint32_t count )
{
	
	uint16_t i;
	while(count--)
	{
		i=12000;
		while(i--);
	}
}


int main(void)
{
	
	 
	  short int kcnt=2000; //
		//uint8_t sign=1;
		GENERAL_TIM_PWM_Init();
//	  LED_GPIO_Config();
			
	
	  while(1)
		{
			
			for(kcnt=2001;kcnt>0;kcnt=kcnt-200)
			{
				TIM_SetCompare3(TIM,kcnt);
//				LED_ON();
				Delay_nms(100);			
			}
			
			for(kcnt=1;kcnt<=2001;kcnt=kcnt+200)//ARR2000
			{
				TIM_SetCompare3(TIM,kcnt);
//				LED_OFF();
				Delay_nms(100);			
			}
	  }
}






