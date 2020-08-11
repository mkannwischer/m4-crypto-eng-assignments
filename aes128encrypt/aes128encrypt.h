#ifndef AES128ENCRYPT_H
#define AES128ENCRYPT_H

#define CRYPTO_OUTPUTBYTES 16
#define CRYPTO_INPUTBYTES 16
#define CRYPTO_KEYBYTES 16

int aes128encrypt(unsigned char *out, const unsigned char *in,
  const unsigned char *k);

#endif