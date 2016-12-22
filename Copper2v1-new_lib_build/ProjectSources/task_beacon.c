// Project headers
#include "debug_functions.h"
#include "events.h"
#include "radio.h"

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
  static int i;
  static RADIO_TX_PACKET_HEADER header;
  static RADIO_TX_PACKET packet;
  static RADIO_CONFIGURATION_TYPE radio_config;
  static char beacon_header[65] = {1};
  //static EPS_DATA epsdata;
  static unsigned char data;
  static unsigned int ADCData[NUM_ADC_CHANNELS]={0};
  static unsigned int count;

   // ATMEGA EPS SPI settings
  TRISE|=BIT9;
  SCLK_LOW;
  CS1_HIGH;
  CS2_HIGH;
  // END ATMEGA EPS SPI settings

    while(1) {
      OS_Delay(20);

  /** Begin reading EPS values...*/
      CS1_LOW; // Chip Select 1 (Select Atmel chip 1)
  // Calling an OS_Delay here is ok as this function is inline and we will still be in the
  // stack frame of the task function.
      // Without this delay, ADC is read incorrectly
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
      CS1_HIGH;  // Deselect EPS Atmel chip 1
      OS_Delay(20);
      CS2_LOW;  // Select EPS Atmel chip 2
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
/** End reading EPS values */

      sprintf(beacon_header, "%03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X",
          ADCData[0], ADCData[1], ADCData[2], ADCData[3], ADCData[4],
          ADCData[5], ADCData[6], ADCData[7], ADCData[8], ADCData[9], ADCData[10], ADCData[11],
          ADCData[12], ADCData[13], ADCData[14], ADCData[15]);

      fill_out_radio_tx_packet(&packet,
              &header,
              TRANSMIT_DATA,
              65,
              beacon_header);

  //    OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) &packet);
      OS_Delay(250);
    } // end while(1)
} // end task_beacon(void)
