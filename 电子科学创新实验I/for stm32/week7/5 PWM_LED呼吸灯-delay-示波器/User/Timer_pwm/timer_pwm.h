#ifndef __TIMER_PWM_H
#define __TIMER_PWM_H

#include "stm32f10x.h"

#define            TIM                    TIM1
#define            TIMx_Period            2000
#define            TIMx_Prescaler         72


void GENERAL_TIM_PWM_Init(void);
#endif
