#ifndef SHA256_H
#define SHA256_H

#define CRYPTO_BYTES 32
int sha256(unsigned char *output, const unsigned char *input, unsigned long long inlen);

#endif