#include "stm32f10x.h" 
#include "usart.h"
#include "GeneralTim.h"
#include "led.h"
#include "timer_time.h"


 uint32_t number; 

 
int main(void)
{
	// uint32_t number; 
	// TIM 计数器的驱动时钟
	 uint32_t TIM_PscCLK = 72000000 / (GENERAL_TIM_PSC+1);
	// 设置中断组为0
   NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);
   //初始化定时器和串口
	 GENERAL_TIM_Init();  
	 BASIC_TIM_Init();
	
	 USART_Config();
  
	 LED_GPIO_Config();
	
	 printf ( "\r\n电子创新实验 STM32 输入捕获实验\r\n" );
	 printf ( "\r\n计算频率\r\n" );
	
	while ( 1 )
	{
		//生成方波
    Wave();
		
		if(TIM_ICUserValueStructure.Capture_FinishFlag == 1)
		{
			// 计算高电平时间的计数器的值
			number = TIM_ICUserValueStructure.Capture_Period * (GENERAL_TIM_PERIOD+1) + (TIM_ICUserValueStructure.Capture_CcrValue+1);
			
			// 打印高电平脉宽时间  //两个整形数相除，得到的还是整型。。
			//printf ( "\r\n测得高电平脉宽时间：%d.%d s\r\n",number/TIM_PscCLK,number%TIM_PscCLK );
			printf ( "\r\n HZ：%d Hz\r\n",(int)(1/((double)number/TIM_PscCLK)));
			
			TIM_ICUserValueStructure.Capture_FinishFlag = 0;			
		}		
	}
	
}






