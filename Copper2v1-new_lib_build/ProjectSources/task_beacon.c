// Project headers
#include "debug_functions.h"

//#include <stdio.h>

// Pumpkin headers
#include "csk_io.h"
#include "csk_uart.h"
#include "csk_hw.h"

// Microchip headers
#include "p24FJ256GA110.h"

// Salvo headers
#include "salvo.h"

#include "task_beacon.h"

/*
extern void init_eps_data(EPS_DATA* eps_data) {
    eps_data->eps_hex_size = 65;
    memset(eps_data->eps_hex, 1, eps_data->eps_hex_size);
}

extern void read_eps_values_pt1(char* inputarray) {
  static unsigned char data;
  static unsigned int ADCData[NUM_ADC_CHANNELS]={0};
  static unsigned int count;
  static int i;

  CS1_LOW;
  OS_Delay(20);
  
  for(data=0;data<8;data++) { //ADC-Reads (10-Bits)
    ADCData[data]=0;
    for(count=0;count<10;count++) { //Bits
      SCLK_HIGH;
      for(i=0;i<SCLK_DELAY;i++) Nop(); //Delay
      ADCData[data]|=(MISO<<count);
      SCLK_LOW;
      for(i=0;i<SCLK_DELAY;i++) Nop(); //Delay
    }
  }

  CS1_HIGH;
  OS_Delay(20);

  CS2_LOW;
  // Without this delay, ADC is read incorrectly
  OS_Delay(20);

  for(data=8;data<16;data++) { //ADC-Reads (10-Bits)
    ADCData[data]=0;
    for(count=0;count<10;count++) { //Bits
      SCLK_HIGH;
      for(i=0;i<SCLK_DELAY;i++) Nop(); //Delay
      ADCData[data]|=(MISO<<count);
      SCLK_LOW;
      for(i=0;i<SCLK_DELAY;i++) Nop(); //Delay
    }
  }
  CS2_HIGH;

  sprintf(inputarray, "%03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X", ADCData[0], ADCData[1], ADCData[2], ADCData[3], ADCData[4],
      ADCData[5], ADCData[6], ADCData[7], ADCData[8], ADCData[9], ADCData[10], ADCData[11],
      ADCData[12], ADCData[13], ADCData[14], ADCData[15]);

  // DEBUGGING
  //dprintf("adc_hdr: %s\r\n", adc_hdr);
} // END extern void read_eps_values()
*/

void task_beacon(void) {
  static int received = 0;
  static int i;
  static char temp[100];
  static char temp2[101];
    while(1) {
      while (!received) {
      //dprintf("task listen waiting for something on radio\r\n");
        i = 0;
        while(csk_uart0_count() > 0) {
          Nop();Nop();Nop();Nop();
          //dprintf("task listen got something on radio\r\n");
          temp[i] = csk_uart0_getchar();
           // csk_uart0_putchar(csk_uart0_getchar());
          received = 1;
          i++;
        }
        temp[i+1] = '\0';
        sprintf(temp2, temp);
        csk_uart0_puts(temp2);
        Nop();Nop();Nop();Nop();
        OS_Delay(50);
      }
      received = 0;
      OS_Delay(50);

    }
}
