#include "tools.h"
#include "ts7200.h"
#include "syscall.h"
#include "nameserver.h"
#include "io.h"
#include "ring_buf.h"

// Turn on UART, should only be used for COM1
int enable_uart( int channel ) {
  int *uart_base;
  switch( channel ){
  case COM1:
    uart_base = (int *) UART1_BASE;
    break;
  case COM2:
    uart_base = (int *) UART2_BASE;
    break;
  default:
    return -1;
    break;
  }
  int *uart_ctrl = uart_base + (UART_CTLR_OFFSET / 4);
  *uart_ctrl = *uart_ctrl | UARTEN_MASK;
  return 0;
}

// Enables the two stop bits
// Used to properly communicate with train controller
int enable_two_stop_bits( int channel ) {
  int *uart_base;
  switch( channel ){
  case COM1:
    uart_base = (int *) UART1_BASE;
    break;
  case COM2:
    uart_base = (int *) UART2_BASE;
    break;
  default:
    return -1;
    break;
  }
  int *uart_lcrh = uart_base + (UART_LCRH_OFFSET / 4);
  // also double check use 8-bit
  *uart_lcrh = *uart_lcrh | STP2_MASK | WLEN_MASK;
  return 0;
}

int setfifo( int channel, int state ) {
  int *line, buf;
  switch( channel ) {
  case COM1:
    line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
          break;
  case COM2:
          line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
          break;
  default:
          return -1;
          break;
  }
  buf = *line;
  buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
  *line = buf;
  return 0;
}

// Set communication speed
int setspeed( int channel, int speed ) {
  int *high, *low;
  switch( channel ) {
  case COM1:
    high = (int *)( UART1_BASE + UART_LCRM_OFFSET );
    low = (int *)( UART1_BASE + UART_LCRL_OFFSET );
          break;
  case COM2:
    high = (int *)( UART2_BASE + UART_LCRM_OFFSET );
    low = (int *)( UART2_BASE + UART_LCRL_OFFSET );
          break;
  default:
          return -1;
          break;
  }
  switch( speed ) {
  case 115200:
    *high = 0x0;
    *low = 0x3;
    return 0;
  case 2400:
    *high = 0x0;
    *low = 0xbf; //voodoo magic
    return 0;
  default:
    return -1;
  }
}

void wait_cycles( int cycles ) {
  while( cycles > 0 ) cycles--;
}

void com1_out_notifier( ) {
  int com1_out_server_tid = MyParentTid( );
  
  com_msg_t msg;
  msg.request_type = COM_OUT_READY;
  msg.msg_val = NULL;
  msg.msg_len = 0;
  char rpl;
  int errno;

  FOREVER {
    debug( 3, "Before await" );
    errno = AwaitEvent( COM1_OUT_IND );
    assertm( 1, errno >= 0, "ERROR: interrupt eventid is incorrect" );
    debug( 3, "Notifier finished awaiting" );

    errno = Send( com1_out_server_tid, (char*)&msg, sizeof( msg ), &rpl, 1 );
    assert( 1, errno >= 0 );
    *((int *)( UART1_BASE + UART_DATA_OFFSET )) = rpl;
  }
}

void com2_out_notifier( ) {
  int com2_out_server_tid = MyParentTid( );
  
  com_msg_t msg;
  int msg_size = sizeof(msg);
  msg.request_type = COM_OUT_READY;
  msg.msg_val = NULL;
  msg.msg_len = 0;
  com_msg_t rpl;
  int errno;
  int i = 0;

  FOREVER {
    errno = AwaitEvent( COM2_OUT_IND );
    assertm( 1, errno >= 0, "ERROR: interrupt eventid is incorrect" );

    errno = Send( com2_out_server_tid, (char*)&msg, msg_size, (char *)&rpl, msg_size );
    assert( 1, errno >= 0 );
    for( i = 0; i < rpl.msg_len; ++i ) {
      *((int *)( UART2_BASE + UART_DATA_OFFSET )) = (rpl.msg_val)[i];
    }
  }
}


