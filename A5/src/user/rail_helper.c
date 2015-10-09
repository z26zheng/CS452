#include "io.h"
#include "tools.h"
#include "track.h"
#include "clock_server.h"
#include "syscall.h"
#include "rail_helper.h"
#include "calibration.h"
#include "track_node.h"
#include "rail_control.h"

// time to switch branch * velocity of train + buffer + length of train
// Assume 250ms to switch switch
// returns distance in mm

//TODO: TONY, give the magic 100000 and 200000 names 
inline int safe_distance_to_branch( train_state_t *train ) {
  int vel = train->cur_vel;
  return ( vel * SW_TIME ) / 100000 + SWITCH_BUFFER;
}

inline int get_expected_train_idx( train_state_t* trains, int sensor_num ) {
  //FIXME TODO: handle expected sensor hit list for stopping
  /* loop thorugh the trains to find the expected train for this sensor hit */ 
  int cur_idx;
  int expected_train_idx = NONE;
  int initializing_train_idx = NONE;
  int fallback_idx = NONE;
  int i;
  for( cur_idx = 0; cur_idx < TR_MAX; ++cur_idx ) {
    //assertm( 1, trains[cur_idx].next_sensor_id != NONE || trains[cur_idx].state == INITIALIZING, "failure here indicates incorrect prediction functions" );
    if( trains[cur_idx].next_sensor_id == sensor_num ) {
      return cur_idx;
    }
    if( trains[cur_idx].state == INITIALIZING ) {
      initializing_train_idx = cur_idx;
    }
    for( i = 0; i < NUM_FALLBACK; ++i ) {
      if( trains[cur_idx].fallback_sensors[i] == -1 ) {
        break;
      }
      if( trains[cur_idx].fallback_sensors[i] == sensor_num ) {
        fallback_idx = cur_idx;
        break;
      }
    }
  }
  /* if can't find matching train, assign the initializing train */ 
  if( initializing_train_idx != NONE ) {
    return initializing_train_idx;
  }
  if( fallback_idx != NONE ) {
    return fallback_idx;
  }
  return expected_train_idx;
}
// returns in ms
int get_accel_time( int cur_speed, int prev_speed, train_state_t *train ) {
  int cur_vel = (train->speeds[cur_speed]).straight_vel;
  int prev_vel = (train->speeds[prev_speed]).straight_vel;
  int t;
  if( cur_speed > 15 ) {
    cur_speed -= 15;
  }
  if( prev_speed > 15 ) {
    prev_speed -= 15;
  }

  // slowing down
  if( cur_speed < prev_speed ) {
    t = ( ( prev_vel - cur_vel ) * 10 ) / train->decel_rate;
  } else { // speeding up
    t = ( ( cur_vel - prev_vel ) * 10 ) / train->accel_rate;
  }
  //Printf( COM2, "change from %d, to %d, accel/decel time: %d\r\n", prev_speed, cur_speed, t );
  if( t < 0 ){
    return 0;
  } else {
    return t;
  }
}

// returns in ms
// dist in mm
// vel in mm/100s
inline int time_to_dist_constant_vel( int dist, int vel ) {
  return (dist * 100000) / vel;
}

// TODO: A little iffy, fix this up
// NOTE: This isn't mm, it's (1/10)mm, need to maintain accuracy
int get_mm_past_last_landmark( train_state_t *train, int cur_time ) {
  int speed_change_time = train->speed_change_time * 10;
  int prev_sensor_time = train->time_at_last_landmark * 10;
  int prev_update_time = train->time_since_last_pos_update * 10;
  int speed_finish_time = speed_change_time + get_accel_time( train->cur_speed, train->prev_speed, train );
  int cur_vel = train->cur_vel;
  int prev_vel;
  int prev_time;
  int mm_so_far;
  // If we have passed over a sensor since last update
  if( prev_sensor_time > prev_update_time ) {
    prev_time = prev_sensor_time;
    mm_so_far = 0;
    prev_vel = train->vel_at_last_landmark;
  } else {
    prev_time = prev_update_time;
    mm_so_far = train->mm_past_landmark;
    prev_vel = train->vel_at_last_pos_update;
  }
  cur_time *= 10;
  if( speed_finish_time < prev_time ) {
    return mm_so_far + ( ( cur_time - prev_time ) * cur_vel ) / 10000;
  } else if( speed_finish_time < cur_time ) {
    return ( mm_so_far + ( ( cur_time - speed_finish_time ) * cur_vel ) / 10000 + 
           ( ( speed_finish_time - prev_time ) * prev_vel ) / 10000 + 
           ( ( speed_finish_time - prev_time ) * ( cur_vel - prev_vel ) ) / 20000 );
  } else {
    return ( mm_so_far + ( ( cur_time - prev_time ) * prev_vel ) / 10000 + 
           ( ( cur_time - prev_time ) * ( cur_vel - prev_vel ) ) / 20000 );
  }
}

