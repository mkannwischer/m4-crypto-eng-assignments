This repository contains a collection of stand-alone assignments for embedded
cryptographic engineering courses that we have been using at Radboud University
and Academia Sinica.

Parts of the code have been shamelessly copied from pqm4 and Joost Rijneveld's
STM32-getting-started.

**Warning**: Some of the code in this repository is not constant-time. It is
usually part of the assignment to eliminate all timing leaks in addition to
optimizing the scheme.


# Getting Started


# Reference Cycle Counts

The following table contains the cycle counts when using arm-none-eabi-gcc `10.2.0`.
Be aware that cycle counts (esp. for reference code) vary significantly between
compiler versions. Most of the times #newisalwaysbetter.


| scheme                       | cycle count |
| ---------------------------- | ----------- |
| chacha20 (1024 bytes)        | 33586       |
| poly1305 (512 bytes)         | 125331      |
| ecdh25519 (scalarmult_base)  | 50117722    |
| ecdh25519 (scalarmult)       | 46689841    |
| sha256 (1024 bytes)          | 47803       |
| sha512 (1024 bytes)          | 123563      |
| aes128encrypt (16 bytes)     | 943758      |
| aes256encrypt (16 bytes)     | 1302441     |