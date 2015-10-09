#ifndef __SCREEN_H__
#define __SCREEN_H__

#include "global.h"

#define CMD_BUF_SIZE 80
#define MOVE_CMD 0
#define REV_CMD 1
#define SWITCH_CMD 2
#define GO_CMD 3
#define KILL_CMD 4
#define QUIT_CMD 99

void parse_user_input( );

#endif
