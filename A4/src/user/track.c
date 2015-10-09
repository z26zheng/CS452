#include "tools.h"
#include "io.h"
#include "syscall.h"
#include "clock_server.h"
#include "track.h"

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
short set_train_speed( short train, short speed ) {
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

  int line_num = 9 + ( switch_ind / 4 );
  int col_num = 20 + ( ( switch_ind % 4 ) * 11 );
  Printf( COM2, "\0337\033[%d;%dH sw%d: %c\0338", line_num, col_num, switch_num, state);
  return 0;
}

// Kill solenoid
int kill_switch( ) {
  Putc( COM1, KILL_SWITCH );
  return 0;
}

int set_switch( short switch_num, short c_s ) {
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


// Initialize track
int initialize_track( ) {
  int initialized = 0;
  int switch_ind = 0;
  // Make things look kinda pretty
  Printf( COM2, "\0337\033[2;0HINITIALIZING\033[5;0HRECENT SENSORS:\r\n---------------\r\n\0338" );
  Putstr( COM2, "\0337\033[5;20HSwitches:\033[6;20H---------\033[24;0H\0338", 43 );
  track_go( );
  while( !initialized ) {
    if ( switch_ind == 18 ) {
      set_switch( 153, STRAIGHT );
    } else if ( switch_ind == 19 ) {
      set_switch( 154, CURVED );
    } else if ( switch_ind == 20 ) {
      set_switch( 155, STRAIGHT );
    } else if ( switch_ind == 21 ) {
      set_switch( 156, CURVED );
      initialized = 1;
    } else {
      set_switch( switch_ind + 1, CURVED );
    }
    ++switch_ind;
    Delay( 10 );
  }
  // And everything is good to go
  Putstr( COM2, "\033[2;0H\033[2K\033[24;0H>", 22 );

  return 0;
}

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
  FOREVER {
    Putc( COM1, REQUEST_SENSOR );
    module_num = 0;
    recent_sensor_triggered = 0;
    for( i = 0; i < NUM_SENSOR_BYTES; ++i ) {
      c = (char) Getc( COM1 );
      sensor_num = 1;
      if ( c > 0 ) {
        if ( module_num % 2 == 1 ) {
          sensor_num += 8;
        }
        for( j = 0; j < 8 ; ++j ) {
          // Yay for bitwise operations
          if ( ( c >> ( 7 - j ) ) & 0x1 ) {
            recent_sensor = ( module_num * 100 ) + sensor_num;
            if ( recent_sensor == most_recent_sensor ) {
              ++sensor_num;
              continue;
            }
            recent_sensor_triggered = 1;
            recent_sensors[recent_sensors_ind] = recent_sensor;
            ++num_sensors_triggered;
            most_recent_sensor = recent_sensor;
            recent_sensors_ind = ( recent_sensors_ind + 1 ) % NUM_RECENT_SENSORS;
          }
          ++sensor_num;
        }
      }
      ++module_num;
    }

    recent_sensor_ind = recent_sensors_ind - 1;
    for( j = 0 ; recent_sensor_triggered && j < NUM_RECENT_SENSORS && j < num_sensors_triggered; ++j ) {
      if ( recent_sensor_ind == -1 ) recent_sensor_ind = NUM_RECENT_SENSORS - 1;
      recent_sensor = recent_sensors[recent_sensor_ind];
      sensor_num = recent_sensor % 100;
      module_num = recent_sensor / 100;
      module_num_c = ( ( char ) ( module_num / 2 ) ) + 'A';
      Printf( COM2, "\0337\033[%d;0H     %c%d  \0338", j + 7, module_num_c, sensor_num );
      --recent_sensor_ind;
    }
    Delay( 10 );
  }
  Exit( );
}
