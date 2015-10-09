 /*
  * timer.c
  */

#include "ts7200.h"
#include "timer.h"
#include "io.h"
#include "tools.h"

static unsigned int pre_tick = (unsigned int)TIMER_FREQ;
static unsigned int glb_time;

void timer_init(unsigned int * timer) {
  glb_time = 1;
  *timer = (unsigned int)TIMER_FREQ;
  *(timer + CRTL_OFFSET / 4) = (ENABLE_MASK | MODE_MASK);// | CLKSEL_MASK);
}

inline int timer_get(unsigned int * timer) {
  return *(timer+VAL_OFFSET / 4);
}

inline int timer_ready(unsigned int * timer) {
  unsigned int tick = timer_get(timer);
  return tick == 0 && tick < pre_tick;
}

void timer_update_buf() {
  glb_time++;
  unsigned int time, min, sec;
  time = glb_time;
  min  = time / 600UL;
  time -= min * 600UL;
  sec = time / 10UL;
  time -= sec * 10UL;
  
  plprintf(COM2, "\033[s\033[3;5HTimer: %d min, %d sec, %d dsec\n\r\033[u",  min, sec, time);
}

unsigned int timer_get_time() {
  return glb_time;
}
