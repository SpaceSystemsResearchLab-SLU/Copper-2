// Project headers
#include "main.h"
#include "events.h"
#include "radio.h"
#include "task_radio_talk.h"
#include "debug_functions.h"

// Pumpkin headers
#include "csk_uart.h"
#include "csk_hw.h"

// Salvo headers
#include "salvo.h"

#include "task_beacon.h"
static char temp[100];

RADIO_CONFIGURATION_TYPE radio_configuration;

// we ran into a lot of issues with endianness and memcopy/moving values from structs
// to arrays which is why we're doing all this goofy, clunky, char array accessing.
// This is a helper function to keep code clean when writing a radio configuration.
// Destination array had better be big enough for a RADIO_CONFIGURATION_TYPE struct
// because I'm not doing any checking in here
// TO CONFIGURE RADIO:
// Step 1:  Make sure radio_configuration is filled out with the settings you want to change
// Step 2:  Pass a char[34] array to write_radio_config_to_array (ARRAY NEEDS TO BE AT LEAST 34
//          BYTES)
// Step 3:  Call fill_out_radio_tx_packet and pass it SET_TRANSCIEVER_CONFIG for the command
//          type and the array you just filled out as the payload (remember: transciever
//          configs are 34 bytes long)
// Step 4:  Call send packet to radio
void write_radio_config_to_array(char* destination) {
  static int i;

  destination[0] = radio_configuration.interface_baud_rate;
  destination[1] = radio_configuration.tx_power_amp_level;
  destination[2] = radio_configuration.rx_rf_baud_rate;
  destination[3] = radio_configuration.tx_rf_baud_rate;
  destination[4] = radio_configuration.rx_modulation;
  destination[5] = radio_configuration.tx_modulation;
  destination[6] = (radio_configuration.rx_freq & 0xFF000000) >> 24;
  destination[7] = (radio_configuration.rx_freq & 0xFF0000) >> 16;
  destination[8] = (radio_configuration.rx_freq & 0xFF00) >> 8;
  destination[9] = (radio_configuration.rx_freq & 0xFF);
  destination[10] = (radio_configuration.tx_freq & 0xFF000000) >> 24;
  destination[11] = (radio_configuration.tx_freq & 0xFF0000) >> 16;
  destination[12] = (radio_configuration.tx_freq & 0xFF00) >> 8;
  destination[13] = (radio_configuration.tx_freq & 0xFF);
  for (i = 0; i < 6; i++) {
    destination[14 + i] = radio_configuration.source[i];
    destination[20 + i] = radio_configuration.destination[i];
  }
  destination[26] = (radio_configuration.tx_preamble & 0xFF00) >> 8;
  destination[27] = (radio_configuration.tx_preamble & 0xFF);
  destination[28] = (radio_configuration.tx_postamble & 0xFF00) >> 8;
  destination[29] = (radio_configuration.tx_postamble & 0xFF);
  destination[30] = (radio_configuration.function_config & 0xFF00) >> 8;
  destination[31] = (radio_configuration.function_config & 0xFF);
  destination[32] = (radio_configuration.function_config2 & 0xFF00) >> 8;
  destination[33] = (radio_configuration.function_config2 & 0xFF);
}

extern void print_radio_config() {
  static int i;
  char radio_config[34];
  write_radio_config_to_array(radio_config);
  for (i = 0; i < 34; i++) {
    dprintf("%02x", radio_config[i]);
  }
  dprintf("\r\n");
}

unsigned int calc_fletcher_chksum(unsigned char * payload, int payload_size) {
  static unsigned char CK_A = 0;
  static unsigned char CK_B = 0;
  static int i;               // THE CHECKSUM IS CALCULATED ACCROSS ALL PERTINENT BYTES OF THE MESSAGE EXCLUDING THE TWO SYNC CHARACTERS OF EACH MESSAGE "He"

  static unsigned int return_value = 0;
  CK_A = 0x00;
  CK_B = 0x00;
  for (i = 2; i < payload_size; i++) {
    CK_A = CK_A + payload[i];
    CK_B = CK_B + CK_A;
  }

  return_value = 0x00FF & CK_A;
  return_value = (return_value << 8) | CK_B;

  return return_value;
}

void fill_out_radio_tx_header(RADIO_TX_PACKET_HEADER* header,
    unsigned int command_type,
    unsigned int payload_size) {
  static unsigned char header_array[6];
  static unsigned int chksum = 0;

  header->sync_chars = 0x00FF & SYNC_A;
  header->sync_chars = (header->sync_chars << 8) | SYNC_B;
  header->command_type = command_type;
  header->payload_size = payload_size;

  header_array[0] = SYNC_A;
  header_array[1] = SYNC_B;
  header_array[2] = (command_type & 0xFF00) >> 8;
  header_array[3] = (command_type & 0xFF);
  header_array[4] = (payload_size & 0xFF00) >> 8;
  header_array[5] = (payload_size & 0xFF);
  chksum = calc_fletcher_chksum(header_array, 6);                  // The header will always be 6 bytes long before the checksums are calculated

  header->header_chksum_a = (chksum & 0xFF00) >> 8;
  header->header_chksum_b = (chksum & 0xFF);
}

