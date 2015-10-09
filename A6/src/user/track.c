#include "tools.h"
#include "io.h"
#include "syscall.h"
#include "clock_server.h"
#include "rail_server.h"
#include "rail_control.h"
#include "track.h"
#include "nameserver.h"

// TODO: Switch most printfs to putstrs, too lazy to count the number of chars

int track_go( ) {
  Putc( COM1, TRACK_START );
  return 0;
}

// Stop track, turn off power
int track_stop( ) {
  Putc( COM1, TRACK_STOP );
  return 0;
}

// Go train go!
short set_train_speed( train_state_t *train, short speed ) {
  if ( speed > 100 || speed < 0 ) {
    speed = 0;
  }

  int speed_normalized = speed;
  if( speed > 15 ) {
    speed_normalized -= 15;
  }
  int cur_speed_normalized = train->cur_speed;
  if( cur_speed_normalized > 15 ) {
    cur_speed_normalized -= 15;
  }

  char msg[2];

  if( train->state == INITIALIZING ) {
    msg[0] = speed_normalized;
    msg[1] = train->train_id;
    Putstr( COM1, msg, 2 );
    return speed;
  }
  
  if( speed_normalized == cur_speed_normalized ) {
    return speed;
  }

  if( speed_normalized >= 8 || speed_normalized == 0 ) {
    if( speed == 15 ) {
      train->is_forward ^= 1;
    } else {
      // accelerating?
      train->prev_speed = train->cur_speed;
      train->cur_speed = speed_normalized;
      if( cur_speed_normalized < speed_normalized && cur_speed_normalized != 0 ) {
        train->cur_speed += 15;
      }
      train->speed_change_time = Time( );
    }
  }

  msg[0] = speed_normalized;
  msg[1] = train->train_id;
  Putstr( COM1, msg, 2 );
  //Printf( COM2, "\0337\033[1A\033[2K\rTrain %d set to %d\0338", train, speed );
  return speed;
}

short set_train_speed_old( short train, short speed ) {
  if ( speed > 100 || speed < 0 ) {
    speed = 0;
  }

  char msg[2];
  msg[0] = speed;
  msg[1] = train;
  Putstr( COM1, msg, 2 );
  //Printf( COM2, "\0337\033[1A\033[2K\rTrain %d set to %d\0338", train, speed );
  return speed;
}

// Print switch statuses
int update_switch_output( short switch_num, char state ) {
  int switch_ind = switch_num - 1;
  if ( switch_num == 153 ) {
    switch_ind = 18;
  } else if ( switch_num == 154 ) {
    switch_ind = 19;
  } else if ( switch_num == 155 ) {
    switch_ind = 20;
  } else if ( switch_num == 156 ) {
    switch_ind = 21;
  } else if ( switch_num <= 0 || switch_num > 18 ){
    return 0;
  }

  int line_num = 5 + ( switch_ind / 5 );
  int col_num = 20 + ( ( switch_ind % 5 ) * 11 );
  Printf( COM2, "\0337\033[%d;%dH sw%d: %c\0338", line_num, col_num, switch_num, state);
  return 0;
}

// Kill solenoid
inline int kill_switch( ) {
  Putc( COM1, KILL_SWITCH );
  return 0;
}

int set_switch_old( short switch_num, short c_s ) {
  char c_s_c;
  char msg[2];
  msg[0] = c_s;
  msg[1] = switch_num;
  Putstr( COM1, msg, 2 );
  Delay( 20 );
  kill_switch( );
  switch( c_s ) {
  case STRAIGHT:
    c_s_c = 'S';
    break;
  case CURVED:
    c_s_c = 'C';
    break;
  default:
    c_s_c = '/';
    break;
  }
  update_switch_output( switch_num, c_s_c );
  return 0;
}

int set_switch( short switch_num, short c_s, int *switch_states ) {
  char c_s_c;
  char msg[2];
  int switch_idx;
  switch_idx = switch_num;
  if( switch_idx > 18 ) {
    switch_idx -= 134;
  }
  switch( c_s ) {
  case STRAIGHT:
    c_s_c = 'S';
    switch_states[switch_idx] = SW_STRAIGHT;
    break;
  case CURVED:
    c_s_c = 'C';
    switch_states[switch_idx] = SW_CURVED;
    break;
  default:
    c_s_c = '/';
    break;
  }
  msg[0] = c_s;
  msg[1] = switch_num;
  debugu( 1, "INSIDE SET_SWITCH switch_num: %d, state: %d", msg[1], msg[0] );
  Putstr( COM1, msg, 2 );
  Delay( 20 );
  kill_switch( );
  update_switch_output( switch_num, c_s_c );
  return 0;
}

