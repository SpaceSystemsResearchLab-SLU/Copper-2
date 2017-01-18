/**********************************************************************
* ?2007 Microchip Technology Inc.
*
* FileName:        RTCC.c
* Dependencies:    Header (.h) files if applicable, see below
* Processor:       PIC24Fxxxx
* Compiler:        MPLAB?C30 v3.00 or higher
*
* SOFTWARE LICENSE AGREEMENT:
* Microchip Technology Incorporated ("Microchip") retains all 
* ownership and intellectual property rights in the code accompanying
* this message and in all derivatives hereto.  You may use this code,
* and any derivatives created by any person or entity by or on your 
* behalf, exclusively with Microchip's proprietary products.  Your 
* acceptance and/or use of this code constitutes agreement to the 
* terms and conditions of this notice.
*
* CODE ACCOMPANYING THIS MESSAGE IS SUPPLIED BY MICROCHIP "AS IS". NO 
* WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT 
* NOT LIMITED TO, IMPLIED WARRANTIES OF NON-INFRINGEMENT, 
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS 
* CODE, ITS INTERACTION WITH MICROCHIP'S PRODUCTS, COMBINATION WITH 
* ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
*
* YOU ACKNOWLEDGE AND AGREE THAT, IN NO EVENT, SHALL MICROCHIP BE 
* LIABLE, WHETHER IN CONTRACT, WARRANTY, TORT (INCLUDING NEGLIGENCE OR
* BREACH OF STATUTORY DUTY), STRICT LIABILITY, INDEMNITY, 
* CONTRIBUTION, OR OTHERWISE, FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
* EXEMPLARY, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, FOR COST OR 
* EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE CODE, HOWSOEVER 
* CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE
* DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT ALLOWABLE BY LAW, 
* MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY RELATED TO THIS
* CODE, SHALL NOT EXCEED THE PRICE YOU PAID DIRECTLY TO MICROCHIP 
* SPECIFICALLY TO HAVE THIS CODE DEVELOPED.
*
* You agree that you are solely responsible for testing the code and 
* determining its suitability.  Microchip has no obligation to modify,
* test, certify, or support the code.
*
* REVISION HISTORY:
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Author       	Date      	Comments on this revision
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
* Albert Z.		03/24/08	First release of source file
* Albert Z.		07/10/08	Add RTCC alarm 
*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*
* ADDITIONAL NOTES:
* Copy the RTCC functions to your application. 
*
* Code Tested on:
* Explorer 16 Development Board with  PIC24FJ128GA010 controller
*
* DESCRIPTION:
* Microchip's PIC24F microcontrollers feature a useful Real Time Clock
* for users to get an on chip clock in their applications. 
* This code example demonstrates how to grab and set the RTC, set alarm
* and RTCC clock output / alarm output. 
**********************************************************************/
#include <p24fxxxx.h>
#include <stdio.h>
#include <string.h>
#include "debug_functions.h"

// Setup configuration bits
// JTAG/Code Protect/Write Protect/Clip-on Emulation mode
// Watchdog Timer/ICD pins select
//_CONFIG1(JTAGEN_OFF & GCP_OFF & GWRP_OFF & COE_OFF & FWDTEN_OFF & ICS_PGx2)

// Disable CLK switch and CLK monitor, OSCO or Fosc/2, HS oscillator,
// Primary oscillator
//_CONFIG2(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMOD_HS & FNOSC_PRI)


// Union to access rtcc registers
typedef union tagRTCC {
	struct {
		unsigned char sec;
		unsigned char min;
		unsigned char hr;
		unsigned char wkd;
		unsigned char day;
		unsigned char mth;
		unsigned char yr;
	};
	struct {
		unsigned int prt00;
		unsigned int prt01;
		unsigned int prt10;
		unsigned int prt11;
	};
} RTCC;

RTCC _time;
RTCC _time_chk;
RTCC _alarm;

// macro
#define mRTCCDec2Bin(Dec) (10*(Dec>>4)+(Dec&0x0f))
#define mRTCCBin2Dec(Bin) (((Bin/10)<<4)|(Bin%10))


