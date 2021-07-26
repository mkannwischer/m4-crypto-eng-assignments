#include <stdio.h>
#include <stdlib.h>
#include "hal.h"
#include "cmsis.h"
#include "mock_std_mult.h"

#define QQ 4591
#define NN 768
#define polymul gf_polymul_768x768

extern void polymul(short *h, short *f, short *g);

static void rand16n (short *b, int n) {
  int i;

  for (i=0; i<16*n; i++) b[i] = rand() % QQ - (QQ >> 1);
}

int main(void) {
  /* add your own code */

  hal_setup(CLOCK_BENCHMARK);

  int i, j;
  float counter;
  uint64_t t0, t1;
  char m[256];

  __attribute__((aligned(32))) short ff[768], gg[768], hh[1536];
  int16_t h_ref[1536];

  hal_send_str("\n======== IGNORE OUTPUT BEFORE THIS LINE ============\n");

  srand(53589793); // 31415926
  counter = 0;
  while (counter < 7) {
    rand16n(ff,48);
    rand16n(gg,48);

    t0 = hal_get_time();

    polymul(hh,ff,gg);
    t1 = hal_get_time();
    sprintf(m,"%lld clock cycles\r\n",t1-t0);
    hal_send_str(m);

    mock_std_mult(h_ref, ff, gg, 768);
    for (i = 0; i < 1536; ++i) {
      j = hh[i];
      j -= 4591 * ((228 * j) >> 20);
      j -= 4591 * ((58470 * j + 134217728) >> 28);
      if (h_ref[i] != j) {

        sprintf(m,"h_short vs. h_ref -- %d: WRONG!!! => %d != %d d. %d <= %d\r\n",i,h_ref[i],j,(h_ref[i]-j)%4591,hh[i]);
        hal_send_str(m);
      }
    }
    counter+=1.5;
  }

  hal_send_str("\nEnd of Testing\r\n\n");
  return 0;
}
