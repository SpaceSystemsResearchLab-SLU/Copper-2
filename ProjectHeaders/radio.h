/* 
 * File:   radio.h
 * Author: CDH
 *
 * Created on March 17, 2016, 5:28 PM
 * 
 * Has all the HE specific defines and structs
 */

#ifndef RADIO_H
#define	RADIO_H

#ifdef	__cplusplus
extern "C" {
#endif

/*------- Radio defines -------*/
#define MAX_RADIO_PACKET_LENGTH     265
// Radio header sync chars
#define SYNC_A    0x48     // 'H'
#define SYNC_B    0x65     // 'e'

// CDI packet command type byte defines (commands to radio)
#define NO_OP_COMMAND 0x1001
#define RESET_SYSTEM 0x1002
#define TRANSMIT_DATA 0x1003
// 0x1004 doesn't exist, 0x2004 is the response code for incoming packet
#define GET_TRANSCEIVER_CONFIG 0x1005
#define SET_TRANSCEIVER_CONFIG 0x1006
#define TELEMETRY_QUERY 0x1007
#define WRITE_FLASH 0x1008
#define RF_CONFIG 0x1009
#define BEACON_DATA 0x1010
#define BEACON_CONFIG 0x1011
#define READ_FIRMWARE_REVISION 0x1012
#define WRITE_OVER_AIR_KEY 0x1013
#define FIRMWARE_UPDATE 0x1014
#define FIRMWARE_PACKET 0x1015
#define FAST_PA_SET 0x1020
  
// CDI packet command type byte defines (responses from radio)
// The radio will format its responses with a 0x20 in front of
// each of these (eg. 0x2001, 0x2002, 0x2003, etc...) but we'll
// only be checking the last byte of the command type on responses
// so we've omitted the 0x20 in these defines  
#define NO_OP_COMMAND_ACK 0x01
#define RESET_SYSTEM_ACK 0x02
#define TRANSMIT_DATA_ACK 0x03
#define INCOMING_RECEIVED_DATA 0x04
#define INCOMING_TRANSCEIVER_CONFIG 0x05
#define SET_TRANSCEIVER_CONFIG_ACK 0x06
#define INCOMING_TELEMETRY_STRUCT 0x07
#define WRITE_FLASH_ACK 0x08
#define RF_CONFIG_ACK 0x09
#define BEACON_DATA_ACK 0x10
#define BEACON_CONFIG_ACK 0x11
#define INCOMING_FIRMWARE_REVISION 0x12
#define WRITE_OVER_AIR_KEY_ACK 0x13
#define FIRMWARE_UPDATE_ACK 0x14
#define FIRMWARE_PACKET_ACK 0x15
#define FAST_PA_SET_ACK 0x20

// HE uart baud rates for radio configuration
#define HE_UART_BAUD_RATE_9600 0
#define HE_UART_BAUD_RATE_19200 1
#define HE_UART_BAUD_RATE_38400 2
#define HE_UART_BAUD_RATE_76800 3
#define HE_UART_BAUD_RATE_115200 4

// HE radio transmission baud rates
#define HE_RF_BAUD_RATE_1200 0
#define HE_RF_BAUD_RATE_9600 1
#define HE_RF_BAUD_RATE_19200 2
#define HE_RF_BAUD_RATE_38400 3

#define HE_RF_MODULATION_GFSK 0
#define HE_RF_MODULATION_AFSK 1
#define HE_RF_MODULATION_BPSK 2
#define TELEMETRY_DUMP_COMMAND 0x30
#define PING_RETURN_COMMAND 0x31
#define CODE_UPLOAD_COMMAND 0x32
#define RADIO_RESET_COMMAND 0x33
#define PIN_TOGGLE_COMMAND 0x34

// Holds radio configuration options
// NOTE: chars are 1 byte, ints (w/ MCC30 compiler) are 2 bytes, longs (w/ MCC30 compiler) are 4 bytes
// thats why this differs from the HE radio documentation
typedef struct
{
unsigned char interface_baud_rate; //Radio Interface Baud Rate (9600=0x00)
unsigned char tx_power_amp_level; //Tx Power Amp level (min = 0x00 max = 0xFF)
unsigned char rx_rf_baud_rate; //Radio RX RF Baud Rate (9600=0x00)
unsigned char tx_rf_baud_rate; //Radio TX RF Baud Rate (9600=0x00)
unsigned char rx_modulation; //(0x00 = GFSK);
unsigned char tx_modulation; //(0x00 = GFSK);
unsigned long rx_freq; //Channel Rx Frequency (ex: 45000000)
unsigned long tx_freq; //Channel Tx Frequency (ex: 45000000)
unsigned char source[6]; //AX25 Mode Source Call Sign (default NOCALL)
unsigned char destination[6]; //AX25 Mode Destination Call Sign (default CQ)
unsigned int tx_preamble; //AX25 Mode Tx Preamble Byte Length (0x00 = 20 flags)
unsigned int tx_postamble; //AX25 Mode Tx Postamble Byte Length (0x00 = 20 flags)
unsigned int function_config; //Radio Configuration Discrete Behaviors
unsigned int function_config2; //Radio Configuration Discrete Behaviors #2
} RADIO_CONFIGURATION_TYPE;

// Struct for holding RADIO_TX_PACKET header (8 bytes)
typedef struct
{
  unsigned int sync_chars;   // These are always the same for any packet you send, spells "He" in hex
  unsigned int command_type;
  unsigned int payload_size;
  unsigned char header_chksum_a;
  unsigned char header_chksum_b;
} RADIO_TX_PACKET_HEADER;

// Struct for holding CDI packet pieces
typedef struct
{
  RADIO_TX_PACKET_HEADER header;
  unsigned char payload[255];
  unsigned char payload_chksum_a;
  unsigned char payload_chksum_b;
} RADIO_TX_PACKET;

#ifdef	__cplusplus
}
#endif

#endif	/* RADIO_H */