int get_cur_velocity( train_state_t *train, int cur_time ) {
  int cur_vel;
  int speed_change_time = train->speed_change_time * 10;
  int speed_finish_time = speed_change_time + get_accel_time( train->cur_speed, train->prev_speed, train );
  cur_time *= 10;
  if( cur_time > speed_finish_time ) {
    return (train->speeds[train->cur_speed]).straight_vel;
  }
  int cur_speed_normalized = train->cur_speed;
  int prev_speed_normalized = train->prev_speed;
  if( train->cur_speed > 15 ) {
    cur_speed_normalized -= 15;
  }
  if( train->prev_speed > 15 ) {
    prev_speed_normalized -= 15;
  }

  int a = 0;
  // decelerating
  if( cur_speed_normalized < prev_speed_normalized ) {
    a = 0 - train->decel_rate;
  } else if ( cur_speed_normalized > prev_speed_normalized ) {
    a = train->accel_rate;
  }
  //Printf( COM2, "Some values, time_diff: %d, a: %d, prev_vel: %d\r\n", cur_time - speed_change_time, a, (train->speeds[train->prev_speed]).straight_vel );
  cur_vel = ( ( (cur_time - speed_change_time) * a ) / 10 ) + (train->speeds[train->prev_speed]).straight_vel;
  //Printf( COM2, "cur_vel: %d\r\n", cur_vel );
  if( cur_vel < 0 ) {
    return 0;
  }
  return cur_vel;
}

// node is index
// returns time in ms
// dist = distance from previous landmark it passed to the node
int time_to_node( train_state_t *train, int dist_to_node, track_node_t *track ) {
  int cur_time = Time( ) * 10;
  int speed_change_time = train->speed_change_time * 10;

  int accel_time = get_accel_time( train->cur_speed, train->prev_speed, train );
  int speed_finish_time = speed_change_time + accel_time;
  // Finished accel/decel before cur_time?
  int mm_past = get_mm_past_last_landmark( train, cur_time );
  dist_to_node -= mm_past;
  if( speed_finish_time < cur_time ) {
    return time_to_dist_constant_vel( dist_to_node, train->speeds[train->cur_speed].straight_vel );
  } else { // still changing velocity? fuck TODO: Figure this shit out
    int cur_velocity = ( (train->speeds[train->cur_speed].straight_vel + 
                          train->speeds[train->prev_speed].straight_vel) * 100 ) / 
                          ( ( speed_finish_time * 100 ) / cur_time );
    int dist_to_const_vel = ( ( speed_finish_time - cur_time ) * cur_velocity ) / 10000 + 
                            ( ( speed_finish_time - cur_time ) * ( train->speeds[train->cur_speed].straight_vel - cur_velocity ) ) / 20000;
    // Will finish acceleration after we hit the node
    if( dist_to_const_vel > dist_to_node ) {
      return ( 200000 * dist_to_node ) / (cur_velocity + train->speeds[train->cur_speed].straight_vel );
    } else { // will finish acceleration before we hit the node
      return speed_finish_time + time_to_dist_constant_vel( dist_to_node - dist_to_const_vel, train->speeds[train->cur_speed].straight_vel );
    }
  }
}

// returns stopping distance in mm;
int get_cur_stopping_distance( train_state_t *train ) {
  //if( train->cur_vel != (train->speeds[train->cur_speed]).straight_vel ) {
    int stopping_dist;
    stopping_dist = ( (train->cur_vel / 10) * (train->cur_vel / 10) ) / ( 200 * train->decel_rate );
    return stopping_dist;
  //}
  //return (train->speeds[train->cur_speed]).stopping_distance;
}

// stopping distance + buffer + length of train
// return distance in mm
inline int safe_distance_to_stop( train_state_t *train ) {
  return get_cur_stopping_distance( train ) + STOP_BUFFER + train->length;
}

// returns in ms
// TODO: Double check that this is correct (95% sure)
int get_cur_stopping_time( train_state_t *train ) {
  int cur_stopping_distance = get_cur_stopping_distance( train );
  return ( 200000 * cur_stopping_distance ) / (train->cur_vel);
}

int get_len_train_ahead( train_state_t *train ) {
  if( train->is_forward ) {
    return train->front_len;
  } else {
    return train->back_len;
  }
}

