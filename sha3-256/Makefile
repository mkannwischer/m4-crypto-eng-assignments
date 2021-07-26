LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: sha3-256test.bin sha3-256speed.bin

sha3-256test.elf: sha3-256.o sha3-256.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o sha3-256.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

sha3-256speed.elf: sha3-256.o sha3-256.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o sha3-256.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


