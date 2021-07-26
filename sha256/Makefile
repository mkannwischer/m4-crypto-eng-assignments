LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: sha256test.bin sha256speed.bin

sha256test.elf: sha256.o sha256.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o sha256.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

sha256speed.elf: sha256.o sha256.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o sha256.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


