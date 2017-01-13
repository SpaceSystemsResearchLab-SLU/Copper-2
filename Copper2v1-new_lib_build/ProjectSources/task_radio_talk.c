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

RADIO_CONFIGURATION_TYPE radio_config;

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

  destination[0] = radio_config.interface_baud_rate;
  destination[1] = radio_config.tx_power_amp_level;
  destination[2] = radio_config.rx_rf_baud_rate;
  destination[3] = radio_config.tx_rf_baud_rate;
  destination[4] = radio_config.rx_modulation;
  destination[5] = radio_config.tx_modulation;
  destination[6] = (radio_config.rx_freq & 0xFF000000) >> 24;
  destination[7] = (radio_config.rx_freq & 0xFF0000) >> 16;
  destination[8] = (radio_config.rx_freq & 0xFF00) >> 8;
  destination[9] = (radio_config.rx_freq & 0xFF);
  destination[10] = (radio_config.tx_freq & 0xFF000000) >> 24;
  destination[11] = (radio_config.tx_freq & 0xFF0000) >> 16;
  destination[12] = (radio_config.tx_freq & 0xFF00) >> 8;
  destination[13] = (radio_config.tx_freq & 0xFF);
  for (i = 0; i < 6; i++) {
    destination[14 + i] = radio_config.source[i];
    destination[20 + i] = radio_config.destination[i];
  }
  destination[26] = (radio_config.tx_preamble & 0xFF00) >> 8;
  destination[27] = (radio_config.tx_preamble & 0xFF);
  destination[28] = (radio_config.tx_postamble & 0xFF00) >> 8;
  destination[29] = (radio_config.tx_postamble & 0xFF);
  destination[30] = (radio_config.function_config & 0xFF00) >> 8;
  destination[31] = (radio_config.function_config & 0xFF);
  destination[32] = (radio_config.function_config2 & 0xFF00) >> 8;
  destination[33] = (radio_config.function_config2 & 0xFF);
  destination[34] = '\0';
}

extern void print_radio_config() {
  static int i;
  static char radio_config[35];
  static RADIO_TX_PACKET_HEADER header;
  static RADIO_TX_PACKET packet;
  write_radio_config_to_array(radio_config);
 // for (i = 0; i < 34; i++) {
 //   dprintf("%02x", radio_config[i]);
 // }
 // dprintf("\r\n");
   fill_out_radio_tx_packet(&packet,
            &header,
            TRANSMIT_DATA,
            35,
            radio_config);
    send_packet_to_radio(&packet);

  Nop();Nop();Nop();Nop();
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

extern void fill_out_radio_tx_packet(RADIO_TX_PACKET* packet,
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
    // I think that packet_array only exists to service this checksum (MAS)
    memcpy((packet_array+8), payload, payload_size);
    chksum = calc_fletcher_chksum(packet_array, (8 + payload_size));
    int tempchksuma = chksum & 0xFF00;
    unsigned char temp = tempchksuma >> 8;
    packet->payload_chksum_a = (chksum & 0xFF00) >> 8;
    packet->payload_chksum_b = (chksum & 0xFF);
Nop();Nop();Nop();Nop(); //debug
  }
}

extern void send_packet_to_radio(RADIO_TX_PACKET* packet) {
  static int i;
  static char message[265];
 Nop();Nop();Nop();Nop(); //debug
 
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
} // end send_packet_to_radio()

extern void printnames() {
  static RADIO_TX_PACKET_HEADER header;
  static RADIO_TX_PACKET packet;
  static char* payload = "Nick\r\nFred\r\nDonnie\r\nSam\r\nEvan\r\n";

  fill_out_radio_tx_packet(&packet,
            &header,
            TRANSMIT_DATA,
            9,
            payload);
    send_packet_to_radio(&packet);
}

void configure_radio(void) {
  //static RADIO_CONFIGURATION_TYPE radio_config;
  static RADIO_TX_PACKET_HEADER header;
  static RADIO_TX_PACKET packet;

  radio_config.interface_baud_rate = HE_UART_BAUD_RATE_9600;
  radio_config.tx_power_amp_level = 0x87;
  radio_config.rx_rf_baud_rate = HE_RF_BAUD_RATE_9600;
  radio_config.tx_rf_baud_rate = HE_RF_BAUD_RATE_9600;
  radio_config.rx_modulation = HE_RF_MODULATION_GFSK;
  radio_config.tx_modulation = HE_RF_MODULATION_GFSK;
  radio_config.rx_freq = ONE_FORTY_FIVE_ZERO_ZERO_ZERO_KHZ;
  radio_config.tx_freq = FOUR_THIRTY_SEVEN_TWO_FOUR_EIGHT_KHZ;
  radio_config.source[0] = CALL0;
  radio_config.source[1] = CALL1;
  radio_config.source[2] = CALL2;
  radio_config.source[3] = CALL3;
  radio_config.source[4] = CALL4;
  radio_config.source[5] = CALL5;
  radio_config.destination[0] = GROUND0;
  radio_config.destination[1] = GROUND1;
  radio_config.destination[2] = GROUND2;
  radio_config.destination[3] = GROUND3;
  radio_config.destination[4] = GROUND4;
  radio_config.destination[5] = GROUND5;
  radio_config.tx_preamble = 0x0005;
  radio_config.tx_postamble = 0x0000;
  radio_config.function_config = 0x0000; // 0x0000 = default
  radio_config.function_config2 = 0x0000;

  fill_out_radio_tx_packet(&packet,
            &header,
            SET_TRANSCEIVER_CONFIG,
            HE_CONFIG_LEN,
            &radio_config);
   send_packet_to_radio(&packet);
} // end configure_radio()

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
  static OStypeMsgP msgP; // used in OS_WaitMsgQ below
  static TELEMETRY_STRUCTURE telemetry;

  // begin radio config -- see radio.h for further explanations
  configure_radio();
  OS_Delay(50);
  configure_radio();
  OS_Delay(50);
  configure_radio();
  OS_Delay(50);

  dprintf("Starting task_radio_talk...\r\n");
  
  while (1) {

    // wait to make sure task_radio_listen isn't receiving anything
    //OS_WaitBinSem(BINSEM_RADIO_CLEAR, OSNO_TIMEOUT);
    //dprintf("task talk has the semaphore\r\n");

  //  if (OSMsgQCount(RADIOMSGQP)) {
  //    msgqpayload = (char*)OSReadMsgQ(RADIOMSGQP);
  //    }
 
/*
    fill_out_radio_tx_packet(&packet,
            &header,
            TELEMETRY_QUERY,
            0,
            0);
    send_packet_to_radio(&packet);
*/

  //  OSSignalMsgQ(RADIO_MSGQ_P, (OStypeMsgP) &packet);
    OS_WaitMsgQ(RADIO_MSGQ_P, &msgP, OSNO_TIMEOUT);

    fill_out_radio_tx_packet(&packet,
              &header,
              TRANSMIT_DATA,
              65,
              msgP);
    send_packet_to_radio(&packet);

//dprintf("Sending beacon data...\r\n%s\r\n",msgP);
//Nop();Nop();Nop();Nop();Nop(); //debug
//print_radio_config();
    
   // OS_Delay(250);
     
  // tell task_radio_listen that we're done transmitting
  //OSSignalBinSem(BINSEM_RADIO_CLEAR); 
  } //end while(1) main
}
