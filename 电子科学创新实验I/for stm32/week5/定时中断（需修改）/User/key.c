#include "sys.h"


u8 flag = 0;

void KEY_GPIO_Config(void)
{
	GPIO_InitTypeDef GPIO_InitStruct;
	
	RCC_APB2PeriphClockCmd(KEY_GPIO_CLK, ENABLE);
	GPIO_InitStruct.GPIO_Pin = KEY_GPIO_PIN;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IPU;
	//GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
	
	GPIO_Init(KEY_GPIO_PORT, &GPIO_InitStruct);
	
}

void KEY_Scan()
{
	if(PBin(15) == 0)
	{
		delay_ms(5);
		if(PBin(15) == 0)
		{
			flag = 1;
		}
		while(!PBin(15));
	}
}
