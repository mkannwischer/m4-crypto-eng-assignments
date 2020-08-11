#include <stdio.h>
#include "chacha20.h"
#include "hal.h"

#define OUTLEN 545

const unsigned char cmp[OUTLEN] = {
  0x2a, 0xee, 0x65, 0x0a, 0x13, 0x29, 0x9c, 0x9c, 0x35, 0xdb, 0xd5, 0xd3, 0x51, 0xfa, 0x0a, 0x07,
  0x07, 0xcc, 0xc1, 0xf4, 0x31, 0xab, 0xcc, 0x6d, 0x7b, 0x95, 0x40, 0x77, 0xf4, 0x90, 0x65, 0xe2,
  0x84, 0xba, 0x39, 0x55, 0xce, 0x09, 0x89, 0x15, 0x01, 0x32, 0x99, 0xe5, 0x2c, 0x49, 0xfc, 0x1b,
  0x9b, 0x7e, 0x41, 0xe3, 0x36, 0x50, 0x30, 0x1c, 0x24, 0xf3, 0x8d, 0x77, 0x1f, 0x94, 0x70, 0x82,
  0x5b, 0x63, 0xf7, 0x6c, 0x7f, 0x9f, 0x49, 0x9a, 0x16, 0x77, 0xcc, 0x87, 0x41, 0xd3, 0xcc, 0xe6,
  0xd0, 0x25, 0x73, 0x0d, 0xaf, 0xc6, 0x04, 0x9f, 0x3d, 0x68, 0xec, 0x4a, 0x18, 0x17, 0x1a, 0x1e,
  0x45, 0x3e, 0x34, 0x67, 0x5f, 0xdf, 0x50, 0x1a, 0x08, 0x1e, 0x44, 0xa2, 0xbd, 0x86, 0xe6, 0xf5,
  0x85, 0x27, 0xd4, 0x8c, 0x73, 0xbc, 0xee, 0xb1, 0xb3, 0x72, 0x7f, 0x3b, 0x1f, 0x83, 0x7a, 0xeb,
  0xb3, 0xa6, 0xb6, 0x99, 0x1f, 0xd4, 0x68, 0xb8, 0x19, 0xc8, 0x0b, 0x48, 0xe5, 0x0c, 0xf2, 0x54,
  0x78, 0x33, 0x8d, 0xb3, 0x70, 0x7d, 0x61, 0xe2, 0x96, 0x94, 0x77, 0x10, 0x17, 0x7d, 0x41, 0xec,
  0x4c, 0x29, 0xff, 0x5f, 0x26, 0x54, 0x14, 0x9a, 0x36, 0x89, 0xb3, 0x16, 0x3e, 0x8d, 0xfd, 0x7b,
  0x44, 0x95, 0xa0, 0x65, 0xac, 0x1b, 0xd1, 0xa5, 0x75, 0xb9, 0xe3, 0x83, 0x7d, 0x0a, 0x54, 0x66,
  0x69, 0xae, 0x93, 0xe4, 0xc0, 0x94, 0x9f, 0x85, 0x37, 0x7f, 0x93, 0x41, 0x41, 0x9e, 0x95, 0x6c,
  0x51, 0xa7, 0xb0, 0xb4, 0xb4, 0x85, 0xb9, 0x83, 0x39, 0x3f, 0xcd, 0xe5, 0xd8, 0x67, 0x73, 0x21,
  0xeb, 0x4a, 0x95, 0x33, 0xb9, 0x3f, 0x72, 0xb8, 0x38, 0x0a, 0x9a, 0x74, 0xa0, 0x1a, 0xb6, 0x80,
  0x21, 0xdb, 0x3f, 0x63, 0x25, 0x0f, 0x22, 0x2c, 0x46, 0xe1, 0xe5, 0xf7, 0x6b, 0xfb, 0xca, 0x85,
  0x67, 0x46, 0x9e, 0xea, 0x89, 0x47, 0xa7, 0x8a, 0x25, 0x39, 0xca, 0x12, 0x85, 0x04, 0x08, 0x14,
  0x86, 0x77, 0x3c, 0x4f, 0xcf, 0xab, 0x87, 0xd8, 0xf4, 0x6f, 0x9e, 0x11, 0x99, 0xe3, 0x06, 0xf3,
  0x71, 0x01, 0xf6, 0xa8, 0xd7, 0x73, 0x39, 0x32, 0xb6, 0xaa, 0x81, 0x8c, 0xd0, 0xdf, 0x60, 0x35,
  0x75, 0xeb, 0x59, 0xd1, 0xab, 0xad, 0x78, 0xc1, 0x69, 0xea, 0x4d, 0x38, 0x40, 0x41, 0xb8, 0xfa,
  0x06, 0x44, 0x1b, 0x04, 0x8a, 0x4e, 0xa6, 0x89, 0x55, 0x45, 0x78, 0x04, 0x69, 0x16, 0x9b, 0x36,
  0x8e, 0x07, 0xf9, 0x59, 0xeb, 0xef, 0xc0, 0x2a, 0x69, 0xd7, 0x5f, 0x11, 0x68, 0x57, 0x41, 0x02,
  0xcb, 0xbc, 0x2c, 0xea, 0xfe, 0x1f, 0x8f, 0x84, 0x65, 0xd0, 0xc9, 0x16, 0x3f, 0xc8, 0xb0, 0x1f,
  0x53, 0xdd, 0xc1, 0x00, 0x07, 0x7d, 0xa2, 0x2b, 0x39, 0x30, 0x2c, 0x43, 0xcf, 0x8d, 0xec, 0x8d,
  0x5f, 0xee, 0x00, 0xb0, 0x66, 0x70, 0xdb, 0x38, 0x11, 0xce, 0xc1, 0xe2, 0xf6, 0x4f, 0x61, 0xa0,
  0x34, 0xe8, 0x72, 0x98, 0x39, 0xa0, 0x9b, 0xcb, 0x65, 0xd3, 0x38, 0x10, 0xf3, 0x72, 0xd6, 0xe9,
  0x99, 0xd7, 0x26, 0x36, 0xdd, 0x91, 0xfc, 0x4f, 0x3e, 0x6c, 0x46, 0xc0, 0xd8, 0xcb, 0x9f, 0x11,
  0xbf, 0x92, 0xfe, 0xd4, 0xc0, 0x9c, 0x0c, 0x36, 0xc9, 0x32, 0x39, 0x06, 0xe3, 0x0f, 0x66, 0x7b,
  0x09, 0xfb, 0xdb, 0x8f, 0x19, 0xc3, 0x57, 0x85, 0x36, 0x7e, 0x02, 0xe8, 0x23, 0xeb, 0x82, 0xd5,
  0xc3, 0x9d, 0x56, 0xb9, 0x79, 0x5a, 0x7d, 0x31, 0xf7, 0x7b, 0xef, 0x8d, 0x5e, 0x18, 0x23, 0xce,
  0x0d, 0xb2, 0xd3, 0x40, 0xeb, 0x88, 0x6f, 0xdc, 0xf3, 0x4c, 0x84, 0x4e, 0xa5, 0xfa, 0xe5, 0xe2,
  0xb9, 0x2e, 0x65, 0x96, 0x72, 0x90, 0x50, 0xd1, 0x53, 0x2c, 0xa9, 0x86, 0x6c, 0x8e, 0x8f, 0x97,
  0x83, 0x3d, 0x73, 0xaa, 0x5a, 0x93, 0x0f, 0x62, 0xcb, 0xc5, 0x7e, 0xd2, 0x0e, 0x85, 0x53, 0xae,
  0xe5, 0xed, 0xe9, 0x58, 0xd8, 0x4b, 0x90, 0x16, 0x71, 0xe9, 0x95, 0x97, 0xd0, 0x70, 0xa0, 0x74,
  0x78};

unsigned char out[OUTLEN];

unsigned char key[CHACHA20_KEYBYTES] = {
  0x57, 0x6c, 0x7c, 0x77, 0x6a, 0xc2, 0x93, 0xc6, 0x78, 0x3a, 0x4a, 0x48, 0xc9, 0x45, 0x20, 0x36,
  0x7d, 0xb3, 0xd4, 0x8c, 0x66, 0xa0, 0x52, 0xa8, 0xb2, 0xea, 0x09, 0xdc, 0x41, 0x43, 0xc5, 0x61};
unsigned char nonce[CHACHA20_NONCEBYTES] = {
  0xa8, 0xc8, 0x48, 0x1f, 0xf2, 0x6b, 0x13, 0x86};

int main(void)
{
  hal_setup(CLOCK_FAST);
  hal_send_str("\n============ IGNORE OUTPUT BEFORE THIS LINE ============\n");

  crypto_stream_chacha20(out, OUTLEN, nonce, key);

  int i;
  for(i=0;i<OUTLEN;i++)
  {
    if(cmp[i] != out[i])
    {
      hal_send_str("Test failed!\n");
      while(1);
      return -1;
    }
  }

  hal_send_str("Test successful!\n");
  while(1);
  return 0;
}
