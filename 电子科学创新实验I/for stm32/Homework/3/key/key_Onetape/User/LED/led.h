#ifndef __LED_H
#define __LED_H

#include "stm32f10x.h"

#define LED_GPIO_CLK   RCC_APB2Periph_GPIOB
#define LED_GPIO_Pin5   GPIO_Pin_5 //R
#define LED_GPIO_Pin0   GPIO_Pin_0 //G
#define LED_GPIO_Pin1   GPIO_Pin_1 //B
#define LED_GPIO_PORT   GPIOB

void LED_GPIO_R_Config(void);
void LED_GPIO_G_Config(void);
void LED_GPIO_B_Config(void);
void LED_R_ON(void);
void LED_R_OFF(void);	
void LED_G_ON(void);
void LED_G_OFF(void);	
void LED_B_ON(void);
void LED_B_OFF(void);	
void LED_R_TOGGLE(void);

#endif
