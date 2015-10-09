#ifndef __RAIL_CONTROL_H__
#define __RAIL_CONTROL_H__

#include "global.h"

#define NUM_SPEEDS 30

#define TR_MAX 1

#define NONE      -1
#define TR_STOP   0
#define TR_SPD_1  1 
#define TR_SPD_2  2 
#define TR_SPD_3  3 
#define TR_SPD_4  4 
#define TR_SPD_5  5 
#define TR_SPD_6  6 
#define TR_SPD_7  7 
#define TR_SPD_8  8 
#define TR_SPD_9  9 
#define TR_SPD_10 10 
#define TR_SPD_11 11 
#define TR_SPD_12 12 
#define TR_SPD_13 13 
#define TR_SPD_14 14 

#define SW_STRAIGHT 0 
#define SW_CURVED   1 

#define SW_MAX  23
#define SW1     1 
#define SW2     2 
#define SW3     3
#define SW4     4
#define SW5     5
#define SW6     6
#define SW7     7
#define SW8     8
#define SW9     9
#define SW10   10
#define SW11   11
#define SW12   12
#define SW13   13
#define SW14   14
#define SW15   15
#define SW16   16
#define SW17   17
#define SW18   18
#define SW153  19 
#define SW154  20 
#define SW155  21 
#define SW156  22 

#define SW_TIME     100 // in ms

//FIXME: do dynamic mapping for a2
#define RUNNING_TRAIN_NUM 58
#define TRAIN_58 0

#define TR_STOP         0
#define TR_REVERSE      1
#define TR_CHANGE_SPEED 2
#define TR_INIT         3
#define TR_DEST         4
#define TR_ACCEL        5
#define TR_DECEL        6
#define TR_CH_DIR       7

#define NUM_FALLBACK 5

#define CONVERT_SWITCH_ID( _switch_num ) \
  if( _switch_num > 18 ) { \
    switch_id -= 134; \
  }

struct _track_node_;

typedef struct _rail_cmds_ {
  int train_id;
  int train_action;
  int train_delay;
  int train_speed;
  int train_dest;
  int train_mm_past_dest;
  int train_accel;
  int train_decel;
  
  int sw_count;
  int switch_id0;
  int switch_action0;
  int switch_delay0;
  int switch_id1;
  int switch_action1;
  int switch_delay1;
  int switch_id2;
  int switch_action2;
  int switch_delay2;
  int switch_id3;
  int switch_action3;
  int switch_delay3;

} rail_cmds_t;

typedef struct _speed_info_ {
  int speed; //TODO
  int high_low;
  int straight_vel;
  int curved_vel;
  int stopping_distance;
  int stopping_time;
  int safe_branch_distance;
  int accel_distance;
  int accel_time;
} speed_info_t;

typedef struct _train_state_ {
  struct _track_node_* track_graph;
  int * switch_states;

  enum {
    READY = 0,
    BUSY,
    STOPPING,
    ACCELERATING,
    REVERSING,
    INITIALIZING,
    NOT_INITIALIZED,
  } state;

  int rv_expected_sensors_idx;
  int rv_original_expected_sensor;
  int rv_expected_sensors[10];
  int rv_expected_branches[5];

  int train_id;
  int prev_sensor_id;
  int next_sensor_id;
  int dest_id;
  int front_len;
  int back_len;
  int mm_past_dest;
  int dist_to_next_sensor;
  int time_at_last_landmark;
  int time_since_last_pos_update;
  int vel_at_last_pos_update;
  int vel_at_last_landmark;
  int mm_past_landmark;
  int length;
  int pickup_len;
  int decel_rate;       // mm/s^2
  int accel_rate;
  int cur_speed;
  int prev_speed;
  int cur_vel;
  int speed_change_time;
  int is_forward;
  int fallback_sensors[NUM_FALLBACK];
  speed_info_t speeds[NUM_SPEEDS]; // Two different velocities per speed.
} train_state_t;

void init_rail_cmds( rail_cmds_t* cmds );

void get_next_command( train_state_t* train, rail_cmds_t* cmds );

/* note: this is not a complete min heap library, it does not support inserting
 * any number to the heap. This heap is modified to better suit the needs of dijkstra's
 * algorithm. On initialization, the heap's all elements are assigned to INT_MAX, since
 * the distance of dijkstra's algorithm only gets decreased, we bubble up the node 
 * whose distance is decreased. Thus, this heap does not need to support item insertion.
 */

typedef struct _min_heap_node_ {
  int id;       // must be the same as the id for each track vertex
  int dist;     // distance to the source vertex
} min_heap_node_t;

typedef struct _min_heap_ {
  int size;     // num of nodes in the heap
  int capacity; // max num of nodes 
  int * node_id2idx; // map node_id(track_vertex) to heap idx 
  min_heap_node_t * nodes; // heap representation by an array
} min_heap_t;

inline void init_node( min_heap_node_t * node, int id, int dist );

void init_min_heap( min_heap_t * min_heap, int src_id, int * node_id2idx, min_heap_node_t * nodes );

inline void swap_node( min_heap_node_t * node_a, min_heap_node_t * node_b );

void make_min_heap( min_heap_t * min_heap, int idx );

inline bool heap_empty( min_heap_t * min_heap );

inline bool heap_find( min_heap_t * min_heap, int id );

min_heap_node_t * extract_min( min_heap_t * min_heap );

inline void print_min_heap( min_heap_t * min_heap );

void dijkstra( struct _track_node_* track_graph, int src_id, int* all_path, int* all_dist, int* all_step );

void get_shortest_path( int* all_path, int* all_step, int src_id, int dst_id, int* dst_path );

void print_shortest_path( struct _track_node_ * track_graph, int* all_path, int* all_step, int src_id, int dst_id, int* dst_path );

void decrease_dist( min_heap_t * min_heap, int id, int dist );

void predict_next_sensor_static( train_state_t *train_state );

void predict_next_fallback_sensors_static( train_state_t *train );

void predict_next_sensor_dynamic( train_state_t *train_state );

#endif
