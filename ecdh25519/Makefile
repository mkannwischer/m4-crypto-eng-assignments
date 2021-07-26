LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: ecdh25519test.bin ecdh25519speed.bin


ecdh25519test.elf: fe25519.o fe25519.h group.o group.h smult.o smult.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o fe25519.o group.o smult.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

ecdh25519speed.elf: fe25519.o fe25519.h group.o group.h smult.o smult.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o fe25519.o group.o smult.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

include ../common/make.mk
