#include "i2c.h"

/*--------------------------------
 * All functions in this file are modeled after the general
 * flow and organization found in C:\work\CDH\src\Argus_refactor_fred_donnie\task_I2C.c
 */

// i2c_init() helper function
// PIC has trouble with seeing a free bus on i2c initialization
// see C:\work\CDH\src\Argus_refactor_fred_donnie\task_I2C.c:line 380
void clear_i2cbus() {
	// Drive SDA (i2c data line) low
	PORTG &= ~BIT3;
	Nop();
	// Drive SCL (i2c clock line) low
	PORTG &= ~BIT2;
	Nop();
	// Drive SCL high
	PORTG |= BIT2;
	Nop();
	// Drive SDA high
	PORTG |= BIT3;
}

// BRG is the Baud Rate Generator value used to initialize the
// i2c module to a certain speed, see Argus file above
void i2c_init(int BRG) {
	// Microchip example code intialization
	CloseI2C1();
	ConfigIntI2C1(MI2C_INT_OFF);
	
	// first arg is an ORing of the hardware configuration #defines in the microchip
	// peripheral libraries, these mirror the options set in the Argus code
	// I2C_ON (#define I2C_ON 0x8000) sets the 16th bit of the I2C1CON register which enables the i2c interface
	// I2C_SLW_DIS disables slew rate control
	OpenI2C1(I2C_ON | I2C_SLW_DIS, BRG);
	MI2C1_Clear_Intr_Status_Bit;	// clear interrupt status of I2C1
}

void task_i2c (void) {
	
}