void com1_in_notifier( ) {
  int com_in_server_tid = MyParentTid( );

  com_msg_t msg;
  msg.request_type = COM_IN_READY;
  char rpl;
  char c;
  int ret_val;

  FOREVER {
    ret_val = AwaitEvent( COM1_IN_IND );
    assertm( 1, ret_val >= 0, "ERROR: interrupt eventid is incorrect" );
    c = (char)ret_val;
    msg.msg_val = &c;
    msg.msg_len = 1;
    ret_val = Send( com_in_server_tid, (char *)&msg, sizeof( msg ), &rpl, 0 );
    assert( 1, ret_val >= 0 );
  }
}

void com2_in_notifier( ) {
  int com_in_server_tid = MyParentTid( );

  com_msg_t msg;
  msg.request_type = COM_IN_READY;
  char rpl;
  char c_buf[MAX_IN_SIZE];
  int c_buf_size = MAX_IN_SIZE;
  msg.msg_val = c_buf;
  FOREVER {
    msg.msg_len = AwaitEvent2( COM2_IN_IND, c_buf, c_buf_size );
    assertm( 1, msg.msg_len >= 0, "ERROR: interrupt eventid is incorrect" );
    int ret_val = Send( com_in_server_tid, (char *)&msg, sizeof( msg ), &rpl, 0 );
    assert( 1, ret_val >= 0 );
  }
}

void com1_out_server( ) {
  if( RegisterAs( (char *)COM1_OUT_SERVER ) == -1) {
    //bwputstr( COM2, "ERROR: failed to register COM1 OUTPUT server, aborting." );
    Exit( );
  }

  enable_uart( COM1 );
  int client_tid;
  com_msg_t msg;
  int notifier_ready = 0;
  int com1_out_cur_ind = 0;
  int com1_out_print_ind = 0;
  char com1_out_buf[OUT_BUF_SIZE];
  char c;
  char *client_msg;
  int i;
  int notifier_tid = Create( 2, &com1_out_notifier );
  int ret_val;
  debug( 3, "com1_out - notifier_tid: %d, server_tid: %d", notifier_tid, MyTid( ) );
  FOREVER {
    ret_val = Receive( &client_tid, (char *)&msg, sizeof( msg ));
    assert( 1, ret_val >= 0 );
    switch( msg.request_type ) {
    case COM_OUT_READY:
      notifier_ready = 1;
      break;
    case COM_OUT_PUT:
      client_msg = msg.msg_val;
      for( i = 0; i < msg.msg_len; ++i ) {
        com1_out_buf[com1_out_cur_ind] = client_msg[i];
        com1_out_cur_ind = ( com1_out_cur_ind + 1 ) % OUT_BUF_SIZE;
      }
      ret_val = Reply( client_tid, &c, 0 );
      assert( 1, ret_val >= 0 );
      break;
    default:
      break;
    }

    if( notifier_ready && com1_out_print_ind != com1_out_cur_ind ) {
      c = com1_out_buf[com1_out_print_ind];
      com1_out_print_ind = ( com1_out_print_ind + 1 ) % OUT_BUF_SIZE;
      notifier_ready = 0;
      ret_val = Reply( notifier_tid, &c, 1 );
      assert( 1, ret_val >= 0 );
      //Printf( COM2, "sent: %d\r\n", c );
    }
  }
  Exit( );
}

