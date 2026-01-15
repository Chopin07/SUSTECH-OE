#include "GeneralTim.h"

// 定时器输入捕获用户自定义变量结构体定义
TIM_ICUserValueTypeDef TIM_ICUserValueStructure = {0,0,0,0};


static void GENERAL_TIM_GPIO_Config(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;

  // 输入捕获通道 GPIO 初始化  TIM4  的PB6 端口
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_6;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
  GPIO_Init(GPIOA, &GPIO_InitStructure);	
}


static void GENERAL_TIM_Mode_Config(void)
{
	  // 开启定时器时钟,即内部时钟CK_INT=72M
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4,ENABLE);

/*--------------------时基结构体初始化-------------------------*/	
   TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	// 自动重装载寄存器的值，累计TIM_Period+1个频率后产生一个更新或者中断
	TIM_TimeBaseStructure.TIM_Period=GENERAL_TIM_PERIOD;	
	// 驱动CNT计数器的时钟 = Fck_int/(psc+1)
	TIM_TimeBaseStructure.TIM_Prescaler= GENERAL_TIM_PSC;	
	// 时钟分频因子 
	TIM_TimeBaseStructure.TIM_ClockDivision=TIM_CKD_DIV1;		
	// 计数器计数模式，设置为向上计数
	TIM_TimeBaseStructure.TIM_CounterMode=TIM_CounterMode_Up;		
	// 重复计数器的值，没用到不用管
	TIM_TimeBaseStructure.TIM_RepetitionCounter=0;	
	// 初始化定时器
	TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure);

	/*--------------------输入捕获结构体初始化-------------------*/	
	TIM_ICInitTypeDef TIM_ICInitStructure;
	// 配置输入捕获的通道，需要根据具体的GPIO来配置
	TIM_ICInitStructure.TIM_Channel = TIM_Channel_1;
	// 输入捕获信号的极性配置
	TIM_ICInitStructure.TIM_ICPolarity = TIM_ICPolarity_Rising;
	// 输入通道和捕获通道的映射关系，有直连和非直连两种
	TIM_ICInitStructure.TIM_ICSelection = TIM_ICSelection_DirectTI;
	// 输入的需要被捕获的信号的分频系数
	TIM_ICInitStructure.TIM_ICPrescaler = TIM_ICPSC_DIV1;
	// 输入的需要被捕获的信号的滤波系数
	TIM_ICInitStructure.TIM_ICFilter = 0;
	// 定时器输入捕获初始化
	TIM_ICInit(TIM4, &TIM_ICInitStructure);
	/*--------------------中断配置-------------------*/	
	//NVIC 配置
	 NVIC_InitTypeDef NVIC_InitStructure; 
    // 设置中断来源
    NVIC_InitStructure.NVIC_IRQChannel = TIM4_IRQn ;	
		// 设置主优先级为 0
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;	 
	  // 设置抢占优先级为3
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;	
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
	
	// 清除更新和捕获中断标志位
    TIM_ClearFlag(TIM4, TIM_FLAG_Update | TIM_FLAG_CC1);	
    // 开启更新和捕获中断  
	TIM_ITConfig (TIM4, TIM_IT_Update | TIM_IT_CC1, ENABLE );
	
	// 使能计数器
	TIM_Cmd(TIM4, ENABLE);
}

void GENERAL_TIM_Init(void)
{
	GENERAL_TIM_GPIO_Config();
	GENERAL_TIM_Mode_Config();
}
