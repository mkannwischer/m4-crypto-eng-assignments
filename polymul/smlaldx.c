#include "polymul_768x768.h"
#include <stdint.h>
#include "cmsis.h"

#define n 768


void gf_polymul_768x768(short *h, short *f, short *g) {
  // stupid schoolbook, with SMLALDX
  int i, j, ff, gg;
  int64_t a;

  for (i = 0; i < n; ++i) {
    a = 0;
    for (j = 0; j < i; j+=2) {
      gg = *(int *)&g[j];
      ff = *(int *)&f[i-j-1];
      a = __SMLALDX(gg, ff, a);
    }
    if (!(i&1)) {
      gg = g[i]; ff = f[0];
      a = __SMLAL(gg, ff, a);
    }
    // for n <= 2560, |a| < 2^34
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    h[i] = a;
  }
  for (; i < n * 2 - 1; ++i) {
    a = 0;
    for (j = i - n + 1; j < n-1; j+=2) {
      gg = *(int *)&g[j];
      ff = *(int *)&f[i-j-1];
      a = __SMLALDX(gg, ff, a);
    }
    if (!(i&1)) {
      gg = g[n-1]; ff = f[i-n+1];
      a = __SMLAL(gg, ff, a);
    }
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    h[i] = a;
  }
  h[n * 2 - 1] = 0;
}

