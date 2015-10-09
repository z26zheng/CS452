
/*
 * io.c routines for diagnosis
 *
 * Specific to the TS-7200 ARM evaluation board
 *
 */

#include "ts7200.h"
#include "io.h"
#include "tools.h"

/*
 * The UARTs are initialized by RedBoot to the following state
 * 	115,200 bps
 * 	8 bits
 * 	no parity
 * 	fifos enabled
 */


//TODO: macro to do: ASSERT, DEBUG
//TODO: pass by pointer
static com_buf_t com1_buf;
static com_buf_t com2_buf;

void com_buf_init(com_buf_t * buf, int size) {
  //bwprintf(COM2, "DEBUG: COM_BUF_T_SIZE: %d \n\r", sizeof(com_buf_t));
  int i = 0;
  for( ; i < size; ++i)
  {
    (buf->char_arr)[i] = '\0';
  }

  buf->start = 0;
  buf->end = 0;
  return ;
}

//void plcombufinit(int channel) {
//  switch(channel) {
//  case COM1:
//    com_buf_init(&com1_buf, COM_BUF_SIZE);
//    break;
//  case COM2:
//    com_buf_init(&com2_buf, COM_BUF_SIZE);
//    break;
//  default:
//    break;
//  }
//}

int com_buf_push_back(com_buf_t * buf, char c) {
  //TODO: this is a hack, ignore 255 form system
  if((int)c == 255) return -1;
  if(buf->start >= COM_BUF_SIZE) {
    debug("DEBUG: com buf full, char to push: %d\n\r", c);
    //debug("DEBUG: buf end: %d\n\r", buf->end);
    // TODO properly deal with overflow and loop back
    return -1;
  }

  buf->char_arr[buf->start] = c;
  ++(buf->start);
  
  //bwprintf(COM2, "DEBUG com_buf_push_back: end: %d\n\r", buf->end);
  return 0;
}

char com_buf_peek_front(com_buf_t * buf, int pos) {
  int check_pos = buf->end + pos;
  if(check_pos >= buf->start) {
    return '\0';
  }
  else {
    char chout = (buf->char_arr)[check_pos];
    return chout;
  }
}

void com_buf_printf(com_buf_t * buf) {
  int check_pos = buf->end;
  while(check_pos < buf->start) {
    char ch = (buf->char_arr)[check_pos];
    bwprintf(COM2, "%c", ch);
    ++check_pos;
  }
}

void plbufprintf(int channel) {
  bwprintf(COM2, "DEBUG: print com%d_buf: \n\r", channel+1);
  switch( channel ) {
  case COM1:
    com_buf_printf(&com1_buf);
    break;
  case COM2:
    com_buf_printf(&com2_buf);
    break;
  default:
    break;
  }
  bwprintf(COM2, "\n\r");
}

char com_buf_pop_front(com_buf_t * buf) {
  //bwprintf(COM2, "DEBUG: com_buf_pop_front\n\r");
  if(buf->end == buf->start) {
    return '\0';
  }
  else {
    //bwprintf(COM2, "DEBUG: 2: %d, \n\r", buf->end);
    char chout = (buf->char_arr[buf->end]);
    ++(buf->end);
    if(buf->end == buf->start) 
      buf->start = buf->end = 0;
    //bwprintf(COM2, "DEBUG: 3\n\r");
    return chout;
  }
}

char com_buf_pop_back(com_buf_t *buf) {
  if(buf->end == buf->start) 
    return '\0';
  else {
    char chout = (buf->char_arr[buf->start]);
    --(buf->start);
    if(buf->end == buf->start)
      buf->start = buf->end = 0;
    return chout;
  }
}

int buf_size(com_buf_t * buf) {
  return buf->start - buf->end;
}

int com_buf_size(int channel) {
  switch(channel) {
    case COM1:
      return buf_size(&com1_buf);
      break;
    case COM2:
      return buf_size(&com2_buf);
      break;
    default:
      return -1;
      break;
  }
}
int com_set_fifo( int channel, int state ) {
	int *line, buf;
	switch( channel ) {
	case COM1:
		      line = (int *)( UART1_BASE + UART_LCRH_OFFSET );
	        break;
	case COM2:
	        line = (int *)( UART2_BASE + UART_LCRH_OFFSET );
	        break;
	default:
          bwprintf(COM2, "ERROR: com_set_fifo failed on COM%d\n\r", channel);
	        return -1;
	        break;
	}
	buf = *line;
	buf = state ? buf | FEN_MASK : buf & ~FEN_MASK;
	*line = buf;
	return 0;
}


int com_enable( int channel ) {
  int * uart_ctrl;
  switch( channel ) {
  case COM1:
    uart_ctrl = (int *)( UART1_BASE + UART_CTLR_OFFSET );
    break;
  case COM2:
    uart_ctrl = (int *)( UART2_BASE + UART_CTLR_OFFSET );
    break;
  default:
    bwprintf(COM2, "ERROR: com_enable failed on COM%d\n\r", channel);
    return -1;
    break;
  }   
  *uart_ctrl |= UARTEN_MASK;
  return 0;
}

