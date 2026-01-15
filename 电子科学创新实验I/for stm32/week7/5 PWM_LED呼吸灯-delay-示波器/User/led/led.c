#include "led.h"
#include "stm32f10x_gpio.h"

 uint16_t time=0;
 
void LED_GPIO_Config(void)
{
  GPIO_InitTypeDef  GPIO_InitStruct;
	// 打开 GPIOB 端口的时钟
	RCC_APB2PeriphClockCmd(LED_GPIO_CLK, ENABLE);
	// 配置IO口为输出
	GPIO_InitStruct.GPIO_Mode=GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Pin=LED_GPIO_Pin;
	GPIO_InitStruct.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_Init(LED_GPIO_PORT, &GPIO_InitStruct);

}

void LED_ON(void)
{
	// 输出电平	
	GPIO_ResetBits(LED_GPIO_PORT, LED_GPIO_Pin); //LED on

}


void LED_OFF(void)
{
	// 输出电平	
	GPIO_SetBits(LED_GPIO_PORT, LED_GPIO_Pin); //LED on

}

void Wave(void)
{

		static uint8_t i=0;
  if( time == 5) //0.005s变一次，100Hz；0.010s变一次，50Hz
    {
     time = 0;
     switch(i)
     {
       case 0:LED_ON();i++;break;
       case 1:LED_OFF();i= 0;break;
      }
     }
  
}
