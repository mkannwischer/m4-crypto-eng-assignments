#include <stdint.h>
#include "hal.h"

#define NN 128
#define M_CONC(A,B) M_CONC_(A,B)
#define M_CONC_(A,B) A##B
#define polymul_mod3 M_CONC(M_CONC(M_CONC(gf_polymul_,NN),M_CONC(x,NN)),_mod3)

void polymul_mod3 (char *h, char *f, char *g);

#include <stdint.h>
#include "cmsis.h"
#include "reduce3.h"

void polymul_mod3 (char *h, char *f, char *g) {
  // stupid schoolbook, but with radix 2^8 and a 8x8 block
  register int i, j, k, f0, f1, g0, g1, h0, h1, h2, h3;
  char m[256];

  // int kk;
  
  h0 = h1 = 0;
  for (i = 0; i < NN; i+=8) {
    h2 = h3 = 0; k = 7; // kk = 0;
    for (j = 0; j <= i; j+=8) {
      // kk++;
      f0 = *(int*)&f[j];
      f1 = *(int*)&f[j+4];
      g0 = *(int*)&g[i-j];
      g1 = *(int*)&g[i-j+4];
      __asm__ volatile("umlal %0, %1, %4, %6\n\t"	\
		       "umlal %1, %2, %4, %7\n\t"	\
		       "umlal %1, %2, %5, %6\n\t"	\
		       "umlal %2, %3, %5, %7\n\t":
		       "+r"(h0),"+r"(h1),"+r"(h2),"+r"(h3):
		       "r"(f0),"r"(f1),"r"(g0),"r"(g1));
      if (--k == 0) {
	//sprintf(m,"h0=%d; h1=%d; h2=%d; h3=%d", h0, h1, h2, h3);
        //hal_send_str(m);
        h0 = reduce3_255(h0);
        h1 = reduce3_255(h1);
        h2 = reduce3_255(h2);
        h3 = reduce3_255(h3);
	//sprintf(m,"h0=%d; h1=%d; h2=%d; h3=%d", h0, h1, h2, h3);
	//hal_send_str(m);
	k  = 7;
      }
    }
    //sprintf(m,"%d blocks in big loop %d", kk, i);
    //hal_send_str(m);

    h0 = reduce3_255(h0);
    h1 = reduce3_255(h1);
    h0 = reduce3_30(h0);
    h1 = reduce3_30(h1);
    h0 = reduce3_30(h0);
    h1 = reduce3_30(h1);
    *(int*)&h[i]   = reduce3_5(h0);
    *(int*)&h[i+4] = reduce3_5(h1);
    h0 = reduce3_255(h2);
    h1 = reduce3_255(h3);
  }
  for (; i < NN * 2 - 8; i+=8) {
    h2 = h3 = 0; k = 7; //kk = 0;
    for (j = i - NN + 8; j < NN; j+=8) {
      //kk ++;
      f0 = *(int*)&f[j];
      f1 = *(int*)&f[j+4];
      g0 = *(int*)&g[i-j];
      g1 = *(int*)&g[i-j+4];
      __asm__ volatile("umlal %0, %1, %4, %6\n\t"	\
		       "umlal %1, %2, %4, %7\n\t"	\
		       "umlal %1, %2, %5, %6\n\t"	\
		       "umlal %2, %3, %5, %7\n\t":
		       "+r"(h0),"+r"(h1),"+r"(h2),"+r"(h3):
		       "r"(f0),"r"(f1),"r"(g0),"r"(g1));
      if (--k == 0) {
        h0 = reduce3_255(h0);
        h1 = reduce3_255(h1);
        h2 = reduce3_255(h2);
        h3 = reduce3_255(h3);
	k  = 7;
      }
    }
    // sprintf(m,"%d blocks in big loop %d", kk, i);
    // hal_send_str(m);

    h0 = reduce3_255(h0);
    h1 = reduce3_255(h1);
    h0 = reduce3_30(h0);
    h1 = reduce3_30(h1);
    h0 = reduce3_30(h0);
    h1 = reduce3_30(h1);
    *(int*)&h[i]   = reduce3_5(h0);
    *(int*)&h[i+4] = reduce3_5(h1);
    h0 = reduce3_255(h2);
    h1 = reduce3_255(h3);
  }
  h0 = reduce3_30(h0);
  h1 = reduce3_30(h1);
  h0 = reduce3_30(h0);
  h1 = reduce3_30(h1);
  *(int*)&h[i]   = reduce3_5(h0);
  *(int*)&h[i+4] = reduce3_5(h1);
}
