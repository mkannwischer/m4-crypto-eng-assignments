#ifndef SHA512_H
#define SHA512_H

#define CRYPTO_BYTES 64
int sha512(unsigned char *output, const unsigned char *input, unsigned long long inlen);

#endif