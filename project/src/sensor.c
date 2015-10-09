#include "ts7200.h"
#include "sensor.h"
#include "io.h"
#include "timer.h"
#include "tools.h"

static char sensor_buf[10];
static int buf_idx_head;
static int buf_idx_tail;
static int size;
static char print_buf[10];
static int buf_head;
static int buf_tail;
static int psize;
static int sensor_future_time;

//1. check_byte: if the status is 1, send it's id to com2_buf
//2. need to know current id, can use ascii code to transfer 
//    int to A-Z 
//3. get_byte needs to wait 1 dsec ish until the next request, can
//    use the same way in train_control

//4. nice to have a buffer of resently triggered buffer,do it if have time

void sensor_init() {
  int i = 0;
  for( ; i < 10; ++i)
    sensor_buf[i] = '\0';
  buf_idx_head = buf_idx_tail = 0;
  size = 0;

  for(i = 0; i < 10; ++i)
    print_buf[i] = '\0';
  buf_head = buf_tail = 0;
  psize = 0;

  sensor_future_time = 0;
}

void push_2print_buf(char chidx, int didx) {
  assert(buf_head < 9);
  print_buf[buf_head] = chidx;
  ++buf_head;
  print_buf[buf_head] = (char)didx;
  ++buf_head;

  if(buf_head > 9)
    buf_head = 0;

  ++psize;
  if(psize > 5)
    psize = 5;
}

//called only when print_buf is full
void pop_2print_buf() {
  if (psize < 5)
    return;
  //bwprintf(COM2, "DEBUG: pop_2print_buf to pop \n\r");
  assert(buf_tail < 9);

  ++buf_tail;
  ++buf_tail;

  if(buf_tail > 9)
    buf_tail = 0;
}

void print_print_buf() {
  int i = 0;
  //bwprintf(COM2, "0:psize: %d, buf_head: %d, buf_tail: %d\n\r",psize, buf_head, buf_tail);
  for(; i < psize; ++i) {
    plprintf(COM2, "\033[s\033[K\033[%d;20H %c%d \033[u", 7+i, print_buf[buf_tail],
       (int)print_buf[buf_tail+1]);

    pop_2print_buf();
  }
}

// 0,1=>A, 2,3=>B, 4,5=>C 6,7=>D 8,9=>E
inline char sensor_get_cidx() {
  return (char)(buf_idx_tail/2 + 65); 
}

inline int sensor_get_didx(int i) {
  return (buf_idx_tail % 2) * 8 + (8 - i);
}

int sensor_is_ready() {
  //bwprintf(COM2, "DEBUG: sensor_is_ready\n\r");
  return (size < 10) && (timer_get_time() >= sensor_future_time);
}

void sensor_check_byte() {

  assert(buf_idx_head >= 0 && buf_idx_tail <= 9);
  assert(buf_idx_tail >= 0 && buf_idx_tail <= 9);

  if(size == 0) 
    return;

  char byte = sensor_buf[buf_idx_tail];
  int i = 0;
  for( ; i < 8; ++i) {
    int status = (byte >> i) & 1;
    char cidx = sensor_get_cidx();
    int  didx  = sensor_get_didx(i);
    if (status == 1) {
      //plprintf(COM2, "DEBUG: tail: %d, sensor %c%dis ", buf_idx_tail, cidx, didx);
      //TODO: sent info to com2_buf
      push_2print_buf(cidx, didx);
      print_print_buf(); 
    }
    else 
      plprintf(COM2, "");
  }
  if(buf_idx_tail == 9) 
    buf_idx_tail = 0;
  else
    ++buf_idx_tail;
  --size;

  assert(size >= 0);
  return;
}

void sensor_get_byte() {
  
  assert(buf_idx_head >= 0 && buf_idx_tail <= 9);
  assert(buf_idx_tail >= 0 && buf_idx_tail <= 9);

  if(size == 10)
    return;

  char byte = (char)plgetc(COM1);

  sensor_buf[buf_idx_head] = byte;

  if(buf_idx_head == 9)
    buf_idx_head = 0;
  else
    ++buf_idx_head;

  ++size;
  assert(size <= 10);

  sensor_check_byte();
  return;
}

void sensor_send_request() {
  plbufc(COM1, 133);
  sensor_future_time = timer_get_time() + 10;
}

