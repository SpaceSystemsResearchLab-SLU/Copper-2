/******************************************************************************
(C) Copyright Pumpkin, Inc. All Rights Reserved.

This file may be distributed under the terms of the License
Agreement provided with this software.

THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND,
INCLUDING THE WARRANTY OF DESIGN, MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE.

$Source: C:\\RCS\\D\\Pumpkin\\CubeSatKit\\Example\\all\\all\\CubeSatKit_Dev_Board\\Test\\Test1\\task_5sec.h,v $
$Author: aek $
$Revision: 3.0 $
$Date: 2009-10-11 22:38:16-07 $

******************************************************************************/
#ifndef __task_I2C_h
#define __task_I2C_h


// Function declarations
extern void task_I2C(void);

// Symbols, etc.
#define STR_TASK_I2C "task_I2C: " STR_1TAB
#define SCLK_HIGH csk_io33_high()
#define SCLK_LOW csk_io33_low()
#define MISO ((PORTE&BIT9)>>9)
#define CS1_HIGH csk_io11_high()
#define CS1_LOW csk_io11_low()
#define CS2_HIGH csk_io9_high()
#define CS2_LOW csk_io9_low()
#define SCLK_DELAY 200
#define NUM_ADC_CHANNELS 16
#define ADC_BATV 11

#endif /* __task_I2C_h */