void sensor_id_to_name( int sensor_id, char *rtn ) {
  int sensor_num = ( sensor_id % 16 ) + 1;
  int module_num = sensor_id / 16;
  rtn[0] = ( ( char ) ( module_num ) ) + 'A';
  rtn[1] = ( ( char ) ( sensor_num / 10 ) ) + '0';
  rtn[2] = ( ( char ) ( sensor_num % 10 ) ) + '0';
  return;
}

// Initialize track
int initialize_track( ) {
  int initialized = 0;
  int switch_ind = 0;
  // Make things look kinda pretty
  Printf( COM2, "\0337\033[2;0HINITIALIZING\033[3;0HRECENT SENSORS:\r\n---------------\r\n\0338" );
  Putstr( COM2, "\0337\033[3;20HSwitches:\033[4;20H---------\033[24;0H\0338", 43 );
  track_go( );
  while( !initialized ) {
    if ( switch_ind == 18 ) {
      set_switch_old( 153, STRAIGHT );
    } else if ( switch_ind == 19 ) {
      set_switch_old( 154, CURVED );
    } else if ( switch_ind == 20 ) {
      set_switch_old( 155, CURVED );
    } else if ( switch_ind == 21 ) {
      set_switch_old( 156, STRAIGHT );
      initialized = 1;
    } else if ( switch_ind == 0 || switch_ind == 1 || switch_ind == 3 ) {
      set_switch_old( switch_ind + 1, STRAIGHT );
    } else {
      set_switch_old( switch_ind + 1, CURVED );
    }
    ++switch_ind;
  }
  // And everything is good to go
  Putstr( COM2, "\033[2;0H\033[2K\033[24;0H>", 22 );
  return 0;
}

// TODO: Redo how we are representing sensor nums
void track_sensor_task( ) {
  char c;
  int module_num = 0;
  int sensor_num = 1;
  int i = 0;
  int j = 0;
  int recent_sensor;
  int most_recent_sensor = 0;
  int recent_sensors[NUM_RECENT_SENSORS];
  int recent_sensors_ind = 0;
  int num_sensors_triggered = 0;
  int recent_sensor_ind;
  char module_num_c;
  int recent_sensor_triggered = 0;
  char request_sensor = REQUEST_SENSOR;
  RegisterAs( (char *) SENSOR_PROCESSING_TASK );
  int courier_tid;
  char sensor_name[3];
  char sensor_hits[NUM_SENSOR_BYTES * 8];
  FOREVER {
    Putstr( COM1, &request_sensor, 1 );
    module_num = 0;
    recent_sensor_triggered = 0;
    for( i = 0; i < NUM_SENSOR_BYTES; ++i ) {
      c = (char) Getc( COM1 );
      sensor_num = 0;
      if ( module_num % 2 == 1 ) {
        sensor_num += 8;
      }
      for( j = 0; j < 8 ; ++j ) {
        // Yay for bitwise operations
        recent_sensor = ( ( module_num / 2 ) * 16 ) + sensor_num;
        if ( ( c >> ( 7 - j ) ) & 0x1 ) {
          if ( sensor_hits[recent_sensor] == 1 ) {
            ++sensor_num;
            continue;
          }
          recent_sensor_triggered = 1;
          recent_sensors[recent_sensors_ind] = recent_sensor;
          ++num_sensors_triggered;
          most_recent_sensor = recent_sensor;
          recent_sensors_ind = ( recent_sensors_ind + 1 ) % NUM_RECENT_SENSORS;
          sensor_hits[recent_sensor] = 1;
          Receive( &courier_tid, &module_num_c, 0 );
          Reply( courier_tid, (char *)&recent_sensor, sizeof(recent_sensor) );
        } else {
          sensor_hits[recent_sensor] = 0;
        }
        ++sensor_num;
      }
      ++module_num;
    }

    recent_sensor_ind = recent_sensors_ind - 1;
    for( j = 0 ; recent_sensor_triggered && j < NUM_RECENT_SENSORS && j < num_sensors_triggered; ++j ) {
      if ( recent_sensor_ind == -1 ) recent_sensor_ind = NUM_RECENT_SENSORS - 1;
      recent_sensor = recent_sensors[recent_sensor_ind];
      sensor_id_to_name( recent_sensor, sensor_name );
      Printf( COM2, "\0337\033[%d;0H     %c%c%c  \0338", j + 5, sensor_name[0], sensor_name[1], sensor_name[2] );
      --recent_sensor_ind;
    }
    //Delay( 1 );
  }
  Exit( );
}
