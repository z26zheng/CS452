#ifndef __SENSOR_H__
#define __SENSOR_H__

#define SENSOR_BUF_SIZE 10


void sensor_init();

int sensor_is_ready();

inline char sensor_get_cidx();

inline int sensor_get_didx(int i);

void sensor_check_byte();

void sensor_get_byte();

void sensor_send_request();

void push_2print_buf(char chidx, int didx);

void pop_2print_buf();

void print_print_buf();

#endif
