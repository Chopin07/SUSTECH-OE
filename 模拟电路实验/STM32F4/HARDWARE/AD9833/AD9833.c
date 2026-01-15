#include "stm32f4xx.h"                  // Device header
#include "AD9833.h"


//***************************
//		Pin assign	   	
//			STM32			AD9833
//		GPIOB_Pin_15 		---> FSYNC
//		GPIOB_Pin_14 		---> SCK
//		GPIOB_Pin_13 		---> DAT
//		GPIOB_Pin_12		---> CS
//***************************	

	/*端口定义 */ 
	#define PORT_FSYNC_B  GPIOB
	#define PIN_FSYNC_B   GPIO_Pin_15

	#define PORT_SCK_B	  GPIOB
	#define PIN_SCK_B	  GPIO_Pin_14

	#define PORT_DAT_B	  GPIOB
	#define PIN_DAT_B	  GPIO_Pin_13

	#define PORT_CS_B	  GPIOB
	#define PIN_CS_B	  GPIO_Pin_12  //数字电位器片选

    #define PORT_FSYNC_A  GPIOB
	#define PIN_FSYNC_A	  GPIO_Pin_11

	#define PORT_SCK_A	  GPIOB
	#define PIN_SCK_A	  GPIO_Pin_10

	#define PORT_DAT_A	  GPIOB
	#define PIN_DAT_A	  GPIO_Pin_9

	#define PORT_CS_A	  GPIOB
	#define PIN_CS_A 	  GPIO_Pin_8
//****************************************************************

	#define FSYNC_B_0()		GPIO_ResetBits(PORT_FSYNC_B, PIN_FSYNC_B)
	#define FSYNC_B_1()		GPIO_SetBits(PORT_FSYNC_B, PIN_FSYNC_B)

	#define SCK_B_0()		GPIO_ResetBits(PORT_SCK_B, PIN_SCK_B)
	#define SCK_B_1()		GPIO_SetBits(PORT_SCK_B, PIN_SCK_B)

	#define DAT_B_0()		GPIO_ResetBits(PORT_DAT_B, PIN_DAT_B)
	#define DAT_B_1()		GPIO_SetBits(PORT_DAT_B, PIN_DAT_B)	

	#define CS_B_0()		GPIO_ResetBits(PORT_CS_B, PIN_CS_B)	
	#define CS_B_1()		GPIO_SetBits(PORT_CS_B, PIN_CS_B)

    #define FSYNC_A_0()		GPIO_ResetBits(PORT_FSYNC_A, PIN_FSYNC_A)
	#define FSYNC_A_1()		GPIO_SetBits(PORT_FSYNC_A, PIN_FSYNC_A)

	#define SCK_A_0()		GPIO_ResetBits(PORT_SCK_A, PIN_SCK_A)
	#define SCK_A_1()		GPIO_SetBits(PORT_SCK_A, PIN_SCK_A)

	#define DAT_A_0()		GPIO_ResetBits(PORT_DAT_A, PIN_DAT_A)
	#define DAT_A_1()		GPIO_SetBits(PORT_DAT_A, PIN_DAT_A)	

	#define CS_A_0()		GPIO_ResetBits(PORT_CS_A, PIN_CS_A)	
	#define CS_A_1()		GPIO_SetBits(PORT_CS_A, PIN_CS_A)

//初始化AD9833 GPIO

void AD9833_Init_GPIO()
{
    GPIO_InitTypeDef GPIO_InitStructure;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);

	GPIO_InitStructure.GPIO_Pin = PIN_FSYNC_B|PIN_SCK_B|PIN_DAT_B|PIN_CS_B|PIN_FSYNC_A|PIN_SCK_A|PIN_DAT_A|PIN_CS_A; 
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

}



/*
*********************************************************************************************************
*	函 数 名: AD9833_Delay
*	功能说明: 时钟延时
*	形    参: 无
*	返 回 值: 无
*********************************************************************************************************
*/
static void AD9833_Delay(void)
{
	uint16_t i;
	for (i = 0; i < 1; i++);
}



/*
*********************************************************************************************************
*	函 数 名: AD9833_Write
*	功能说明: 向SPI总线发送16个bit数据
*	形    参: TxData : 数据
*	返 回 值: 无
*********************************************************************************************************
*/
void AD9833_Write_B(unsigned int TxData)
{
	unsigned char i;

	SCK_B_1();
	//AD9833_Delay();
	FSYNC_B_1();
	//AD9833_Delay();
	FSYNC_B_0();
	//AD9833_Delay();
	for(i = 0; i < 16; i++)
	{
		if (TxData & 0x8000)
			DAT_B_1();
		else
			DAT_B_0();
		
		AD9833_Delay();
		SCK_B_0();
		AD9833_Delay();		
		SCK_B_1();
		
		TxData <<= 1;
	}
	FSYNC_B_1();
	
} 

