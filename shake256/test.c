#include <stdio.h>
#include "shake256.h"
#include "hal.h"

#define INLEN 169
#define OUTLEN 512

// https://github.com/XKCP/XKCP/blob/master/tests/TestVectors/ShortMsgKAT_SHAKE256.txt
const unsigned char msg[INLEN] = {
0xb3, 0x9f, 0xeb, 0x82, 0x83, 0xea, 0xdc, 0x63, 0xe8, 0x18, 0x4b, 0x51, 0xdf,
0x5a, 0xe3, 0xfd, 0x41, 0xaa, 0xc8, 0xa9, 0x63, 0xbb, 0x0b, 0xe1, 0xcd, 0x08,
0xaa, 0x58, 0x67, 0xd8, 0xd9, 0x10, 0xc6, 0x69, 0x22, 0x1e, 0x73, 0x24, 0x33,
0x60, 0x64, 0x6f, 0x65, 0x53, 0xd1, 0xca, 0x05, 0xa8, 0x4e, 0x8d, 0xc0, 0xde,
0x05, 0xb6, 0x41, 0x9e, 0xc3, 0x49, 0xca, 0x99, 0x44, 0x80, 0x19, 0x3d, 0x01,
0xc9, 0x25, 0x25, 0xf3, 0xfb, 0x3d, 0xce, 0xfb, 0x08, 0xaf, 0xc6, 0xd2, 0x69,
0x47, 0xbd, 0xbb, 0xfd, 0x85, 0x19, 0x3f, 0x53, 0xb5, 0x06, 0x09, 0xc6, 0x14,
0x09, 0x05, 0xc5, 0x3a, 0x66, 0x86, 0xb5, 0x8e, 0x53, 0xa3, 0x19, 0xa5, 0x7b,
0x96, 0x23, 0x31, 0xed, 0xe9, 0x81, 0x49, 0xaf, 0x3d, 0xe3, 0x11, 0x8a, 0x81,
0x9d, 0xa4, 0xd7, 0x67, 0x06, 0xa0, 0x42, 0x4b, 0x4e, 0x1d, 0x29, 0x10, 0xb0,
0xed, 0x26, 0xaf, 0x61, 0xd1, 0x50, 0xeb, 0xcb, 0x46, 0x59, 0x5d, 0x42, 0x66,
0xa0, 0xbd, 0x7f, 0x65, 0x1b, 0xa4, 0x7d, 0x0c, 0x7f, 0x17, 0x9c, 0xa2, 0x85,
0x45, 0x00, 0x7d, 0x92, 0xe8, 0x41, 0x9d, 0x48, 0xfd, 0xfb, 0xd7, 0x44, 0xce
};


