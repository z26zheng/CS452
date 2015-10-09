#include <stdio.h>
#include <pthread.h>

#ifndef SRC_STATIC_LIST_H_
#define SRC_STATIC_LIST_H_

// TODO: Will making this lock free improve performance?
template<size_t SIZE, typename T>
class StaticList {
public:
  StaticList() {
    pthread_rwlockattr_t lock_attr;
    pthread_rwlockattr_init(&lock_attr);
    pthread_rwlockattr_setpshared(&lock_attr, PTHREAD_PROCESS_SHARED);
    pthread_rwlock_init(&lock, &lock_attr);

    reset();
  }

  void reset() {
    free_head = 0;
    head = NULL_INDEX;
    tail = NULL_INDEX;

    for (unsigned i = 0; i < SIZE - 1; i++) {
      elements[i].next = i + 1;
      elements[i].prev = i - 1;
    }
    elements[SIZE - 1].prev = SIZE - 2;
    elements[SIZE - 1].next = NULL_INDEX;
  }

  bool push_back(const T& elem) {
    wrlock();

    if (count == SIZE) {
      unlock();
      return false;
    }
    ssize_t index = free_head;

    free_head = elements[free_head].next;

    elements[index].next = NULL_INDEX;
    elements[index].prev = tail;

    if (tail != NULL_INDEX) {
      elements[tail].next = index;
    } else {
      head = index;
    }

    tail = index;
    elements[tail].elem = elem;
    count += 1;

    unlock();

    return true;
  }

  bool push_front(const T& elem) {
    wrlock();

    if (count == SIZE) {
      unlock();
      return false;
    }
    ssize_t index = free_head;

    free_head = elements[free_head].next;

    elements[index].next = head;
    elements[index].prev = NULL_INDEX;

    if (head != NULL_INDEX) {
      elements[head].prev = index;
    } else {
      tail = index;
    }

    head = index;
    elements[head].elem = elem;
    count += 1;

    unlock();

    return true;
  }

  bool pop_front() {
    wrlock();

    ssize_t index = head;

    if (count == 0) {
      unlock();
      return false;
    } else if (count == 1) {
      tail = NULL_INDEX;
      head = NULL_INDEX;
    } else {
      head = elements[index].next;
      elements[tail].prev = NULL_INDEX;
    }

    elements[index].next = free_head;
    elements[index].prev = NULL_INDEX;
    elements[free_head].prev = index;
    free_head = index;

    count -= 1;

    unlock();

    return true;
  }

  bool pop_back() {
    wrlock();

    ssize_t index = tail;

    if (count == 0) {
      unlock();
      return false;
    } else if (count == 1) {
      tail = NULL_INDEX;
      head = NULL_INDEX;
    } else {
      tail = elements[index].prev;
      elements[tail].next = NULL_INDEX;
    }

    elements[index].next = free_head;
    elements[index].prev = NULL_INDEX;
    elements[free_head].prev = index;
    free_head = index;

    count -= 1;

    unlock();

    return true;
  }
  
  template<typename PRED, typename CMP>
  bool remove_if(PRED& predicate, CMP* cmp) {
    wrlock();
    for (ssize_t i = head; i != NULL_INDEX; i = elements[i].next) {
      if (predicate(elements[i].elem, cmp)) {

        if (i != head) {
          elements[elements[i].prev].next = elements[i].next;
        } else {
          head = elements[i].next;
        }

        if (i != tail) {
          elements[elements[i].next].prev = elements[i].prev;
        } else {
          tail = elements[i].prev;
        }

        elements[i].next = free_head;
        elements[i].prev = NULL_INDEX;
        elements[free_head].prev = i;
        free_head = i;
        count -= 1;

        unlock();
        return true;
      }
    }

    unlock();
    return false;
  }

  template <typename PRED, typename CMP>
  bool find(PRED& predicate, CMP * cmp) {
    bool ret = false;
    wrlock();

    size_t j = 0;
    for (ssize_t i = head; i != NULL_INDEX; i = elements[i].next) {
      if (j >= count) {
        break;
      }

      if (predicate(elements[i].elem, cmp)) {
        ret = true;
      }

      j += 1;
    }

    unlock();
    return ret;
  }

  inline size_t size() {
    rdlock();
    int retval = count;
    unlock();
    return retval;
  }

  template<typename PRED, typename OP, typename RET>
  int operate(PRED& p, OP& op, RET* ret) {
    wrlock();
    int retval = do_operation(p, op, ret);
    unlock();
    return retval;
  }

  template<typename OP, typename STATE>
  int map(OP& op, STATE* s = NULL) {
    wrlock();
    int retval = do_map_operation(op, s);
    unlock();
    return retval;
  }

  template<typename STATE>
  int map(int (*op)(T&, STATE*), STATE* s = NULL) {
    wrlock();
    int retval = do_map_operation(op, s);
    unlock();
    return retval;
  }

  template<typename STATE>
  int map(int (*op)(const T&, STATE*), STATE* s = NULL) {
    rdlock();
    int retval = do_map_operation(op, s);
    unlock();
    return retval;
  }

private:

  template<typename PRED, typename OP, typename RET>
  int do_operation(PRED pred, OP op, RET*ret) {
    if (head == NULL_INDEX) {
      return -1;
    }
    for (ssize_t i = head; i != NULL_INDEX; i = elements[i].next) {
      if (pred(elements[i].elem)) {
        return op(elements[i].elem, ret);;
      }
    }
    return -1;
  }

  template<typename OP, typename STATE>
  int do_map_operation(OP op, STATE* s) {
    if (head == NULL_INDEX) {
      return -1;
    }

    size_t j = 0;
    for (ssize_t i = head; i != NULL_INDEX; i = elements[i].next) {
      if (j >= count) {
        break;
      }

      op(elements[i].elem, s);
      j += 1;
    }
    return 0;
  }

  static const ssize_t NULL_INDEX = -1;

  struct elem_wrapper {
    T elem;
    ssize_t next;
    ssize_t prev;
  };

  elem_wrapper elements[SIZE];
  ssize_t free_head, head, tail;
  pthread_rwlock_t lock;
  size_t count = 0;

  inline void rdlock() {
    pthread_rwlock_rdlock(&lock);
  }

  inline void wrlock() {
    pthread_rwlock_wrlock(&lock);
  }

  inline void unlock() {
    pthread_rwlock_unlock(&lock);
  }
};

#endif /* SRC_STATIC_LIST_H_ */
