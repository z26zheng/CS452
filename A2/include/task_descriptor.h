#ifndef __TASK_DESCRIPTOR_H__
#define __TASK_DESCRIPTOR_H__

#include <global.h>

struct global_context_t;

typedef struct task_descriptor_t{
  unsigned int *sp; 
  unsigned int *orig_sp;
  unsigned int spsr;
  int retval;

  unsigned int id;
  unsigned int parent_id;
  unsigned int priority;//;: 4;

  enum { 
    TD_READY,
    TD_RECEIVE_BLOCKED,   // Sender's state
    TD_REPLY_BLOCKED,     // Sender's state
    TD_SEND_BLOCKED,      // Recver's state
    TD_ZOMBIE,            // Exited already
  } status;//: 8;

  struct task_descriptor_t * next_free;
  struct task_descriptor_t * next_in_priority;
  struct task_descriptor_t * first_sender_in_queue; // receiver information
  struct task_descriptor_t * last_sender_in_queue; // receiver information
  struct task_descriptor_t * next_sender; // sender information

} task_descriptor_t;

void tds_init( struct global_context_t *gc );

task_descriptor_t * tds_create_td( struct global_context_t *gc, unsigned int priority, int code );

void tds_remove_td( struct global_context_t *gc, task_descriptor_t * td );

#endif