void AD9833_Write_A(unsigned int TxData)
{
	unsigned char i;

	SCK_A_1();
	//AD9833_Delay();
	FSYNC_A_1();
	//AD9833_Delay();
	FSYNC_A_0();
	//AD9833_Delay();
	for(i = 0; i < 16; i++)
	{
		if (TxData & 0x8000)
			DAT_A_1();
		else
			DAT_A_0();
		
		AD9833_Delay();
		SCK_A_0();
		AD9833_Delay();		
		SCK_A_1();
		
		TxData <<= 1;
	}
	FSYNC_A_1();
	
} 

/*
*********************************************************************************************************
*	函 数 名: AD9833_AmpSet
*	功能说明: 改变输出信号幅度值
*	形    参: 1.amp ：幅度值  0- 255
*	返 回 值: 无
*********************************************************************************************************
*/ 


void AD9833_AmpSet_B(unsigned char amp)
{
	unsigned char i;
	unsigned int temp;
   	
	CS_B_0();
	temp =0x1100|amp;
	for(i=0;i<16;i++)
	{
	    SCK_B_0();	
	   if(temp&0x8000)
	   	DAT_B_1();
	   else
		DAT_B_0();
		temp<<=1;
	    SCK_B_1();
	    AD9833_Delay();
	}
	
   	CS_B_1();
}

void AD9833_AmpSet_A(unsigned char amp)
{
	unsigned char i;
	unsigned int temp;
   	
	CS_A_0();
	temp =0x1100|amp;
	for(i=0;i<16;i++)
	{
	    SCK_A_0();	
	   if(temp&0x8000)
	   	DAT_A_1();
	   else
		DAT_A_0();
		temp<<=1;
	    SCK_A_1();
	    AD9833_Delay();
	}
	
   	CS_A_1();
}


/*
*********************************************************************************************************
*	函 数 名: AD9833_WaveSeting
*	功能说明: 向SPI总线发送16个bit数据
*	形    参: 1.Freq: 频率值, 0.1 hz - 12Mhz
			  2.Freq_SFR: 0 或 1
			  3.WaveMode: TRI_WAVE(三角波),SIN_WAVE(正弦波),SQU_WAVE(方波)
			  4.Phase : 波形的初相位
*	返 回 值: 无
*********************************************************************************************************
*/ 
void AD9833_WaveSeting_B(double Freq,unsigned int Freq_SFR,unsigned int WaveMode,unsigned int Phase )
{

		int frequence_LSB,frequence_MSB,Phs_data;
		double   frequence_mid,frequence_DATA;
		long int frequence_hex;

		/*********************************计算频率的16进制值***********************************/
		frequence_mid=268435456/25;//适合25M晶振
		//如果时钟频率不为25MHZ，修改该处的频率值，单位MHz ，AD9833最大支持25MHz
		frequence_DATA=Freq;
		frequence_DATA=frequence_DATA/1000000;
		frequence_DATA=frequence_DATA*frequence_mid;
		frequence_hex=frequence_DATA;  //这个frequence_hex的值是32位的一个很大的数字，需要拆分成两个14位进行处理；
		frequence_LSB=frequence_hex; //frequence_hex低16位送给frequence_LSB
		frequence_LSB=frequence_LSB&0x3fff;//去除最高两位，16位数换去掉高位后变成了14位
		frequence_MSB=frequence_hex>>14; //frequence_hex高16位送给frequence_HSB
		frequence_MSB=frequence_MSB&0x3fff;//去除最高两位，16位数换去掉高位后变成了14位

		Phs_data=Phase|0xC000;	//相位值
		AD9833_Write_B(0x0100); //复位AD9833,即RESET位为1
		AD9833_Write_B(0x2100); //选择数据一次写入，B28位和RESET位为1

		if(Freq_SFR==0)				  //把数据设置到设置频率寄存器0
		{
		 	frequence_LSB=frequence_LSB|0x4000;
		 	frequence_MSB=frequence_MSB|0x4000;
			 //使用频率寄存器0输出波形
			AD9833_Write_B(frequence_LSB); //L14，选择频率寄存器0的低14位数据输入
			AD9833_Write_B(frequence_MSB); //H14 频率寄存器的高14位数据输入
			AD9833_Write_B(Phs_data);	//设置相位
			//AD9833_Write(0x2000); /**设置FSELECT位为0，芯片进入工作状态,频率寄存器0输出波形**/
	    }
		if(Freq_SFR==1)				//把数据设置到设置频率寄存器1
		{
			 frequence_LSB=frequence_LSB|0x8000;
			 frequence_MSB=frequence_MSB|0x8000;
			//使用频率寄存器1输出波形
			AD9833_Write_B(frequence_LSB); //L14，选择频率寄存器1的低14位输入
			AD9833_Write_B(frequence_MSB); //H14 频率寄存器1为
			AD9833_Write_B(Phs_data);	//设置相位
			//AD9833_Write(0x2800); /**设置FSELECT位为0，设置FSELECT位为1，即使用频率寄存器1的值，芯片进入工作状态,频率寄存器1输出波形**/
		}

		if(WaveMode==TRI_WAVE) //输出三角波波形
		 	AD9833_Write_B(0x2002); 
		if(WaveMode==SQU_WAVE)	//输出方波波形
			AD9833_Write_B(0x2028); 
		if(WaveMode==SIN_WAVE)	//输出正弦波形
			AD9833_Write_B(0x2000); 

}