void RTCCgrab(void);
void RTCCInit(void);
void RTCCSet(void);
void RTCCALMSet(void);
void RTCCUnlock(void);
void RTCCSetBinSec(unsigned char );
void RTCCSetBinMin(unsigned char );
void RTCCSetBinHour(unsigned char );
void RTCCCalculateWeekDay(void);
void RTCCSetBinDay(unsigned char );
void RTCCSetBinMonth(unsigned char );
void RTCCSetBinYear(unsigned char );

// main
// int main(void)
void RTCCmain(void)
{
	// I/O initialization
  ODCAbits.ODA6 		= 0;
	TRISAbits.TRISA6 	= 0;

    RTCCInit();		// initialization includes set the time and date
	
	RTCCgrab();		// grab once
	
	//while (1);		
	// TO DO: 
	// observe D9 on Explorer 16, it will toggle every 10 seconds as set.
	// probe RTCC pin on #68 of PIC24FJ128GA010, it is a second clock of RTCC. 
	
	//return (0);
}

/*********************************************************************
 * Function: RTCCProcessEvents
 *
 * Preconditions: RTCCInit must be called before.
 *
 * Overview: The function grabs the current time from the RTCC and
 * translate it into strings.
 *
 * Input: None.
 *
 * Output: It update time and date strings  _time_str, _date_str,
 * and _time, _time_chk structures.
 *
 ********************************************************************/
void RTCCgrab(void)
{
	// Process time object only if time is not being set

		// Grab the time
		RCFGCALbits.RTCPTR = 3;			
		_time.prt11 = RTCVAL;
		_time.prt10 = RTCVAL;
		_time.prt01 = RTCVAL;
		_time.prt00 = RTCVAL;

		// Grab the time again 
		RCFGCALbits.RTCPTR = 3;			
		_time_chk.prt11 = RTCVAL;
		_time_chk.prt10 = RTCVAL;
		_time_chk.prt01 = RTCVAL;
		_time_chk.prt00 = RTCVAL;

		// Verify there is no roll-over
		if ((_time.prt00 == _time_chk.prt00) &&
			(_time.prt01 == _time_chk.prt01) &&
			(_time.prt10 == _time_chk.prt10) &&
			(_time.prt11 == _time_chk.prt11))
		{
			// Here, you can watch structure _time, 
			//	which has the data from RTCC registers.
 
			// TO DO: do something as you like here.
      dprintf("Time check (Bin): %02d:%02d:%02d\r\n",mRTCCDec2Bin(_time_chk.hr),mRTCCDec2Bin(_time_chk.min),mRTCCDec2Bin(_time_chk.sec) );
      //dprintf("Time check: (BCD) %d:%d:%d\r\n", _time_chk.hr,_time_chk.min,_time_chk.sec);
      dprintf("Date check (Bin): %02d %02d %02d    Weekday check (Bin): %02d\r\n",mRTCCDec2Bin(_time_chk.mth),mRTCCDec2Bin(_time_chk.day),mRTCCDec2Bin(_time_chk.yr),mRTCCDec2Bin(_time_chk.wkd));
		}
	//  dprintf("Time: %d:%d:%d\r\n", _time.hr,_time.min,_time.sec);
  //  dprintf("Time check: %d:%d:%d\r\n", _time_chk.hr,_time_chk.min,_time_chk.sec);
}

/*********************************************************************
 * Function: RTCCInit
 *
 * Preconditions: RTCCInit must be called before.
 *
 * Overview: Enable the oscillator for the RTCC
 *
 * Input: None.
 *
 * Output: None.
 ********************************************************************/
