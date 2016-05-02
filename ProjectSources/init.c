#include "main.h"
#include "init.h"
#include "events.h"
#include "debug_functions.h"
#include <string.h>

// Pumpkin CubeSat Kit headers
#include "csk_hw.h" 
#include "csk_led.h"
#include "csk_mhx.h"
#include "csk_uart.h"
#include "csk_usb.h"
#include "csk_wdt.h"

// Pumpkin PIC24 Library.
#include "pic24_uart.h"

// Microchip PIC24F Peripehral Library
#include <pps.h>
#include <pwrmgnt.h>
#include <timer.h>
#include <uart.h>
#include <ports.h>
#include <rtcc.h>

#include "salvo.h"

// Select primary oscillator in XT mode. 
_CONFIG2( FNOSC_PRI & POSCMOD_XT )
        
void init_Rtcc();

/******************************************************************************
****                                                                       ****
**                                                                           **
init()

**                                                                           **
****                                                                       ****
******************************************************************************/
void init(void) {
  // Force WDT off for now ... having it on tends to confuse novice
  //   users.
  csk_wdt_off();
  

  // Keep interrupts off for now ...
  __disable_interrupt();

  // H2.9  (IO.39 -> AN15 -> AN7 -> RB7) will be PI1 power
  // H2.13 (IO.35 -> AN11 -> AN2 -> RB2) will be quark power
  // H2.14 (IO.34 -> AN10 -> AN3 -> RB3) will be Burn Circuit (PI2) power

  // All CSK control signals are active LOW.
  TRISA = ~(BIT15+BIT14+BIT13+BIT12+                                          BIT3+BIT2          );
  TRISB = ~(BIT15+BIT14+BIT13+BIT12+BIT11+BIT10+BIT9+BIT8+BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0); // set RB2, 3, 7 as outputs
  TRISC = ~(                                                             BIT4+BIT3+BIT2+BIT1     );
  TRISD = ~(BIT15+BIT14+      BIT12+            BIT9+BIT8+          BIT5     +BIT3+BIT2+BIT1+BIT0);
  TRISE = ~(                                    BIT9+BIT8+BIT7+BIT6+BIT5+BIT4+BIT3+BIT2          ); // TRISE bit9 is being set here. Still need to do it in task beacon?
  TRISF = ~(            BIT13+BIT12+                 BIT8+BIT7+BIT6+BIT5+     BIT3+     BIT1+BIT0); // leave RF2 & RF4 alone
  TRISG = ~(                                    BIT9+BIT8+BIT7+BIT6+          BIT3+BIT2     +BIT0); // set RG1 bit as input for heartbeat

  PORTA = 0x0000;
  PORTB = 0x0000;                        // LEAVE POWER GPIOS LOW (Nick says weird things happen if theyre high when they don't need to be.)
  PORTC = 0x0000+BIT1;                   // -OE_USB is OFF
  PORTD = 0x0000+BIT3;                   // TX2 initially high
  PORTE = 0x0000+BIT4+BIT3+BIT2;         // -ON_SD, -ON_MHX, -OE_MHX are OFF
  PORTF = 0x0000+BIT3+BIT5;              // TX0 & TX1 initially high.
  PORTG = 0x0000;
  
  AD1PCFGL = 0xFFFF;                     // set all 16 analog inputs to digital I/O mode

  // High-level inits (works at any clock speed).
  csk_mhx_close();
  csk_mhx_pwr_off();
  csk_usb_close();
  csk_led_status_close();
 
// For safety -- Initialize power lines to Pi, Quark, and Burn Circuit to OFF!!
  csk_io39_low();  // H2.9 == PI1_IO
  csk_io35_low();  // H2.13 == QUARK_IO
  csk_io34_low();  // H2.14 == BURN CIRCUIT (AKA: PI2_IO)

  // Set up to run with primary oscillator.
  // See _CONFIG2 above. A configuration-word-centric setup of the
  //  oscillator(s) was chosen because of its relative simplicity.
  //  Note e.g. that PwrMgnt_OscSel() returns FALSE if clock switching
  //  (FCKSM) is disabled ...

  // Set up Timer2 to run at system tick rate                
  ConfigIntTimer2(T2_INT_ON & T2_INT_PRIOR_1);   // Timer is configured for 10 msec (100Hz), with interrupts
  OpenTimer2(T2_ON & T2_IDLE_CON & T2_GATE_OFF & T2_PS_1_1 & T2_32BIT_MODE_OFF & T2_SOURCE_INT,
             (MAIN_XTAL_FREQ/(2*100)));        // A prescalar is not required because 8E6/200 < 16 bits.


  // Configure I/O pins for UARTs via PIC24's PPS system.
  // CSK UART0 (PIC24 UART1) TX/RX = IO.4/IO.5
  // CSK UART1 (PIC24 UART2) TX/RX = IO.6/IO.7
  // RP30/RF2 & RP10/RF4 must be configured as inputs!
  iPPSInput(IN_FN_PPS_U1RX,IN_PIN_PPS_RP30);        // uart1 (csk_uart0) rx pin setup
  iPPSOutput(OUT_PIN_PPS_RP16,OUT_FN_PPS_U1TX);     // uart1 (csk_uart0) tx pin setup
  
  // Funny, these just so happen to be the pins that the HE radio uses...
  iPPSInput(IN_FN_PPS_U2RX,IN_PIN_PPS_RP10);        // uart2 (csk_uart1) rx pin setup
  iPPSOutput(OUT_PIN_PPS_RP17,OUT_FN_PPS_U2TX);     // uart2 (csk_uart1) tx pin setup
  iPPSInput(IN_FN_PPS_U3RX,IN_PIN_PPS_RP25);        // uart3 (csk_uart2) rx pin setup
  iPPSOutput(OUT_PIN_PPS_RP22,OUT_FN_PPS_U3TX);     // uart3 (csk_uart2) tx pin setup

  // enable motherboard pin h2.22 (IO.26)
  InputChange_Clear_Intr_Status_Bit;
  ConfigIntCN(INT_ENABLE|INT_PRI_1);
  EnableCN78;
          
  // Init UARTs to 115200 baud 
  // UARTs won't transmit until interrupts are enabled ...
  csk_uart0_open(UART_115200_N81_MAIN);
  //csk_uart0_open(UART_9600_N81_MAIN);
  // set radio uart to 9600
  csk_uart1_open(UART_9600_N81_MAIN);
  csk_uart2_open(UART_115200_N81_MAIN);
  //dprintf(STR_CRLF STR_CRLF);
  //dprintf("Pumpkin " STR_CSK_TARGET " " STR_APP_NAME "." STR_CRLF);
  //dprintf(STR_VERSION "." STR_CRLF);
  
  // initialize the real time clock
  //RtccInitClock();
  //RtccWrOn(); // enable writing to the Rtcc register
  //init_Rtcc();
  
} /* init() */

