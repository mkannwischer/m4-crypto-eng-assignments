#include <stdio.h>
#include <stdlib.h>
#include "hal.h"
#include "cmsis.h"
#include "mock_std_mult.h"

#define NN 128
#define M_CONC(A,B) M_CONC_(A,B)
#define M_CONC_(A,B) A##B
#define polymul_mod3 M_CONC(M_CONC(M_CONC(gf_polymul_,NN),M_CONC(x,NN)),_mod3)

extern void polymul(char *h, char *f, char *g);

static void randn3 (char *b, int n) {
  int i;

  for (i=0; i<n; i++) b[i] = rand() % 3;
}

int main(void) {
  /* add your own code */

  hal_setup(CLOCK_BENCHMARK);

  int i, j;
  float counter;
  uint64_t t0, t1;
  char m[256];

  __attribute__((aligned(32))) char ff[NN], gg[NN], hh[NN*2];
  __attribute__((aligned(32))) char h_ref[NN*2];

  hal_send_str("\n======== IGNORE OUTPUT BEFORE THIS LINE ============\n");

  srand(53589793); // 31415926
  counter = 0;
  while (counter < 7) {
    randn3(ff,NN);
    randn3(gg,NN);

    t0 = hal_get_time();

    polymul_mod3(hh,ff,gg);
    t1 = hal_get_time();
    sprintf(m,"%lld clock cycles\r\n",t1-t0);
    hal_send_str(m);

    mock_std_mult_mod3(h_ref, ff, gg, NN);
    for (i = 0; i < 2*NN; ++i) {
      j = hh[i] % 3;
      j = (3+j) % 3;
      if (h_ref[i] != j) {

        sprintf(m,"h_short vs. h_ref -- %d: WRONG!!! => %d != %d d. %d <= %d\r",i,h_ref[i],j,(h_ref[i]-j)%3,hh[i]);
        hal_send_str(m);
      }
    }
    counter+=1.5;
  }

  hal_send_str("\nEnd of Testing\r\n\n");
  return 0;
}
