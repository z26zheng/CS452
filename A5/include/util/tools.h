/*
 * tools.h
 */
#ifndef __TOOLS_H__
#define __TOOLS_H__

#include "bwio.h"
#include "global.h"

#define FOREVER for( ; ; )


#ifndef AST_LEVEL
#define AST_LEVEL -1
#endif

#define assertm( level, cond, fmt, ... ) \
  if( level <= AST_LEVEL && !( cond )) { \
    bwprintf( COM2, "assertm failed (%s:%d):\t"fmt"\n\r", __FILE__, \
        __LINE__, ## __VA_ARGS__ ); \
  } \
  if( AST_LEVEL >= 10 ) { \
    FOREVER; \
  } else { ; }

#define assert( level, cond ) \
  if( level <= AST_LEVEL && !( cond )) { \
    bwprintf(COM2,"Assert failed (%s:%d):\t\n\r\n\r",__FILE__, \
        __LINE__); \
  } \
  if( AST_LEVEL >= 10 ) { \
    FOREVER; \
  } else { ; }                                                  

#define compile_assert( cond, msg ) \
  typedef char compile_assert_##msg[( cond ) ? 1 : -1]

/* to enable debug print
 * call nmake with -d; ./nmake -d
 * Please do not change the default DEBUG value
 */
#ifndef DEBUG
#define DEBUG 0
#endif
#define debug( fmt, ... )                                     \
  do {                                                        \
    if( DEBUG ) {                                             \
      bwprintf(COM2, "DEBUG (%s:%d):\t"fmt"\n\r", __FILE__,   \
          __LINE__, ## __VA_ARGS__ );                         \
    }                                                         \
  } while( 0 )

#define min(a, b)              \
   ( {__typeof__ (a) _a = (a); \
      __typeof__ (b) _b = (b); \
      _a < _b ? _a : _b; } )


#endif