char getBCDfromstring(char* num) {
    static char return_value;
    return_value = 0x00;

    switch(num[0]) {
        case '0':
            return_value |= 0x00;
            break;
        case '1':
            return_value |= 0x10;
            break;
        case '2':
            return_value |= 0x20;
            break;
        case '3':
            return_value |= 0x30;
            break;
        case '4':
            return_value |= 0x40;
            break;
        case '5':
            return_value |= 0x50;
            break;
        case '6':
            return_value |= 0x60;
            break;
        case '7':
            return_value |= 0x70;
            break;
        case '8':
            return_value |= 0x80;
            break;
        case '9':
            return_value |= 0x90;
            break;
    }
    switch (num[1]) {
        case '0':
            return_value |= 0x00;
            break;
        case '1':
            return_value |= 0x01;
            break;
        case '2':
            return_value |= 0x02;
            break;
        case '3':
            return_value |= 0x03;
            break;
        case '4':
            return_value |= 0x04;
            break;
        case '5':
            return_value |= 0x05;
            break;
        case '6':
            return_value |= 0x06;
            break;
        case '7':
            return_value |= 0x07;
            break;
        case '8':
            return_value |= 0x08;
            break;
        case '9':
            return_value |= 0x09;
            break;
    }

    return return_value;
}

