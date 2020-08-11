#include <stdio.h>
#include "aes256encrypt.h"
#include "hal.h"


int main(void)
{
  char outstr[128];
  unsigned char in[CRYPTO_INPUTBYTES];
  unsigned char out[CRYPTO_OUTPUTBYTES];
  unsigned char key[CRYPTO_KEYBYTES];

  uint64_t oldcount, newcount;
  hal_setup(CLOCK_BENCHMARK);

  hal_send_str("\n============ IGNORE OUTPUT BEFORE THIS LINE ============\n");

  oldcount = hal_get_time();
  aes256encrypt(out, in, key);
  newcount = hal_get_time();

  sprintf(outstr, "\ncycles for %d bytes: %llu", CRYPTO_INPUTBYTES, newcount-oldcount);

  hal_send_str(outstr);

  while(1);

  return 0;
}
