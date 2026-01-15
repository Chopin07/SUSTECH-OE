#include "timer_pwm.h"

//TIM3 CH3--PB0 引脚配置  
static void GENERAL_TIM_GPIO_Config()
{
       GPIO_InitTypeDef GPIO_InitStructure;
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	
       GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_8;
	
       GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF_PP;
	
       GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	
       GPIO_Init(GPIOB, &GPIO_InitStructure);
}
static void GENERAL_TIM__PWM_Config()
{
       TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;
       TIM_OCInitTypeDef TIM_OCInitStruct;
 	
       // 1 开启定时器时钟,即内部时钟 CK_INT=72M
       RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1,ENABLE);
	
       TIM_DeInit(TIM);
       TIM_InternalClockConfig(TIM);
	
       // 2 自动重装载寄存器的值，累计 TIM_Period+1 个频率后产生一个更新或者中断
       TIM_TimeBaseStructure.TIM_Period = TIMx_Period;                                                                                        
	
       // 时钟预分频数为
       TIM_TimeBaseStructure.TIM_Prescaler= TIMx_Prescaler;
	
       // 时钟分频因子 ，
       TIM_TimeBaseStructure.TIM_ClockDivision=0x0;
	
       // 计数器计数模式，
       TIM_TimeBaseStructure.TIM_CounterMode=TIM_CounterMode_Up;
	
       // 重复计数器的值，
       //TIM_TimeBaseStructure.TIM_RepetitionCounter=0;
			 
       // 初始化定时器
       TIM_TimeBaseInit(TIM, &TIM_TimeBaseStructure);
			 
       //继续配置 PWM 功能。初始 CCR=72
       TIM_OCInitStruct.TIM_OCMode=TIM_OCMode_PWM1;
       TIM_OCInitStruct.TIM_OutputState=TIM_OutputState_Enable;
       TIM_OCInitStruct.TIM_OCPolarity=TIM_OCPolarity_High;
       TIM_OCInitStruct.TIM_Pulse=72;
       TIM_OC3Init(TIM,&TIM_OCInitStruct);
			 
       //使能 TIMx 在 CCR 上的预装载寄存器
       TIM_OC3PreloadConfig(TIM,TIM_OCPreload_Enable);
			 
       //设置 TIMx 的 PWM 输出为使能
       TIM_CtrlPWMOutputs(TIM,ENABLE);
			 
       //使能 TIMx 在 ARR 上的预装载寄存器
       TIM_ARRPreloadConfig(TIM,ENABLE);
			 
       //4 使能 TIMx 外设
       TIM_Cmd(TIM, ENABLE);
			 
}
void GENERAL_TIM_PWM_Init(void)
{
     GENERAL_TIM_GPIO_Config();
     GENERAL_TIM__PWM_Config();
}



