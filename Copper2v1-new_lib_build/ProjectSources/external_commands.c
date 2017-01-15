#include <stdio.h>
#include <stdarg.h>
#include "events.h"
#include "main.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "salvo.h"
#include "task_pi.h"


// prototype
void process_command(char*);

// received_packet comese from task_radio_listen
void process_command(char * received_packet) {
  
  // NAMES = for testing radio comms
  if (received_packet[24] == 'N' && received_packet[25] == 'A' && received_packet[26] == 'M' && received_packet[27] == 'E' && received_packet[28] == 'S') {
    static char names[] = "Nick\r\nKate\r\nCody\r\nFred\r\nDonnie\r\nConnor\r\nLindsey\r\nSam\r\nEvan\r\n";
    OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) names);
  }
  // PION = turn Pi power on
  else if (received_packet[24]=='P' && received_packet[25]=='I' && received_packet[26] == 'O' && received_packet[27] == 'N') {
    OSSignalBinSem(BINSEM_PION);
  }
  // PIOFF = tell Pi to shutdown
  else if (received_packet[24]=='P' && received_packet[25]=='I' && received_packet[26] == 'O' && received_packet[27] == 'F' && received_packet[28]=='F'){
    //csk_io39_low();	
	// TODO: Have task_pi look for PIOFF flag and communicate w/ Pi to perform a shutdown
	// TODO: Use RTCC to clock amount of time and perform a hard power off of Pi if Pi is still powered on after ~30sec.
    OSSignalBinSem(BINSEM_PION);
  }
  // QUARKON = turn Quark power on
  else if (received_packet[24]=='Q' && received_packet[25]=='U' && received_packet[26] == 'A' && received_packet[27] == 'R' && received_packet[28]=='K' && received_packet[29]=='O' && received_packet[30]=='N'){
    // TODO: need a delay to give Quark time to power on and boot up
    OSSignalBinSem(BINSEM_QUARKON);
  }
  // QUARKOFF = turn Quark power off
  else if (received_packet[24]=='Q' && received_packet[25]=='U' && received_packet[26] == 'A' && received_packet[27] == 'R' && received_packet[28]=='K' && received_packet[29]=='O' && received_packet[30]=='F' && received_packet[31]=='F'){
    OSSignalBinSem(BINSEM_QUARKOFF);
  }
  // TAKEPICPI = tell Pi to take a picture with Pi camera
  else if (received_packet[24]=='T' && received_packet[25]=='A' && received_packet[26] == 'K' && received_packet[27] == 'E' && received_packet[28]=='P' && received_packet[29]=='I' && received_packet[30]=='C' && received_packet[31]=='P' && received_packet[32]=='I'){
    // tell Pi to take a picture w/ Pi (visible light) camera
    TAKEPICPI = TRUE;
  }
  // TAKEPICQ = tell Pi to take a picture with Quark camera
  else if (received_packet[24]=='T' && received_packet[25]=='A' && received_packet[26] == 'K' && received_packet[27] == 'E' && received_packet[28]=='P' && received_packet[29]=='I' && received_packet[30]=='C' && received_packet[31]=='Q'){
    TAKEPICQ = TRUE;
  }
  // BURN = activate Burn circuit (csk_io34_high()) for ~10sec.
  else if (received_packet[24]=='B' && received_packet[25]=='U' && received_packet[26] == 'R' && received_packet[27] == 'N') {
    //TODO: figure out way to do this w/o using a task...?
  }
  // GETBCN = send a beacon NOW
  else if (received_packet[24]=='G' && received_packet[25]=='E' && received_packet[26] == 'T' && received_packet[27] == 'B' && received_packet[28]=='C' && received_packet[29]=='N'){
    OSSignalBinSem(BINSEM_GETBCN);
  }
} // end void process_command(char*)