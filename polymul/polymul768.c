#include "polymul_768x768.h"
#include <stdint.h>

#define n 768

#include <stdint.h>
#include "cmsis.h"

#define n 768


void gf_polymul_768x768(short *h, short *f, short *g) {
  // stupid schoolbook, but with SMLALDX and a 4x4 block
  register int i, j, f0, f1, g0, g1, h0, h1, h2, h3, h4, h5, h6;

  h0 = h1 = h2 = 0;
  for (i = 0; i < n; i+=4) {
    h3 = h4 = h5 = h6 = 0;
    for (j = 0; j <= i; j+=4) {
      f0 = *(int*)&f[j];
      f1 = *(int*)&f[j+2];
      g0 = *(int*)&g[i-j];
      g1 = *(int*)&g[i-j+2];
      h0 = __SMLABB(f0, g0, h0);
      h1 = __SMLADX(f0, g0, h1);
      h2 = __SMLABB(f0, g1, h2);
      h3 = __SMLADX(f0, g1, h3);
      h3 = __SMLADX(f1, g0, h3);
      h4 = __SMLATT(f1, g0, h4);
      h5 = __SMLADX(f1, g1, h5);
      h6 = __SMLATT(f1, g1, h6);
      __asm__ ("pkhtb %0, %0, %1": "+r"(f0): "r"(f1));
      //f0 = __PKHTB (f0, f0, f1, 0);
      h2 = __SMLAD (f0, g0, h2);
      h4 = __SMLAD (f0, g1, h4);
      if ((j & 0xff) == 0xfc) {
        h0 = __MLS(4591, __SMMULR(935519, h0), h0);
        h1 = __MLS(4591, __SMMULR(935519, h1), h1);
        h2 = __MLS(4591, __SMMULR(935519, h2), h2);
        h3 = __MLS(4591, __SMMULR(935519, h3), h3);
        h4 = __MLS(4591, __SMMULR(935519, h4), h4);
        h5 = __MLS(4591, __SMMULR(935519, h5), h5);
        h6 = __MLS(4591, __SMMULR(935519, h6), h6);
      }
    }
    h0 = __MLS(4591, __SMMULR(935519, h0), h0);
    h1 = __MLS(4591, __SMMULR(935519, h1), h1);
    h2 = __MLS(4591, __SMMULR(935519, h2), h2);
    h3 = __MLS(4591, __SMMULR(935519, h3), h3);
    h4 = __MLS(4591, __SMMULR(935519, h4), h4);
    h5 = __MLS(4591, __SMMULR(935519, h5), h5);
    h6 = __MLS(4591, __SMMULR(935519, h6), h6);
    h[i]   = __MLS(4591, __SMMULR(935519, h0), h0);
    h[i+1] = __MLS(4591, __SMMULR(935519, h1), h1);
    h[i+2] = __MLS(4591, __SMMULR(935519, h2), h2);
    h[i+3] = __MLS(4591, __SMMULR(935519, h3), h3);
    h0 = __MLS(4591, __SMMULR(935519, h4), h4);
    h1 = __MLS(4591, __SMMULR(935519, h5), h5);
    h2 = __MLS(4591, __SMMULR(935519, h6), h6);
  }
  for (; i < n * 2 - 4; i+=4) {
    h3 = h4 = h5 = h6 = 0;
    for (j = i - n + 4; j < n; j+=4) {
      f0 = *(int*)&f[j];
      f1 = *(int*)&f[j+2];
      g0 = *(int*)&g[i-j];
      g1 = *(int*)&g[i-j+2];
      h0 = __SMLABB(f0, g0, h0);
      h1 = __SMLADX(f0, g0, h1);
      h2 = __SMLABB(f0, g1, h2);
      h3 = __SMLADX(f0, g1, h3);
      h3 = __SMLADX(f1, g0, h3);
      h4 = __SMLATT(f1, g0, h4);
      h5 = __SMLADX(f1, g1, h5);
      h6 = __SMLATT(f1, g1, h6);
      __asm__ ("pkhtb %0, %0, %1": "+r"(f0): "r"(f1));
      //f0 = __PKHTB (f0, f0, f1, 0);
      h2 = __SMLAD (f0, g0, h2);
      h4 = __SMLAD (f0, g1, h4);
      if ((j & 0xff) == 0xfc) {
        h0 = __MLS(4591, __SMMULR(935519, h0), h0);
        h1 = __MLS(4591, __SMMULR(935519, h1), h1);
        h2 = __MLS(4591, __SMMULR(935519, h2), h2);
        h3 = __MLS(4591, __SMMULR(935519, h3), h3);
        h4 = __MLS(4591, __SMMULR(935519, h4), h4);
        h5 = __MLS(4591, __SMMULR(935519, h5), h5);
        h6 = __MLS(4591, __SMMULR(935519, h6), h6);
      }
    }
    h0 = __MLS(4591, __SMMULR(935519, h0), h0);
    h1 = __MLS(4591, __SMMULR(935519, h1), h1);
    h2 = __MLS(4591, __SMMULR(935519, h2), h2);
    h3 = __MLS(4591, __SMMULR(935519, h3), h3);
    h4 = __MLS(4591, __SMMULR(935519, h4), h4);
    h5 = __MLS(4591, __SMMULR(935519, h5), h5);
    h6 = __MLS(4591, __SMMULR(935519, h6), h6);
    h[i]   = __MLS(4591, __SMMULR(935519, h0), h0);
    h[i+1] = __MLS(4591, __SMMULR(935519, h1), h1);
    h[i+2] = __MLS(4591, __SMMULR(935519, h2), h2);
    h[i+3] = __MLS(4591, __SMMULR(935519, h3), h3);
    h0 = __MLS(4591, __SMMULR(935519, h4), h4);
    h1 = __MLS(4591, __SMMULR(935519, h5), h5);
    h2 = __MLS(4591, __SMMULR(935519, h6), h6);
  }
  h[2 * n - 4] = h0;
  h[2 * n - 3] = h1;
  h[2 * n - 2] = h2;
  h[2 * n - 1] = 0;
}