#ifndef SHAKE128_H
#define SHAKE128_H

#include <stddef.h>
#include <stdint.h>

#define SHAKE128_RATE 168


void shake128_absorb(uint64_t state[25], const uint8_t *input, size_t inlen);

void shake128_squeezeblocks(uint8_t *output, size_t nblocks, uint64_t state[25]);

void shake128(uint8_t *output, size_t outlen, const uint8_t *input, size_t inlen);


#endif