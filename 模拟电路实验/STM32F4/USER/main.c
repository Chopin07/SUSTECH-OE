#include "stm32f4xx.h"                  // Device header
#include "adc.h"
#include "usart.h"
#include <math.h>
#include "arm_math.h"
#include "arm_const_structs.h"
#include "delay.h"
#include "tim.h"
#include "AD9833.h"
#include <stdlib.h>
#include <stdio.h>


extern uint16_t ADC_ConvertedValue[512];

#define FFT_SIZE       512
float32_t hamming_window[FFT_SIZE]={0};        
float32_t window_gain = 1.0f;     
float32_t fft_input[2 * FFT_SIZE]={0};         
float32_t fft_output[FFT_SIZE / 2]={0};    
float32_t adc_buffer[FFT_SIZE]={0};       

int index1 = 0, index2 = 0;
float32_t max1 = -1.0f, max2 = -1.0f;

int wave_type_and_req=0;

//中断函数
void TIM1_UP_TIM10_IRQHandler(void)
{
	if (TIM_GetITStatus(TIM1, TIM_IT_Update) != RESET)//检查指定的TIM中断发生与否:TIM 中断源 
	{
		printf("%d\r\n",100);
		
		TIM_ClearITPendingBit(TIM1, TIM_IT_Update);//清除TIMx的中断待处理位:TIM 中断源 
    }
}

void init_hamming_window(void) 
{
    float32_t sum = 0.0f;
    for (int i = 0; i < FFT_SIZE; i++) {
        hamming_window[i] = 0.54f - 0.46f * arm_cos_f32(2.0f * PI * i / (FFT_SIZE - 1));
        sum += hamming_window[i];
    }
    window_gain = sum / FFT_SIZE;  // 用于后续能量补偿
}

void prepare_fft_input(void) 
{
    for (int i = 0; i < FFT_SIZE; i++) {
		adc_buffer[i] = (float32_t)ADC_ConvertedValue[i]*3.3f/4096.0f;
        float32_t windowed = adc_buffer[i] * hamming_window[i];//这里应该乘一个汉明窗
        fft_input[2 * i]     = windowed;  // 实部
        fft_input[2 * i + 1] = 0.0f;      // 虚部
    }
}

void do_fft_analysis(void) 
{
    // 1. 执行FFT
    arm_cfft_f32(&arm_cfft_sR_f32_len512, fft_input, 0, 1);

    // 2. 计算复数幅度
    float32_t fft_full[FFT_SIZE];
    arm_cmplx_mag_f32(fft_input, fft_full, FFT_SIZE);

    // 3. 归一化 + 补偿（输出前FFT_SIZE/2点，有效频率范围）
    fft_output[0] = fft_full[0] / (FFT_SIZE * window_gain);  // DC分量，不乘2，还有窗补偿

    for (int i = 1; i < FFT_SIZE / 2; i++) {
        fft_output[i] = fft_full[i] * 2.0f / (FFT_SIZE * window_gain);  // 其余频点乘2补回对称能量,还有窗补偿
    }
}


void find_top2_peaks_in_range(int start, int end) 
{
    max1 = -1.0f;
    max2 = -1.0f;
    index1 = 0;
    index2 = 0;

    // 1. 找到第一个最大峰值
    for (int i = start; i <= end; i++) {
        if (fft_output[i] > max1) {
            max1 = fft_output[i];
            index1 = i;
        }
    }

    // 2. 找到第二个最大峰值，需满足与第一个峰值有最小间隔
    for (int i = start; i <= end; i++) {
        if (abs(i - index1) >= 5 && fft_output[i] > max2) {
            max2 = fft_output[i];
            index2 = i;
        }
    }

    // 可选打印调试信息
    // printf("Max1: %f at index %d\n", max1, index1);
    // printf("Max2: %f at index %d\n", max2, index2);
}

//void find_top2_peaks_in_range(int start, int end) 
//{
//    max1 = -1.0f;
//    max2 = -1.0f;
//    index1 = 0;
//    index2 = 0;

//    for (int i = start; i <= end; i++) {
//        if (fft_output[i] > max1) {
//            max2 = max1;
//            index2 = index1;

