/******************************************************************************
(C) Copyright Pumpkin, Inc. All Rights Reserved.

This file may be distributed under the terms of the License
Agreement provided with this software.

THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND,
INCLUDING THE WARRANTY OF DESIGN, MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!I2C--Not 5sec~~~~~~~~~~~~~~~~~~~~~~~
$Source: C:\\RCS\\D\\Pumpkin\\CubeSatKit\\Example\\all\\all\\CubeSatKit_Dev_Board\\Test\\Test1\\task_5sec.c,v $
$Author: aek $
$Revision: 3.1 $
$Date: 2009-11-02 00:45:07-08 $

******************************************************************************/
#include "main.h"
#include "task_I2C.h"

// Pumpkin CubeSat Kit headers 
#include "csk_io.h"
#include "csk_uart.h"

// Pumpkin Salvo headers
#include "salvo.h"

static int I2CSPEED=78; 	// I2CSPEED = 18 at 8Mhz for 400kHz I2C clock, or 78-->100kHz, or etc.
//--------------------------Begin I2C protocols.-----------------------------------------
//--------------------------Begin imported I2C protocols.--------------------------------

void reset_i2c_bus(void);

//function initiates I2C1 module to baud rate BRG
void i2c_init(int BRG)
{
   int temp;
   // I2C1BRG = 18 at 8Mhz for 400kHz I2C clock, or 78-->100kHz, or etc.
   I2C1BRG = BRG;
   I2C1CONbits.I2CEN = 0;	// Disable I2C Mode
   I2C1CONbits.DISSLW = 1;	// Disable slew rate control
   IFS1bits.MI2C1IF = 0;	 // Clear Interrupt
   I2C1CONbits.I2CEN = 1;// Enable I2C Mode
   temp = I2C1RCV;	 // read buffer to clear buffer full
   reset_i2c_bus();	 // set bus to idle
}

//function iniates a start condition on bus
void i2c_start(void)
{
   int x = 0;
   I2C1CONbits.ACKDT = 0;	//Reset any previous Ack
   I2C1CONbits.SEN = 1;	//Initiate Start condition
   Nop();

   //the hardware will automatically clear Start Bit
   //wait for automatic clear before proceding
   while (I2C1CONbits.SEN)
   {
      x++;
      if (x > 20) {i2c_init(I2CSPEED);break;}
   }
}

//function iniates a repeated start condition on bus
void i2c_restart(void)
{
   int x = 0;
   I2C1CONbits.ACKDT = 0;	//Reset any previous Ack
   I2C1CONbits.RSEN = 1;	//Initiate Repeated Start condition
   Nop();

   //the hardware will automatically clear Start Bit
   //wait for automatic clear before proceding
   while (I2C1CONbits.RSEN)
   {
      x++;
      if (x > 20){i2c_init(I2CSPEED);break;}
   }
}

//Resets the I2C bus to Idle
void reset_i2c_bus(void)
{
   int x = 0;
	
   //initiate stop bit
   I2C1CONbits.PEN = 1;
	
   //wait for hardware clear of stop bit
   while (I2C1CONbits.PEN)
   {
      x ++;
      if (x > 20) {i2c_init(I2CSPEED);break;}
   }

   I2C1CONbits.RCEN = 0;
   IFS1bits.MI2C1IF = 0; // Clear Interrupt
   I2C1STATbits.IWCOL = 0;
   I2C1STATbits.BCL = 0;

    I2C1CONbits.I2CEN = 0;	// Disable I2C Mode
	// Drive DATA Low		//Manually assert stop bit.
	PORTG &= ~BIT3; // Low
	Nop();
	// Drive CLK low
	PORTG &= ~BIT2; // Low
	Nop();
	// Stop Sequence
	// Drive CLK High
	PORTG |=  BIT2; // High
	Nop();
	// Drive DATA High
	PORTG |=  BIT3; // High
    I2C1CONbits.I2CEN = 1;	// enable I2C Mode

}

//basic I2C byte send
char send_i2c_byte(int data)
{
   int i;
	i=0;
   while (I2C1STATbits.TBF) { 
		if (i==2000) {i2c_init(I2CSPEED);break;}
		i++;
	}
   IFS1bits.MI2C1IF = 0; // Clear Interrupt
   I2C1TRN = data; // load the outgoing data byte

   // wait for transmission
   for (i=0; i<500; i++)
   {
      if (!I2C1STATbits.TRSTAT) break;

      }
      if (i == 500) {
      return(1);
   }

   // Check for NO_ACK from slave, abort if not found
   if (I2C1STATbits.ACKSTAT == 1)
   {
      //reset_i2c_bus();
      return(1);
   }

   return(0);
}

