// Pumpkin Salvo headers
#include "salvo.h"
#include "csk_io.h"
#include "csk_sd.h"
//#include "thin_usr.h"

// Microchip headers
#include "p24FJ256GA110.h"

#include "events.h"
#include "init.h"
#include "main.h"
#include "tasks.h"
#include "messagequeues.h"
#include "task_test.h"
#include "task_radio_talk.h"
#include "task_radio_listen.h"
#include "task_scheduler.h"
#include "task_beacon.h"
#include "task_pi.h"
#include "task_pi_listen.h"
#include "task_burncircuit.h"

csk_status_t csk_status;

/******************************************************************************
****                                                                       ****
**                                                                           **
main()

Conventional Salvo main(), with peripheral initialization, Salvo 
initialization, and the Salvo scheduler.

**                                                                           **
****                                                                       ****
******************************************************************************/
int main() {
  //csk_io42_low();

  // Do target-specific (e.g., clocks, UARTs) and general 
  //  (e.g., CSK IO) initialization.
  init();
 
  // Initialize Salvo RTOS.
  OSInit();

  /*int i = 0;
  TRISB = ~(BIT15+BIT14+BIT13+BIT12+BIT11+BIT10+BIT9+BIT8+BIT7+BIT6+BIT5+BIT4+BIT3+BIT2+BIT1+BIT0);
    PORTB |=  BIT3;
    while (1) {
        for (i = 0; i < 10000; i++) {
            Nop();
        }
        PORTB &= ~BIT3;
        for (i = 0; i < 10000; i++) {
            Nop();
        }
        PORTB |=  BIT3;
    }*/

  /*1=Startup critical
  * 2=COMs
  * 3=Abstract data collection
  * 4=Permanent schedules
  * 6=Burn circuit--wait for call
  * 7=Ejection wait on RTC
  * 8=I2C init
  * 9=Debugging/does nothing
  */
  // Create tasks -- MAKE SURE THAT OSTASKS in salvocfg.h IS LARGE ENOUGH!
  //OSCreateTask(task_test,               TASK_TEST_P,              2);
  OSCreateTask(task_radio_listen,       TASK_RADIO_LISTEN_P,      3);
  OSCreateTask(task_radio_talk,         TASK_RADIO_TALK_P,        3);
  OSCreateTask(task_pi,                 TASK_PI_P,                4);
  OSCreateTask(task_beacon,             TASK_BEACON_P,            4);
  OSCreateTask(task_pi_listen,          TASK_PI_LISTEN_P,         3);
  OSCreateTask(task_burncircuit,        TASK_BURNCIRCUIT_P,       6);
  //OSCreateTask(task_scheduler,          TASK_SCHEDULER_P,           4);
  
  // Create binary semaphores -- MAKE SURE THEY'RE DEFINED IN events.h AND
  // THAT OSEVENTS IN salvocfg.h IS LARGE ENOUGH!
  //OSCreateBinSem(BINSEM_RADIO_CLEAR,  1);    // initialize this to 1 to signal that radio is not in use
  OSCreateBinSem(BINSEM_PION, 1);
  OSCreateBinSem(BINSEM_PI_ISON, 0);
  OSCreateBinSem(BINSEM_PIOFF, 0);
  OSCreateBinSem(BINSEM_QUARKON, 0);
  OSCreateBinSem(BINSEM_QUARKOFF, 0);
  OSCreateBinSem(BINSEM_BURNCIRCUIT, 0);
  OSCreateBinSem(BINSEM_TAKEPICPI, 1);
  OSCreateBinSem(BINSEM_TAKEPICQ, 0);
  OSCreateBinSem(BINSEM_GETBCN, 0);

  
  // Create message queues
  //OSgltypeMsgQP radio_messageq_buffer[SIZEOFRADIOMSGQ];
  OSgltypeMsgQP radioMsgBuff[SIZEOF_RADIO_MSGQ];
  OSCreateMsgQ(RADIO_MSGQ_P, RADIO_MSGQ_CBP_P, radioMsgBuff, SIZEOF_RADIO_MSGQ);

//Init SD-Card
  //csk_sd_pwr_on();
  //csk_sd_open();
  //f_initvolume();

  // Enable interrupts (enables UART tx & rx).
  __enable_interrupt();

 
  // Multitask.
  while (1) {
    OSSched();
  } /* while */
  
} /* main() */