void RTCCInit(void)
{
    // Enables the LP OSC for RTCC operation
	asm("mov #OSCCON,W1");	// move address of OSCCON to W1
	asm("mov.b #0x02, W0");	// move 8-bit literal to W0, 16-bit.
	asm("mov.b #0x46, W2");	// unlock byte 1 for OSCCONL(low byte)
	asm("mov.b #0x57, W3");	// unlock byte 2 for OSCCONL(low byte)
							// move 8-bit of Wn to OSCCON register
	asm("mov.b W2, [W1]");	// write unlock byte 1
	asm("mov.b W3, [W1]");	// write unlock byte 2
	asm("mov.b W0, [W1]");	// enable SOSCEN

    // Unlock sequence must take place for RTCEN to be written
	RCFGCAL	= 0x0000;			
    RTCCUnlock();
    RCFGCALbits.RTCEN = 1;	// bit15
    
    //RTCC pin pad conected to RTCC second clock
	PADCFG1bits.RTSECSEL = 1;	
	RCFGCALbits.RTCOE = 1;		//RTCC Output Enable bit

	/* Enable the RTCC interrupt*/
	IFS3bits.RTCIF = 0;		//clear the RTCC interrupt flag
	IEC3bits.RTCIE = 1;		//enable the RTCC interrupt

  // Write the time and date to RTCC as follow.
  char DATE_STRING[] = __DATE__;
  char *date_token;
  unsigned char year, month, day, weekday;
  char TIME_STRING[] = __TIME__;
  char *time_token;
  unsigned char hour, min, sec;

  date_token = strtok(DATE_STRING, " ");
 // date_token = strtok(NULL, " ");
 // date_token = strtok(NULL, " ");
  switch(date_token[0]) {
    case 'J':
      switch(date_token[1]) {
        case 'a':
          month = 0x01;
          break;
        default:
          switch(date_token[2]) {
            case 'n':
              month = 0x06;
              break;
            case 'l':
              month = 0x07;
          }
      }
      break;
    case 'F':
      month = 0x02;
      break;
    case 'M':
      switch(date_token[2]) {
        case 'r':
          month = 0x03;
          break;
        case 'y':
          month = 0x05;
          break;
      }
      break;
    case 'A':
      switch(date_token[1]) {
        case 'p':
          month = 0x04;
          break;
        default:
          month = 0x08;
      }
      break;
    case 'S':
      month = 0x09;
      break;
    case 'O':
      month = 0x10;
      break;
    case 'N':
      month = 0x11;
      break;
    case 'D':
      month = 0x12;
      break;
  } // end: switch(date_token[0]

  // get the day of the month
  date_token = strtok(NULL, " ");
  day = (unsigned char)strtol(date_token,NULL,10);

  // get the year
  date_token = strtok(NULL, " ");
  year = (unsigned char)strtol(date_token+2,NULL,10);
 dprintf("Month Day Year:  %d %d %d\r\n",month, day, year);
  time_token = strtok(TIME_STRING,":");
  hour = (unsigned char)strtol(time_token,NULL,10);
  time_token = strtok(NULL,":");
  min = (unsigned char)strtol(time_token,NULL,10);
  time_token = strtok(NULL,":");
  sec = (unsigned char)strtol(time_token,NULL,10);

	_time_chk.sec = mRTCCBin2Dec(sec);
	_time_chk.min = mRTCCBin2Dec(min);
	_time_chk.hr = mRTCCBin2Dec(hour);
	_time_chk.wkd = 0x00;
	_time_chk.day = mRTCCBin2Dec(day);
	_time_chk.mth = month;
	_time_chk.yr = mRTCCBin2Dec(year);
	RTCCCalculateWeekDay();	// To calculate and confirm the weekday

	// Set it after you change the time and date. 
	RTCCSet();
	
	// Set alarm
	_alarm.sec	= 0x01;
	_alarm.min	= 0x01;
	_alarm.hr	= 0x01;
	_alarm.wkd	= 0x01;
	_alarm.day	= 0x01;
	_alarm.mth	= 0x01;
	RTCCALMSet();
}

/*********************************************************************
 * Function: RTCCSet
 *
 * Preconditions: None.
 *
 * Overview: 
 * The function upload time and date from _time_chk into clock.
 *
 * Input: _time_chk - structure containing time and date.
 *
 * Output: None.
 *
 ********************************************************************/
void RTCCSet(void)
{
	RTCCUnlock();				// Unlock the RTCC
	
	RCFGCALbits.RTCPTR = 3;		// Set the time
	RTCVAL = _time_chk.prt11;	// set year
	RTCVAL = _time_chk.prt10;	// set month:day
	RTCVAL = _time_chk.prt01;	// set week:hour
	RTCVAL = _time_chk.prt00;	// set min:sec

	RCFGCALbits.RTCWREN = 0;	// Lock the RTCC
	
	// Here, you can watch the RTCC register, 
	// 	the new time and date has been updated. 
}