void init_Rtcc() {
  // time and date struct for initialization of the real time clock 
  // this will load the time and date of compilation into the RTC so it won't
  // be 100% accurate, but it should be close enough.
  // rtcc struct values are BCD format (Binary Coded Decimal; see en.wikipedia.org/wiki/Binary-coded_decimal):
  //
  // Decimal:   BCD:
  // 01         0   1
  //            00000001
  //
  // 10         0   1
  //            00010000
  //
  // 15         1   5
  //            00010101
  //
  // 54         5   4
  //            01010100

  rtccTime testtime;
  rtccTimeDate init_rtcc_time;
  char DATE_STRING[40] = STR_VERSION;
  char *date_token;
  
  Nop();
  Nop();
  Nop();
  
  // STR_VERSION #defined in main.h
  // get the month string
  date_token = strtok(DATE_STRING, " :");
  date_token = strtok(NULL, " :");
  date_token = strtok(NULL, " :");
  switch(date_token[0]) {
    case 'J':
      switch(date_token[1]) {
        case 'a':
          init_rtcc_time.f.mon = 0x01;
          break;
        default:
          switch(date_token[2]) {
            case 'n':
              init_rtcc_time.f.mon = 0x06;
              break;
            case 'l':
              init_rtcc_time.f.mon = 0x07;
          }
      }
      break;
    case 'F':
      init_rtcc_time.f.mon = 0x02;
      break;
    case 'M':
      switch(date_token[2]) {
        case 'r':
          init_rtcc_time.f.mon = 0x03;
          break;
        case 'y':
          init_rtcc_time.f.mon = 0x05;
          break;
      }
      break;
    case 'A':
      switch(date_token[1]) {
        case 'p':
          init_rtcc_time.f.mon = 0x04;
          break;
        default:
          init_rtcc_time.f.mon = 0x08;
      }
      break;
    case 'S':
      init_rtcc_time.f.mon = 0x09;
      break;
    case 'O':
      init_rtcc_time.f.mon = 0x10;
      break;
    case 'N':
      init_rtcc_time.f.mon = 0x11;
      break;
    case 'D':
      init_rtcc_time.f.mon = 0x12;
      break;
  }
  
  // get the day of the month
  date_token = strtok(NULL, " :");
  init_rtcc_time.f.mday = getBCDfromstring(date_token);
  
  // get the year
  date_token = strtok(NULL, " :");
  // chop off the '20' from the front of the year
  init_rtcc_time.f.year = getBCDfromstring(date_token + 2);
  
  // get the hour (in 24 hour format)
  date_token = strtok(NULL, " :");
  date_token = strtok(NULL, " :");
  //init_rtcc_time.f.hour = getBCDfromstring(date_token);
  testtime.f.hour = getBCDfromstring(date_token);

  // get the minute
  date_token = strtok(NULL, " :");
  //init_rtcc_time.f.min = getBCDfromstring(date_token);
  testtime.f.min = getBCDfromstring(date_token);

  // get the second (the second the source code was compiled)
  date_token = strtok(NULL, " :");
  //init_rtcc_time.f.sec = getBCDfromstring(date_token);
  testtime.f.sec = getBCDfromstring(date_token);

  // manually set the day of the week, if the rtcc is keeping time
  // properly (eg. keeping time even when the board has no power)
  // then this should only need to be done when replacing the rtcc battery
  // this particular time, I'm setting the rtcc date on 3/31/2016 which is
  // a Thursday so I'm setting the day of the week to 4 (I'm assuming Sunday = 0)
  init_rtcc_time.f.wday = 0x04;
  
  Nop();
  Nop();
  Nop();
  
  /*BOOL result = RtccWriteTime(&testtime, FALSE);
  if (!result) { // one of the values was out of range, see PIC24F peripheral library documentation
    dprintf("Error setting RTC values, something was out of range.\r\n");
    dprintf("mon: %02x\r\n", init_rtcc_time.f.mon);
    dprintf("mday: %02x\r\n", init_rtcc_time.f.mday);
    dprintf("year: %02x\r\n", init_rtcc_time.f.year);
    dprintf("hour: %02x\r\n", init_rtcc_time.f.hour);
    dprintf("min: %02x\r\n", init_rtcc_time.f.min);
    dprintf("sec: %02x\r\n", init_rtcc_time.f.sec);
    dprintf("wday: %02x\r\n", init_rtcc_time.f.wday);
  }*/
}

// change notification ISR
void __attribute__((interrupt,no_auto_psv)) _CNInterrupt(void)
{
  InputChange_Clear_Intr_Status_Bit;
}


void __attribute__ ((interrupt,no_auto_psv)) _T2Interrupt (void)
{
   T2_Clear_Intr_Status_Bit;
   OSTimer();
}


void __attribute__ ((interrupt,no_auto_psv)) _U1TXInterrupt(void)
{
  csk_uart0_outchar();
}


void __attribute__ ((interrupt,no_auto_psv)) _U1RXInterrupt(void)
{
  csk_uart0_inchar(ReadUART1());
}


void __attribute__ ((interrupt,no_auto_psv)) _U2TXInterrupt(void)
{
  csk_uart1_outchar();
}


void __attribute__ ((interrupt,no_auto_psv)) _U2RXInterrupt(void)
{
  csk_uart1_inchar(ReadUART2());
}

void __attribute__ ((interrupt,no_auto_psv)) _U3TXInterrupt(void)
{
  csk_uart2_outchar();
}


void __attribute__ ((interrupt,no_auto_psv)) _U3RXInterrupt(void)
{
  csk_uart2_inchar(ReadUART3());
}
