// Project headers
#include "task_beacon.h"
#include "debug_functions.h"
#include <stdio.h>

// Pumpkin headers
#include "csk_io.h"

// Microchip headers
#include "p24FJ256GA110.h"

// Salvo headers
#include "salvo.h"

extern void read_eps_values(char* adc_hdr) {
 

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

  sprintf(adc_hdr, "%03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X", ADCData[0], ADCData[1], ADCData[2], ADCData[3], ADCData[4],
      ADCData[5], ADCData[6], ADCData[7], ADCData[8], ADCData[9], ADCData[10], ADCData[11],
      ADCData[12], ADCData[13], ADCData[14], ADCData[15]);

  CS2_HIGH;

  // DEBUGGING
  dprintf("adc_hdr: %s\r\n", adc_hdr);
} // END extern void read_eps_values()

void task_beacon(void) {
     // ATMEGA EPS SPI settings
  //TRISE|=BIT9;
 // SCLK_LOW;
 // CS1_HIGH;
  //CS2_HIGH;
  // END ATMEGA EPS SPI settings
    while(1) { OS_Delay(250); }
}
