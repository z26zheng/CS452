 /*
  * a0.c
  */

#include "ts7200.h"
#include "timer.h"
#include "io.h"
#include "tools.h"
#include "train_control.h"
#include "sensor.h"


void wait(cycle) { while(cycle > 0) cycle = cycle - 1; }
static int quit;
// put keyboard input char to com1 buf and com2 buf
void filter_input(char chin) {
  int val = (int)chin;

  if (val == 113) {
    quit = 1;
  }

  if(32 <= val && val <= 127) {  // normal chars
    //TODO naming!! separate buffer from io.h
    train_buf_push_back(chin);
    plprintf(COM2, "%c", chin); 
  }

  //special chars:
  if(val == 13) { // return
    //train:
    train_parse_command();
    //COM2:
    plprintf(COM2, "\033[31;2H\033[K\033[31;2H prompt>: ");
  }
  if(val == 8) { //backspace
    CURSOR_BACK;
    plprintf(COM2, " ");
    CURSOR_BACK;
    train_buf_pop_back();
    plerasefrontc(COM2);
  }
}


void format_screen() {
  //SCREEN_ERAS;
  //CURSOR_HOME;

  plprintf(COM2, "\033[5;2H SWITCHES:      RECENT SENSORS: ");
 plprintf(COM2, "\033[6;1H -----------    -----------------");
  plprintf(COM2, "\033[7;2H SW 1: ");
  plprintf(COM2, "\033[8;2H SW 2: ");
  plprintf(COM2, "\033[9;2H SW 3: ");
  plprintf(COM2, "\033[10;2H SW 4: ");
  plprintf(COM2, "\033[11;2H SW 5: ");
  plprintf(COM2, "\033[12;2H SW 6: ");
  plprintf(COM2, "\033[13;2H SW 7: ");
  plprintf(COM2, "\033[14;2H SW 8: ");
  plprintf(COM2, "\033[15;2H SW 9: ");
  plprintf(COM2, "\033[16;2H SW 10: ");
  plprintf(COM2, "\033[17;2H SW 11: ");
  plprintf(COM2, "\033[18;2H SW 12: ");
  plprintf(COM2, "\033[19;2H SW 13: ");
  plprintf(COM2, "\033[20;2H SW 14: ");
  plprintf(COM2, "\033[21;2H SW 15: ");
  plprintf(COM2, "\033[22;2H SW 16: ");
  plprintf(COM2, "\033[23;2H SW 17: ");
  plprintf(COM2, "\033[24;2H SW 18: ");
  plprintf(COM2, "\033[25;2H SW 153: ");
  plprintf(COM2, "\033[26;2H SW 154: ");
  plprintf(COM2, "\033[27;2H SW 155: ");
  plprintf(COM2, "\033[28;2H SW 156: ");
  
  plprintf(COM2, "\033[31;2H prompt>: ");

  
  //bwprintf(COM2, "\033[H\n\r");

  //bwprintf(COM2, "\033[15;0H");
  
}
int main( int argc, char* argv[] ) {
  quit = 0;
  unsigned int * timer = (unsigned int*)TIMER3_BASE;

  if(coms_init() != 0) {
    debug("coms_init failed %d\n\r", 1);
  }

  plprintf(COM2, "\033[2J");
  format_screen();

  train_init();

  timer_init(timer);

  sensor_init();

  FOREVER {
    //int tick1, tick2, maxdiff;
    //tick1 = tick2 = maxdiff = 0;

    //tick1 = timer_get_tick(timer);

    if(quit == 1)
      break;

    if(timer_ready(timer)) {
      timer_update_buf();
    }
    
    // input from COM1: get char from sensor
    if (plgetc_check(COM1)){
      //bwprintf(COM2, "DEBUG: passed com1 check\n\r");
      sensor_get_byte();
      // check sensor info
      //sensor_check_byte();
    }

    // input from COM2: get char from keyboard then push to both buffers
    if (plgetc_check(COM2)) {
      char chin = plgetc(COM2);
      filter_input(chin);
    } 

    // screen display: from com2_buf to screen
    if (plputc_check(COM2) && com_buf_size(COM2) > 0) {
      // print availble stuff to screen
      char ch = plpopbufc(COM2);
      plputbufc(COM2, ch);
    }

    // sensor request: send request to read sensor data from COM1
    if (plputc_check(COM1) && sensor_is_ready()) {
      sensor_send_request();
    }

    // train_control: send char in com1_buf to com1 when ready
    if (plputc_check(COM1) && com_buf_size(COM1) > 0 && 
        com_check_cts(COM1) == 1) {//TODO cts should be 1
      char ch = plpeekbufc(COM1, 0);
      if((int)ch == TRAIN_SHORT_WAIT) {
        plpopbufc(COM1);
        //wait(100000);
      }
      else if((int)ch == TRAIN_LONG_WAIT && train_is_future() <= 0) {
        continue;
      }
      else {
        //bwprintf(COM2, "DEBUG: push to COM1: %d\n\r", ch);
        plputbufc(COM1, ch); 
        plpopbufc(COM1);
      }
    }
    //tick2 = timer_get_tick(timer);
    //
    //if(tick2 > tick1 && tick2-tick1 > maxdiff) {
    //  maxdiff = tick2 - tick1;
    //  bwprintf(COM2, "maxdiff: %d\n\r", maxdiff);
    //}
    
  }
  bwprintf(COM2, "finished main\n\r");
  return 0;
}

