//==========================================================================
//	Author				: Cytron Technologies		
//	Project				: Temperature Control System using LM35
//	Project description             : This project will use PIC16F876A to control NPN power transistor (BD135)
//                                        further drive DC brushless fans, LEDs and buzzer when the certain
//                                        temperature was detected. Compatible with
//                                        -MPLAB IDE with HITECH C compiler
//                                        -MPLABX with HITECH C compiler v9.83/v9.82 and XC8 compiler.
//==========================================================================
//==================inckude=================================
#if defined(__XC8)
  #include <xc.h>
 #pragma config CONFIG = 0x3F32
//FOSC = EXTRC     // Oscillator Selection bits (RC oscillator)
//WDTE = ON        // Watchdog Timer Enable bit (WDT enabled)
//PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
//BOREN = ON       // Brown-out Reset Enable bit (BOR enabled)
//LVP = ON         // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3/PGM pin has PGM function; low-voltage programming enabled)
//CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
//WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
//CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#else
//#include <htc.h>                  //include the PIC microchip header file
#include <pic.h>

//	configuration
//==========================================================================
__CONFIG (0x3F32);

#endif

//===============configuration==============================


//===============define IO port=============================
#define		LCD		PORTC
#define		RS		RA2
#define		E		RA5
#define		CHANNEL0	0b10000001	// AN0
#define		CHANNEL1	0b10001001	// AN1
#define		BUZZER		RB5
#define		FANA		RB4
#define		FANB		RB3
#define		LEDA		RB2
#define		LEDB		RB1

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
unsigned short temporary1,temporary2,temperatureA,temperatureB;

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

		while(1)					//infinity loop
		{
		//sensor A
		ADCON0=CHANNEL1;				//CHANNEL1=0b10001001
		lcd_goto(8);
				
		read_adc();

		temporary1=read_temp();
		dis_num(temporary1/10);
		send_char('.');
		dis_num(temporary1%10);
		send_char(0b11011111);
		send_char('C');
		send_char(' ');
		send_char(' ');
		
		temperatureA=temporary1;
		
		//sensor B
		ADCON0=CHANNEL0;				//CHANNEL0=0b10000001

		lcd_goto(28);
				
		read_adc();

		temporary2=read_temp();
		dis_num(temporary2/10);
		send_char('.');
		dis_num(temporary2%10);
		send_char(0b11011111);
		send_char('C');
		send_char(' ');
		send_char(' ');

		temperatureB=temporary2;
	
			if((temperatureA>240)&&(temperatureB<230))		//	*****************************************
				{                                                       //	*	LED A and Fan A activated only for 	*
					LEDA=1;						//	*	temperature A greater than 40'C		*
					LEDB=0;						//	*	and temperature B less than 35'C	*
					FANA=1;						//	*****************************************
					FANB=0;
					BUZZER=0;
				}	

			else if((temperatureB>230)&&(temperatureA<240)) 	//	*****************************************
				{							//	*	LED B and Fan B activated only for 	*
					LEDA=0;						//	*	temperature A less than 40'C and	*
					LEDB=1;						//	*	temperature B greater than 35'C		*
					FANA=0;						//	*****************************************
					FANB=1;
					BUZZER=0;
				}	

			else if((temperatureB>350)&&(temperatureA>400)) 	//	*****************************************************
				{							//	*	All LED A & LED B, Fan A & Fan B and Buzzer	*
					LEDA=1;						//	*	activated for temperature A greater than 40'C	*
					LEDB=1;						//	*	and temperature B greater than 35'C		*
					FANA=1;						//	*****************************************************
					FANB=1;
					BUZZER=1;
				}	

			else if((temperatureB<350)&&(temperatureA<400))	//	*****************************************************
				{							//	*	All LED A & LED B, Fan A & Fan B and Buzzer	*
					LEDA=0;						//	*	disactivated for temperature A less than 40'C	*
					LEDB=0;						//	*	and temperature B less than 35'C		*
					FANA=0;						//	*****************************************************
					FANB=0;
					BUZZER=0;
				}	

		delay(2000);
	
		}
	
	}
		
}
		
					

//==================subroutine LCD setting ==========================

void send_config(unsigned char data)
{
 	RS=0;
	LCD=data;
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
	LCD=data;
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
   #if((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ <= 80)) //if Hi-Tech V9.80 or lower version of compiler is being used
	ADGO = 1;				//start ADC conversion
	while (ADGO == 1);		//wait for ADC to complete the conversion
 
	#elif((__XC8__) ||((_HTC_VER_MAJOR_ == 9) && (_HTC_VER_MINOR_ > 80))) //else if Hi-Tech greater than V9.80 compiler is being used
	GO_DONE = 1;			//start ADC conversion
	while (GO_DONE == 1);		//await for ADC to complete the conversion
  
	#endif	
		
    result=ADRESH;
		result=result<<8;		//shift to left for 8 bit
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

