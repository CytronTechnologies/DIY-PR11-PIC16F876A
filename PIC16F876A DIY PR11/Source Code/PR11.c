//==========================================================================
//	Author				: Cytron Technologies		
//	Project				: Temperature Control System using LM35
//	Project description	: This project will use PIC16F876A to control NPN power transistor (BD135) 
//						  further drive DC brushless fans, LEDs and buzzer when the certain 
//						  temperature was detected. 
//==========================================================================
//==================inckude=================================
#include<pic.h>

//===============configuration==============================
__CONFIG (0x3F32);

//===============define IO port=============================
#define		lcd			PORTC
#define		RS			RA2
#define		E			RA5
#define		CHANNEL0	0b10000001	// AN0
#define		CHANNEL1	0b10001001	// AN1
#define		buzzer		RB5
#define		fanA		RB4
#define		fanB		RB3
#define		ledA		RB2
#define		ledB		RB1

//==============FUNCTION PTOTOTYPE=========================
void e_pulse(void);
void delay(unsigned short i);
void send_char(unsigned char data);
void send_config(unsigned char data);
void lcd_goto(unsigned char data);
void lcd_clr(void);
void dis_num(unsigned long data);
void increment(unsigned long data);
void read_adc(void);
unsigned short read_temp(void);

//====================MAIN================================
unsigned short result;
unsigned short temp,tempA,tempB;

void main(void)
{
	ADRESH=0;					//clear A/D result
	ADRESL=0;					//clear A/D result

	//setting ADCON1 Register
	ADCON1=0b11000101;			// A/D result right justified, 				
								// configure RA2 and RA5 as digital I/O

	TRISA=0b11011011;			//configure PORTA I/O direction
	TRISB=0b00000000;			//configure PORTB as output
	TRISC=0b00000000;			//configure PORTC as output

	PORTA=0;
	PORTB=0;
	
	while(1)					
	{
		send_config(0b00000001);		//clear display at lcd
		send_config(0b00000010);		//Lcd Return to home 
		send_config(0b00000110);		//entry mode-cursor increase 1
		send_config(0b00001100);		//diplay on, cursor off and cursor blink off
		send_config(0b00111000);		//function set
		
		lcd_goto(0);					//cursor start from beginning
		
		//display character on LCD
		send_char(' ');
		send_char('T');
		send_char('E');
		send_char('M');
		send_char('P');
		send_char('.');
		send_char('A');
		send_char('=');	

		lcd_goto(20);					//cursor go to 2nd line of the LCD

		//display character on LCD
		send_char(' ');
		send_char('T');
		send_char('E');
		send_char('M');
		send_char('P');
		send_char('.');
		send_char('B');
		send_char('=');	

		while(1)						//infinity loop
		{
		//sensor A
		ADCON0=CHANNEL0;				//CHANNEL1=0b10001001
		lcd_goto(8);
				
		read_adc();

		temp=read_temp();
		dis_num(temp/10);
		send_char('.');
		dis_num(temp%10);
		send_char(0b11011111);
		send_char('C');
		send_char(' ');
		send_char(' ');
		
		tempA=temp;
		
		//sensor B
		ADCON0=CHANNEL1;				//CHANNEL0=0b10000001			

		lcd_goto(28);
				
		read_adc();

		temp=read_temp();
		dis_num(temp/10);
		send_char('.');
		dis_num(temp%10);
		send_char(0b11011111);
		send_char('C');
		send_char(' ');
		send_char(' ');

		tempB=temp;
	
			if((tempA>400)&&(tempB<350))		//	*****************************************
				{								//	*	LED A and Fan A activated only for 	*
					ledA=1;						//	*	temperature A greater than 40'C		*
					ledB=0;						//	*	and temperature B less than 35'C	*
					fanA=1;						//	*****************************************
					fanB=0;
					buzzer=0;
				}	

			else if((tempB>350)&&(tempA<400)) 	//	*****************************************
				{								//	*	LED B and Fan B activated only for 	*
					ledA=0;						//	*	temperature A less than 40'C and	*
					ledB=1;						//	*	temperature B greater than 35'C		*
					fanA=0;						//	*****************************************
					fanB=1;
					buzzer=0;
				}	

			else if((tempB>350)&&(tempA>400)) 	//	*****************************************************
				{								//	*	All LED A & LED B, Fan A & Fan B and Buzzer		*
					ledB=1;						//	*	activated for temperature A greater than 40'C	*
					ledA=1;						//	*	and temperature B greater than 35'C				*
					fanA=1;						//	*****************************************************
					fanB=1;
					buzzer=1;
				}	

			else if((tempB<350)&&(tempA<400))	//	*****************************************************
				{								//	*	All LED A & LED B, Fan A & Fan B and Buzzer		*
					ledB=0;						//	*	disactivated for temperature A less than 40'C	*
					ledA=0;						//	*	and temperature B less than 35'C				*
					fanA=0;						//	*****************************************************
					fanB=0;
					buzzer=0;
				}	

		delay(2000);
	
		}
	
	}
		
}
		
					