// returns in ms
int get_delay_time_to_stop( train_state_t *train, int dist ) {
  int cur_vel = train->cur_vel;
  int cur_stopping_dist = get_cur_stopping_distance( train );
  int cur_stopping_time = get_cur_stopping_time( train );
  if( cur_stopping_dist <= dist || train->cur_speed == 0 ) {
    return 0;
  }
  int cur_time = train->time_since_last_pos_update * 10;
  int speed_change_time = train->speed_change_time * 10;
  int accel_time = get_accel_time( train->cur_speed, train->prev_speed, train );
  int speed_finish_time = speed_change_time + accel_time;
  // if no longer accel/decel
  if( speed_finish_time <= cur_time ) {
    return ( ( 200000 * dist ) - ( cur_stopping_time * cur_vel ) ) / ( 2 * cur_vel );
  }

  int cur_speed_normalized = train->cur_speed;
  int prev_speed_normalized = train->prev_speed;
  int finish_vel = (train->speeds[train->cur_speed]).straight_vel;
  int finish_vel_stopping_dist = (train->speeds[train->cur_speed]).stopping_distance;
  int stopping_time_at_finish_vel = ( 200000 * finish_vel_stopping_dist ) / (finish_vel);
  int accel_finish_time_rel = speed_finish_time - cur_time;
  if( cur_speed_normalized > 15 ) {
    cur_speed_normalized -= 15;
  }
  if( prev_speed_normalized > 15 ) {
    prev_speed_normalized -= 15;
  }

  // decelerating?
  if( cur_speed_normalized < prev_speed_normalized ) {
    int dist_to_stop_so_far = dist;
    dist_to_stop_so_far -= ( ( ( ( cur_vel - finish_vel ) * accel_finish_time_rel ) / 2 ) + ( finish_vel * accel_finish_time_rel ) ) / 100000;
    assert( 1, dist_to_stop_so_far >= 0 );
    return ( ( 200000 *  dist_to_stop_so_far ) - ( stopping_time_at_finish_vel * finish_vel ) ) / ( 2 * finish_vel );
  }

  // accelerating?
  if( cur_speed_normalized > prev_speed_normalized ) {
    int stopping_dist_if_immediate;
    stopping_dist_if_immediate = (cur_vel * accel_finish_time_rel) + ( ( (finish_vel - cur_vel) * accel_finish_time_rel) / 2 ) + ( ( finish_vel * stopping_time_at_finish_vel ) / 2 );
    stopping_dist_if_immediate = stopping_dist_if_immediate / 100000;
    // need to find intersection
    //return ( ( 200000 * dist ) - ( cur_stopping_time * cur_vel ) ) / ( 2 * cur_vel );
    // TODO: Finish this off
    if( stopping_dist_if_immediate < dist ) {
      // TODO: Figure this out
      return ( ( 200000 * dist ) - ( cur_stopping_time * cur_vel ) ) / ( cur_vel );
    } else {
      int num = ( (200000 * dist) + (finish_vel * stopping_time_at_finish_vel) ) - ( (finish_vel * accel_finish_time_rel) + (cur_vel * accel_finish_time_rel) );
      return ( num / (2 * finish_vel) );
    }
  }

  return ( ( 200000 * dist ) - ( cur_stopping_time * cur_vel ) ) / ( 2 * cur_vel );

  // if accel
}

void init_58( train_state_t *train ) {

  /* Copypasta calibration output here */
  // Velocity in mm/100s, divide by 1000 to get cm/s
  // Stopping distance in mm
  // (2*d)/v0 d = stopping distance, v0 = velocity
  train->length = 210;
  train->pickup_len = 50;
  train->front_len = 25;
  train->back_len = 145;
  train->train_id = 58;
  train->prev_sensor_id = NONE;
  train->next_sensor_id = NONE;
  train->dest_id = NONE;
  train->dist_to_next_sensor = NONE;
  train->time_at_last_landmark = 0;
  train->mm_past_landmark = 0;
  train->cur_speed = 0;
  train->prev_speed = 0;
  train->speed_change_time = 0;
  train->is_forward = 1;
  train->state = NOT_INITIALIZED;
  train->decel_rate = 119;
  train->accel_rate = 90;
  (train->speeds[14]).straight_vel = 50579; // 14 HIGH
  (train->speeds[14]).curved_vel = 50586;
  (train->speeds[14]).stopping_distance = 2158;
  (train->speeds[13]).straight_vel = 50092; // 13 HIGH
  (train->speeds[13]).curved_vel = 50083;
  (train->speeds[13]).stopping_distance = 975;
  (train->speeds[12]).straight_vel = 48798; // 12 HIGH
  (train->speeds[12]).curved_vel = 48517;
  (train->speeds[12]).stopping_distance = 802;
  (train->speeds[11]).straight_vel = 41440; // 11 HIGH
  (train->speeds[11]).curved_vel = 41749;
  (train->speeds[11]).stopping_distance = 678;
  (train->speeds[10]).straight_vel = 33814; // 10 HIGH
  (train->speeds[10]).curved_vel = 34627;
  (train->speeds[10]).stopping_distance = 460;
  (train->speeds[9]).straight_vel = 28004; // 9 HIGH
  (train->speeds[9]).curved_vel = 27860;
  (train->speeds[9]).stopping_distance = 336;
  (train->speeds[8]).straight_vel = 22133; // 8 HIGH
  (train->speeds[8]).curved_vel = 22370;
  (train->speeds[8]).stopping_distance = 231;
  (train->speeds[23]).straight_vel = 18907; // 8 LOW
  (train->speeds[23]).curved_vel = 19127;
  (train->speeds[23]).stopping_distance = 176;
  (train->speeds[24]).straight_vel = 24765; // 9 LOW
  (train->speeds[24]).curved_vel = 24770;
  (train->speeds[24]).stopping_distance = 285;
  (train->speeds[25]).straight_vel = 31219; // 10 LOW
  (train->speeds[25]).curved_vel = 31030;
  (train->speeds[25]).stopping_distance = 412;
  (train->speeds[26]).straight_vel = 37021; // 11 LOW
  (train->speeds[26]).curved_vel = 37043;
  (train->speeds[26]).stopping_distance = 580;
  (train->speeds[27]).straight_vel = 45551; // 12 LOW
  (train->speeds[27]).curved_vel = 44540;
  (train->speeds[27]).stopping_distance = 664;
  (train->speeds[28]).straight_vel = 49030; // 13 LOW
  (train->speeds[28]).curved_vel = 49056;
  (train->speeds[28]).stopping_distance = 916;
  (train->speeds[29]).straight_vel = 51344; // 14 LOW
  (train->speeds[29]).curved_vel = 51635;
  (train->speeds[29]).stopping_distance = 2158;
}

