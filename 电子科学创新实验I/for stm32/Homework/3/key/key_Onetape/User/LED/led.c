#include "led.h"

void LED_GPIO_R_Config(void)
{
  GPIO_InitTypeDef  GPIO_InitStruct;
	// 打开 GPIOB 端口的时钟
	RCC_APB2PeriphClockCmd(LED_GPIO_CLK, ENABLE);
	// 配置IO口为输出
	GPIO_InitStruct.GPIO_Mode=GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Pin=LED_GPIO_Pin5;
	GPIO_InitStruct.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_Init(LED_GPIO_PORT, &GPIO_InitStruct);

}

void LED_GPIO_G_Config(void)
{
  GPIO_InitTypeDef  GPIO_InitStruct;
	// 打开 GPIOB 端口的时钟
	RCC_APB2PeriphClockCmd(LED_GPIO_CLK, ENABLE);
	// 配置IO口为输出
	GPIO_InitStruct.GPIO_Mode=GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Pin=LED_GPIO_Pin0;
	GPIO_InitStruct.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_Init(LED_GPIO_PORT, &GPIO_InitStruct);

}

void LED_GPIO_B_Config(void)
{
  GPIO_InitTypeDef  GPIO_InitStruct;
	// 打开 GPIOB 端口的时钟
	RCC_APB2PeriphClockCmd(LED_GPIO_CLK, ENABLE);
	// 配置IO口为输出
	GPIO_InitStruct.GPIO_Mode=GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Pin=LED_GPIO_Pin1;
	GPIO_InitStruct.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_Init(LED_GPIO_PORT, &GPIO_InitStruct);

}

void LED_R_ON(void)
{
	// 输出电平	
	GPIO_ResetBits(LED_GPIO_PORT, LED_GPIO_Pin5); //LED on

}


void LED_R_OFF(void)
{
	// 输出电平	
	GPIO_SetBits(LED_GPIO_PORT, LED_GPIO_Pin5); //LED off

}

void LED_G_ON(void)
{
	// 输出电平	
	GPIO_ResetBits(LED_GPIO_PORT, LED_GPIO_Pin0); //LED on

}


void LED_G_OFF(void)
{
	// 输出电平	
	GPIO_SetBits(LED_GPIO_PORT, LED_GPIO_Pin0); //LED off

}

void LED_B_ON(void)
{
	// 输出电平	
	GPIO_ResetBits(LED_GPIO_PORT, LED_GPIO_Pin1); //LED on

}


void LED_B_OFF(void)
{
	// 输出电平	
	GPIO_SetBits(LED_GPIO_PORT, LED_GPIO_Pin1); //LED off

}

void LED_R_TOGGLE(void)
{
	
	if(GPIO_ReadOutputDataBit(LED_GPIO_PORT, LED_GPIO_Pin5) == Bit_RESET)
	{
		LED_R_OFF();
	}
	else
	{
		LED_R_ON();
	}
	
}