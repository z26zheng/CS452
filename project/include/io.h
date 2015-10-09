/*
 * io.h
 */

#ifndef __IO_H__
#define __IO_H__

typedef char *va_list;

#define __va_argsiz(t)	\
		(((sizeof(t) + sizeof(int) - 1) / sizeof(int)) * sizeof(int))

#define va_start(ap, pN) ((ap) = ((va_list) __builtin_next_arg(pN)))

#define va_end(ap)	((void)0)

#define va_arg(ap, t)	\
		 (((ap) = (ap) + __va_argsiz(t)), *((t*) (void*) ((ap) - __va_argsiz(t))))

#define COM1	0
#define COM2	1

#define ON	1
#define	OFF	0

#define COM_BUF_SIZE 1800 

//TODO
#define SCREEN_ERAS plprintf(COM2, "\033[2J") 
#define CURSOR_SAVE plprintf(COM2, "\033[s")
#define CURSOR_LOAD plprintf(COM2, "\033[u")
#define CURSOR_HOME plprintf(COM2, "\033[H")
#define LINE_ERAS plprintf(COM2, "\033[2K")
#define CURSOR_BACK plprintf(COM2, "\033[1D")
#define EOL_ERAS plprintf(COM2, "\033[K")

/* 
 * io without busy-wait 
 */

struct _com_buf_t {
  char char_arr[COM_BUF_SIZE]; // TODO: make size variable
  volatile int start;
  volatile int end;
}; 
typedef struct _com_buf_t com_buf_t;


void com_buf_init(com_buf_t * buf, int size);

void com_bufs_init();

int com_buf_push_back(com_buf_t * buf, char c);

char com_buf_pop_front(com_buf_t * buf);

char com_buf_pop_back(com_buf_t *buf);

int com_buf_size(int channel);

int buf_size(com_buf_t * buf);

int coms_init( );

int com_set_speed( int channel, int speed );

int com_set_fifo( int channel, int state);

char com_buf_peek_front(com_buf_t * buf, int pos);

int com_check_cts(int channel);

inline int plputc_check(int channel); 

int plputc(int channel, char c);

int plputbufc(int channel, char ch);

char pla2i( char ch, char **src, int base, int *nump );

void plui2a( unsigned int num, unsigned int base, char *bf );

void pli2a( int num, char *bf );

int pla2d( char ch );

void plprintf( int channel, char *fmt, ... );

int plgetc( int channel );

int plbufc(int channel, char c);

int plgetc_check( int channel );

void plbufw(int channel, int n, char fc, char *bf);

char plpopbufc(int channel);

char plpeekbufc(int channel, int pos);

void plbufprintf(int channel);

void plcombufinit(int channel);

char plerasefrontc(int channel);

/* 
 * bwio, from bwio.h/c, only used for testing purpose
 */

int bwsetfifo( int channel, int state );


int bwputc( int channel, char c );

int bwgetc( int channel );

int bwputx( int channel, char c );

int bwputstr( int channel, char *str );

int bwputr( int channel, unsigned int reg );

void bwputw( int channel, int n, char fc, char *bf );

void bwprintf( int channel, char *format, ... );

#endif