void com1_setup_bits() {
  int * uart_ctrl = (int *)(UART1_BASE + UART_LCRH_OFFSET);
  *uart_ctrl |= STP2_MASK | WLEN_MASK;
}

int coms_init( ) {
  if( com_enable( COM1 ) != 0 || com_enable( COM2 ) != 0 ) 
    return -1;
  if( com_set_speed( COM1, 2400 ) != 0 ) 
    return -1;
  com1_setup_bits(); 
  if(com_set_fifo( COM1, OFF) != 0 || com_set_fifo(COM2, OFF) != 0)
    return -1;
  
  com_bufs_init( );

  //bwprintf(COM2, "DEBUG: coms_init done\n\r");
  return 0;
}

void com_bufs_init() {
  com_buf_init(&com1_buf, COM_BUF_SIZE);
  com_buf_init(&com2_buf, COM_BUF_SIZE);
}

int com_set_speed( int channel, int speed ) {
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
    //TODO: DOUBLE CHECK BAUD RATE
		*high = 0x0;
		*low = 0xbf;
		return 0;
	default:
    bwprintf(COM2, "ERROR: com_set_speed failed on COM%d\n\r", channel);
		return -1;
	}
}

inline int plputc_check(int channel) {
	int *flags;
	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	return !(*flags & TXFF_MASK);  
}

int com_check_cts(int channel) {
  int *flags;
  switch( channel ) {
    case COM1:
      flags = (int*)(UART1_BASE + UART_FLAG_OFFSET);
      break;
    case COM2:
      flags = (int*)(UART2_BASE + UART_FLAG_OFFSET);
      break;
    default:
      return -1;
      break;
  }
  return (*flags & CTS_MASK);
}

int plputc(int channel, char c) {
 	int *data;
	switch( channel ) {
	case COM1:
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}
  *data = c;
  return 0;
}

int plputbufc(int channel, char ch) {
  return plputc(channel, ch);
}

char plerasefrontc(int channel) {
  char chout;
  switch (channel) {
  case COM1:
    chout = com_buf_pop_back(&com1_buf);
    break;
  case COM2:
    chout = com_buf_pop_back(&com2_buf);
    break;
  default:
    break;
  }
  return chout;
}

//TODO: formalize getchar/putchar to buffer
char plpeekbufc(int channel, int pos) {
  char chout;
  switch(channel) {
  case COM1:
    chout = com_buf_peek_front(&com1_buf, pos);
    break;
  case COM2:
    chout = com_buf_peek_front(&com2_buf, pos);
    break;
  default:
    bwprintf(COM2, "ERROR: plpeekbufc failed \n\r");
    return -1; break;
  }
  return chout;
}

char plpopbufc(int channel) {
  char chout;
  switch( channel ) {
  case COM1:
    chout = com_buf_pop_front(&com1_buf);
    break;
  case COM2:
    chout = com_buf_pop_front(&com2_buf);
    break;
  default: 
    bwprintf(COM2, "ERROR: get_buf_char failed\n\r");
    return -1;
    break;
  }
  return chout;
}


int plbufc(int channel, char c) {
  switch(channel) {
    case COM1:
      //TODO
      com_buf_push_back(&com1_buf, c);
      break;
    case COM2:
      com_buf_push_back(&com2_buf, c);
      break;
    default:
      return -1;
      break;
  }
  return 0;
}