void init_trains( train_state_t *trains, track_node_t* track_graph, int* switch_states ) {
  int i;
  int j;
  for( i = 0; i < TR_MAX; ++i ) {
    trains[i].track_graph = track_graph;
    trains[i].switch_states = switch_states;
    trains[i].prev_sensor_id= NONE;
    trains[i].next_sensor_id= NONE;
    trains[i].dest_id = NONE;
    trains[i].mm_past_landmark = 0;
    trains[i].cur_speed = 0;
    for( j = 0; j < NUM_SPEEDS; ++j ) {
      trains[i].speeds[j].speed = 0;
      trains[i].speeds[j].high_low = 0;
      trains[i].speeds[j].straight_vel = 0;
      trains[i].speeds[j].curved_vel = 0;
      trains[i].speeds[j].stopping_distance = 0;
      trains[i].speeds[j].stopping_time = 0;
      trains[i].speeds[j].accel_distance = 0;
      trains[i].speeds[j].accel_time = 0;
    }
  }

  init_58( &(trains[TRAIN_58]) );
}

void init_switches( int *switch_states ) {
  switch_states[SW1] = SW_CURVED;
  switch_states[SW2] = SW_CURVED;
  switch_states[SW3] = SW_CURVED;
  switch_states[SW4] = SW_CURVED;
  switch_states[SW5] = SW_CURVED;
  switch_states[SW6] = SW_CURVED;
  switch_states[SW7] = SW_CURVED;
  switch_states[SW8] = SW_CURVED;
  switch_states[SW9] = SW_CURVED;
  switch_states[SW10] = SW_CURVED;
  switch_states[SW11] = SW_CURVED;
  switch_states[SW12] = SW_CURVED;
  switch_states[SW13] = SW_CURVED;
  switch_states[SW14] = SW_CURVED;
  switch_states[SW15] = SW_CURVED;
  switch_states[SW16] = SW_CURVED;
  switch_states[SW17] = SW_CURVED;
  switch_states[SW18] = SW_CURVED;
  switch_states[SW153] = SW_STRAIGHT;
  switch_states[SW154] = SW_CURVED;
  switch_states[SW155] = SW_CURVED;
  switch_states[SW156] = SW_STRAIGHT;
}

void update_velocity( train_state_t *train, int cur_time, int prev_time, int dist ) {
  int speed_change_time = train->speed_change_time * 10;
  int speed_finish_time = speed_change_time + get_accel_time( train->cur_speed, train->prev_speed, train );
  // Only do this after train has hit steady velocity
  if( dist == 0 || prev_time * 10 <= speed_finish_time || train->prev_sensor_id == 41 ) {
    return;
  }
  int new_vel = ( dist * 10000 ) / ( cur_time - prev_time );
  (train->speeds[train->cur_speed]).straight_vel = 
    ( (80 * (train->speeds[train->cur_speed]).straight_vel ) + ( 20 * new_vel ) ) / 100;
  train->cur_vel = (train->speeds[train->cur_speed]).straight_vel;
  (train->speeds[train->cur_speed]).stopping_distance = get_cur_stopping_distance( train );
}

