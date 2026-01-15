/*********************************
芯片：STM32F103ZET6
实现功能：TIM2定时200ms，TIM3使用外部ETR引脚作为输入进行计数；
引脚：TIM3 ETR---PD2
*************************************/

#include "stm32f10x.h" 
#include "timer_time.h"
#include "usart.h"

float Frequency_value;

int main(void)
{
	
	 
	  // 设置中断组为0
      NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);	
	  GENERAL_TIM_Init();  
	  USART_Config();  
	 
	
	  while(1)
		{
				 Usart_SendString( DEBUG_USARTx,"\nHello!\n");
				 printf("Frequency of the input signal is \n%f\r",Frequency_value);
	  }
}






