#ifndef __CONFIG_H
#define __CONFIG_H


#include <p24fxxxx.h>         			              // For the entire PIC24 family.

#define MAIN_XTAL_FREQ                    8000000L    // 8.000MHz main xtal
#define SCND_XTAL_FREQ                    32768       // 32.768kHz secondary xtal

#define GETCHAR_PUTCHAR_RETURN_ZERO       1           // For this project, these functions return 0
                                                      //  on error

#define RX1_BUFF_SIZE                     256          //
#define TX1_BUFF_SIZE                     256         //
#define RX2_BUFF_SIZE                     128          //
#define TX2_BUFF_SIZE                     128         //
#define RX3_BUFF_SIZE                     64
#define TX3_BUFF_SIZE                     64
#define RX4_BUFF_SIZE                     64
#define TX4_BUFF_SIZE                     64

#endif /* __CONFIG_H */