//            max1 = fft_output[i];
//            index1 = i;
//        } else if (fft_output[i] > max2 && i != index1) {
//            max2 = fft_output[i];
//            index2 = i;
//        }
//    }
//}

void send_type_and_frequency(void)
{
	float32_t difference = max1-max2;
	float32_t ratio=max1/max2;
	if(ratio>= 1.2f)// 5.0f*difference >=0.1f,ratio>= 1.2f
	{
		if(index1>index2)
		{
			AD9833_WaveSeting_B((double)index1*1000,0,SIN_WAVE,0);
			AD9833_WaveSeting_A((double)index2*1000,0,TRI_WAVE,0);
			wave_type_and_req=1;
		}
		else
		{
			AD9833_WaveSeting_B((double)index2*1000,0,TRI_WAVE,0);
			AD9833_WaveSeting_A((double)index1*1000,0,SIN_WAVE,0);
			wave_type_and_req=2;
		}
	}
	else
	{
		if(max1>=0.4f)
		{
			if(index1>index2)
			{
				AD9833_WaveSeting_B((double)index1*1000,0,SIN_WAVE,0);
			    AD9833_WaveSeting_A((double)index2*1000,0,SIN_WAVE,0);
				wave_type_and_req=3;
			}
			else
			{
				AD9833_WaveSeting_B((double)index2*1000,0,SIN_WAVE,0);
			    AD9833_WaveSeting_A((double)index1*1000,0,SIN_WAVE,0);
				wave_type_and_req=4;
			}
		}
		else
		{
			if(index1>index2)
			{
				AD9833_WaveSeting_B((double)index1*1000,0,TRI_WAVE,0);
			    AD9833_WaveSeting_A((double)index2*1000,0,TRI_WAVE,0);
				wave_type_and_req=5;
			}
			else
			{
				AD9833_WaveSeting_B((double)index2*1000,0,TRI_WAVE,0);
			    AD9833_WaveSeting_A((double)index1*1000,0,TRI_WAVE,0);
				wave_type_and_req=6;
			}
		}
	}
}

int main(void)
{	
	Debug_USART_Config();
	ADC1_Init();
	Delay_ms(500);
	init_hamming_window();
	prepare_fft_input();
	do_fft_analysis();
	find_top2_peaks_in_range(10,110);
	AD9833_Init_GPIO();
	send_type_and_frequency();
//	AD9833_WaveSeting_B((double)100000,0,SIN_WAVE,0);
//	AD9833_WaveSeting_A((double)100000,0,TRI_WAVE,0);
	//Timer1_Init();//用定时器测试时钟频率是否准确

	while(1)
	{
		
		//测试类型和频率判断
		/*if(wave_type_and_req==1)
		{
			printf("B:Sin %dK,A:Tri %dK\r\n",index1,index2);
		}
		else if(wave_type_and_req==2)
		{
			printf("B:Tri %dK,A:Sin %dK\r\n",index2,index1);
		}
		else if(wave_type_and_req==3)
		{
			printf("B:Sin %dK,A:Sin %dK\r\n",index1,index2);
		}
		else if(wave_type_and_req==4)
		{
			printf("B:Sin %dK,A:Sin %dK\r\n",index2,index1);
		}
		else if(wave_type_and_req==5)
		{
			printf("B:Tri %dK,A:Tri %dK\r\n",index1,index2);
		}
		else if(wave_type_and_req==6)
		{
			printf("B:Tri %dK,A:Tri %dK\r\n",index2,index1);
		}
		else
		{
			printf("Error\r\n");
		}*/
		//测试ADC+DMA
		/*for(int i=0;i<512;i++)
		{
			printf("%d\r\n",ADC_ConvertedValue[i]);
		}*/
		//测试delay函数
		/*printf("%d\r\n",100);
		Delay_ms(1000);
		printf("%d\r\n",200);
		Delay_ms(1000);*/
		//FFT结果
		for(int i=0;i< FFT_SIZE/2;i++)
		{
			printf("%f\r\n",fft_output[i]);
		}
		//ADC结果
		//printf("%f\r\n",ADC_ConvertedValue[0]*3.3/1024);		
	}
}
