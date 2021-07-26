LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: poly1305test.bin poly1305speed.bin

poly1305test.elf: poly1305.o poly1305.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o poly1305.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

poly1305speed.elf: poly1305.o poly1305.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o poly1305.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


