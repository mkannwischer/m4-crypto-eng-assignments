LDSCRIPT   = ../libopencm3/lib/stm32/f4/stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: shake128test.bin shake128speed.bin

shake128test.elf: shake128.o shake128.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o shake128.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

shake128speed.elf: shake128.o shake128.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o shake128.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


