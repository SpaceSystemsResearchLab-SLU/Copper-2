#ifndef __init_h
#define __init_h


// Function declarations
extern void init (void);

// MPLAB C30's lack of __enable_interrupt() is addressed here ...
#define __enable_interrupt()   do { __asm__ volatile("disi #0x0000"); } while (0)
#define __disable_interrupt()  do { __asm__ volatile("disi #0x3FFF"); } while (0)

// Target-specific symbols, etc. 
#define STR_CSK_TARGET "CubeSat Kit /PIC24 (PPM D1)"


#endif /* __init_h */
