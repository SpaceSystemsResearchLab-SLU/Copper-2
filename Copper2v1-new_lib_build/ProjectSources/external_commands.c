#include <stdio.h>
#include <stdarg.h>
#include "main.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "salvo.h"
#include "task_pi.h"

extern void printnames();

// prototype
void process_command(char*);


void process_command(char * received_packet) {

Nop();Nop();Nop();Nop();Nop(); //debug
  if (received_packet[24] == 'N' && received_packet[25] == 'A' && received_packet[26] == 'M' && received_packet[27] == 'E' && received_packet[28] == 'S') {
    // for testing -- transmits names
    printnames(); // <-- in task_radio_talk.c
  }
  else if (received_packet[24]=='P' && received_packet[25]=='I' && received_packet[26] == 'O' && received_packet[27] == 'N') {
    // turn Pi on!
    csk_io39_high();
  }
  else if (received_packet[24]=='P' && received_packet[25]=='I' && received_packet[26] == 'O' && received_packet[27] == 'F' && received_packet[28]=='F'){
    // turn Pi OFF!
    csk_io39_low();
  }
  else if (received_packet[24]=='T' && received_packet[25]=='A' && received_packet[26] == 'K' && received_packet[27] == 'E' && received_packet[28]=='P' && received_packet[29]=='I' && received_packet[30]=='C' && received_packet[31]=='P' && received_packet[32]=='I'){
    // tell Pi to take a picture w/ Pi (visible light) camera
    TAKEPICPI = TRUE;
  }
} // end void process_command(char*)