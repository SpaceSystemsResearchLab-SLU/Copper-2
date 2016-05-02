#include "main.h"
#include "task_test.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "csk_hw.h"
#include "salvo.h"

// Microchip headers
#include "p24FJ256GA110.h"
#include "Rtcc.h"
#include "ports.h"

static char temp[100];
static int i;

void task_test(void) {
/*
  // ATMEGA EPS SPI settings
  TRISE|=BIT9;
  SCLK_LOW;
  CS1_HIGH;
  CS2_HIGH;
  // END ATMEGA EPS SPI settings

  while(1) {
    i = 0;
    while(csk_uart0_count() > 0) {
      temp[i] = csk_uart0_getchar();
      i++;
    }
    i = 0;

    Nop();
    Nop();
    Nop();
    Nop();
    if (!strcmp(temp, "PON\n")) {
        csk_io34_high();
        dprintf("IO.34 high\r\n");
    } else if (!strcmp(temp, "POFF\n")) {
        csk_io34_low();
        dprintf("IO.34 low\r\n");
    }
    temp[0] = '\0';
    
      static unsigned char data;
      static unsigned int ADCData[NUM_ADC_CHANNELS]={0};
      static unsigned int count;
      static char adc_hdr[65];

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

                                dprintf("adc_hdr: %s\r\n", adc_hdr);

      csk_io34_high();
      csk_io35_high();
      csk_io39_high();
      OS_Delay(100);
      csk_io34_low();
      csk_io35_low();
      csk_io39_low();

    OS_Delay(100);
  }*/
    OS_Delay(250);
}
