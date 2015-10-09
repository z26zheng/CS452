#include <tools.h>
#include <kernel.h>


// TODO: integrate it with makefile
void cache_init( ) {
  asm volatile( 
    "MRC p15, 0, r0, c1, c0, 0\n\t" // read cp15 to r0
    "ORR r0, r0, #0x5\n\t"         //, MMU, D-cache
    "ORR r0, r0, #0x1000\n\t"         //, MMU, D-cache and I-cache
    "MCR p15, 0, r0, c1, c0, 0\n\t" // store the new value
  ); 
}

void kernel_init( global_context_t *gc) {
  gc->cur_task = NULL;
  gc->priority_bitmap = 0;

  
  init_kernelentry();
#ifdef CACHE
  bwprintf( COM2, "TURNING ON CACHE ...\n\r " );
  cache_init( );
#endif

  tds_init(gc);
  init_schedulers(gc);
}

int activate( global_context_t *gc, task_descriptor_t *td ) {
  register int request_type_reg asm("r0"); // absolute 
  int request_type;
  register unsigned int *new_sp_reg asm("r1"); // absolute 
  unsigned int *new_sp;
  register unsigned int new_spsr_reg asm("r2"); // absolute 
  unsigned int new_spsr;
  gc->cur_task = td;

  kernel_exit(td->retval, td->sp, td->spsr);

  asm volatile(
    "mov %0, r0\n\t"
    "mov %1, r1\n\t"
    "mov %2, r2\n\t"
  : "+r"(request_type_reg), "+r"(new_sp_reg), "+r"(new_spsr_reg)
  );

  request_type = request_type_reg;
  new_sp = new_sp_reg;
  td->sp = new_sp;
  new_spsr = new_spsr_reg;
  td->spsr = new_spsr;

  /* check td magic, failures indicate user stack is too small */
  assert(*(td->orig_sp - (TD_SIZE - 1)) == gc->td_magic);
  return request_type;
}

void handle( global_context_t *gc, int request_type ) {
  switch( request_type ) {
  case SYS_CREATE:
    handle_create( gc );
    break;
  case SYS_MY_TID:
    handle_my_tid( gc );
    break;
  case SYS_MY_PARENT_TID:
    handle_my_parent_tid( gc );
    break;
  case SYS_SEND:
    handle_send( gc );
    break;
  case SYS_RECEIVE:
    handle_receive( gc );
    break;
  case SYS_REPLY:
    handle_reply( gc );
    break;
  case SYS_PASS:
    handle_pass( gc );
    break;
  case SYS_EXIT:
    handle_exit( gc );
    break;
  default:
    break;
  }
}

int main(int argc, char *argv[]) {

  debug("TD_BIT: %d", TD_BIT);
  debug("TD_MAX: %d", TD_MAX);

  int request_type;
  bwputstr( COM2, "LOADING... WE ARE FASTER THAN WINDOWS :)\r\n" );
  global_context_t gc;
  kernel_init( &gc );

  task_descriptor_t *first_td = tds_create_td(&gc, 5, (int)&first_user_task);
  add_to_priority( &gc, first_td );

  bwputstr( COM2, "FINISHED INITIALIZATION. WOO!\r\n" );

  FOREVER {
    task_descriptor_t *scheduled_td = schedule( &gc );
    if ( scheduled_td == NULL ) {
      // HHEYYYYYYY, we exit
      break;    
    }

    request_type = activate( &gc, scheduled_td );
    handle( &gc, request_type );
  }

  bwprintf(COM2, "\n\rExit Main\n\r");

  return 0;
}



//TODO: delete test once we are assured the id calculation is coorect
//test for id generating
//void test() {
//  int bit = 7;
//  int tds = (1 << (bit+1)) - 1;
//  int id = 0;
//  int i = 0;
//  int j = 0;
//  int id_arr[tds];
//  // initialize id_arr
//  
//  for(id = 0; id < tds; ++id) {
//    id_arr[id] = id+1;
//  }
//
//  for(j = 0; j < 5; ++j) {
//
//    for(i = 0; i < tds; ++i) {
//      id_arr[i] = (id_arr[i] & tds) | (((id_arr[i] >> bit) + 1) << bit) ;
//      int gen = id_arr[i] >> bit;
//      int idx = id_arr[i] & tds;
//      debug("gen: %d, idx: %d", gen, idx);
//    }
//
//  }
//}

//TODO: delete memcpy test once we are assured that it works properly
//char * src = "123456";
//  char * dst = "999999"; 
//  dst[-1] = 'a';
//
//  int size = 7;
//  debug("size: %d\n", size);
//
//  kmemcpy(dst, src, 3);
//
//  int s = 0;
//  debug();
//  debug("dst[-1]: %c", dst[-1]);
//  for(; s < 7; ++s) 
//    debug("s: %d, dst[s]: %c", s, dst[s]);
  

