#ifndef REDUCE3_H

#define REDUCE3_H



__attribute__(( always_inline )) static int reduce3_255(int X) {
  int scratch;
  __asm__ volatile ("and %1, %0, #0x0F0F0F0F\n\t"\
		    "and %0, %0, #0xF0F0F0F0\n\t"\
		    "add %0, %1, %0, LSR #4\n\t" : "+r"(X),"=r"(scratch));  
  return(X);
}


__attribute__(( always_inline )) static int reduce3_30(int X) {
  int scratch;
  __asm__ volatile ("and %1, %0, #0x03030303\n\t"\
		    "and %0, %0, #0x1C1C1C1C\n\t"\
		    "add %0, %1, %0, LSR #2\n\t" : "+r"(X),"=r"(scratch));  
  return(X);
}

__attribute__(( always_inline )) static int reduce3_5(int X) {
  int mask = 0x03030303;
  int scratch;
  __asm__ volatile ("usub8 %1, %0, %2\n\t"\
		    "sel %0, %1, %0\n\t" : "+r"(X),"=r"(scratch): "r"(mask));  
  return(X);
}



#endif
