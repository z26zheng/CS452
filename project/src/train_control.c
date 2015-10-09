/*
 * train_control.c
 */

#include "ts7200.h"
#include "io.h"
#include "tools.h"
#include "train_control.h"
#include "timer.h"

static com_buf_t train_buf;
static int train_pre_speed;
static unsigned int future_time;


void print_sw(int swnum, int swdir) {
  char chdir;
  int col, row;
  if (swdir == TRACK_STRAIGHT)
    chdir = 'S';
  if (swdir == TRACK_CURVE)
    chdir = 'C';

  if (swnum > 18) 
    row = swnum - 134 + 6;
  else 
    row = swnum + 6;

  col = 10; 
  
  plprintf(COM2, "\033[s\033[%d;%dH %c \033[u", row, col, chdir);
  //bwprintf(COM2, "\033[s SW %d: %c \033[u", swnum, chdir);
  
}


void train_init() {
  com_buf_init(&train_buf, COM_BUF_SIZE);
  train_pre_speed = 0;
  future_time = 0;

  // set up bitches:
  track_sw(1, TRACK_CURVE);
  track_sw(2, TRACK_CURVE);
  track_sw(3, TRACK_CURVE);
  track_sw(4, TRACK_CURVE);
  track_sw(5, TRACK_CURVE);
  track_sw(6, TRACK_CURVE);
  track_sw(7, TRACK_CURVE);
  track_sw(8, TRACK_CURVE);
  track_sw(9, TRACK_CURVE);
  track_sw(10, TRACK_CURVE);
  track_sw(11, TRACK_CURVE);
  track_sw(12, TRACK_CURVE);
  track_sw(13, TRACK_CURVE);
  track_sw(14, TRACK_CURVE);
  track_sw(15, TRACK_CURVE);
  track_sw(16, TRACK_CURVE);
  track_sw(17, TRACK_CURVE);
  track_sw(18, TRACK_CURVE);
  track_sw(153, TRACK_CURVE);
  track_sw(154, TRACK_STRAIGHT);
  track_sw(155, TRACK_CURVE);
  track_sw(156, TRACK_STRAIGHT);
}

void train_buf_push_back(char c) {
  com_buf_push_back(&train_buf, c);
}

char train_buf_pop_front() {
  char chout = com_buf_pop_front(&train_buf);
  return chout;
}

char train_buf_pop_back() {
  char chout = com_buf_pop_back(&train_buf);
  return chout;
}

void train_speed(int trnum, int speed) {
  plbufc(COM1, 96);
  plbufc(COM1, TRAIN_SHORT_WAIT);
  plbufc(COM1, speed);
  plbufc(COM1, TRAIN_SHORT_WAIT);
  plbufc(COM1, trnum);
  plbufc(COM1, TRAIN_SHORT_WAIT);
}

void train_rv(int trnum) {
  train_speed(trnum, 0);
  future_time = timer_get_time() + 25;
  //bwprintf(COM2, "DEBUG: future_time: %d\n\r", future_time);
  plbufc(COM1, TRAIN_LONG_WAIT);
  train_speed(trnum, TRAIN_REV);  
  train_speed(trnum, train_pre_speed);

}

void track_sw(int swnum, int swdir) {
  print_sw(swnum, swdir);
  plbufc(COM1, swdir);
  plbufc(COM1, swnum);
  //plprintf(COM2, "DEBUG: track_sw future_time: %d\n\r", future_time);
  future_time = timer_get_time() + 2;
  plbufc(COM1, TRACK_SWITCH_OFF);

}


int train_is_future() {
  return (timer_get_time() >= future_time);
}

int train_do_command(int command, int arg1, int arg2) {
  //bwprintf(COM2, "DEBUG: train_do_command: command %d, arg1 %d, arg2 %d\n\r", command ,arg1, arg2);
  //TODO: replace bwputc with putting it onto buffer
  switch(command) {
  case TRAIN_TR:
  {
    train_speed(arg1, arg2);
    train_pre_speed = arg2;
    break;
  }
  case TRAIN_RV:
    train_rv(arg1);
    break;
  case TRACK_SW:
    track_sw(arg1, arg2);
    break;
  //TODO more cases
  default:
    return -1; break;
  }
  return 0;
}

int train_parse_command() {

  void get_input(char * ch1, char * ch2) {
    char chtmp = com_buf_peek_front(&train_buf, 0);
    // skip space
    while((int)chtmp == 32) {
      com_buf_pop_front(&train_buf);
      chtmp = com_buf_peek_front(&train_buf, 0);
    }
    *ch1 = com_buf_pop_front(&train_buf);
    *ch2 = com_buf_pop_front(&train_buf);
    //bwprintf(COM2, "DEBUG: get_input ch1, ch2: %c%c\n\r", *ch1, *ch2);
  }

  int is_int(char ch) {
    return (int)ch <= 57 && (int)ch >= 48;
  }

  int parse_input(char ch1, char ch2) {
    if(ch1 == 't' && ch2 == 'r') {
      //bwprintf(COM2, "DEBUG: parse_input: TR\n\r");
      return TRAIN_TR;
    }
    else if (ch1 == 'r' && ch2 == 'v') {
      //bwprintf(COM2, "DEBUG: parse_input: RV\n\r");
      return TRAIN_RV;
    }
    else if (ch1 == 's' && ch2 == 'w') {
      //bwprintf(COM2, "DEBUG: parse_input: SW\n\r");
      return TRACK_SW;
    }
    else if (ch1 == 'S') {
      return TRACK_STRAIGHT;
    }
    else if (ch1 == 'C') {
      return TRACK_CURVE;
    }
    //NOTE: add more commands here
    else if (is_int(ch1) != 0) {
      int num = (int)ch1 - 48;
      if(is_int(ch2) != 0) {
        num = num * 10 + (int)ch2 - 48;
      }
      //bwprintf(COM2, "DEBUG: parse_input: num %d\n\r", num);
      return num;
    }
    else {
      //bwprintf(COM2, "DEBUG: train_parse_command: unhandled case: ch1,ch2: %d %d\n\r", (int)ch1, (int)ch2);
      return -1;
    }
  }


  char *ch1;
  char *ch2;
  int command, arg1, arg2;
  command = arg1 = arg2 = -1;

  get_input(ch1, ch2);
  command = parse_input(*ch1, *ch2);

  get_input(ch1, ch2);
  arg1 = parse_input(*ch1, *ch2);

  get_input(ch1, ch2);
  arg2 = parse_input(*ch1, *ch2);

  train_do_command(command, arg1, arg2);

  return 0;
}
