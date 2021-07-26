LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: aes128encrypttest.bin aes128encryptspeed.bin

aes128encrypttest.elf: aes128encrypt.o aes128encrypt.h test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o aes128encrypt.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)

aes128encryptspeed.elf: aes128encrypt.o aes128encrypt.h speed.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ speed.o aes128encrypt.o $(OBJS) $(LDFLAGS) -l$(LIBNAME)


include ../common/make.mk


