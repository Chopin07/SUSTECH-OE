#ifndef __AD9833_H
#define __AD9833_H

#include "stm32f4xx.h"                  // Device header

#define TRI_WAVE 	0  		//输出三角波
#define SIN_WAVE 	1		//输出正弦波
#define SQU_WAVE 	2		//输出方波


void AD9833_WaveSeting_B(double frequence,unsigned int frequence_SFR,unsigned int WaveMode,unsigned int Phase );
void AD9833_WaveSeting_A(double frequence,unsigned int frequence_SFR,unsigned int WaveMode,unsigned int Phase );
void AD9833_Init_GPIO(void);
void AD9833_AmpSet_B(unsigned char amp);
void AD9833_AmpSet_A(unsigned char amp);


#endif