void com2_out_server( ) {
  if( RegisterAs( (char *)COM2_OUT_SERVER ) == -1) {
    Exit( );
  }

  int client_tid;
  com_msg_t msg;
  int msg_size = sizeof(msg);
  char c_buf[MAX_OUT_SIZE];
  com_msg_t rpl;
  rpl.request_type = COM_OUT_REPLY;
  rpl.msg_val = c_buf;
  int notifier_ready = 0;
  int com2_out_cur_ind = 0;
  int com2_out_print_ind = 0;
  char com2_out_buf[OUT_BUF_SIZE];
  int i;
  int notifier_tid = Create( 2, &com2_out_notifier );
  int ret_val;
  char c_rpl = 'a';
  debug( 3, "com2_out - notifier_tid: %d, server_tid: %d", notifier_tid, MyTid( ) );
  FOREVER {
    ret_val = Receive( &client_tid, (char *)&msg, msg_size );
    assert( 1, ret_val >= 0 );
    switch( msg.request_type ) {
    case COM_OUT_READY:
      notifier_ready = 1;
      break;
    case COM_OUT_PUT:
      for( i = 0; i < msg.msg_len; ++i ) {
        com2_out_buf[com2_out_cur_ind] = msg.msg_val[i];
        com2_out_cur_ind = ( com2_out_cur_ind + 1 ) % OUT_BUF_SIZE;
      }
      ret_val = Reply( client_tid, &c_rpl, 0 );
      assert( 1, ret_val >= 0 );
      break;
    default:
      break;
    }
    if( notifier_ready && com2_out_print_ind != com2_out_cur_ind ) {
      for( i = 0; com2_out_print_ind != com2_out_cur_ind && i < MAX_OUT_SIZE; ++i ) {
        rpl.msg_val[i] = com2_out_buf[com2_out_print_ind];
        com2_out_print_ind = ( com2_out_print_ind + 1 ) % OUT_BUF_SIZE;
      }
      notifier_ready = 0;
      rpl.msg_len = i;
      ret_val = Reply( notifier_tid, (char *)&rpl, msg_size );
      assert( 1, ret_val >= 0 );
    }
  }
  Exit( );
}


void com1_in_server( ) {
  if( RegisterAs( (char *)COM1_IN_SERVER ) == -1) {
    //bwputstr( COM2, "ERROR: failed to register COM1 INPUT server, aborting." );
    Exit( );
  }

  int client_tid;
  com_msg_t msg;
  char c_rpl = 'a';
  int com1_in_cur_ind = 0;
  int com1_in_print_ind = 0;
  char com1_in_buf[OUT_BUF_SIZE];
  int notifier_tid = Create( 1, &com1_in_notifier );
  int ret_val;
  int client_ready_tid = 0;
  debug( 3, "com1_in - notifier_tid: %d, server_tid: %d", notifier_tid, MyTid( ) );
  FOREVER {
    ret_val = Receive( &client_tid, (char *)&msg, sizeof( msg ));
    assert( 1, ret_val >= 0 );
    switch( msg.request_type ) {
    case COM_IN_READY:
      ret_val = Reply( client_tid, &c_rpl, 0 );
      assert( 1, ret_val >= 0 );
      // Add char to buffer
      com1_in_buf[com1_in_cur_ind] = msg.msg_val[0];
      debug( 3, "received char from uart: char:%x\r\n", com1_in_buf[com1_in_cur_ind] );
      com1_in_cur_ind = ( com1_in_cur_ind + 1 ) % OUT_BUF_SIZE;
      break;
    case COM_IN_GET:
      client_ready_tid = client_tid;
      break;
    default:
      break;
    }

    if( com1_in_cur_ind != com1_in_print_ind && client_ready_tid ) {
      c_rpl = com1_in_buf[com1_in_print_ind];
      com1_in_print_ind = ( com1_in_print_ind + 1 ) % OUT_BUF_SIZE;
      ret_val = Reply( client_ready_tid, &c_rpl, 1 );
      assert( 1, ret_val >= 0 );
      client_ready_tid = 0;
    }
  }
  Exit( );
}

