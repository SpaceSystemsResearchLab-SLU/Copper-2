#include <stdio.h>
#include <stdarg.h>
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
  static char rx_pi_cmd[265];
  static char PI_HDR[] = "$$$";
  static char cmd[]="PITAKEIMG";
  static char msg[100];
  static char tmp[51];
  static int i=0;
  static int j;
  static unsigned int msg_length;
  static unsigned int PI_ON; // flag used if Pi is on or off
  //rtccTimeDate init_rtcc_time;
  PI_ON = 0;

  dprintf("Starting task_pi...\r\n");
  
  while(1) {
    //while (!csk_uart0_count()) { OS_Delay(10); }
    dprintf("In task_pi.\tOERR=%d\r\n",U1STAbits.OERR);
    //csk_uart0_puts("$$$ROGERTHAT");
    //OS_Delay(10);
    /*
    if (csk_uart0_count()) {
      msg_length = (unsigned int)csk_uart0_count();
      sprintf(tmp, "%d ",msg_length);
      csk_uart2_puts(tmp);
    }
   */
   // csk_uart0_putchar('U');
    if (U1STAbits.OERR==1) { csk_uart0_close(); Nop(); csk_uart0_open(UART_500000_N81_MAIN); Nop(); csk_uart2_puts("Reset UART0 OERR!\r\n"); }

    /*
   if (csk_uart0_count() && (csk_uart0_getchar()==0x11)) {
      csk_uart0_putchar(0x11);
      csk_uart2_puts("Got 0x11 from Pi!\r\n");
    }
     */
    while(csk_uart0_count()) {
         // Nop();Nop();Nop();Nop();
        //dprintf("task listen got something on radio\r\n");
        //csk_uart2_putchar(csk_uart2_getchar());
      rx_pi_cmd[i] = csk_uart0_getchar();
      i++;
      //csk_uart2_putchar((unsigned char)rx_pi_cmd[i]);
        //csk_uart0_putchar(tmp);
         // csk_uart0_putchar(rx_test[i]);
//Nop();Nop();Nop();Nop();Nop(); //debug
    }
   // rx_pi_cmd[i]='\0';
//sprintf(tmp,"\trx_pi_cmd: %s\r\n",rx_pi_cmd);
//csk_uart2_puts(rx_pi_cmd); csk_uart2_puts(" ");

//Nop();Nop();Nop();Nop();Nop(); //debug
//Nop();Nop();Nop();Nop();Nop(); //debug

    
//Nop();Nop();Nop();Nop();Nop(); //debug
    // Message from Pi header check for "$$$"
    if (rx_pi_cmd[0]=='$' && rx_pi_cmd[1]=='$' && rx_pi_cmd[2]=='$'){
    //    msg_length = i-3;
    //  if (msg_length) {
    //    for (j=0;j<msg_length;j++){
     //     sprintf(&msg[j],"%c",rx_pi_cmd[3+j]);
     //   }
     //   msg[j]='\0';
    //    csk_uart2_puts(msg);
    //    csk_uart2_puts(" <-- msg\r\n");
    //  }
      if (rx_pi_cmd[3]=='P' && rx_pi_cmd[4]=='I' && rx_pi_cmd[5]=='P' && rx_pi_cmd[6]=='O' && rx_pi_cmd[7]=='W' && rx_pi_cmd[8]=='E' && rx_pi_cmd[9]=='R' && rx_pi_cmd[10]=='E' && rx_pi_cmd[11]=='D' && rx_pi_cmd[12]=='O' && rx_pi_cmd[13]=='N'){
      //if (!PI_ON && msg=="PIPOWEREDON"){
      //if (msg=="PIPOWEREDON"){
        PI_ON = !PI_ON;
        //csk_uart0_puts("$$$ROGERTHAT");
        //csk_uart0_puts("$$$ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
        //csk_uart2_puts("in ROGERTHAT response\r\n");
        //sprintf(tmp, "\r\nin PIPOWERED response. PI_ON = %d\r\n", PI_ON);
        sprintf(tmp, "$$$ROGERTHAT%c",(unsigned char)rx_pi_cmd[14]);
        csk_uart0_puts(tmp);
        csk_uart2_puts(tmp);
      }
    } // end rx_pi_cmd header check
    rx_pi_cmd[0] = '\0';
    i=0;
//Nop();Nop();Nop();Nop();Nop(); //debug
    //temp[i+1] = '\0';
      //sprintf(temp2, temp);
    //while(i<100000) { csk_uart2_putchar('U'); i++;}
   // sprintf(tmp, "$$$PITAKEIMG~~~");
    //sprintf(tmp, "%s%d%s", TO_PI_HDR, strlen(cmd), cmd);
   // csk_uart2_puts(tmp);
   // csk_uart0_puts(tmp);
   // Nop();Nop();Nop();Nop();Nop(); //debug
    /* for testing...
    if (received == 1) {
       Nop();Nop();Nop();Nop();
      csk_uart2_puts(rx_test);
      csk_uart0_puts(rx_test);
      received = 0;
    }
     * ...end test */
      // csk_uart0_puts(temp2);
    OS_Delay(50);
  } // end while(1)
} // end task_pi()
