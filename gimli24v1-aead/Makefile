LDSCRIPT   = ../libopencm3/lib/stm32/f4/stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: gimli24v1test.bin gimli24v1speed.bin

gimli24v1test.elf: gimli.o gimli.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o gimli.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

gimli24v1speed.elf: gimli.o gimli.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o gimli.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


