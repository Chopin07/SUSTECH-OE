#include "stm32f10x.h"
#include "stm32f10x_gpio.h"
int main (void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	// 打开 GPIOB 端口的时钟
	RCC->APB2ENR  |=  ( (1) << 3 );
	
	// 配置IO口为输出

	GPIO_InitStructure.GPIO_Pin= GPIO_Pin_5;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);	
	
     // 控制 ODR 寄存器	
	//LED on
	
	//GPIO_SetBits(GPIOB,GPIO_Pin_5);  //LED off
	
		
}


void SystemInit(void)
{
	// 函数体为空，目的是为了骗过编译器不报错
}