/*********************************************************************
 * Function: RTCCALMSet
 *
 * Preconditions: None.
 *
 * Overview: 
 * The function upload time and date from _alarm into RTCC alarm.
 *
 * Input: _alarm - structure containing time and date.
 *
 * Output: None.
 *
 ********************************************************************/
void RTCCALMSet(void)
{
	RTCCUnlock();				// Unlock the RTCC
	while(RCFGCALbits.RTCSYNC==1);		//wait for RTCSYNC bit to become 0
	
	ALCFGRPTbits.ALRMEN		= 0;		//disable alarm to update it
	ALCFGRPTbits.ALRMPTR	= 2;  	 	//Point to Month/Day register		
	ALRMVAL = _alarm.prt10;				//load month & day	
	ALRMVAL = _alarm.prt01;				//load weekday & hour	
	ALRMVAL = _alarm.prt00;				//load minute & seconds

	ALCFGRPTbits.AMASK		= 2;		//alarm every 10 seconds
	ALCFGRPTbits.ARPT		= 0xff;		//alarm 255 times
	ALCFGRPTbits.CHIME		= 1;		//enable chime
    ALCFGRPTbits.ALRMEN		= 1;  	 	//enable the alarm

	RCFGCALbits.RTCWREN = 0;	// Lock the RTCC
}

/*********************************************************************
 * Function: RTCCUnlock
 *
 * Preconditions: None.
 *
 * Overview: The function allows a writing into the clock registers.
 *
 * Input: None.
 *
 * Output: None.
 *
 ********************************************************************/
void RTCCUnlock()
{
	asm volatile("disi	#5");
	asm volatile("mov #0x55, w7");		// write 0x55 and 0xAA to
	asm volatile("mov w7, _NVMKEY"); 	//  NVMKEY to disable
	asm volatile("mov #0xAA, w8");		// 	write protection
	asm volatile("mov w8, _NVMKEY");
    asm volatile("bset _RCFGCAL, #13");	// set the RTCWREN bit
	asm volatile("nop");
	asm volatile("nop");
}

/*********************************************************************
 * Function: RTCCSetBinSec
 *
 * Preconditions: None.
 *
 * Overview: The function verifies setting seconds range, translates
 * it into BCD format and writes into _time_chk structure. To write
 * the structure into clock RTCCSet must be called.
 *
 * Input: Seconds binary value.
 *
 * Output: Checked BCD value in _time_chk structure.
 *
 ********************************************************************/
void RTCCSetBinSec(unsigned char Sec)
{
    if(Sec >= 60)  Sec = 0;
    _time_chk.sec = mRTCCBin2Dec(Sec);
}

/*********************************************************************
 * Function: RTCCSetBinMin
 *
 * Preconditions: None.
 *
 * Overview: The function verifies a setting minutes range, translates
 * it into BCD format and writes into _time_chk structure. To write
 * the structure into clock RTCCSet must be called.
 *
 * Input: Minutes binary value.
 *
 * Output: Checked BCD value in _time_chk structure.
 *
 ********************************************************************/
void RTCCSetBinMin(unsigned char Min)
{
    if(Min >= 60)  Min = 0;
    _time_chk.min = mRTCCBin2Dec(Min);
}

/*********************************************************************
 * Function: RTCCSetBinHour
 *
 * Preconditions: None.
 *
 * Overview: The function verifies a setting hours range, translates
 * it into BCD format and writes into _time_chk structure. To write
 * the structure into clock RTCCSet must be called.
 *
 * Input: Hours binary value.
 *
 * Output: Checked BCD value in _time_chk structure.
 *
 ********************************************************************/
void RTCCSetBinHour(unsigned char Hour)
{
    if(Hour >= 24) Hour = 0;
    _time_chk.hr = mRTCCBin2Dec(Hour);
}