int plputstr( int channel, char *str ) {
	while( *str ) {
		if( plputc( channel, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void plputw( int channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) plputc( channel, fc );
	while( ( ch = *bf++ ) ) plputc( channel, ch );
}

void plbufw(int channel, int n, char fc, char *bf) {
  //bwprintf(COM2, "DEBUG: plbufw\n\r");
  char ch;
  char *p = bf;
  
	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) plbufc( channel, fc );
	while( ( ch = *bf++ ) ) plbufc( channel, ch );
}

int plgetc( int channel ) {
	int *data;
	char c;

	switch( channel ) {
	case COM1:
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	c = *data;
	return c;
}

int plgetc_check( int channel ) {
	int *flags;

	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	return ( *flags & RXFF_MASK ) ;
}

int pla2d( char ch ) {
	if( ch >= '0' && ch <= '9' ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}

char pla2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = pla2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void plui2a( unsigned int num, unsigned int base, char *bf ) {
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

void pli2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	plui2a( num, 10, bf );
}

void plformat ( int channel, char *fmt, va_list va ) {
  //bwprintf(COM2, "DEBUG: plformat: sta1: %d\n\r", com2_buf.start);
  //bwprintf(COM2, "DEBUG: plformat: end1: %d\n\r", com2_buf.end);
	char bf[12];
	char ch, lz;
	int w;
	
	while ( ( ch = *(fmt++) ) ) {
    //bwprintf(COM2, "DEBUG: plformat: end2: %d\n\r", com2_buf.end);
		if ( ch != '%' )
			plbufc( channel, ch );
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
				ch = pla2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				plbufc( channel, va_arg( va, char ) );
				break;
			case 's':
				plbufw( channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				plui2a( va_arg( va, unsigned int ), 10, bf );
				plbufw( channel, w, lz, bf );
				break;
			case 'd':
				pli2a( va_arg( va, int ), bf );
				plbufw( channel, w, lz, bf );
				break;
			case 'x':
				plui2a( va_arg( va, unsigned int ), 16, bf );
				plbufw( channel, w, lz, bf );
				break;
			case '%':
				plbufc( channel, ch );
				break;
			}
		}
	}
}

void plprintf( int channel, char *fmt, ... ) {
        va_list va;
        va_start(va,fmt);
        plformat( channel, fmt, va );
        va_end(va);
}




//bwio functions

int bwputc( int channel, char c ) {
	int *flags, *data;
	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	while( ( *flags & TXFF_MASK ) ) ;
	*data = c;
	return 0;
}

char c2x( char ch ) {
	if ( (ch <= 9) ) return '0' + ch;
	return 'a' + ch - 10;
}

int bwputx( int channel, char c ) {
	char chh, chl;

	chh = c2x( c / 16 );
	chl = c2x( c % 16 );
	bwputc( channel, chh );
	return bwputc( channel, chl );
}

int bwputr( int channel, unsigned int reg ) {
	int byte;
	char *ch = (char *) &reg;

	for( byte = 3; byte >= 0; byte-- ) bwputx( channel, ch[byte] );
	return bwputc( channel, ' ' );
}

int bwputstr( int channel, char *str ) {
	while( *str ) {
		if( bwputc( channel, *str ) < 0 ) return -1;
		str++;
	}
	return 0;
}

void bwputw( int channel, int n, char fc, char *bf ) {
	char ch;
	char *p = bf;

	while( *p++ && n > 0 ) n--;
	while( n-- > 0 ) bwputc( channel, fc );
	while( ( ch = *bf++ ) ) bwputc( channel, ch );
}

int bwgetc( int channel ) {
	int *flags, *data;
	char c;

	switch( channel ) {
	case COM1:
		flags = (int *)( UART1_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART1_BASE + UART_DATA_OFFSET );
		break;
	case COM2:
		flags = (int *)( UART2_BASE + UART_FLAG_OFFSET );
		data = (int *)( UART2_BASE + UART_DATA_OFFSET );
		break;
	default:
		return -1;
		break;
	}
	while ( !( *flags & RXFF_MASK ) ) ;
	c = *data;
	return c;
}

int bwa2d( char ch ) {
	if( ch >= '0' && ch <= '9' ) return ch - '0';
	if( ch >= 'a' && ch <= 'f' ) return ch - 'a' + 10;
	if( ch >= 'A' && ch <= 'F' ) return ch - 'A' + 10;
	return -1;
}

char bwa2i( char ch, char **src, int base, int *nump ) {
	int num, digit;
	char *p;

	p = *src; num = 0;
	while( ( digit = bwa2d( ch ) ) >= 0 ) {
		if ( digit > base ) break;
		num = num*base + digit;
		ch = *p++;
	}
	*src = p; *nump = num;
	return ch;
}

void bwui2a( unsigned int num, unsigned int base, char *bf ) {
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

void bwi2a( int num, char *bf ) {
	if( num < 0 ) {
		num = -num;
		*bf++ = '-';
	}
	bwui2a( num, 10, bf );
}

void bwformat ( int channel, char *fmt, va_list va ) {
	char bf[12];
	char ch, lz;
	int w;
	
	while ( ( ch = *(fmt++) ) ) {
		if ( ch != '%' )
			bwputc( channel, ch );
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
				ch = bwa2i( ch, &fmt, 10, &w );
				break;
			}
			switch( ch ) {
			case 0: return;
			case 'c':
				bwputc( channel, va_arg( va, char ) );
				break;
			case 's':
				bwputw( channel, w, 0, va_arg( va, char* ) );
				break;
			case 'u':
				bwui2a( va_arg( va, unsigned int ), 10, bf );
				bwputw( channel, w, lz, bf );
				break;
			case 'd':
				bwi2a( va_arg( va, int ), bf );
				bwputw( channel, w, lz, bf );
				break;
			case 'x':
				bwui2a( va_arg( va, unsigned int ), 16, bf );
				bwputw( channel, w, lz, bf );
				break;
			case '%':
				bwputc( channel, ch );
				break;
			}
		}
	}
}

void bwprintf( int channel, char *fmt, ... ) {
        va_list va;

        va_start(va,fmt);
        bwformat( channel, fmt, va );
        va_end(va);
}
