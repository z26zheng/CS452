

typedef struct ring_buf {
  char * addr ;// TODO
  int max_num_of_element;
  int num_of_free;
  int size_of_element;
  int head;
  int tail;

} ring_buf_t ;

#define NULL (void *)

ring_buf_t * create_ring_buf( int size_of_element, int num_of_element ) {
  if( size_of_element <= 0 || num_of_element <= 0 ) {
    return NULL;
  }

  ring_buf_t * new_ring_buf = malloc( sizeof( ring_buf_t ));

  if( !new_ring_buf )
    return NULL;

  new_ring_buf->max_num_of_element = num_of_element;
  new_ring_buf->size_of_element = size_of_element;
  new_ring_buf->head = 0;
  new_ring_buf->tail = 0;
  new_ring_buf->num_of_free = num_of_element;
  new_ring_buf->addr = malloc( size_of_element * num_of_element );
  
  if( !(new_ring_buf->addr) ) {
    free (new_ring_buf);
    return NULL;
  }

  return new_ring_buf; 

}


int insert( ring_buf_t * ring_buf, char * element ) {
  if( !ring_buf || !element )
    return INVALID_INPUT;

  if( ring_buf->num_of_free == 0 ) {
    return BUF_FULL;
  }

  char * start_addr = ring_buf->addr[ring_buf->head * size_of_element];
  
  memcpy( start_addr, element, size_of_element );

  ring_buf->head = ( ring_buf->head + 1 ) % max_num_of_element;

  --(ring_buf->num_of_free);

  return 0;
}
