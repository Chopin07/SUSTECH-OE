#include "delay.h"
#include "stm32f10x.h"  //包含需要的头文件



void delay_init()
{
	((SysTick_Type*)(0xE000E010))->CTRL &=~(1<<2);//1、系统时钟的8分频

}



void delay_ms(u16 nms)
{	 		  	  
	u32 temp; 
	((SysTick_Type*)(0xE000E010))->LOAD =  (u32)nms*9000;//2、重装数值
	((SysTick_Type*)(0xE000E010))->VAL = 0x00; //3、清空计数器
	((SysTick_Type*)(0xE000E010))->CTRL |= 0x01;//4、启动计数器
	do
	{
		temp=((SysTick_Type*)(0xE000E010))->CTRL;//5、查询
	}while(!(temp&(1<<16)));
	
	((SysTick_Type*)(0xE000E010))->CTRL &= ~(1<<0);//6、关闭计数器
	((SysTick_Type*)(0xE000E010))->VAL = 0x00; //7、清空计数器
}