void fill_out_radio_tx_packet(RADIO_TX_PACKET* packet,
    RADIO_TX_PACKET_HEADER* header,
    unsigned int command_type,
    unsigned int payload_size,
    char* payload) {
  static unsigned char packet_array[265];
  static unsigned int chksum = 0;

  fill_out_radio_tx_header(header, command_type, payload_size);

  packet_array[0] = SYNC_A;
  packet_array[1] = SYNC_B;
  packet_array[2] = (command_type & 0xFF00) >> 8;
  packet_array[3] = (command_type & 0xFF);
  packet_array[4] = (payload_size & 0xFF00) >> 8;
  packet_array[5] = (payload_size & 0xFF);
  packet_array[6] = header->header_chksum_a;
  packet_array[7] = header->header_chksum_b;

  memcpy(&packet->header, header, sizeof(RADIO_TX_PACKET_HEADER));

  if (payload_size) {
    memcpy(&packet->payload, payload, payload_size);
    memcpy((packet_array+8), payload, payload_size);
    chksum = calc_fletcher_chksum(packet_array, (8 + payload_size));
    int tempchksuma = chksum & 0xFF00;
    unsigned char temp = tempchksuma >> 8;
    packet->payload_chksum_a = (chksum & 0xFF00) >> 8;
    packet->payload_chksum_b = (chksum & 0xFF);
  }
}

void send_packet_to_radio(RADIO_TX_PACKET* packet) {
  static int i;
  static char message[265];

  // send header to radio
  csk_uart1_putchar((packet->header.sync_chars & 0xFF00) >> 8);
  csk_uart1_putchar(packet->header.sync_chars & 0xFF);
  csk_uart1_putchar((packet->header.command_type & 0xFF00) >> 8);
  csk_uart1_putchar(packet->header.command_type & 0xFF);
  csk_uart1_putchar((packet->header.payload_size & 0xFF00) >> 8);
  csk_uart1_putchar(packet->header.payload_size & 0xFF);
  csk_uart1_putchar(packet->header.header_chksum_a);
  csk_uart1_putchar(packet->header.header_chksum_b);

  // if we have a packet, send that too (w/ packet checksum)
  if (packet->header.payload_size) {
    for (i; i < packet->header.payload_size; i++) {
      csk_uart1_putchar(packet->payload[i]);
    }
    i = 0;

    csk_uart1_putchar(packet->payload_chksum_a);
    csk_uart1_putchar(packet->payload_chksum_b);
  }

}

void task_radio_talk(void) {
 
  
  static int i;
  static RADIO_TX_PACKET_HEADER header;
  static RADIO_TX_PACKET packet;
  static char* msgqpayload;
  static char beacon_header[65] = {1};
  //static EPS_DATA epsdata;
  static unsigned char data;
  static unsigned int ADCData[NUM_ADC_CHANNELS]={0};
  static unsigned int count;
  static char temp2[101];

   // ATMEGA EPS SPI settings
  TRISE|=BIT9;
  SCLK_LOW;
  CS1_HIGH;
  CS2_HIGH;
  // END ATMEGA EPS SPI settings

  //Power Pi on!
  //csk_io39_high();  // H2.9 == PI1_IO

  while (1) {
    // wait to make sure task_radio_listen isn't receiving anything
    // OS_WaitBinSem(BINSEM_RADIO_CLEAR, OSNO_TIMEOUT);
    //dprintf("task talk has the semaphore\r\n");

    /*if (OSMsgQCount(RADIOMSGQP)) {
      msgqpayload = (char*)OSReadMsgQ(RADIOMSGQP);
      }*/
  
/**
  //while (!received) {
      //dprintf("task listen waiting for something on radio\r\n");
      i = 0;
      while(csk_uart0_count() > 0) {
          Nop();Nop();Nop();Nop();
        //dprintf("task listen got something on radio\r\n");
        temp[i] = csk_uart0_getchar();
         // csk_uart0_putchar(csk_uart0_getchar());
       // received = 1;
        i++;
      }
      temp[i+1] = '\0';
      sprintf(temp2, temp);
      csk_uart0_puts(temp2);
      Nop();Nop();Nop();Nop();
 // }
  //received = 0;
**/
      

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

  sprintf(beacon_header, "%03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X %03X", ADCData[0], ADCData[1], ADCData[2], ADCData[3], ADCData[4],
      ADCData[5], ADCData[6], ADCData[7], ADCData[8], ADCData[9], ADCData[10], ADCData[11],
      ADCData[12], ADCData[13], ADCData[14], ADCData[15]);

    // DEBUG: REMOVE: for beacon testing 
    //while (1) {
    //OS_Delay(10);

  //  read_eps_values(beacon_header);
    fill_out_radio_tx_packet(&packet,
            &header,
            TRANSMIT_DATA,
            65,
            beacon_header);
    send_packet_to_radio(&packet);
    
    Nop();Nop();Nop();Nop();

    OS_Delay(250);
    OS_Delay(250);
    OS_Delay(250);
    OS_Delay(250);
  //} //end while(1) -- inner


  //while(1) {
  //send_packet_to_radio(&packet);
  //OS_Delay(250);
  //}

  // tell task_radio_listen that we're done transmitting
  // OSSignalBinSem(BINSEM_RADIO_CLEAR);
 // OS_Delay(50);
  } //end while(1) main
}
