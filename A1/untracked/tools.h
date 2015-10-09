/*
 * tools.h
 */
#ifndef __TOOLS_H__
#define __TOOLS_H__

//#include "bwio.h"
#include <stdio.h>

#define FOREVER for( ; ; )


#define assert(cond, ...) \
  if(!(cond)) { \
    printf("Assert failed (%s: %d): %s\n\r\n\r",__FILE__,__LINE__, ## __VA_ARGS__);\
  }


/* to disable debug print, in your source file, do:
 * #undef DEBUG
 * #define DEBUG 0
 */
//#define DEBUG 1
//#define debug(fmt, ...) \
//  if(DEBUG == 1) { \
//    printf( fmt, __VA_ARGS__);\
//  }

//#define DEBUG 1;
//#define debug(fmt, ... ) \
//  if( DEBUG == 1 ) \
//    printf( "DEBUG (%s: %s: %d): ", __FILE__, __func__,__LINE__); \
//    printf(fmt,  ## __VA_ARGS__ ); \
//    printf("\n");
// 

//void debug(char * fmt, ...) {
//  va_list args;
//  printf( fmt, args);
//}
//
//__attribute__((gnu_inline)) 
//inline void __debug(char * fmt, ... ) {
//  //#ifdef DEBUG
//  //void * args = __builtin_apply_args();
//  //void * ret = __builtin_apply((void*)printf, args, 0);
//  va_list args;
//  va_start(args, fmt);
//  debug( fmt, args );
//  va_end(args);
//  //#endif
//
//}


//void debug( ... ) {
//  void *arg = __builtin_apply_args();
//  void *ret = __builtin_apply((void *)printf, arg, 100);
//}

#endif