//function reads data, returns the read data, no ack
char i2c_read(void)
{
   int i = 0;
   char data = 0;

   //set I2C module to receive
   I2C1CONbits.RCEN = 1;

   //if no response, break
   while (!I2C1STATbits.RBF)
   {
      i ++;
      if (i > 2000) {
		//i2c_init(I2CSPEED);
		break;
	  }
   }

   //get data from I2CRCV register
   data = I2C1RCV;

   //return data
   return data;
}

//function reads data, returns the read data, with ack
unsigned char i2c_read_ack(void)	//does not reset bus!!!
{
   long long i = 0;
   char data = 0;

   //set I2C module to receive
   I2C1CONbits.RCEN = 1;

   //if no response, break
   while (!I2C1STATbits.RBF && i<=1000000)
   {
      i++;
      if (i >= 1000000) {
		//i2c_init(I2CSPEED);
   		I2C1CONbits.RCEN = 0;
	  }
   }

   //get data from I2CRCV register
   data = I2C1RCV;

   //set ACK to high
   I2C1CONbits.ACKDT = 0;//Set Ack as output.
   for(i=0;i<1000;i++) Nop();
   I2C1CONbits.ACKEN = 1;
   
   i=0;
   while (I2C1CONbits.ACKEN){
   i++;
   if(i>1000000) {
		//i2c_init(I2CSPEED);
		I2C1CONbits.ACKEN=0;
		return data;
	}
   }

   return data;
}

//function reads data, returns the read data, with nack
unsigned char i2c_read_nack(void)	//does not reset bus!!!
{
   long long i = 0;
   char data = 0;

   //set I2C module to receive
   I2C1CONbits.RCEN = 1;

   //if no response, break
   while (!I2C1STATbits.RBF && i<=1000000)
   {
      i++;
      if (i >= 1000000) {
		//i2c_init(I2CSPEED);
   		I2C1CONbits.RCEN = 0;
	  }
   }

   //get data from I2CRCV register
   data = I2C1RCV;

   //set ACK to high
   I2C1CONbits.ACKDT = 1;//Set Nack as output.
	for(i=0;i<1000;i++) Nop();
   I2C1CONbits.ACKEN = 1;

   i=0;
   while (I2C1CONbits.ACKEN){
   i++;
   if(i>1000000) {
		//i2c_init(I2CSPEED);
		I2C1CONbits.ACKEN=0;
		return data;
	}
   }

   return data;
}



//--------------------------End imported I2C protocols.-----------------------------------------

/** Updated 08/2014 MAS to ensure that 0x00 is included in charArrayOfAppropriateSize when asciiOrHex
 * is set to 0. (They weren't.)
 */
char * i2c_readz(int num, char charArrayOfAppropriateSize[], int asciiOrHex) {
	/*The first input gives the number of bytes to read
	The second input is the array the function will use to return all the data it receives (as hex), 
		and should be at least large enough to contain [3*(num)] number of characters.*/
	charArrayOfAppropriateSize[0] = 0x00;
	if (asciiOrHex==0) {
		int i;
		for (i=0; i < num-1; i++) {
			charArrayOfAppropriateSize[i] = i2c_read_ack(); 
		}
		charArrayOfAppropriateSize[num-1] = i2c_read_nack();
	} else {
		while (num > 1) {
			sprintf(charArrayOfAppropriateSize,"%s%02X ",charArrayOfAppropriateSize,i2c_read_ack());
			num--;
		}
		sprintf(charArrayOfAppropriateSize,"%s%02X",charArrayOfAppropriateSize,i2c_read_nack());
	}
	return charArrayOfAppropriateSize;
}

void i2c_sendz(char sending[], int num) {
	int i;
	for (i=0;i<num;i++) {
		send_i2c_byte(sending[i]);
	}
}

