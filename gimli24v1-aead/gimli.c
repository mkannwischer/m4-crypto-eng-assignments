#include <stdint.h>
#include <string.h>
#include "gimli.h"

static uint32_t rotate(uint32_t x,int bits)
{
  if (bits == 0) return x;
  return (x << bits) | (x >> (32 - bits));
}

static uint32_t load(uint8_t *state,int pos)
{
  uint32_t result = state[4*pos+3];
  result <<= 8; result |= state[4*pos+2];
  result <<= 8; result |= state[4*pos+1];
  result <<= 8; result |= state[4*pos+0];
  return result;
}

static void store(uint8_t *state,int pos,uint32_t x)
{
  state[4*pos+0] = x; x >>= 8;
  state[4*pos+1] = x; x >>= 8;
  state[4*pos+2] = x; x >>= 8;
  state[4*pos+3] = x;
}

static void gimli(uint8_t *state)
{
  int round, column;
  uint32_t x, y, z;

  for (round = 24; round > 0; --round) {
    for (column = 0; column < 4; ++column) {
      x = rotate(load(state,    column), 24);
      y = rotate(load(state,4 + column),  9);
      z =        load(state,8 + column);

      store(state,8 + column,x ^ (z << 1) ^ ((y&z) << 2));
      store(state,4 + column,y ^ x        ^ ((x|z) << 1));
      store(state,    column,z ^ y        ^ ((x&y) << 3));
    }

    if ((round & 3) == 0) { // small swap: pattern s...s...s... etc.
      x = load(state,0);
      store(state,0,load(state,1));
      store(state,1,x);
      x = load(state,2);
      store(state,2,load(state,3));
      store(state,3,x);
    }
    if ((round & 3) == 2) { // big swap: pattern ..S...S...S. etc.
      x = load(state,0);
      store(state,0,load(state,2));
      store(state,2,x);
      x = load(state,1);
      store(state,1,load(state,3));
      store(state,3,x);
    }

    if ((round & 3) == 0) // add constant: pattern c...c...c... etc.
      store(state,0,load(state,0) ^ (0x9e377900 | round));
  }
}

int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
  (void) nsec; // ignore warning
  uint8_t state[48];
  unsigned long long i;

  memcpy(state,npub,16);
  memcpy(state+16,k,32);
  gimli(state);
  *clen = mlen + 16;

  while (adlen >= 16) {
    for (i = 0;i < 16;++i) state[i] ^= ad[i];
    gimli(state);
    ad += 16;
    adlen -= 16;
  }

  for (i = 0;i < adlen;++i) state[i] ^= ad[i];
  state[adlen] ^= 1;
  state[47] ^= 1;
  gimli(state);

  while (mlen >= 16) {
    for (i = 0;i < 16;++i) c[i] = state[i] ^= m[i];
    gimli(state);
    c += 16;
    m += 16;
    mlen -= 16;
  }

  for (i = 0;i < mlen;++i) c[i] = state[i] ^= m[i];
  c += mlen;
  state[mlen] ^= 1;
  state[47] ^= 1;
  gimli(state);

  for (i = 0;i < 16;++i) c[i] = state[i];

  return 0;
}

int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *mlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
)
{
  (void) nsec; // ignore warning
  uint8_t state[48];
  uint32_t result;
  unsigned long long i;
  unsigned long long tlen;

  if (clen < 16) return -1;
  *mlen = tlen = clen - 16;

  memcpy(state,npub,16);
  memcpy(state+16,k,32);
  gimli(state);

  while (adlen >= 16) {
    for (i = 0;i < 16;++i) state[i] ^= ad[i];
    gimli(state);
    ad += 16;
    adlen -= 16;
  }

  for (i = 0;i < adlen;++i) state[i] ^= ad[i];
  state[adlen] ^= 1;
  state[47] ^= 1;
  gimli(state);

  while (tlen >= 16) {
    for (i = 0;i < 16;++i) m[i] = state[i] ^ c[i];
    for (i = 0;i < 16;++i) state[i] = c[i];
    gimli(state);
    c += 16;
    m += 16;
    tlen -= 16;
  }

  for (i = 0;i < tlen;++i) m[i] = state[i] ^ c[i];
  for (i = 0;i < tlen;++i) state[i] = c[i];
  c += tlen;
  m += tlen;
  state[tlen] ^= 1;
  state[47] ^= 1;
  gimli(state);

  result = 0;
  for (i = 0;i < 16;++i) result |= c[i] ^ state[i];
  result -= 1;
  result = ((int32_t) result) >> 16;

  tlen = *mlen;
  m -= tlen;
  for (i = 0;i < tlen;++i) m[i] &= result;

  return ~result;
}
