// Project headers
#include "task_beacon.h"
#include "debug_functions.h"

//#include <stdio.h>

// Pumpkin headers
#include "csk_io.h"

// Microchip headers
#include "p24FJ256GA110.h"

// Salvo headers
#include "salvo.h"

extern void init_eps_data(EPS_DATA* eps_data) {
    eps_data->eps_hex_size = 65;
    memset(eps_data->eps_hex, 0, eps_data->eps_hex_size);
}

extern void read_eps_values(EPS_DATA* epsdata) {
    //memset(adc_hdr, 0, size_of_hdr * sizeof(*adc_hdr));


  static unsigned char data;
  static unsigned int ADCData[NUM_ADC_CHANNELS]={0};
  static unsigned int count;
  static int i;

  CS1_LOW;
  //OS_Delay(20);
  for (i = 0; i < 2000; i++) {
      Nop();
  }

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
  //OS_Delay(20);
  for (i = 0; i < 2000; i++) {
      Nop();
  }

  CS2_LOW;
  // Without this delay, ADC is read incorrectly
  //OS_Delay(20);
  for (i = 0; i < 2000; i++) {
      Nop();
  }
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

  // Debugging
  //char tmp[10] = "HELLO!";
  //char tmp2[15];
  //sprintf(tmp2, "%s", tmp);
  // End debugging
  Nop();
  Nop();
  Nop();
  Nop();
  //char adc_hdr_tmp[64];
  sprintf(epsdata->eps_hex, "%03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X", ADCData[0], ADCData[1], ADCData[2], ADCData[3], ADCData[4],
      ADCData[5], ADCData[6], ADCData[7], ADCData[8], ADCData[9], ADCData[10], ADCData[11],
      ADCData[12], ADCData[13], ADCData[14], ADCData[15]);

  Nop();
  Nop();
  Nop();
  Nop();
  //memcpy(&adc_hdr, &adc_hdr_tmp, 65);
  Nop();
  Nop();
  Nop();
  Nop();

  // DEBUGGING
  //dprintf("adc_hdr: %s\r\n", adc_hdr);
} // END extern void read_eps_values()

void task_beacon(void) {
  // ATMEGA EPS SPI settings
  TRISE|=BIT9;
  SCLK_LOW;
  CS1_HIGH;
  CS2_HIGH;
  // END ATMEGA EPS SPI settings

    while(1) { OS_Delay(250); }
}
