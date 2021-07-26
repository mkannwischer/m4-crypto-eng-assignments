LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: sha512test.bin sha512speed.bin

sha512test.elf: sha512.o sha512.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o sha512.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

sha512speed.elf: sha512.o sha512.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o sha512.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