//char * i2c_SnR(int address, int sending[], int num, char charArrayOfAppropriateSize[], int asciiOrHex) {
char * i2c_SnR(int address, char sending[], int numSend, int numRec, char charArrayOfAppropriateSize[], int asciiOrHex) {
	/*The first input is the 7-bit address of the slave you want to talk to. (probably constructed like 0b0000000, etc)
	The second input an interger array containing the data you want to send. (probably constructed from 0x00, etc bytes)
	The third input is the number of bytes you want to return.
	The fourth input is the array the function will use to return all the data it receives
		a) (as ascii), and should be at least large enough to contain [num] number of characters.
		b) (as hex), and should be at least large enough to contain [3*(num)] number of characters.
	The fifth input is a 0 or a 1:
		0 if you want ascii to be returned, 
		1 if you want ascii encoded hex to be returned.
		Note: All returns will be character arrays.
	Note: If num is 0, then the data will be sent, and 0 will be returned.*/
	if(sizeof(sending)>0) {
		i2c_start();
		send_i2c_byte((address<<1));
		i2c_sendz(sending, numSend);
		Nop();
		if (numRec<1) {reset_i2c_bus();return 0;}
		i2c_restart();
		int i;
		for(i=0;i<10000;i++) Nop();
	}
	else {
		i2c_start();
		if (numRec<1) {reset_i2c_bus();return 0;}
	}
	send_i2c_byte((address<<1)+1);
	i2c_readz(numRec, charArrayOfAppropriateSize, asciiOrHex);
	reset_i2c_bus();
	int i;
	for(i=0;i<10000;i++) Nop();
	return charArrayOfAppropriateSize;
}

/* This is exactly the same as i2c_SnR(), above, except we have a different approach to the 
 * reset of the i2c bus between the write and read operations. This approach works better with
 * the Argus spacecraft. Your mileage may vary.
 * int address: the 7-bit address of the slave you want to talk to. 
 *					(probably constructed like 0b0000000, etc)
 * char sending[]: an interger array containing the data you want to send. 
 *					(probably constructed from 0x00, etc bytes)
 * int numSend: the number of bytes to send
 * int numRec: the number of bytes to read
 * char charArrayOfAppropriateSize[]: array the function will use to return all the data it receives
 *		a) (char array), and should be at least large enough to contain [numRec] number of characters.
 *		b) (hex-formatted string), must be large enough to contain [3*(numRec)] number of characters.
 * int asciiOrHex: 	0 = returns the 0xXX characters
 *					1 = returns formatted characters as a string "XX " for each 
 * returns: charArrayOfAppropriateSize
 * 	Note: If num is 0, then the data will be sent, and 0 will be returned.
 */
char * i2c_SnR_v2(int address, char sending[], int numSend, int numRec, 
			char charArrayOfAppropriateSize[], int asciiOrHex) {
	if(sizeof(sending)>0) {
		i2c_start();
		send_i2c_byte((address<<1));
		i2c_sendz(sending, numSend);
		reset_i2c_bus();
		Nop();
		if (numRec<1) { return 0;}
		// i2c_restart();
		int i;
		for(i=0;i<1000;i++) Nop();
	}
	else {
		if (numRec<1) {reset_i2c_bus();return 0;}
	}
	i2c_start();
	send_i2c_byte((address<<1)+1);
	i2c_readz(numRec, charArrayOfAppropriateSize, asciiOrHex);
	reset_i2c_bus();
	int i;
	for(i=0;i<1000;i++) Nop();
	return charArrayOfAppropriateSize;
}

//--------------------------End I2C protocols.-----------------------------------------

/* Returns the ADC array 
 */
//unsigned int* i2c_getADC() {
//    return ADCData;
//}

//unsigned int i2c_getThisADCchannel(int channelID) {
//	return(ADCData[channelID]);
//}

void task_I2C(void) {
	//***BEGIN Fix I2C startup***
	//The PIC is looking for a "stop bit last seen on bus" to ensure that the bus is free.
	//The following takes care of the issue wherein the stop bit is not initially set. (see: silicon errata)
	// Start Sequence
	// Drive DATA Low
	PORTG &= ~BIT3; // Low
	Nop();
	// Drive CLK low
	PORTG &= ~BIT2; // Low
	Nop();
	// Stop Sequence
	// Drive CLK High
	PORTG |=  BIT2; // High
	Nop();
	// Drive DATA High
	PORTG |=  BIT3; // High
	//***END Fix I2C startup****

	i2c_init(I2CSPEED);

	//This turns off the halt bit in the RTC.
	char sending[2] = {0x0C, 0x3F};
	i2c_SnR_v2(0x68, sending, 2, 0, sending, 0); 
//	i2c_start();
//	send_i2c_byte((0x68<<1));
//	send_i2c_byte(0x0C);
//	send_i2c_byte(0x3F);
//	reset_i2c_bus();
//	int i = 0;
//	for(i=0;i<1000;i++) Nop();


	while(1) {
		OS_Delay(250);
		OS_Delay(250);
		OS_Delay(250);
		OS_Delay(100);
	}
} /* task_I2C() */


