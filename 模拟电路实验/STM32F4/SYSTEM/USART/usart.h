#ifndef __USART_H
#define __USART_H
#include "stdio.h"	
#include "stm32f4xx_conf.h"
#include "sys.h" 

void Usart_SendString( USART_TypeDef * pUSARTx, char *str);
void Debug_USART_Config(void);


#endif


