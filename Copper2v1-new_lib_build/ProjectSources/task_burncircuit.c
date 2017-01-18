/******************************************************************************
(C) Copyright Pumpkin, Inc. All Rights Reserved.

This file may be distributed under the terms of the License
Agreement provided with this software.

THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND,
INCLUDING THE WARRANTY OF DESIGN, MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE.

$Source: C:\\RCS\\D\\Pumpkin\\CubeSatKit\\Example\\all\\all\\CubeSatKit_Dev_Board\\Test\\Test1\\task_5sec.c,v $
$Author: aek $
$Revision: 3.1 $
$Date: 2009-11-02 00:45:07-08 $

******************************************************************************/
#include "main.h"
#include "events.h"
#include "task_burncircuit.h"

// Pumpkin CubeSat Kit headers
#include "csk_io.h"
#include "csk_uart.h"

// Pumpkin Salvo headers
#include "salvo.h"

void task_burncircuit(void) {
  static char* tmp;
  // This task runs the burn circuit any time the binary
  // semaphore is enabled
  while(1) {
    OS_Delay(250);
	// Wait until the burn circuit command is enabled;
	//OS_WaitBinSem(BINSEM_BURNCIRCUIT, OSNO_TIMEOUT);
    // WaitBinSem sets the semaphore low again
    if(OSReadBinSem(BINSEM_BURNCIRCUIT)) {
//	csk_uart0_puts("Turning on Burn Circuit\r\n");
	    csk_io34_high();
      sprintf(tmp, "Burn circuit ON!\r\n");
    OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) tmp);
	    //OS_Delay(250);OS_Delay(250);OS_Delay(250);OS_Delay(50);
	    //csk_io34_low();
      OSTryBinSem(BINSEM_BURNCIRCUIT);
      sprintf(tmp, "Burn circuit OFF!\r\n");
    OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) tmp);
//	csk_uart0_puts("Turning off Burn Circuit\r\n");
    } // end: if(OSReadBinSem...)
  } // end: while(1)
} // end: task_burncircuit() 


