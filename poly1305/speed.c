#include <stdio.h>
#include "poly1305.h"
#include "hal.h"

#define INLEN 512

const unsigned char msg[INLEN];

unsigned char tag[POLY1305_BYTES];

unsigned char key[POLY1305_KEYBYTES] = {
  0x57, 0x6c, 0x7c, 0x77, 0x6a, 0xc2, 0x93, 0xc6, 0x78, 0x3a, 0x4a, 0x48, 0xc9, 0x45, 0x20, 0x36};

int main(void)
{
  char outstr[128];
  uint64_t oldcount, newcount;
  hal_setup(CLOCK_BENCHMARK);

  hal_send_str("\n============ IGNORE OUTPUT BEFORE THIS LINE ============\n");

  oldcount = hal_get_time();
  crypto_onetimeauth_poly1305(tag,msg,INLEN,key);
  newcount = hal_get_time();

  sprintf(outstr, "\ncycles for %d bytes: %llu", INLEN, newcount-oldcount);

  hal_send_str(outstr);

  while(1);

  return 0;
}
