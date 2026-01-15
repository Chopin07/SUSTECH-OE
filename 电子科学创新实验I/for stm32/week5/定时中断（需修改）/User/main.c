#include "sys.h"

int main(void)
{
		LED_GPIO_Config();
		delay_init();
		
		TIM3_Init(9999,7199);
		while(1)			
		{
				
		
		};
}
