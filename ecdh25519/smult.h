#ifndef SMULT_H
#define SMULT_H

int crypto_scalarmult(unsigned char *ss, const unsigned char *sk, const unsigned char *pk);

int crypto_scalarmult_base(unsigned char *pk, const unsigned char *sk);

#endif
