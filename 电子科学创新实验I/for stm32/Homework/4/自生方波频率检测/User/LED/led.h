#ifndef __LED_H
#define __LED_H

#include "stm32f10x.h"

#define LED_GPIO_CLK   RCC_APB2Periph_GPIOA
#define LED_GPIO_Pin   GPIO_Pin_4
#define LED_GPIO_PORT  GPIOA

void LED_GPIO_Config(void);
void LED_ON(void);
void LED_OFF(void);	
void Wave(void);

#endif
