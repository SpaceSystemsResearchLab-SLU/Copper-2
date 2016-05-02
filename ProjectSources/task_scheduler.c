#include "main.h"
#include "task_scheduler.h"
#include "csk_uart.h"
#include "task_scheduler.h"
#include "debug_functions.h"
#include "csk_hw.h"
#include "salvo.h"

// Microchip headers
#include "p24FJ256GA110.h"
#include "Rtcc.h"

static char temp[100];

void task_scheduler(void) {
  //rtccTimeDate test_time_date;
  rtccTime testtime;

   //RtccInitClock();
   //RtccWrOn();

  while(1) {
    //RtccReadTimeDate(&test_time_date);

      //RtccReadTime(&testtime);
    
    /*dprintf("month: %02x\r\nday: %02x\r\nyear: %02x\r\nhour: %02x\r\nmin: %02x\r\nsec: %02x\r\n",
            test_time_date.f.mon,
            test_time_date.f.mday,
            test_time_date.f.year,
            test_time_date.f.hour,
            test_time_date.f.min,
            test_time_date.f.sec);
    */

      //dprintf("hour: %02x\r\nmin: %02x\r\nsec: %02x\r\n", testtime.f.hour, testtime.f.min, testtime.f.sec);
      static int i;
      i = 0;
      for(i; csk_uart2_count(); i++) {
          temp[i] = csk_uart2_getchar();
      }
      
      static int j;
      j = 0;
      csk_uart2_puts("I got ");
      for (j; j < i; j++) {
          csk_uart2_putchar(temp[j]);
      }
      csk_uart2_puts(" from the PI!!!!");
      
      dprintf("from PI: ");
      dnprintf(i, temp);
      dprintf("\r\n");
      OS_Delay(250);
  }
}
