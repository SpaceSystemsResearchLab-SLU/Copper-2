/* 
 * File:   debug_functions.h
 * Author: CDH
 *
 * Created on March 26, 2016, 2:09 PM
 */

#ifndef DEBUG_FUNCTIONS_H
#define	DEBUG_FUNCTIONS_H

#ifdef	__cplusplus
extern "C" {
#endif

  #define dprintf(fmt, ...)  _dprintf(fmt, ##__VA_ARGS__)
  
  void _dprintf(const char* fmt, ...);
  void dnprintf(unsigned int n, const unsigned char* buffer);

#ifdef	__cplusplus
}
#endif

#endif	/* DEBUG_FUNCTIONS_H */

