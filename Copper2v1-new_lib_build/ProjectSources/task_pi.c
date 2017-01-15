#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "main.h"
#include "events.h"
#include "task_pi.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "csk_hw.h"
#include "salvo.h"

// Microchip headers
#include "p24FJ256GA110.h"
//#include "Rtcc.h"
#include "ports.h"

void task_pi(void) {
  static int received = 0;
  //static char tx_test[] = {"The quick brown fox jumps over the lazy dog!\r\n"};
  static unsigned char rx_pi_cmd[265];
  static char PI_HDR[] = "$$$";
  static char cmd[]="PITAKEIMG";
  static char msg[100];
  static char tmp[51];
  static int i=0;
  static int j;
  static int msg_length; // used for message length to/from Pi
  static BOOL PI_ON = FALSE; // flag used if Pi is on or off
  static BOOL RTS_FROM_PI = FALSE; // when Pi needs to talk to PIC
  static BOOL CTS_FROM_PI = FALSE; // when Pi needs to talk to PIC
  //rtccTimeDate init_rtcc_time;
  //TAKEPICPI = FALSE;
  
  dprintf("Starting task_pi...\r\n");
  
  while(1) {


    if (OSReadBinSem(BINSEM_PION)) {
      OSTryBinSem(BINSEM_PION);
      csk_io39_high();
      //PION = TRUE;
    }  
    if (OSReadBinSem(BINSEM_PIOFF)) {
      OSTryBinSem(BINSEM_PIOFF);
      csk_uart0_puts("$$$05PIOFF");
      OS_Delay(100);
      csk_uart0_puts("$$$05PIOFF");
    }
    if (OSReadBinSem(BINSEM_TAKEPICPI)) {
      csk_uart0_puts("$$$09TAKEPICPI");
    } // end: BINSEM_TAKEPICPI
    if (OSReadBinSem(BINSEM_TAKEPICQ)) {
      OSTryBinSem(BINSEM_TAKEPICQ);
      csk_uart0_puts("$$$08TAKEPICQ");
    }
    if (OSReadBinSem(BINSEM_QUARKON)) {
      csk_io35_high();
      OS_Delay(250);OS_Delay(250);OS_Delay(250);
      //QUARKON = TRUE;
    }
    if (OSReadBinSem(BINSEM_QUARKOFF)) {
      OSTryBinSem(BINSEM_QUARKOFF);
      csk_io35_low();

    }
 
    OS_Delay(50);
  } // end while(1)
} // end task_pi()
