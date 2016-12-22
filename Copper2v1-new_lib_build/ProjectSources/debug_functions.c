#include <stdio.h>
#include <stdarg.h>
#include "main.h"
#include "debug_functions.h"
#include "csk_uart.h"
#include "salvo.h"

static char temp[200];

void _dprintf(const char* fmt, ...) {
  va_list arg;
  
  va_start(arg, fmt);
  vsprintf(temp, fmt, arg);
  va_end(arg);

  csk_uart2_puts(temp);
}

void dnprintf(unsigned int n, const unsigned char* buffer) {
    static int i = 0;
    
    for (i; i < n; i++) {
        csk_uart0_putchar(buffer[i]);
    }
}
