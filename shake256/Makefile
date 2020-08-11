LDSCRIPT   = ../libopencm3/lib/stm32/f4/stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: shake256test.bin shake256speed.bin

shake256test.elf: shake256.o shake256.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o shake256.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

shake256speed.elf: shake256.o shake256.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o shake256.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


