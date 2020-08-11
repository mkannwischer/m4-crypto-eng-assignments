#ifndef SHA3_512_H
#define SHA3_512_H

#include <stddef.h>
#include <stdint.h>


#define CRYPTO_BYTES 64
#define SHA3_512_RATE 72

void sha3_512(uint8_t *output, const uint8_t *input, size_t inlen);

#endif