#ifndef __task_beacon
#define __task_beacon

extern void task_beacon(void);

#define SCLK_HIGH         csk_io33_high()
#define SCLK_LOW          csk_io33_low()
#define MISO              ((PORTE&BIT9)>>9)
#define CS1_HIGH          csk_io11_high()
#define CS1_LOW           csk_io11_low()
#define CS2_HIGH          csk_io9_high()
#define CS2_LOW           csk_io9_low()
#define SCLK_DELAY        200
#define NUM_ADC_CHANNELS  16
#define ADC_BATV          11



// WARNING: This function is only safe to call from directly within a task function
// DO NOT call this function from any other function called from inside a task function
static inline void read_eps_values(char* inputarray) {
  static unsigned char data;
  static unsigned int ADCData[NUM_ADC_CHANNELS]={0};
  static unsigned int count;
  static int i;

  CS1_LOW;
  // Calling an OS_Delay here is ok as this function is inline and we will still be in the
  // stack frame of the task function.
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
}

#endif
