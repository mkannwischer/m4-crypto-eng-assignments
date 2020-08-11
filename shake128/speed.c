#include <stdio.h>
#include "shake128.h"
#include "hal.h"

#define INLEN 1024
#define OUTLEN 1024

const unsigned char msg[INLEN];

int main(void)
{
  char outstr[128];
  unsigned char digest[OUTLEN];
  uint64_t oldcount, newcount;
  hal_setup(CLOCK_BENCHMARK);

  hal_send_str("\n============ IGNORE OUTPUT BEFORE THIS LINE ============\n");

  oldcount = hal_get_time();
  shake128(digest, OUTLEN, msg, INLEN);
  newcount = hal_get_time();

  sprintf(outstr, "\ncycles for %d input bytes and %d output bytes: %llu", INLEN, OUTLEN, newcount-oldcount);

  hal_send_str(outstr);

  while(1);

  return 0;
}
