#ifndef __GENERALTIM_H
#define __GENERALTIM_H

#include "stm32f10x.h"


/************通用定时器TIM参数定义，只限TIM2、3、4、5***********本例使用TIM5*/

#define            GENERAL_TIM_PERIOD            0XFFFF
#define            GENERAL_TIM_PSC              (72-1)

// 中断相关宏定义
#define            GENERAL_TIM_IT_CCx            TIM_IT_CC1


// 获取捕获寄存器值函数宏定义
#define            GENERAL_TIM_GetCapturex_FUN                 TIM_GetCapture1



// 定时器输入捕获用户自定义变量结构体声明
typedef struct
{   
	uint8_t   Capture_FinishFlag;   // 捕获结束标志位
	uint8_t   Capture_StartFlag;    // 捕获开始标志位
	uint16_t  Capture_CcrValue;     // 捕获寄存器的值
	uint16_t  Capture_Period;       // 自动重装载寄存器更新标志 
}TIM_ICUserValueTypeDef;

extern TIM_ICUserValueTypeDef TIM_ICUserValueStructure;


void GENERAL_TIM_Init(void);

#endif	/* __GENERALTIM_H */
