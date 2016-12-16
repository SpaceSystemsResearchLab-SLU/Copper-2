#include "main.h"
#include "task_test.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "csk_hw.h"
#include "salvo.h"
#include "task_beacon.h"

// Microchip headers
#include "p24FJ256GA110.h"
#include "Rtcc.h"
#include "ports.h"

void task_test(void) {

static int received = 0;
//static char tx_test[] = {"The quick brown fox jumps over the lazy dog!\r\n"};
static char rx_test[256];
static char TO_PI_HDR[] = "$$$";
static char cmd[]="PITAKEIMG";
static char tmp[100];
static int i=0;
rtccTimeDate init_rtcc_time;

  while(1) {
    while(csk_uart2_count() > 0) {
         // Nop();Nop();Nop();Nop();
        //dprintf("task listen got something on radio\r\n");
        //csk_uart2_putchar(csk_uart2_getchar());
         rx_test[i] = csk_uart2_getchar();
         //csk_uart2_putchar(tmp);
         //csk_uart0_putchar(tmp);
         // csk_uart0_putchar(rx_test[i]);
       // received = 1;
        i++;
      }
    
    i=0;
    //temp[i+1] = '\0';
      //sprintf(temp2, temp);
    //while(i<100000) { csk_uart2_putchar('U'); i++;}
    //sprintf(tmp, "$$$9PITAKEIMG");
    sprintf(tmp, "%s%d%s", TO_PI_HDR, strlen(cmd), cmd);
    csk_uart2_puts(tmp);
    csk_uart0_puts(tmp);
    Nop();Nop();Nop();Nop();Nop(); //debug
    /* for testing...
    if (received == 1) {
       Nop();Nop();Nop();Nop();
      csk_uart2_puts(rx_test);
      csk_uart0_puts(rx_test);
      received = 0;
    }
     * ...end test */
      // csk_uart0_puts(temp2);
    OS_Delay(100);
  }
}
