#include "sys.h"
u8 j=0;
extern u8 flag;
void LED_GPIO_Config(void)
{
	GPIO_InitTypeDef GPIO_InitStruct;
	
	RCC_APB2PeriphClockCmd(LED_GPIO_CLK, ENABLE);
	GPIO_InitStruct.GPIO_Pin = LED_GPIO_PIN;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	
	GPIO_Init(LED_GPIO_PORT, &GPIO_InitStruct);
	
}

void LED_Change()
{
	
	static u8 i =0;
	j++;
	if(flag == 1)
	{
		flag = 0;	
		switch (i)
		{
			case 0:PAout(8) = 1;i++;break;
			case 1:PAout(8) = 0;i=0;break;
		}	
	}	

}