void com2_in_server( ) {
  if( RegisterAs( (char *)COM2_IN_SERVER ) == -1) {
    //bwputstr( COM2, "ERROR: failed to register COM1 INPUT server, aborting." );
    Exit( );
  }

  int client_tid;
  com_msg_t msg;
  //TODO
  char c_rpl = 'a';
  int msg_size = sizeof(msg);
  int com2_in_cur_ind = 0;
  int com2_in_print_ind = 0;
  char com2_in_buf[OUT_BUF_SIZE];
  int notifier_tid = Create( 1, &com2_in_notifier );
  int client_ready_tid = 0;
  int c_buf_size;
  int i;
  int ret_val;
  debug( 3, "com2_in - notifier_tid: %d, server_tid: %d", notifier_tid, MyTid( ) );
  FOREVER {
    ret_val = Receive( &client_tid, (char *)&msg, msg_size );
    assert( 1, ret_val >= 0 );
    switch( msg.request_type ) {
    case COM_IN_READY:
      ret_val = Reply( client_tid, &c_rpl, 0 );
      assert( 1, ret_val >= 0 );
      // Add char to buffer
      c_buf_size = msg.msg_len;
      for( i = 0; i < c_buf_size; ++i ) {
        com2_in_buf[com2_in_cur_ind] = msg.msg_val[i];
        debug( 3, "received char from uart: char:%x\r\n", com2_in_buf[com2_in_cur_ind] );
        com2_in_cur_ind = ( com2_in_cur_ind + 1 ) % OUT_BUF_SIZE;
      }
      break;
    case COM_IN_GET:
      client_ready_tid = client_tid;
      break;
    default:
      break;
    }

    if( com2_in_cur_ind != com2_in_print_ind && client_ready_tid ) {
      c_rpl = com2_in_buf[com2_in_print_ind];
      com2_in_print_ind = ( com2_in_print_ind + 1 ) % OUT_BUF_SIZE;
      ret_val = Reply( client_ready_tid, &c_rpl, 1 );
      assert( 1, ret_val >= 0 );
      client_ready_tid = 0;
    }
  }
  Exit( );
}

int Putc( int channel, char ch ) {
  return Putstr( channel, &ch, 1 );
}

int Putstr( int channel, char *msg, int msg_len ) {
  com_msg_t com_msg;
  int com_msg_len = sizeof(com_msg);
  char rtn;
  com_msg.request_type = COM_OUT_PUT;
  com_msg.msg_val = msg;
  com_msg.msg_len = msg_len;
  int com_out_server_tid;

  int ret_val;
  switch( channel ) {
  case COM1: {
    com_out_server_tid = TD_MAX + 7;
    ret_val = Send( com_out_server_tid, (char *)&com_msg, com_msg_len, &rtn, 0 );
    assert( 1, ret_val >= 0 );
    break;
  }
  case COM2: {
    com_out_server_tid = TD_MAX + 3;
    ret_val = Send( com_out_server_tid, (char *)&com_msg, com_msg_len, &rtn, 0 );
    assert( 1, ret_val >= 0 );
    break;
  }
  default:
    return -1;
    break;
  }

  return 0;
}

int Getc( int channel ) {
  int ret_val;
  switch( channel ) {
  case COM1:
  {
    com_msg_t com_msg;
    char rtn;
    com_msg.request_type = COM_IN_GET;
    com_msg.msg_val = NULL;
    com_msg.msg_len = 0;
    int com_in_server_tid = TD_MAX + 9;
    ret_val = Send( com_in_server_tid, (char *)&com_msg, sizeof( com_msg ), &rtn, 1 );
    assert( 1, ret_val >= 0 );
    return (int) rtn;
    break;
  }
  case COM2: {
    com_msg_t com_msg;
    char rtn;
    com_msg.request_type = COM_IN_GET;
    com_msg.msg_val = NULL;
    com_msg.msg_len = 0;
    int com_in_server_tid = TD_MAX + 5;
    ret_val = Send( com_in_server_tid, (char *)&com_msg, sizeof( com_msg ), &rtn, 1 );
    assert( 1, ret_val >= 0 );
    return (int) rtn;
    break;
  }
  default:
    return -1;
    break;
  }
  return 0;
}

int pputc( char c, char *buf, int *ind ) {
  if( *ind >= PRINTF_MAX_SIZE ) {
    return -1;
  }
  buf[(*ind)] = c;
  ++(*ind);
  return 0;
}

char pc2x( char ch ) {
  if ( (ch <= 9) ) return '0' + ch;
  return 'a' + ch - 10;
}

