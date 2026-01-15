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

// 中断优先级配置
static void BASIC_TIM_NVIC_Config(void)
{
    NVIC_InitTypeDef NVIC_InitStructure; 
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM6,ENABLE);
	
	   
		// 设置中断来源
    NVIC_InitStructure.NVIC_IRQChannel = TIM6_IRQn ;	
		// 设置主优先级为 0
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;	 
	  // 设置抢占优先级为3
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;	
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
}

static void BASIC_TIM_Config()
{
	  TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
		
		// 1 开启定时器时钟,即内部时钟CK_INT=72M
	  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM6,ENABLE);
	
		// 2 自动重装载寄存器的值，累计TIM_Period+1个频率后产生一个更新或者中断
    TIM_TimeBaseStructure.TIM_Period = BASIC_TIM_Period;

	  // 时钟预分频数为
    TIM_TimeBaseStructure.TIM_Prescaler= BASIC_TIM_Prescaler;
	
		// 时钟分频因子 ，基本定时器没有，不用管
    //TIM_TimeBaseStructure.TIM_ClockDivision=TIM_CKD_DIV1;
		
		// 计数器计数模式，基本定时器只能向上计数，没有计数模式的设置
    //TIM_TimeBaseStructure.TIM_CounterMode=TIM_CounterMode_Up; 
		
		// 重复计数器的值，基本定时器没有，不用管
		//TIM_TimeBaseStructure.TIM_RepetitionCounter=0;
	
	  // 初始化定时器
    TIM_TimeBaseInit(TIM6, &TIM_TimeBaseStructure);
		
		// 3 清除计数器中断标志位
    TIM_ClearFlag(TIM6, TIM_FLAG_Update);
	  
		//  开启计数器中断
    TIM_ITConfig(TIM6,TIM_IT_Update,ENABLE);
		
		//4 使能计数器
    TIM_Cmd(TIM6, ENABLE);
}

void BASIC_TIM_Init(void)
{
	BASIC_TIM_NVIC_Config();
	BASIC_TIM_Config();
}



