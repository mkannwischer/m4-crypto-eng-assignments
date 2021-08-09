LDSCRIPT   = ../stm32f405x6.ld
LIBNAME    = opencm3_stm32f4
ARCH_FLAGS = -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16
DEFINES    = -DSTM32F4
OBJS       = ../common/hal-stm32f4.o

all: polymultest_stupid.bin polymultest_smlaldx.bin polymultest_polymul768.bin \
     polymultest_polymul_768x768_bar_T4_B48.bin \
	 polymultest_polymul_768x768_bar_T6_B64.bin \
	 polymultest_polymul_768x768_bar_B48.bin \
	 polymultest_polymul_768x768.bin \
	 polymultest3_polymul_NNxNN_mod3.bin \
	 polymultest3_polymul_NN_mod3.bin

.PRECIOUS: polymultest_%.elf polymultest3_%.elf

polymultest_%.elf: %.o test.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test.o $< $(OBJS) $(LDFLAGS) -l$(LIBNAME)

polymultest3_%.elf: %.o test3.o $(OBJS) $(LDSCRIPT)
		$(LD) -o $@ test3.o $< $(OBJS) $(LDFLAGS) -l$(LIBNAME)

include ../common/make.mk

