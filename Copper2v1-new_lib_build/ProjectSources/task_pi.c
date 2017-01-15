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
unsigned char TAKEPICPI = FALSE;
unsigned char TAKEPICQ = FALSE;

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
    while (!csk_uart0_count()) { OS_Delay(40); }
    dprintf("In task_pi.\tOERR=%d\r\n",U1STAbits.OERR);

     // check for UART0 RX buffer Overflow Error and reset bit
     if (U1STAbits.OERR==1) {
         U1STAbits.OERR=0;
         csk_uart2_puts("Reset OERR in main while!\r\n");
       }

/* Part of flow control work ...
    if (!RTS_FROM_PI && csk_uart0_getchar()==0x11) {
      RTS_FROM_PI = TRUE;
      csk_uart0_putchar(0x11);
     // csk_uart2_puts("Got 0x11\r\n");
    }
    while (RTS_FROM_PI) {
      while(!csk_uart0_count());
      rx_pi_cmd[0]=csk_uart0_getchar();
      if (rx_pi_cmd[0]=='$'){
        i++;
        while(csk_uart0_count()) {
          rx_pi_cmd[i] = csk_uart0_getchar();
          i++;
         }
       RTS_FROM_PI = FALSE;
      } // end: if(csk_uart0_getchar=='$')
    } // end: while (RTS_FROM_PI)
... end flow control work */

    i = 0;
    msg_length = 0;
    while(csk_uart0_count()) {
      rx_pi_cmd[i] = csk_uart0_getchar();
      if (i==4) { 
  // take the 2 hex array elements and convert to int
        sprintf(tmp,"%c%c",rx_pi_cmd[i-1],rx_pi_cmd[i]);
        msg_length = (int)strtol(tmp,NULL,16);
        //dprintf("msg_length type: %s",typeof(msg_length));
       // dprintf("i= %d  msg_length= %d %c %c",i,msg_length,rx_pi_cmd[i-1],rx_pi_cmd[i]*1);
      }
      i++;
      // check for max msg_length (cases where byte 3 isn't valid
      // OR bounds checking w/ i & msg_length
   //   if ((msg_length > 20) || (i > (msg_length+4))) { break; }
    } // end: while(csk_uart0_count())
    
    // Message from Pi header: check for "$$$"
    if (rx_pi_cmd[0]=='$' && rx_pi_cmd[1]=='$' && rx_pi_cmd[2]=='$'){
      if (rx_pi_cmd[5]=='P' && rx_pi_cmd[6]=='I' && rx_pi_cmd[7]=='P' && rx_pi_cmd[8]=='O' && rx_pi_cmd[9]=='W' && rx_pi_cmd[10]=='E' && rx_pi_cmd[11]=='R' && rx_pi_cmd[12]=='E' && rx_pi_cmd[13]=='D' && rx_pi_cmd[14]=='O' && rx_pi_cmd[15]=='N'){
      //if (!PI_ON && msg=="PIPOWEREDON"){
      //if (msg=="PIPOWEREDON"){
        PI_ON = TRUE;
        //csk_uart0_puts("$$$ROGERTHAT");
        //csk_uart0_puts("$$$ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
        //csk_uart2_puts("in ROGERTHAT response\r\n");
        //sprintf(tmp, "\r\nin PIPOWERED response. PI_ON = %d\r\n", PI_ON);
        sprintf(tmp, "$$$09ROGERTHAT\r\n");
        csk_uart0_puts(tmp);
        csk_uart0_puts(tmp);

        //DEBUG...
//        dprintf("tmp: %s\t ",tmp);
//        dprintf("rx_pi_cmd before memset: %s\r\n",rx_pi_cmd);
      }
    } // end rx_pi_cmd header check
    //rx_pi_cmd[0] = '\0';
    memset(rx_pi_cmd, 0, sizeof(rx_pi_cmd)); // testing array clear
   // dprintf("rx_pi_cmd AFTER memset: %s\r\n",rx_pi_cmd);
    //RTS_FROM_PI = FALSE;

    if (PI_ON) { // process commands for Pi...
      if (TAKEPICPI) {
/* part of flow control work...
        do {
            csk_uart0_putchar(0x11);
            if (csk_uart0_count() && csk_uart0_getchar()==0x11) {
              CTS_FROM_PI = TRUE;
            }
        } while (!CTS_FROM_PI);
        csk_uart0_puts("$$$TAKEPICPI~~~");
...end flow control work */
        csk_uart0_puts("$$$09TAKEPICPI");
      } // end: if(TAKEPICPI)
    } // end: if(PI_ON)
 
    //OS_Delay(50);
  } // end while(1)
} // end task_pi()