/*********************************************************************
 * Function: RTCCCalculateWeekDay
 *
 * Preconditions: 
 * Valid values of day, month and year must be presented in 
 * _time_chk structure.
 *
 * Overview: The function reads day, month and year from _time_chk and 
 * calculates week day. Than It writes result into _time_chk. To write
 * the structure into clock RTCCSet must be called.
 *
 * Input: _time_chk with valid values of day, month and year.
 *
 * Output: Zero based week day in _time_chk structure.
 *
 ********************************************************************/
void RTCCCalculateWeekDay()
{
	const char MonthOffset[] =
	//jan feb mar apr may jun jul aug sep oct nov dec
	{   0,  3,  3,  6,  1,  4,  6,  2,  5,  0,  3,  5 };
	unsigned Year;
	unsigned Month;
	unsigned Day;
	unsigned Offset;
    // calculate week day 
    Year  = mRTCCDec2Bin(_time_chk.yr);
    Month = mRTCCDec2Bin(_time_chk.mth);
    Day  = mRTCCDec2Bin(_time_chk.day);
    
    // 2000s century offset = 6 +
    // every year 365%7 = 1 day shift +
    // every leap year adds 1 day
    Offset = 6 + Year + Year/4;
    // Add month offset from table
    Offset += MonthOffset[Month-1];
    // Add day
    Offset += Day;

    // If it's a leap year and before March there's no additional day yet
    if((Year%4) == 0)
        if(Month < 3)
            Offset -= 1;
    
    // Week day is
    Offset %= 7;

    _time_chk.wkd = Offset;
}

/*********************************************************************
 * Function: RTCCSetBinDay
 *
 * Preconditions: None.
 *
 * Overview: The function verifies a setting day range, translates it
 * into BCD format and writes into _time_chk structure. To write the
 * structure into clock RTCCSet must be called.
 *
 * Input: Day binary value.
 *
 * Output: Checked BCD value in _time_chk structure.
 *
 ********************************************************************/
void RTCCSetBinDay(unsigned char Day)
{
	const char MonthDaymax[] =
	//jan feb mar apr may jun jul aug sep oct nov dec
	{  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
	unsigned Daymax;
	unsigned Month;
	unsigned Year;

    Month = mRTCCDec2Bin(_time_chk.mth);
    Year = mRTCCDec2Bin(_time_chk.yr);

    Daymax = MonthDaymax[Month-1];

    // February has one day more for a leap year
    if(Month == 2)
    if( (Year%4) == 0)
        Daymax++;

    if(Day == 0) Day = Daymax;
    if(Day > Daymax) Day = 1;
    _time_chk.day = mRTCCBin2Dec(Day);
}

/*********************************************************************
 * Function: RTCCSetBinMonth
 *
 * Preconditions: None.
 *
 * Overview: The function verifies a setting month range, translates
 * it into BCD format and writes into _time_chk structure. To write
 * the structure into clock RTCCSet must be called.
 *
 * Input: Month binary value.
 *
 * Output: Checked BCD value in _time_chk structure.
 *
 ********************************************************************/
void RTCCSetBinMonth(unsigned char Month)
{
    if(Month < 1) Month = 12;
    if(Month > 12) Month = 1;
    _time_chk.mth = mRTCCBin2Dec(Month);
}

/*********************************************************************
 * Function: RTCCSetBinYear
 *
 * Preconditions: None.
 *
 * Overview: The function verifies a setting year range, translates it
 * into BCD format and writes into _time_chk structure. To write the 
 * structure into clock RTCCSet must be called.
 *
 * Input: Year binary value.
 *
 * Output: Checked BCD value in _time_chk structure.
 *
 ********************************************************************/
void RTCCSetBinYear(unsigned char Year)
{
   if(Year >= 100)  Year = 0;
    _time_chk.yr = mRTCCBin2Dec(Year);
    // Recheck day. Leap year influences to Feb 28/29.
    RTCCSetBinDay(mRTCCDec2Bin(_time_chk.day));
}

/*********************************************************************
 * Interrupt for RTCC Alarm.
 *
 ********************************************************************/
void __attribute__((interrupt, no_auto_psv)) _RTCCInterrupt(void)
{
	IFS3bits.RTCIF = 0;	
	
	__builtin_btg((unsigned int *)&LATA, 6);	// Toggle RA6
	
	// TO DO:
	// User Implementation. 
}

