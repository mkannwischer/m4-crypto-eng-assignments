LDSCRIPT   = ../libopencm3/lib/stm32/f4/stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: sha3-512test.bin sha3-512speed.bin

sha3-512test.elf: sha3-512.o sha3-512.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o sha3-512.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

sha3-512speed.elf: sha3-512.o sha3-512.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o sha3-512.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