void AD9833_WaveSeting_A(double Freq,unsigned int Freq_SFR,unsigned int WaveMode,unsigned int Phase )
{

		int frequence_LSB,frequence_MSB,Phs_data;
		double   frequence_mid,frequence_DATA;
		long int frequence_hex;

		/*********************************计算频率的16进制值***********************************/
		frequence_mid=268435456/25;//适合25M晶振
		//如果时钟频率不为25MHZ，修改该处的频率值，单位MHz ，AD9833最大支持25MHz
		frequence_DATA=Freq;
		frequence_DATA=frequence_DATA/1000000;
		frequence_DATA=frequence_DATA*frequence_mid;
		frequence_hex=frequence_DATA;  //这个frequence_hex的值是32位的一个很大的数字，需要拆分成两个14位进行处理；
		frequence_LSB=frequence_hex; //frequence_hex低16位送给frequence_LSB
		frequence_LSB=frequence_LSB&0x3fff;//去除最高两位，16位数换去掉高位后变成了14位
		frequence_MSB=frequence_hex>>14; //frequence_hex高16位送给frequence_HSB
		frequence_MSB=frequence_MSB&0x3fff;//去除最高两位，16位数换去掉高位后变成了14位

		Phs_data=Phase|0xC000;	//相位值
		AD9833_Write_A(0x0100); //复位AD9833,即RESET位为1
		AD9833_Write_A(0x2100); //选择数据一次写入，B28位和RESET位为1

		if(Freq_SFR==0)				  //把数据设置到设置频率寄存器0
		{
		 	frequence_LSB=frequence_LSB|0x4000;
		 	frequence_MSB=frequence_MSB|0x4000;
			 //使用频率寄存器0输出波形
			AD9833_Write_A(frequence_LSB); //L14，选择频率寄存器0的低14位数据输入
			AD9833_Write_A(frequence_MSB); //H14 频率寄存器的高14位数据输入
			AD9833_Write_A(Phs_data);	//设置相位
			//AD9833_Write(0x2000); /**设置FSELECT位为0，芯片进入工作状态,频率寄存器0输出波形**/
	    }
		if(Freq_SFR==1)				//把数据设置到设置频率寄存器1
		{
			 frequence_LSB=frequence_LSB|0x8000;
			 frequence_MSB=frequence_MSB|0x8000;
			//使用频率寄存器1输出波形
			AD9833_Write_A(frequence_LSB); //L14，选择频率寄存器1的低14位输入
			AD9833_Write_A(frequence_MSB); //H14 频率寄存器1为
			AD9833_Write_A(Phs_data);	//设置相位
			//AD9833_Write(0x2800); /**设置FSELECT位为0，设置FSELECT位为1，即使用频率寄存器1的值，芯片进入工作状态,频率寄存器1输出波形**/
		}

		if(WaveMode==TRI_WAVE) //输出三角波波形
		 	AD9833_Write_A(0x2002); 
		if(WaveMode==SQU_WAVE)	//输出方波波形
			AD9833_Write_A(0x2028); 
		if(WaveMode==SIN_WAVE)	//输出正弦波形
			AD9833_Write_A(0x2000); 

}

