#ifndef __TIMER_TIME_H
#define __TIMER_TIME_H

#include "stm32f10x.h"

#define            BASIC_TIM_Period            (1000-1)
#define            BASIC_TIM_Prescaler         71
#define			   BASIC_TIM                   TIM6

void BASIC_TIM_Init(void);
#endif