//==================subroutine LCD setting ==========================

void send_config(unsigned char data)
{
 	RS=0;
	lcd=data;
	delay(500);
	e_pulse();
}

void e_pulse(void)
{
	E=1;
	delay(500);
	E=0;
	delay(500);
}

void send_char(unsigned char data)
{
 	RS=1;
	lcd=data;
	delay(500);
	e_pulse();
}


void lcd_goto(unsigned char data)
{
 	if(data<16)
	{
	 	send_config(0x80+data);
	}
	else
	{
	 	data=data-20;
		send_config(0xc0+data);
	}
}


void lcd_clr(void)
{
	RS=0;
 	send_config(0x01);
	delay(600);	
}


void dis_num(unsigned long data)
{
	unsigned char hundred_thousand;
	unsigned char ten_thousand;
	unsigned char thousand;
	unsigned char hundred;
	unsigned char tenth;

	hundred_thousand = data/100000;					
	data = data % 100000;
	ten_thousand = data/10000;
	data = data % 10000;
	thousand = data / 1000;
	data = data % 1000;
	hundred = data / 100;
	data = data % 100;
	tenth = data / 10;
	data = data % 10;

	if(hundred_thousand>0)
	{
		send_char(hundred_thousand + 0x30);	//0x30 added to become ASCII code
		send_char(ten_thousand + 0x30);
		send_char(thousand + 0x30);
		send_char(hundred + 0x30);
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}

	else if(ten_thousand>0) 
	{
		send_char(ten_thousand + 0x30);	//0x30 added to become ASCII code
		send_char(thousand + 0x30);
		send_char(hundred + 0x30);
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}
	else if(thousand>0)
	{
 		send_char(thousand + 0x30);	//0x30 added to become ASCII code
		send_char(hundred + 0x30);
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}
	else if(hundred>0)
	{
 		send_char(hundred + 0x30);	//0x30 added to become ASCII code
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}
	else if(tenth>0)
 	{
		send_char(tenth + 0x30);	//0x30 added to become ASCII code
		send_char(data + 0x30);
	}
	else send_char(data + 0x30);	//0x30 added to become ASCII code
}

void increment(unsigned long data)
{	
	unsigned short j;
	for(j=10;j>0;j--)
	{	lcd_goto(32);
		data=data+1;
		dis_num(data);
		delay(10000);
	}

}

//==================subroutine ADC=========================

void read_adc(void)
{
	unsigned short i;
	unsigned long result_temp=0;
	for(i=2000;i>0;i-=1)			//looping 2000 times for getting average value 
	{
		ADGO = 1;					//ADGO is the bit 2 of the ADCON0 register
		while(ADGO==1);				//ADC start, ADGO=0 after finish ADC progress
		result=ADRESH;
		result=result<<8;			//shift to left for 8 bit
		result=result|ADRESL;		//10 bit result from ADC

		result_temp+=result;		
	}
	result = result_temp/2000;		//getting average value

}

unsigned short read_temp(void)
{
	unsigned short temp;
	temp=result;
	return temp;

}

//==================subroutine DELAY==========================
void delay(unsigned short i)
{	
	for(;i>0;i--);
}

