/*********************************
芯片：STM32F103VET6
实现功能：LED灯闪烁
引脚：PB5(红),PB0(绿),PB1(蓝) (RGB) 000-111(八种状态）
*************************************/

#include "stm32f10x.h"
#include "led.h"
#include "delay.h"
#include "key.h"

#define KEY_ON  1
#define KEY_OFF 0

int main(void)
{
	  int count = 0;
    /* LED 端口初始化 */
    LED_GPIO_R_Config();
	  LED_GPIO_G_Config();
	  LED_GPIO_B_Config();

    /*初始化按键*/
    Key_GPIO_Config();

	  //题目要求控制红灯的状态,初始化不亮灯
	  LED_R_OFF();
	  LED_G_OFF();
	  LED_B_OFF();
	
	  
	  /*如果要在八个状态间变换
	  从红灯状态为初始状态100
	  100-101：
	
	
	
	                                     */
	
	   
		 
    /* 轮询按键状态，若按键按下则反转LED */
    while (1) 
		{
        if ( Key_Scan(KEY1_GPIO_PORT,GPIO_Pin_0) == KEY_ON  ) 
				{
					  
            count = count+1;
					if(count>=8)
				  {
					count = count-8;
				  }
        }
				
				if ( Key_Scan(KEY2_GPIO_PORT,GPIO_Pin_13) == KEY_ON)//作为重置按钮，回到红灯状态
				{
					
            count =0;
					
        }
				
				if(count==0)//100
				{
					LED_R_ON();
					LED_G_OFF();
	        LED_B_OFF();
				}
				
				if(count==1)//101
				{
					LED_R_ON();
					LED_G_OFF();
	        LED_B_ON();
				}
				
				if(count==2)//110
				{
					LED_R_ON();
					LED_G_ON();
	        LED_B_OFF();
				}
				
				if(count==3)//111
				{
					LED_R_ON();
					LED_G_ON();
	        LED_B_ON();
				}
				
				if(count==4)//000
				{
					LED_R_OFF();
					LED_G_OFF();
	        LED_B_OFF();
				}
				
				if(count==5)//001
				{
					LED_R_OFF();
					LED_G_OFF();
	        LED_B_ON();
				}
				
				if(count==6)//010
				{
					LED_R_OFF();
					LED_G_ON();
	        LED_B_OFF();
				}
				
				if(count==7)//011
				{
					LED_R_OFF();
					LED_G_ON();
	        LED_B_ON();
				}
				
        
 
    }
}







