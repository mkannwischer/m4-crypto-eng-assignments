#ifndef POLY1305_H
#define POLY1305_H

#define POLY1305_BYTES 16
#define POLY1305_KEYBYTES 32

int crypto_onetimeauth_poly1305(unsigned char *out,const unsigned char *in,unsigned long long inlen,const unsigned char *k);

#endif
