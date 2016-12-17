#include "main.h"
#include "events.h"
#include "messagequeues.h"
#include "radio.h"
#include "task_radio_listen.h"
#include "csk_uart.h"
#include "csk_hw.h"
#include "salvo.h"
#include "debug_functions.h"

static int i;
static char temp[100];
static unsigned char received_packet[MAX_RADIO_PACKET_LENGTH];

extern RADIO_CONFIGURATION_TYPE radio_configuration;

extern void printnames();
extern void print_radio_config();
extern void write_msgqmessage_to_OStypeMsgP(MSGQMESSAGE* message_struct, OStypeMsgP message);

void fill_out_radio_config(unsigned char* config_array) {
  static int i;

  radio_configuration.interface_baud_rate = config_array[0];
  radio_configuration.tx_power_amp_level = config_array[1];
  radio_configuration.rx_rf_baud_rate = config_array[2];
  radio_configuration.tx_rf_baud_rate = config_array[3];
  radio_configuration.rx_modulation = config_array[4];
  radio_configuration.tx_modulation = config_array[5];
  radio_configuration.rx_freq = (long)config_array[6];
  radio_configuration.tx_freq = (long)config_array[10];
  for (i = 0; i < 6; i++) {
    radio_configuration.source[i] = config_array[14 + i];
    radio_configuration.destination[i] = config_array[20 + i];
  }
  radio_configuration.tx_preamble = (int)config_array[26];
  radio_configuration.tx_postamble = (int)config_array[28];
  radio_configuration.function_config = (int)config_array[30];
  radio_configuration.function_config2 = (int)config_array[32];
}

void task_radio_listen(void) {
  int j;
  static unsigned int received;
  static int binsem;
  //static char message_to_send[MAX_OSMESSAGEARRAY_LEN];
  //MSGQMESSAGE message_to_tasktalk;

  //int i;
  // flush uart1
  //for (i=0; i <100; i++) { csk_uart1_putchar(NULL); }
  received = 0; // init flag to false
  while (1) {
    // Wait to make sure task_radio_talk is not using radio
    //OS_WaitBinSem(BINSEM_RADIO_CLEAR, OSNO_TIMEOUT);
// dprintf("received = %d\tuart1_count= %d\r\n", received,csk_uart1_count());
    // wait until uart has something
    while (!csk_uart1_count()) { OS_Delay(20);
    Nop();Nop();Nop();Nop();Nop();
    }
      //dprintf("task listen waiting for something on radio\r\n");
      //while(!received && (csk_uart1_count() > 0) ) {
      while(csk_uart1_count() > 0 ) {
        Nop();Nop();Nop();Nop();Nop(); //debug
        //dprintf("task listen got something on radio\r\n");
        received_packet[i] = csk_uart1_getchar();
        i++;
      }
      // check packet header for 'He' to see if Helium is talking to us
//      if ((received_packet[0] == SYNC_A) && (received_packet[1] == SYNC_B)) { // 'He'
//          received = 1;
//     }
Nop();Nop();Nop();Nop();Nop(); //debug
j=0;
for (j=0; j<i;j++) {
 csk_uart0_putchar(received_packet[j]);
}
dprintf("\r\n");
Nop();Nop();Nop();Nop();Nop(); //debug
//dnprintf(i, received_packet);

      // start parsing radio response (command type bytes for responses will
      // always begin with 0x20XX which is why we're only checking the last 
      // byte of the command type)
 //     if (received) {
        switch(received_packet[3]) {
          case NO_OP_COMMAND_ACK:  // No-op ACK
            dprintf("no-op command ACK\r\n");
            break;
          case RESET_SYSTEM_ACK:  // Reset ACK
            dprintf("reset command ACK\r\n");
            break;
          case TRANSMIT_DATA_ACK:  // Transmit ACK
           // dprintf("transmit data ACK\r\n");
            break;
          case INCOMING_RECEIVED_DATA:  // received data payload incoming
            // parse the data
            dprintf("Incoming received data:\r\n");
            dnprintf(i, received_packet);
            if (received_packet[24] == 'N' && received_packet[25] == 'A' && received_packet[26] == 'M' && received_packet[27] == 'E' && received_packet[28] == 'S') {
                printnames();
            }
            //memcpy(received_packet, message_to_send, i); THIS IS SIMPLE LOOPBACK FOR RADIO TESTING
            // more robust messaging implementation
            /*message_to_tasktalk.msgtype = Radio_Transmission;
             extern void printnames()
            message_to_tasktalk.message = received_packet;
             * if (received_packet[4] == 'N' && received_packet[5] == 'A' && ...) {
                OS_Delay(50);
                printnames();
             * }
            message_to_tasktalk.message_len = i;
            write_msgqmessage_to_OStypeMsgP(&message_to_tasktalk, message_to_send);
            OSSignalMsgQ(RADIOMSGQP, message_to_send);*/
            break;
          case INCOMING_TRANSCEIVER_CONFIG:  // transceiver config incoming, this will be in response to a 0x1005 command to the radio
           // dprintf("Incoming transciever config\r\n");
            //fill_out_radio_config(received_packet);
            dnprintf(i, received_packet);
            //print_radio_config();
            break;
          case SET_TRANSCEIVER_CONFIG_ACK:  // set transceiver config ack
            //dprintf("set config ACK\r\n");
            break;
          case INCOMING_TELEMETRY_STRUCT:  // incoming telemetry data struct
            dprintf("incoming telemetry data\r\n");
            break;
          case WRITE_FLASH_ACK:  // write flash ACK (writing the flash sets the power-on config settings)
            dprintf("write flash ACK\r\n");
            break;
          case RF_CONFIG_ACK:  // RF config ACK
            dprintf("rf config ACK\r\n");
            break;
          case BEACON_DATA_ACK:  // beacon data ACK (0x1010 sets the contents of the next beacon)
            dprintf("beacon data set ACK\r\n");
            break;
          case BEACON_CONFIG_ACK:  // set beacon config ACK (0x1011 sets the configuration of the beacon structure)
            dprintf("beacon config set ACK\r\n");
            break;
          case INCOMING_FIRMWARE_REVISION:  // Firmware revision
            dprintf("incoming firmware revision\r\n");
            break;
          case WRITE_OVER_AIR_KEY_ACK:
            dprintf("write over air key ACK\r\n");
            break;
          case FIRMWARE_UPDATE_ACK:
            dprintf("firmware update ACK\r\n");
            break;
          case FIRMWARE_PACKET_ACK:
            dprintf("firmware packet ACK\r\n");
            break;
          case FAST_PA_SET_ACK:   // Fast power amplifier set ack
            dprintf("fast power level set ACK\r\n");
            break;
          default:    // something went wrong
            // TODO: error handling
            dprintf("unknown command byte. dumping packet:\r\n");
            dnprintf(i, received_packet);
        } // end switch case
//      } // end if (received)
      i = 0;
      received = 0;
      
    // signal task_radio_talk that we're done and then yield to scheduler
    //OSSignalBinSem(BINSEM_RADIO_CLEAR);
    OS_Delay(50);
  }
}