int pputx( char c, char *outbuf, int *ind ) {
  char chh, chl;

  chh = pc2x( c / 16 );
  chl = pc2x( c % 16 );
  pputc( chh, outbuf, ind );
  return pputc( chl, outbuf, ind );
}

int pputr( int channel, unsigned int reg, char *outbuf, int *ind ) {
  int byte;
  char *ch = (char *) &reg;

  for( byte = 3; byte >= 0; byte-- ) pputx( ch[byte], outbuf, ind );
  char c = ' ';
  return pputc( c, outbuf, ind );
}

void pputw( int channel, int n, char fc, char *bf, char *outbuf, int *ind ) {
  char ch;
  char *p = bf;

  while( *p++ && n > 0 ) n--;
  while( n-- > 0 ) pputc( fc, outbuf, ind );
  while( ( ch = *bf++ ) ) pputc( ch, outbuf, ind );
}

int pa2d( char ch ) {
  if( ch >= '0' && ch <= '9' ) return ch - '0';
  if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
  if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
  return -1;
}

char pa2i( char ch, char **src, int base, int *nump ) {
  int num, digit;
  char *p;

  p = *src; num = 0;
  while( ( digit = pa2d( ch ) ) >= 0 ) {
    if ( digit > base ) break;
    num = num*base + digit;
    ch = *p++;
  }
  *src = p; *nump = num;
  return ch;
}

void pui2a( unsigned int num, unsigned int base, char *bf ) {
  int n = 0;
  int dgt;
  unsigned int d = 1;

  while( (num / d) >= base ) d *= base;
  while( d != 0 ) {
    dgt = num / d;
    num %= d;
    d /= base;
    if( n || dgt > 0 || d == 0 ) {
      *bf++ = dgt + ( dgt < 10 ? '0' : 'a' - 10 );
      ++n;
    }
  }
  *bf = 0;
}

void pi2a( int num, char *bf ) {
  if( num < 0 ) {
    num = -num;
    *bf++ = '-';
  }
  pui2a( num, 10, bf );
}

/*int pputstr( int channel, char *str ) {
  while( *str ) {
    if( pputc( channel, *str ) < 0 ) return -1;
    str++;
  }
  return 0;
}*/

void pformat ( int channel, int *buf_size, char *outbuf, char *fmt, va_list va ) {
  char bf[12];
  char ch, lz;
  int w;
  int ind = 0;

  while ( ( ch = *(fmt++) ) ) {
    if ( ch != '%' ) {
      pputc( ch, outbuf, &ind );
    }
    else {
      lz = 0; w = 0;
      ch = *(fmt++);
      switch ( ch ) {
      case '0':
        lz = 1; ch = *(fmt++);
        break;
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        ch = pa2i( ch, &fmt, 10, &w );
        break;
      }
      switch( ch ) {
      case 0: return;
      case 'c':
        pputc( va_arg( va, char ), outbuf, &ind );
        break;
      case 's':
        pputw( channel, w, 0, va_arg( va, char* ), outbuf, &ind );
        break;
      case 'u':
        pui2a( va_arg( va, unsigned int ), 10, bf );
        pputw( channel, w, lz, bf, outbuf, &ind );
        break;
      case 'd':
        pi2a( va_arg( va, int ), bf );
        pputw( channel, w, lz, bf, outbuf, &ind );
        break;
      case 'x':
        pui2a( va_arg( va, unsigned int ), 16, bf );
        pputw( channel, w, lz, bf, outbuf, &ind );
        break;
      case '%':
        pputc( ch, outbuf, &ind );
        break;
      }
    }
  }
  *buf_size = ind;
  return;
}

void Printf( int channel, char *fmt, ... ) {
  va_list va;
  va_start(va,fmt);
  int len = 0;
  char outbuf[PRINTF_MAX_SIZE];
  pformat( channel, &len, outbuf, fmt, va );
  Putstr( channel, outbuf, len );
  va_end(va);
}

