// To compile:
//
// gcc -O2 -lpthread example.c 

#include <cassert>
#include <ctime>
#include <cstdlib>
#include <pthread.h>

#include <atomic>
#include <chrono>
#include <iomanip>
#include <iostream>
#include <thread>
#include <string>
#include <vector>
#include <mutex>

using namespace std;

// Delay function waits a variable time controlled by "d".  Note that
// it is set to be non-inlined so that the computation is not
// completely optimized away.  (Without inlining, gcc does not realize
// that the return value is not actually needed).

volatile int volatile_stuff = 12345;


static __attribute__ ((noinline)) int __attribute__((optimize("O0"))) 
delay(int d) {
  int i,k;
  int x = 0;

  for (i = 0; i<d; i++) {
    for (k = 0; k<100000; k++) {
      x+=i+k;
    }
  }
  return x;
}

// Example thread function.  This just delays for a little while,
// controlled by the parameter passed when the thread is started.

void thread_fn(int arg) {
  printf("Thread running, arg=%d\n", arg);
  delay(arg);
  printf("Thread done\n");
}

// Shared variable for use with example atomic compare and swap
// operations (__sync_val_compare_and_swap in this example).

// static volatile int x = 0;

class No_lock {
public:
  void lock() {}
  void unlock() {}
};

class Rw_lock {
private:
  atomic_int l = 0;
public:
  void acquire_write() {
    int zero = 0;
    do {
      if (l.load() == 0 && l.compare_exchange_weak(zero, -1, memory_order_acquire, memory_order_relaxed)) {
        break;
      }
    } while (true);
  }

  void release_write() {
    l.store(0, memory_order_release);
  }

  void lock() {
    do {
      int old_val = l.load(memory_order_relaxed);
      if (old_val >= 0 && l.compare_exchange_weak(old_val, old_val + 1, memory_order_acquire, memory_order_relaxed)) {
        break;
      }
    } while (true);
  }

  void unlock() {
    l.fetch_add(-1, memory_order_release);
  }
};

class C_rw_lock {
private:
  int l = 0;
public:
  void lock() {
    do {
      int old_val = l;
      if (old_val >= 0 && __sync_val_compare_and_swap(&l, old_val, old_val + 1)) break;
    } while (true);
  }

  void unlock() {
    __sync_fetch_and_sub(&l, 1);
  }
};

class Tatas_lock {
private:
  std::atomic_bool flag = false;
public:
  void lock() {
    do {
      while (flag);
    } while (flag.exchange(true, memory_order_acquire));
  }

  void unlock() {
    flag.store(false, memory_order_release);
  }
};


enum class Lock_type { no_lock, mutex, tatas, rw };

template<typename L>
static __attribute__ ((noinline)) int __attribute__((optimize("O0"))) 
sum(int arr[], int size, L& lock) {
  lock.lock();

  int result = 0;
  for (int i = 0; i < size; i += 1) {
    result += arr[i];
  }

  lock.unlock();

  return result;
}

void spin_threads_test(int num_threads, int delay) {
  cout << "delay: " << delay << endl;
  vector<thread> threads;
  for (int i = 0; i < num_threads; i += 1) {
    threads.emplace_back(thread_fn, delay);
  }
  for (auto& t : threads) {
    auto thread_id = t.get_id();
    cout << "Waiting for thread " << thread_id << endl;
    t.join();
    cout << "Joined with thread " << thread_id << endl;
  }
}

template<typename L>
void read_only_test(int num_threads, int arr_size, int num_loops, L& lock) {
  cout << "arr_size: " << arr_size << endl;
  cout << "num_loops: " << num_loops << endl;
  atomic<bool> done(false);

  int arr[5005];
  for (int i = 0; i < arr_size; i += 1) {
    arr[i] = rand();
  }

  vector<thread> workers;

  workers.emplace_back([=, &done, &arr, &lock]() {
    int64_t s = 0;
    for (int i = 0; i < num_loops; i += 1) {
      s += sum(arr, arr_size, lock);
    }
    done.store(true);
    cout << "s=" << s << endl;
  });
  for (int i = 1; i < num_threads; i += 1) {
    workers.emplace_back([=, &done, &arr, &lock]() {
      int64_t s = 0;
      while (!done.load()) {
        s += sum(arr, arr_size, lock);
      }
      cout << "s=" << s << endl;
    });
  }

  for (auto& w: workers) {
    auto thread_id = w.get_id();
    cout << "Waiting for thread " << thread_id << endl;
    w.join();
    cout << "Joined with thread " << thread_id << endl;
  }
}

const string num_threads_flag = "-num_threads";
const string delay_flag = "-delay";
const string arr_size_flag = "-arr-size";
const string num_loops_flag = "-num-loops";
const string mutex_flag = "-mutex";
const string tatas_flag = "-tatas";
const string rw_flag = "-rw-lock";
const string spin_command = "SPIN";
const string read_only_command = "READ_ONLY";
enum class Test { SPIN, READ_ONLY };


/**
 * Timer calculates the system Wall time between creation and destruction.
 * */
class Timer {
private:
  chrono::system_clock::time_point start;
public:
  Timer() : start(chrono::system_clock::now()) {
    cout << "starting timer" << endl;
  }
  ~Timer() {
    auto duration = chrono::system_clock::now() - start; // in nanoseconds
    int64_t sec = duration.count() / 1'000'000'000LL;
    int64_t mili = duration.count() / 1'000'000LL % 1000LL;
    cerr << sec << '.' << setw(3) << setfill('0') <<  mili << endl;
  }
};

int main(int argc, char** argv) {
  Timer timer;

  int num_threads = 4;
  int delay = 10000;
  int arr_size = 5;
  Lock_type lock_type = Lock_type::no_lock;

  Test test = Test::SPIN;

  for (int i = 1; i < argc; i += 1) {
    string flag{argv[i]};
    if (spin_command.find(flag) == 0) {
      test = Test::SPIN;
    } else if (read_only_command.find(flag) == 0) {
      test = Test::READ_ONLY;
    } else if (mutex_flag.find(flag) == 0) {
      lock_type = Lock_type::mutex;
    } else if (tatas_flag.find(flag) == 0) {
      lock_type = Lock_type::tatas;
    } else if (rw_flag.find(flag) == 0) {
      lock_type = Lock_type::tatas;
    } else if (i + 1 < argc) {
      if (num_threads_flag.find(flag) == 0) {
        string value{argv[i + 1]};
        num_threads = stoi(value);
      } else if (delay_flag.find(flag) == 0) {
        string value{argv[i + 1]};
        delay = stoi(value);
      } else if (arr_size_flag.find(flag) == 0) {
        string value{argv[i + 1]};
        arr_size = stoi(value);
      }
    }
  }

  cout << "hardware concurrency: " << thread::hardware_concurrency() << endl;
  cout << "num_threads: " << num_threads << endl;

  if (test == Test::SPIN) {
    spin_threads_test(num_threads, delay);
  } else if (test == Test::READ_ONLY) {
    switch (lock_type) {
    case Lock_type::no_lock: {
      No_lock l;
      read_only_test(num_threads, arr_size, delay, l);
      break;
    }
    case Lock_type::mutex: {
      mutex l;
      read_only_test(num_threads, arr_size, delay, l);
      break;
    }
    case Lock_type::tatas: {
      Tatas_lock l;
      read_only_test(num_threads, arr_size, delay, l);
      break;
    }
    case Lock_type::rw: {
      C_rw_lock l;
      read_only_test(num_threads, arr_size, delay, l);
      break;
    }
    }

  }

  cout << "Done" << endl;

  return 0;
}
