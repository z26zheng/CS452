#ifndef __TRAIN_CONTROL_H__
#define __TRAIN_CONTROL_H__

#define TRAIN_TR 100
#define TRAIN_RV 200
#define TRACK_SW 300

#define TRAIN_REV 15
#define TRAIN_SHORT_WAIT 128
#define TRAIN_LONG_WAIT 129 
#define TRAIN_GO 96
#define TRACK_SWITCH_OFF 32
#define TRACK_STRAIGHT 33
#define TRACK_CURVE 34


void train_init();

int train_do_command(int command, int arg1, int arg2);

int train_parse_command();

void train_buf_push_back(char c);

char train_buf_pop_back();

char train_buf_pop_front();

int train_is_future();

void track_sw(int swnum, int swdir);

#endif
