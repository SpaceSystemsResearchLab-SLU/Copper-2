#ifndef __main_h
#define __main_h


// Symbols, etc.
#define STR_APP_NAME          "Copper-2"
#define STR_VERSION           "Built on " __DATE__ " at " __TIME__ 
#define STR_WARNING           "WARNING: Use 'z' command with caution -- refer to project's abstract.txt"
#define STR_BAUD_RATE         "115200"
#define STR_1TAB              "\t"
#define STR_2TABS             "\t\t"
#define STR_CRLF              "\r\n"
#define OS_VERSION            1
  
// Macros for user-readable messages.
#define user_debug_msg(x)     csk_uart0_msg_ts(x)
#define data_debug_msg(x)     csk_uart1_msg_ts(x)

// Other macros.
#define LOOP_HERE()            do { ; } while (1)

// Target-specific symbols.
#define SYSTEM_TIMER_RELOAD    328
#define NOP                    _NOP()

// Function declarations.
extern void init_devices(void);

// Structure declarations  
typedef struct {
  unsigned int usb_present:1;
  unsigned int usb_connected:1;
  unsigned int mhx_connected:1;
  unsigned int MCLKOutEnabled:2;
  unsigned int exercise_io_running:1;
} csk_status_t;

// Global variable declarations.
extern csk_status_t csk_status;
extern unsigned char TAKEPICPI;
extern unsigned char TAKEPICQ;
extern unsigned char PION;
extern unsigned char PIOFF;


#endif /* __main_h */
