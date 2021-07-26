LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: aes256encrypttest.bin aes256encryptspeed.bin

aes256encrypttest.elf: aes256encrypt.o aes256encrypt.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o aes256encrypt.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

aes256encryptspeed.elf: aes256encrypt.o aes256encrypt.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o aes256encrypt.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


