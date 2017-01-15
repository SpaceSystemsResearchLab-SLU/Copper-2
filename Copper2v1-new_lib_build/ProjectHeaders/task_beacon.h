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

#endif
