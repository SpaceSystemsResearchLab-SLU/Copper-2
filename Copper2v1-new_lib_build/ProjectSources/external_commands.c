#include <stdio.h>
#include <stdarg.h>
#include "events.h"
#include "main.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "salvo.h"
#include "task_pi.h"
#include "radio.h"


// prototype
void process_command(char*);

// received_packet comese from task_radio_listen
void process_command(char * received_packet) {
  static char* tmp;
  static char TRIPLEYEETSUPREME_INT = 0;
 
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
    OSSignalBinSem(BINSEM_PIOFF);
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
    //TAKEPICPI = TRUE;
    OSSignalBinSem(BINSEM_TAKEPICPI);
  }
  // TAKEPICQ = tell Pi to take a picture with Quark camera
  else if (received_packet[24]=='T' && received_packet[25]=='A' && received_packet[26] == 'K' && received_packet[27] == 'E' && received_packet[28]=='P' && received_packet[29]=='I' && received_packet[30]=='C' && received_packet[31]=='Q'){
    TAKEPICQ = TRUE;
  }
  // BURN = activate Burn circuit (csk_io34_high()) for ~8sec.
  else if (received_packet[24]=='B' && received_packet[25]=='U' && received_packet[26] == 'R' && received_packet[27] == 'N') {
    OSSignalBinSem(BINSEM_BURNCIRCUIT);
  }
  // GETBCN = send a beacon NOW
  else if (received_packet[24]=='G' && received_packet[25]=='E' && received_packet[26] == 'T' && received_packet[27] == 'B' && received_packet[28]=='C' && received_packet[29]=='N'){
    OSSignalBinSem(BINSEM_GETBCN);
  }
  // RTYS = Reset TRIPLEYEETSUPREME_INT
  else if (received_packet[24]=='R' && received_packet[25]=='T' && received_packet[26] == 'Y' && received_packet[27] == 'S') {
    TRIPLEYEETSUPREME_INT = 0;
    sprintf(tmp, "Reset of TYS_INT = %d\r\n",TRIPLEYEETSUPREME_INT);
    OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) tmp);
  }
  // TRIPLEYEETSUPREMEx = if you don't know, then you don't need to know
  else if (received_packet[24]=='T' && received_packet[25]=='R' && received_packet[26] == 'I' && received_packet[27] == 'P'
            && received_packet[28]=='L' && received_packet[29]=='E' && received_packet[30]=='Y' && received_packet[31]=='E'
            && received_packet[32]=='E' && received_packet[33]=='T' && received_packet[34]=='S' && received_packet[35]=='U'
            && received_packet[36]=='P' && received_packet[37]=='R' && received_packet[38]=='E' && received_packet[39]=='M' && received_packet[40]=='E'){
    if((received_packet[41]=='0') && (TRIPLEYEETSUPREME_INT==0)){
      TRIPLEYEETSUPREME_INT=1;
      sprintf(tmp, "TYS_INT= %d\r\n",TRIPLEYEETSUPREME_INT);
      OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) tmp);
    }
    else if((received_packet[41]=='1') && (TRIPLEYEETSUPREME_INT==1)){
      TRIPLEYEETSUPREME_INT=2;
      sprintf(tmp, "TYS_INT= %d\r\n",TRIPLEYEETSUPREME_INT);
      OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) tmp);
    }
    else if((received_packet[41]=='2') && (TRIPLEYEETSUPREME_INT==2)){
      sprintf(tmp, "TYS_INT= %d  See you in a little bit...\r\n",TRIPLEYEETSUPREME_INT);
      OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) tmp);
      while(1) {} // force WDT reset!
    }
  }
} // end void process_command(char*)