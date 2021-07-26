#include "polymul_768x768.h"
#include <stdint.h>

#define n 768


void gf_polymul_768x768(short *h, short *f, short *g) {
  // stupid schoolbook
  int i, j;
  int64_t a;

  for (i = 0; i < n; ++i) {
    a = 0;
    for (j = 0; j <= i; ++j) {
        a += g[j] * f[i - j];
    }
    // for n <= 2560, |a| < 2^34
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    h[i] = a;
  }
  for (; i < n * 2 - 1; ++i) {
    a = 0;
    for (j = i - n + 1; j < n; ++j) {
        a += g[j] * f[i - j];
    }
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    a -= (4591LL) * ((a * 935519LL + 2147483648) >> 32);
    h[i] = a;
  }
  h[n * 2 - 1] = 0;
}

