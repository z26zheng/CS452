#ifndef __TIMER_H__
#define __TIMER_H__

#define TIMER_FREQ 200 

void timer_init(unsigned int * timer);

inline int timer_get_tick(unsigned int * timer);

inline int timer_ready(unsigned int * timer);

void timer_update_buf();

unsigned int timer_get_time();

#endif
