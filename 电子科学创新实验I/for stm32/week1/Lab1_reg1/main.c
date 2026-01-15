int main (void)
{

	// 打开 GPIOB 端口的时钟
	*( unsigned int * )0x40021018 |=  ( (1) << 3 );
	
	// 配置IO口PB5为输出 ,推挽输出，速率为10M
	*( unsigned int * )0x40010C00 &= 0xFFFFFFF0; 
	*( unsigned int * )0x40010C00 |=  0X00000001;   
	// 控制 ODR 寄存器	
	
	//*( unsigned int * )0x40010C0C |= (1<<5);  //LED off
	
}


void SystemInit(void)
{
	// 函数体为空，目的是为了骗过编译器不报错
}




