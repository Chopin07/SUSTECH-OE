#include "timer_time.h"
/********************
配置NVIC。

①使能定时器时钟。
RCC_APB1PeriphClockCmd();
② 初始化定时器，配置ARR,PSC。
TIM_TimeBaseInit();
③清除计数器中断标志位、开启定时器中断
TIM_ClearFlag
void TIM_ITConfig();

④使能定时器。
TIM_Cmd();
⑤编写中断服务函数。
TIMx_IRQHandler();
*****************/

//TIM3-ETR---PD2 引脚配置
static void GENERAL_TIM_GPIO_Config()
{
  ？？？？？
  GPIO_Init(GPIOD, &GPIO_InitStructure);	

}


static void GENERAL_TIM__Timer_Config()
{
	 
	
	  
	// 1 开启定时器时钟,即内部时钟CK_INT=72M
	？？？？？
	
	//2 使用内部时钟，
      TIM_DeInit(TIM2);
	？？？？
	
		// 2 自动重装载寄存器的值，累计TIM_Period+1个频率后产生一个更新或者中断
	？？？？？？？
    TIM_TimeBaseInit(TIM2, &TIM_TimeBaseStructure);
		
		// 3 中断的相应配置
	？？？？？？？
    NVIC_Init(&NVIC_InitStructure);
		//清除计数器中断标志位
    TIM_ClearFlag(TIM2, TIM_FLAG_Update);
	  
		//  开启计数器溢出中断
    TIM_ITConfig(TIM2,TIM_IT_Update,ENABLE);
		
		//4 使能计数器
    TIM_Cmd(TIM2, ENABLE);
}

static void GENERAL_TIM__ETRCounter_Config()
{
	
	
  	
		// 1 开启定时器时钟,即内部时钟CK_INT=72M
	？？？？？
	
	  //2 
     TIM_DeInit(TIM3);
	//外部时钟模式2设置
	TIM_ETRClockMode2Config(???????);
		  
	
		// 2 自动重装载寄存器的值，累计TIM_Period+1个频率后产生一个更新或者中断
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
		
    TIM_TimeBaseStructure.TIM_Period = 0xffff-1;

	  // 时钟预分频数为1
    TIM_TimeBaseStructure.TIM_Prescaler= 0x00;
	
		// 滤波器设置，不分频 ，
    TIM_TimeBaseStructure.TIM_ClockDivision=0x0;
		
		// 计数器计数模式，
    TIM_TimeBaseStructure.TIM_CounterMode=TIM_CounterMode_Up; 
		
		// 重复计数器的值，
	TIM_TimeBaseStructure.TIM_RepetitionCounter=0;
	
	  // 初始化定时器
    TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);
		
		
		//清零计数器
	TIM_SetCounter(TIM3,0);
		// 使能计数器
    TIM_Cmd(TIM3, ENABLE);

}

void GENERAL_TIM_Init(void)
{
	GENERAL_TIM_GPIO_Config();
	GENERAL_TIM__Timer_Config();
	GENERAL_TIM__ETRCounter_Config();

}



