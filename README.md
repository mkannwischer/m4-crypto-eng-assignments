This repository contains a collection of stand-alone assignments for embedded cryptographic engineering courses that we have been using at Radboud University
and Academia Sinica.

Parts of the code have been shamelessly copied from [pqm4](https://github.com/mupq/pqm4), [PQClean](https://github.com/PQClean/PQClean), and 
[Joost Rijneveld](https://joostrijneveld.nl/)'s [STM32-getting-started](https://github.com/joostrijneveld/STM32-getting-started).
Most of the crypto implementations come from [SUPERCOP](https://bench.cr.yp.to/supercop.html). 

**Warning**: Some of the code in this repository is not constant-time. It is
usually part of the assignment to eliminate all timing leaks in addition to
optimizing the scheme.


# Getting Started
Follow the setup instructions on https://github.com/joostrijneveld/STM32-getting-started. 

Then clone this repository
```
git clone --recurse-submodules https://github.com/mkannwischer/m4-crypto-eng-assignments
cd m4-crypto-eng-assignments
```

## Receiving Output
Listen to your serial output by either
```
python3 hostside/host_unidirectional.py
```

or 

```
screen /dev/ttyUSB0 115200
```

## Testing 
For any of the schemes included in this repository (e.g. `sha3-256`), you can 
```
cd sha3-256
make 
st-flash write sha3-256test.bin 0x8000000
```
## Benchmarking 

For any of the schemes included in this repository (e.g. `sha3-256`), you can 
```
cd sha3-256
make 
st-flash write sha3-256speed.bin 0x8000000
```


# Reference Cycle Counts

The following table contains the cycle counts when using arm-none-eabi-gcc `10.2.0`.
Be aware that cycle counts (esp. for reference code) vary significantly between
compiler versions. Most of the times #newisalwaysbetter.

| scheme                                            | cycle count |
| ------------------------------------------------- | ----------- |
| chacha20 (1024 bytes)                             | 33586       |
| poly1305 (512 bytes)                              | 125331      |
| ecdh25519 (scalarmult_base)                       | 50117722    |
| ecdh25519 (scalarmult)                            | 46689841    |
| sha256 (1024 bytes)                               | 47803       |
| sha512 (1024 bytes)                               | 123563      |
| aes128encrypt (16 bytes)                          | 943758      |
| aes256encrypt (16 bytes)                          | 1302441     |
| sha3-256 (1024 bytes)                             | 184231      |
| sha3-512 (1024 bytes)                             | 339898      |
| shake128 (1024 input bytes; 1024 output bytes)    | 300657      |
| shake256 (1024 input bytes; 1024 output bytes)    | 344393      |

# License
All code in this repository (excluding the [libopencm3](https://github.com/libopencm3/libopencm3) submodule) is released under the conditions of [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
