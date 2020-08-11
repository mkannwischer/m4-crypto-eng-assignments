#include <stdio.h>
#include "sha3-256.h"
#include "hal.h"

#define INLEN 1024

const unsigned char msg[INLEN];

int main(void)
{
  char outstr[128];
  unsigned char digest[CRYPTO_BYTES];
  uint64_t oldcount, newcount;
  hal_setup(CLOCK_BENCHMARK);

  hal_send_str("\n============ IGNORE OUTPUT BEFORE THIS LINE ============\n");

  oldcount = hal_get_time();
  sha3_256(digest, msg, INLEN);
  newcount = hal_get_time();

  sprintf(outstr, "\ncycles for %d bytes: %llu", INLEN, newcount-oldcount);

  hal_send_str(outstr);

  while(1);

  return 0;
}
