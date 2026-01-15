#include "stm32f10x.h" 
#include "stm32f10x_gpio.h"//
int main(void)
{
GPIO_InitTypeDef GPIO_InitStructure;

// 打开 GPIOB 端口的时钟
RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
// 配置IO口为输出
GPIO_InitStructure.GPIO_Pin= GPIO_Pin_0;
GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
GPIO_Init(GPIOB, &GPIO_InitStructure);
// 控制 ODR 寄存器
GPIO_ResetBits(GPIOB,GPIO_Pin_0); //LED on
//GPIO_SetBits(GPIOB,GPIO_Pin_5); //LED off
	
	
}

