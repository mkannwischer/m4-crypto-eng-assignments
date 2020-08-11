#ifndef SHA3_256_H
#define SHA3_256_H

#include <stddef.h>
#include <stdint.h>

#define CRYPTO_BYTES 32
#define SHA3_256_RATE 136

void sha3_256(uint8_t *output, const uint8_t *input, size_t inlen);

#endif