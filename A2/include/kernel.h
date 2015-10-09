#ifndef __KERNEL_H__
#define __KERNEL_H__

#include <global.h>
#include <task_descriptor.h>
#include <scheduler.h>
#include <kernel_syscall.h>
#include <user_task.h>
#include <context_switch.h>
//#include <nameserver.h>

#define TD_SIZE 0x3000
#define TD_MAGIC 0x3b1a4ef5
#define USER_SPACE_SIZE (TD_MAX * TD_SIZE)
#define PRIORITY_MAX 16

// "Global" variables used by the kernel
typedef struct global_context_t {

  /* task descriptor */
  task_descriptor_t * cur_task;
  task_descriptor_t tds[TD_MAX];
  task_descriptor_t * td_first_free;
  task_descriptor_t * td_last_free;
  unsigned int td_magic;
  unsigned int td_free_num;
  unsigned int user_space[TD_MAX * TD_SIZE];

  /* scheduler */
  scheduler_t priorities[PRIORITY_MAX];
  unsigned int priority_bitmap;
  int de_bruijn_bit_positions[32];

} global_context_t;

void kernel_init( struct global_context_t *gc);

int activate( global_context_t *gc, task_descriptor_t *td );

void handle( global_context_t *gc, int request_type );


#endif