const unsigned char cmp[OUTLEN] = {
0xa3, 0xd5, 0xcf, 0xcd, 0xcc, 0x03, 0x33, 0x46, 0x32, 0x02, 0x7f, 0xa1, 0xb1,
0xad, 0xb9, 0x7c, 0x74, 0x0f, 0x9c, 0x5d, 0x33, 0xf0, 0xb6, 0xd8, 0x46, 0x8b,
0x4a, 0xa9, 0xb3, 0x7a, 0x5e, 0xae, 0x69, 0x7d, 0x6d, 0xe7, 0x71, 0x7b, 0x6f,
0x7c, 0x3e, 0x87, 0x2d, 0xcc, 0x4a, 0x62, 0x68, 0x2d, 0xdd, 0x76, 0xd8, 0x76,
0x57, 0x09, 0x6d, 0x14, 0x3d, 0xed, 0xf9, 0x7f, 0x2b, 0x9b, 0xa3, 0x67, 0x34,
0xb9, 0xff, 0x58, 0x16, 0xe2, 0x47, 0x24, 0x3b, 0x1f, 0x32, 0xf5, 0xca, 0x12,
0x2a, 0xb4, 0x96, 0x47, 0xfd, 0xa6, 0x90, 0xb8, 0x3a, 0xe0, 0xfe, 0xe4, 0x56,
0x25, 0xb4, 0xa2, 0x60, 0x6c, 0x8e, 0x36, 0x6c, 0xd5, 0x03, 0x1a, 0x0c, 0x93,
0x84, 0x07, 0xcc, 0x94, 0x21, 0x41, 0x4c, 0xe4, 0x63, 0x14, 0x77, 0xc3, 0xd4,
0x49, 0x45, 0x70, 0x91, 0x6b, 0xb4, 0x1c, 0x60, 0xfc, 0x05, 0xac, 0x12, 0x5a,
0x3e, 0x81, 0x34, 0x67, 0x59, 0xdc, 0xa0, 0xce, 0xbd, 0xd7, 0x63, 0xb6, 0x14,
0x93, 0x99, 0x7b, 0x77, 0x4a, 0x58, 0x24, 0x75, 0xd2, 0x26, 0x1f, 0x6f, 0x85,
0x00, 0xd2, 0xc5, 0x1c, 0x70, 0xde, 0x11, 0x12, 0x37, 0x56, 0xeb, 0x6b, 0x95,
0x8e, 0xe5, 0xf2, 0x0f, 0xb4, 0xa4, 0x94, 0x29, 0x35, 0x8d, 0x74, 0x3e, 0x4b,
0x62, 0xd7, 0x69, 0x04, 0xd2, 0x3f, 0xd5, 0xda, 0xc9, 0xec, 0xbf, 0xf1, 0x48,
0x54, 0xbf, 0x27, 0xdd, 0xa8, 0x19, 0xb3, 0xf5, 0x24, 0x21, 0x32, 0x9b, 0x05,
0x76, 0xcc, 0x39, 0x9e, 0xac, 0x73, 0x4d, 0x73, 0xfd, 0x9b, 0xb8, 0x72, 0x91,
0x68, 0xe3, 0x5e, 0x2a, 0x34, 0x90, 0xd7, 0xbf, 0xaa, 0x39, 0xe5, 0x3e, 0x54,
0x34, 0x04, 0x57, 0xae, 0xc4, 0xc5, 0xc8, 0xf4, 0xc0, 0xfe, 0xe9, 0x33, 0x90,
0x53, 0x64, 0x6e, 0x4d, 0x74, 0xef, 0x1a, 0x14, 0x06, 0xeb, 0xa2, 0x08, 0x82,
0x2b, 0x8e, 0x66, 0xde, 0x41, 0x0c, 0xfc, 0xd4, 0x9a, 0x46, 0x4d, 0x9f, 0xf5,
0x45, 0x60, 0x4c, 0x26, 0xca, 0xa4, 0xfe, 0x84, 0xb0, 0x18, 0xc6, 0x9b, 0xe1,
0x81, 0x12, 0xb5, 0xc3, 0xd7, 0x32, 0x54, 0x81, 0x07, 0x8c, 0x71, 0x29, 0x79,
0xdc, 0x88, 0x84, 0x2e, 0x28, 0x42, 0xdf, 0x19, 0xf3, 0x90, 0x25, 0xd2, 0x8f,
0xdf, 0x45, 0xa5, 0xdd, 0x6e, 0x8f, 0xd2, 0xd1, 0x2b, 0xf2, 0x7d, 0x22, 0x7e,
0x79, 0x21, 0x0f, 0x62, 0x66, 0xb8, 0x6c, 0xdc, 0x7b, 0xc6, 0xf8, 0x1d, 0xb5,
0x7a, 0xf5, 0x7a, 0xa2, 0x52, 0xc5, 0xbb, 0x95, 0xa2, 0x35, 0x74, 0x6b, 0x9c,
0x86, 0x9b, 0xa7, 0xf8, 0xc9, 0x0e, 0x0a, 0xd3, 0xf5, 0xde, 0xd4, 0x09, 0x94,
0x71, 0x73, 0xd0, 0x71, 0xde, 0x21, 0x6e, 0xd1, 0xb1, 0x37, 0x84, 0x67, 0x52,
0x65, 0x3c, 0xc6, 0xcf, 0xa3, 0xc5, 0x2a, 0x32, 0xad, 0x6c, 0xa0, 0xbc, 0xe2,
0x9a, 0x5b, 0x12, 0x47, 0x5c, 0x04, 0x94, 0x88, 0xf0, 0xa7, 0x9a, 0xdf, 0x5a,
0xdc, 0x45, 0x10, 0xe6, 0x46, 0x8e, 0x71, 0x4b, 0xba, 0x37, 0xc0, 0x00, 0x5a,
0x9c, 0xfa, 0x3d, 0xdb, 0x24, 0x36, 0x32, 0x90, 0xa0, 0x4b, 0xaf, 0xbb, 0xa9,
0x2b, 0xbb, 0x2c, 0x2e, 0x16, 0xcd, 0xd9, 0xd4, 0x07, 0x07, 0xc5, 0x6f, 0x49,
0xc0, 0x5c, 0x52, 0x76, 0xc8, 0x9b, 0xea, 0xc3, 0xb2, 0x39, 0xde, 0x28, 0x48,
0x67, 0x61, 0x1c, 0xa3, 0xdd, 0x82, 0x50, 0xe8, 0xc7, 0xfd, 0xf5, 0x22, 0xe0,
0xe8, 0x4e, 0xa4, 0x7a, 0x3a, 0x06, 0x55, 0x4d, 0xff, 0xf6, 0xb7, 0xda, 0x13,
0x34, 0x9a, 0x5f, 0x36, 0xca, 0x44, 0x74, 0x99, 0xc4, 0x5d, 0xa4, 0xc4, 0x91,
0xdf, 0xc1, 0x13, 0x89, 0x26, 0x72, 0xb0, 0x36, 0x50, 0x7f, 0xf3, 0xa1, 0xe7,
0xe0, 0x7b, 0x43, 0xfb, 0x95
};




int main(void)
{
  unsigned char digest[OUTLEN];
  hal_setup(CLOCK_FAST);


  hal_send_str("\n============ IGNORE OUTPUT BEFORE THIS LINE ============\n");
  shake256(digest, OUTLEN, msg, INLEN);

  int i;
  for(i=0;i<OUTLEN;i++)
  {
    if(cmp[i] != digest[i])
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
