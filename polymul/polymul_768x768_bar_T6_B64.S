  .global gf_polymul_768x768
  .type  gf_polymul_768x768, %function
 .p2align  2,,3
 .syntax    unified
 .text
/*

temp.o:     file format elf32-littlearm


Disassembly of section .text:
*/

T6_Mat1:
 .word  0x00020001
 .word  0x00080004
 .word  0x00200010
 .word  0x00100020
 .word  0x00040008
 .word  0x00010002
 .word  0x00040001
 .word  0x00400010
 .word  0x04000100
 .word  0x01000400
 .word  0x00100040
 .word  0x00010004

T_exp_ov_128:
 .short  0xffff

T_exp_add_128_128:
 .short  0x0160

T_mul_ov_128:
 .short  0x0021

T_col_128_ov:
 .short  0x0580
 .word  0x00000000
 .word  0x00040800
 .word  0x00130016
 .word  0x0001000d
 .word  0xffff001f

T_col_add_128_64:
 .short  0x02c0

T6_Mat2:
 .short  0xfffc
 .word  0xf89bfffc
 .word  0xfd75f7fa
 .word  0xfc9c0400
 .word  0xfef604d9
 .word  0xf8c5f9cf
 .word  0x0010fa60
 .word  0x04400440
 .word  0xffefffef
 .word  0x06c806c8
 .word  0xfaeefaee
 .word  0x04910000
 .word  0xffd20491
 .word  0xfa6c0044
 .word  0x003105af
 .word  0xfd87ffea
 .word  0xf875faee
 .word  0xffab05e8
 .word  0xff9bff9b
 .word  0x01750175
 .word  0x00110011
 .word  0xffb8ffb8
 .word  0xfa4f0000
 .word  0xf7b4fa4f
 .word  0x0284f811
 .word  0x0284faaf
 .word  0x0706faaf
 .word  0x07060000
 .word  0x04d5fe98
 .word  0x05610561
 .word  0xfa1cfa1c
 .word  0xfb80fb80
 .word  0x00480048
 .word  0x05a00000
 .word  0xfb4e05a0
 .word  0xfde9fbc0
 .word  0xf824fda2
 .word  0xfd870367
 .word  0x02990512
 .word  0xfb6f011f
 .word  0xffbcffbc
 .word  0x04800480
 .word  0xfda7fda7
 .word  0x05120512
 .word  0xfb840000
 .word  0xf9abfb84
 .word  0x07b2f90a
 .word  0x088bfe00
 .word  0xfef6fd27
 .word  0x05270631

gf_polymul_768x768:
 stmdb.w r13!, {r4, r5, r6, r7, r8, r9, r10, r11, r14}
 vpush.w {s16-s31}

T128x6_saves:
 vmov.w s0, r0
 vmov.w s11, r1
 vmov.w s12, r2
 movw.w r12, #4224
 sub.n sp, #96
 mov.n r3, r13
 vmov.w s10, r3
 sub.w  r13, r13, r12, lsl #2
 mov.w r3, r13
 add.w  r0, r13, r12
 vmov.w s1, r12
 vmov.w s2, r0
 add.w  r14, r0, r12
 vmov.w s3, r14

 movw.w r14, :lower16:T_exp_ov_128

 movt.w r14, :upper16:T_exp_ov_128

 movw.w r11, :lower16:T6_Mat2

 movt.w r11, :upper16:T6_Mat2

 movw.w r12, :lower16:T6_Mat1

 movt.w r12, :upper16:T6_Mat1
 vmov.w s4, r14
 vmov.w s15, r12
 vmov.w s16, r11
 movw.w r12, #4591
 movw.w r14, #15631
 vmov.w s6, r14
 rsb.w r12, r12, #0
 vmov.w s8, r12
 movw.w r14, #18015
 movt.w r14, #14
 vmov.w s7, r14

T128x6_begin:
 mov.w  r14, #256

T128x6_mv_loop:
 ldmia.w  r1!, {r4, r5, r6, r7, r8, r9, r10, r11}
 stmia.w  r3!, {r4, r5, r6, r7, r8, r9, r10, r11}
 ldmia.w  r2!, {r4, r5, r6, r7, r8, r9, r10, r11}
 stmia.w  r0!, {r4, r5, r6, r7, r8, r9, r10, r11}
 subs.w  r14, r14, #32
 bne.w  T128x6_mv_loop
 add.w  r1, r1, #1024
 add.w  r2, r2, #1024
 mov.w  r14, #256

T128x6_mv_loop1:
 ldmia.w  r1!, {r4, r5, r6, r7, r8, r9, r10, r11}
 stmia.w  r3!, {r4, r5, r6, r7, r8, r9, r10, r11}
 ldmia.w  r2!, {r4, r5, r6, r7, r8, r9, r10, r11}
 stmia.w  r0!, {r4, r5, r6, r7, r8, r9, r10, r11}
 subs.w  r14, r14, #32
 bne.n  T128x6_mv_loop1
 b.n  T128x6_split

T128x6_split_sub:
 vmov.w s13, r14
 add.w  r1, r1, #512
 mov.w  r12, #256
 vmov.w r11, s7
 vmov.w r7, s8

T128x6_split_sub1:
 mov.w  r14, #0
 vmov.w r9, s10
 mov.w  r5, #0
 mov.w  r6, #0

T128x6_split_sub2:
 ldr.w  r8, [r0, r14]
 str.w  r8, [r9]
 sadd16.w r5, r5, r8
 add.w  r14, r14, #256
 ldr.w  r8, [r0, r14]
 str.w  r8, [r9, #4]
 sadd16.w r6, r6, r8
 add.w  r14, r14, #256
 ldr.w  r8, [r0, r14]
 str.w  r8, [r9, #8]
 sadd16.w r5, r5, r8
 add.w  r14, r14, #256
 ldr.w  r8, [r0, r14]
 str.w  r8, [r9, #12]
 sadd16.w r6, r6, r8
 add.w  r14, r14, #256
 ldr.w  r8, [r0, r14]
 str.w  r8, [r9, #16]
 sadd16.w r5, r5, r8
 add.w  r14, r14, #256
 ldr.w  r8, [r0, r14]
 str.w  r8, [r9, #20]
 sadd16.w r6, r6, r8
 sadd16.w r4, r5, r6
 ssub16.w r5, r5, r6
 mov.w  r3, #32768
 smlawb.w r6, r11, r4, r3
 smlatb.w r10, r6, r7, r4
 smlawt.w r6, r11, r4, r3
 smultb.w r6, r6, r7
 add.w  r6, r4, r6, lsl #16
 pkhbt.w r4, r10, r6
 smlawb.w r6, r11, r5, r3
 smlatb.w r10, r6, r7, r5
 smlawt.w r6, r11, r5, r3
 smultb.w r6, r6, r7
 add.w  r6, r5, r6, lsl #16
 pkhbt.w r5, r10, r6
 vmov.w r10, s15
 str.w r4, [r1, #0]
 mov.w  r2, #256
 str.w r5, [r1, r2]
 add.w  r2, r2, #256

T128x6_split_sub3:
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9]
 smulbb.w r4, r14, r8
 smulbt.w r5, r14, r8
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9, #4]
 smulbb.w r3, r14, r8
 smulbt.w r6, r14, r8

T128x6_split_sub4:
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9, #8]
 smlabb.w r4, r14, r8, r4
 smlabt.w r5, r14, r8, r5
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9, #12]
 smlabb.w r3, r14, r8, r3
 smlabt.w r6, r14, r8, r6
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9, #16]
 smlabb.w r4, r14, r8, r4
 smlabt.w r5, r14, r8, r5
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9, #20]
 smlabb.w r3, r14, r8, r3
 smlabt.w r6, r14, r8, r6
 add.w  r8, r4, r3
 cmp.w  r2, #2048
 bcs.w  T128x6_split_sub5
 sub.w  r3, r4, r3
 add.w  r4, r5, r6
 sub.w  r5, r5, r6
 smmulr.w r6, r8, r11
 mla.w r8, r7, r6, r8
 smmulr.w r6, r3, r11
 mla.w r3, r7, r6, r3
 smmulr.w r6, r4, r11
 mla.w r4, r7, r6, r4
 smmulr.w r6, r5, r11
 mla.w r5, r7, r6, r5
 pkhbt.w r8, r8, r4, lsl #16
 pkhbt.w r3, r3, r5, lsl #16
 str.w  r8, [r1, r2]
 add.w  r2, r2, #256
 str.w r3, [r1, r2]
 add.w  r2, r2, #256
 b.w  T128x6_split_sub3

T128x6_split_sub5:
 add.w  r4, r5, r6
 smmulr.w r6, r8, r11
 mla.w r8, r7, r6, r8
 smmulr.w r6, r4, r11
 mla.w r4, r7, r6, r4
 pkhbt.w r8, r8, r4, lsl #16
 str.w  r8, [r1, r2]
 add.w  r0, r0, #4
 add.w  r1, r1, #4
 subs.w  r12, r12, #4
 bne.w  T128x6_split_sub1
 vmov.w r14, s13
 bx.n r14
 nop.n

T128x6_split:
 vmov.w r0, s11
 mov.w r1, r13
 bl.w T128x6_split_sub
 vmov.w r0, s12
 vmov.w r1, s2
 bl.w T128x6_split_sub

T128x6_exp:
 vmov.w r12, s1
 mov.w r0, r13
 add.w  r1, r0, r12
 mov.w  r2, #128
 vmov.w r3, s4

T128x6_exp_loop1:
 cmp.n r2, #64
 beq.n  T128x6_exp_end1

T128x6_exp_reduce:
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 beq.w  T128x6_exp_adds
 vmov.w r6, s8
 vmov.w r7, s7
 mov.w  r10, #32768

T128x6_exp_red1:
 ldrsh.w  r5, [r3], #2

T128x6_exp_red2:
 ldr.w  r8, [r0, r4, lsl #2]
 ldr.w  r9, [r1, r4, lsl #2]
 smlawb.w r11, r7, r8, r10
 smlatb.w r12, r11, r6, r8
 smlawt.w r11, r7, r8, r10
 smultb.w r11, r11, r6
 add.w  r11, r8, r11, lsl #16
 pkhbt.w r8, r12, r11
 str.w  r8, [r0, r4, lsl #2]
 smlawb.w r11, r7, r9, r10
 smlatb.w r12, r11, r6, r9
 smlawt.w r11, r7, r9, r10
 smultb.w r11, r11, r6
 add.w  r11, r9, r11, lsl #16
 pkhbt.w r9, r12, r11
 str.w  r9, [r1, r4, lsl #2]
 add.w  r4, r4, #1
 cmp.n r4, r5
 bls.n  T128x6_exp_red2
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 bne.w  T128x6_exp_red1

T128x6_exp_adds:
 ldrsh.w  r4, [r3], #2
 add.w  r5, r0, r4, lsl #3
 add.w  r6, r1, r4, lsl #3
 add.n r0, r2
 add.n r1, r2
 rsb.w r2, r2, #0
 mov.w r12, r2

T128x6_exp_adds1:
 ldr.w  r8, [r0, r2]
 ldr.w  r10, [r0], #4
 ldr.w  r9, [r0, r2]
 ldr.w  r11, [r0], #4
 sadd16.w r8, r8, r10
 sadd16.w r9, r9, r11
 strd.w r8, r9, [r5], #8
 ldr.w  r8, [r1, r2]
 ldr.w  r10, [r1], #4
 ldr.w  r9, [r1, r2]
 ldr.w  r11, [r1], #4
 sadd16.w r8, r8, r10
 sadd16.w r9, r9, r11
 strd.w r8, r9, [r6], #8
 subs.n r4, #2
 beq.n  T128x6_exp_end
 adds.w  r12, r12, #8
 ittt.n eq
 subeq.n r0, r0, r2
 subeq.n r1, r1, r2
 moveq.n r12, r2
 b.w  T128x6_exp_adds1

T128x6_exp_end:
 rsb.w r2, r2, #0
 mov.w r0, r13
 vmov.w r1, s2
 mov.w  r2, r2, lsr #1
 b.w  T128x6_exp_loop1

T128x6_exp_end1:
 ldrsh.w  r14, [r3], #2
 vmov.w s4, r3
 vmov.w r2, s3

T128x6_muls1:
 vmov.w s17, r14
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smuadx.w r6, r3, r12
 smuadx.w r8, r4, r12
 smladx.w r8, r3, r14, r8
 smuadx.w r10, r4, r14
 smulbb.w r5, r3, r12
 smulbb.w r7, r3, r14
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smuad.w r9, r3, r14
 smlatt.w r9, r4, r12, r9
 smultt.w r11, r4, r14
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 pkhbt.w r5, r5, r6, lsl #16
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 pkhbt.w r7, r7, r8, lsl #16
 str.w  r5, [r2], #4
 str.w  r7, [r2], #4
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 ldr.w  r12, [r1]
 smladx.w r10, r3, r12, r10
 smuadx.w r5, r4, r12
 smladx.w r5, r3, r14, r5
 smuadx.w r7, r4, r14
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smuad.w r6, r3, r14
 smlatt.w r6, r4, r12, r6
 smultt.w r8, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 pkhbt.w r9, r9, r10, lsl #16
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 pkhbt.w r11, r11, r5, lsl #16
 str.w  r9, [r2], #4
 str.w  r11, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 smladx.w r7, r3, r12, r7
 smuadx.w r9, r4, r12
 smladx.w r9, r3, r14, r9
 smuadx.w r11, r4, r14
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smuad.w r10, r3, r14
 smlatt.w r10, r4, r12, r10
 smultt.w r5, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 pkhbt.w r6, r6, r7, lsl #16
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 pkhbt.w r8, r8, r9, lsl #16
 str.w  r6, [r2], #4
 str.w  r8, [r2], #4
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 ldr.w  r12, [r1]
 smladx.w r11, r3, r12, r11
 smuadx.w r6, r4, r12
 smladx.w r6, r3, r14, r6
 smuadx.w r8, r4, r14
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smuad.w r7, r3, r14
 smlatt.w r7, r4, r12, r7
 smultt.w r9, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 pkhbt.w r10, r10, r11, lsl #16
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 pkhbt.w r5, r5, r6, lsl #16
 str.w  r10, [r2], #4
 str.w  r5, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 smladx.w r8, r3, r12, r8
 smuadx.w r10, r4, r12
 smladx.w r10, r3, r14, r10
 smuadx.w r5, r4, r14
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smuad.w r11, r3, r14
 smlatt.w r11, r4, r12, r11
 smultt.w r6, r4, r14
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 pkhbt.w r7, r7, r8, lsl #16
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 pkhbt.w r9, r9, r10, lsl #16
 str.w  r7, [r2], #4
 str.w  r9, [r2], #4
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 ldr.w  r12, [r1]
 smladx.w r5, r3, r12, r5
 smuadx.w r7, r4, r12
 smladx.w r7, r3, r14, r7
 smuadx.w r9, r4, r14
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smuad.w r8, r3, r14
 smlatt.w r8, r4, r12, r8
 smultt.w r10, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 pkhbt.w r11, r11, r5, lsl #16
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 pkhbt.w r6, r6, r7, lsl #16
 str.w  r11, [r2], #4
 str.w  r6, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 smladx.w r9, r3, r12, r9
 smuadx.w r11, r4, r12
 smladx.w r11, r3, r14, r11
 smuadx.w r6, r4, r14
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smuad.w r5, r3, r14
 smlatt.w r5, r4, r12, r5
 smultt.w r7, r4, r14
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 pkhbt.w r8, r8, r9, lsl #16
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 pkhbt.w r10, r10, r11, lsl #16
 str.w  r8, [r2], #4
 str.w  r10, [r2], #4
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 ldr.w  r12, [r1]
 smladx.w r6, r3, r12, r6
 smuadx.w r8, r4, r12
 smladx.w r8, r3, r14, r8
 smuadx.w r10, r4, r14
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smuad.w r9, r3, r14
 smlatt.w r9, r4, r12, r9
 smultt.w r11, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 pkhbt.w r5, r5, r6, lsl #16
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 pkhbt.w r7, r7, r8, lsl #16
 str.w  r5, [r2], #4
 str.w  r7, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 smladx.w r10, r3, r12, r10
 smuadx.w r5, r4, r12
 smladx.w r5, r3, r14, r5
 smuadx.w r7, r4, r14
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smuad.w r6, r3, r14
 smlatt.w r6, r4, r12, r6
 smultt.w r8, r4, r14
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 pkhbt.w r9, r9, r10, lsl #16
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 pkhbt.w r11, r11, r5, lsl #16
 str.w  r9, [r2], #4
 str.w  r11, [r2], #4
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 ldr.w  r12, [r1]
 smladx.w r7, r3, r12, r7
 smuadx.w r9, r4, r12
 smladx.w r9, r3, r14, r9
 smuadx.w r11, r4, r14
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smuad.w r10, r3, r14
 smlatt.w r10, r4, r12, r10
 smultt.w r5, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 pkhbt.w r6, r6, r7, lsl #16
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 pkhbt.w r8, r8, r9, lsl #16
 str.w  r6, [r2], #4
 str.w  r8, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 smladx.w r11, r3, r12, r11
 smuadx.w r6, r4, r12
 smladx.w r6, r3, r14, r6
 smuadx.w r8, r4, r14
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smuad.w r7, r3, r14
 smlatt.w r7, r4, r12, r7
 smultt.w r9, r4, r14
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 pkhbt.w r10, r10, r11, lsl #16
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 pkhbt.w r5, r5, r6, lsl #16
 str.w  r10, [r2], #4
 str.w  r5, [r2], #4
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 ldr.w  r12, [r1]
 smladx.w r8, r3, r12, r8
 smuadx.w r10, r4, r12
 smladx.w r10, r3, r14, r10
 smuadx.w r5, r4, r14
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smuad.w r11, r3, r14
 smlatt.w r11, r4, r12, r11
 smultt.w r6, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 pkhbt.w r7, r7, r8, lsl #16
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 pkhbt.w r9, r9, r10, lsl #16
 str.w  r7, [r2], #4
 str.w  r9, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 smladx.w r5, r3, r12, r5
 smuadx.w r7, r4, r12
 smladx.w r7, r3, r14, r7
 smuadx.w r9, r4, r14
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smuad.w r8, r3, r14
 smlatt.w r8, r4, r12, r8
 smultt.w r10, r4, r14
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 pkhbt.w r11, r11, r5, lsl #16
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 pkhbt.w r6, r6, r7, lsl #16
 str.w  r11, [r2], #4
 str.w  r6, [r2], #4
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 ldr.w  r12, [r1]
 smladx.w r9, r3, r12, r9
 smuadx.w r11, r4, r12
 smladx.w r11, r3, r14, r11
 smuadx.w r6, r4, r14
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smuad.w r5, r3, r14
 smlatt.w r5, r4, r12, r5
 smultt.w r7, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 pkhbt.w r8, r8, r9, lsl #16
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 pkhbt.w r10, r10, r11, lsl #16
 str.w  r8, [r2], #4
 str.w  r10, [r2], #4
 ldr.w r3, [r0, #0]
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 smladx.w r6, r3, r12, r6
 smuadx.w r8, r4, r12
 smladx.w r8, r3, r14, r8
 smuadx.w r10, r4, r14
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smuad.w r9, r3, r14
 smlatt.w r9, r4, r12, r9
 smultt.w r11, r4, r14
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1]
 ldr.w  r14, [r1, #4]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 pkhbt.w r5, r5, r6, lsl #16
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 pkhbt.w r7, r7, r8, lsl #16
 str.w  r5, [r2], #4
 str.w  r7, [r2], #4
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 ldr.w  r12, [r1]
 smladx.w r10, r3, r12, r10
 smuadx.w r5, r4, r12
 smladx.w r5, r3, r14, r5
 smuadx.w r7, r4, r14
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smuad.w r6, r3, r14
 smlatt.w r6, r4, r12, r6
 smultt.w r8, r4, r14
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #0]
 ldr.n r4, [r0, #4]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 pkhbt.w r9, r9, r10, lsl #16
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 pkhbt.w r11, r11, r5, lsl #16
 str.w  r9, [r2], #4
 str.w  r11, [r2], #4
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 ldr.w  r12, [r1, #120]
 smladx.w r7, r3, r12, r7
 smuadx.w r9, r4, r12
 smladx.w r9, r3, r14, r9
 smuadx.w r11, r4, r14
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smuad.w r10, r3, r14
 smlatt.w r10, r4, r12, r10
 smultt.w r5, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #8]
 ldr.w  r14, [r1, #12]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 pkhbt.w r6, r6, r7, lsl #16
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 pkhbt.w r8, r8, r9, lsl #16
 str.w  r6, [r2], #4
 str.w  r8, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
 smladx.w r11, r3, r12, r11
 smuadx.w r6, r4, r12
 smladx.w r6, r3, r14, r6
 smuadx.w r8, r4, r14
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smuad.w r7, r3, r14
 smlatt.w r7, r4, r12, r7
 smultt.w r9, r4, r14
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #16]
 ldr.n r4, [r0, #20]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 pkhbt.w r10, r10, r11, lsl #16
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 pkhbt.w r5, r5, r6, lsl #16
 str.w  r10, [r2], #4
 str.w  r5, [r2], #4
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 ldr.w  r12, [r1, #120]
 smladx.w r8, r3, r12, r8
 smuadx.w r10, r4, r12
 smladx.w r10, r3, r14, r10
 smuadx.w r5, r4, r14
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smuad.w r11, r3, r14
 smlatt.w r11, r4, r12, r11
 smultt.w r6, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #24]
 ldr.w  r14, [r1, #28]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 pkhbt.w r7, r7, r8, lsl #16
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 pkhbt.w r9, r9, r10, lsl #16
 str.w  r7, [r2], #4
 str.w  r9, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
 smladx.w r5, r3, r12, r5
 smuadx.w r7, r4, r12
 smladx.w r7, r3, r14, r7
 smuadx.w r9, r4, r14
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smuad.w r8, r3, r14
 smlatt.w r8, r4, r12, r8
 smultt.w r10, r4, r14
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #32]
 ldr.n r4, [r0, #36]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 pkhbt.w r11, r11, r5, lsl #16
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 pkhbt.w r6, r6, r7, lsl #16
 str.w  r11, [r2], #4
 str.w  r6, [r2], #4
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 ldr.w  r12, [r1, #120]
 smladx.w r9, r3, r12, r9
 smuadx.w r11, r4, r12
 smladx.w r11, r3, r14, r11
 smuadx.w r6, r4, r14
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smuad.w r5, r3, r14
 smlatt.w r5, r4, r12, r5
 smultt.w r7, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #40]
 ldr.w  r14, [r1, #44]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 pkhbt.w r8, r8, r9, lsl #16
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 pkhbt.w r10, r10, r11, lsl #16
 str.w  r8, [r2], #4
 str.w  r10, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
 smladx.w r6, r3, r12, r6
 smuadx.w r8, r4, r12
 smladx.w r8, r3, r14, r8
 smuadx.w r10, r4, r14
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smuad.w r9, r3, r14
 smlatt.w r9, r4, r12, r9
 smultt.w r11, r4, r14
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #48]
 ldr.n r4, [r0, #52]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 pkhbt.w r5, r5, r6, lsl #16
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 pkhbt.w r7, r7, r8, lsl #16
 str.w  r5, [r2], #4
 str.w  r7, [r2], #4
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 ldr.w  r12, [r1, #120]
 smladx.w r10, r3, r12, r10
 smuadx.w r5, r4, r12
 smladx.w r5, r3, r14, r5
 smuadx.w r7, r4, r14
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smuad.w r6, r3, r14
 smlatt.w r6, r4, r12, r6
 smultt.w r8, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 ldr.w  r12, [r1, #56]
 ldr.w  r14, [r1, #60]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r9, r12
 mla.w r9, r3, r14, r9
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 pkhbt.w r9, r9, r10, lsl #16
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 pkhbt.w r11, r11, r5, lsl #16
 str.w  r9, [r2], #4
 str.w  r11, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
 smladx.w r7, r3, r12, r7
 smuadx.w r9, r4, r12
 smladx.w r9, r3, r14, r9
 smuadx.w r11, r4, r14
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smuad.w r10, r3, r14
 smlatt.w r10, r4, r12, r10
 smultt.w r5, r4, r14
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #64]
 ldr.n r4, [r0, #68]
 smladx.w r7, r3, r12, r7
 smladx.w r9, r4, r12, r9
 smladx.w r9, r3, r14, r9
 smladx.w r11, r4, r14, r11
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smlad.w r10, r3, r14, r10
 smlatt.w r10, r4, r12, r10
 smlatt.w r5, r4, r14, r5
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 pkhbt.w r6, r6, r7, lsl #16
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 pkhbt.w r8, r8, r9, lsl #16
 str.w  r6, [r2], #4
 str.w  r8, [r2], #4
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 ldr.w  r12, [r1, #120]
 smladx.w r11, r3, r12, r11
 smuadx.w r6, r4, r12
 smladx.w r6, r3, r14, r6
 smuadx.w r8, r4, r14
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smuad.w r7, r3, r14
 smlatt.w r7, r4, r12, r7
 smultt.w r9, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 ldr.w  r12, [r1, #72]
 ldr.w  r14, [r1, #76]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r11, r3, r12, r11
 smladx.w r6, r4, r12, r6
 smladx.w r6, r3, r14, r6
 smladx.w r8, r4, r14, r8
 smlabb.w r10, r3, r12, r10
 smlabb.w r5, r3, r14, r5
 pkhbt.w r3, r4, r3
 smlad.w r5, r3, r12, r5
 smlad.w r7, r3, r14, r7
 smlatt.w r7, r4, r12, r7
 smlatt.w r9, r4, r14, r9
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r10, r12
 mla.w r10, r3, r14, r10
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 pkhbt.w r10, r10, r11, lsl #16
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 pkhbt.w r5, r5, r6, lsl #16
 str.w  r10, [r2], #4
 str.w  r5, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
 smladx.w r8, r3, r12, r8
 smuadx.w r10, r4, r12
 smladx.w r10, r3, r14, r10
 smuadx.w r5, r4, r14
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smuad.w r11, r3, r14
 smlatt.w r11, r4, r12, r11
 smultt.w r6, r4, r14
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #80]
 ldr.n r4, [r0, #84]
 smladx.w r8, r3, r12, r8
 smladx.w r10, r4, r12, r10
 smladx.w r10, r3, r14, r10
 smladx.w r5, r4, r14, r5
 smlabb.w r7, r3, r12, r7
 smlabb.w r9, r3, r14, r9
 pkhbt.w r3, r4, r3
 smlad.w r9, r3, r12, r9
 smlad.w r11, r3, r14, r11
 smlatt.w r11, r4, r12, r11
 smlatt.w r6, r4, r14, r6
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 pkhbt.w r7, r7, r8, lsl #16
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 pkhbt.w r9, r9, r10, lsl #16
 str.w  r7, [r2], #4
 str.w  r9, [r2], #4
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 ldr.w  r12, [r1, #120]
 smladx.w r5, r3, r12, r5
 smuadx.w r7, r4, r12
 smladx.w r7, r3, r14, r7
 smuadx.w r9, r4, r14
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smuad.w r8, r3, r14
 smlatt.w r8, r4, r12, r8
 smultt.w r10, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 ldr.w  r12, [r1, #88]
 ldr.w  r14, [r1, #92]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r5, r3, r12, r5
 smladx.w r7, r4, r12, r7
 smladx.w r7, r3, r14, r7
 smladx.w r9, r4, r14, r9
 smlabb.w r11, r3, r12, r11
 smlabb.w r6, r3, r14, r6
 pkhbt.w r3, r4, r3
 smlad.w r6, r3, r12, r6
 smlad.w r8, r3, r14, r8
 smlatt.w r8, r4, r12, r8
 smlatt.w r10, r4, r14, r10
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r11, r12
 mla.w r11, r3, r14, r11
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 pkhbt.w r11, r11, r5, lsl #16
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 pkhbt.w r6, r6, r7, lsl #16
 str.w  r11, [r2], #4
 str.w  r6, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #96]
 ldr.w  r14, [r1, #100]
 smladx.w r9, r3, r12, r9
 smuadx.w r11, r4, r12
 smladx.w r11, r3, r14, r11
 smuadx.w r6, r4, r14
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smuad.w r5, r3, r14
 smlatt.w r5, r4, r12, r5
 smultt.w r7, r4, r14
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #96]
 ldr.n r4, [r0, #100]
 smladx.w r9, r3, r12, r9
 smladx.w r11, r4, r12, r11
 smladx.w r11, r3, r14, r11
 smladx.w r6, r4, r14, r6
 smlabb.w r8, r3, r12, r8
 smlabb.w r10, r3, r14, r10
 pkhbt.w r3, r4, r3
 smlad.w r10, r3, r12, r10
 smlad.w r5, r3, r14, r5
 smlatt.w r5, r4, r12, r5
 smlatt.w r7, r4, r14, r7
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 pkhbt.w r8, r8, r9, lsl #16
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 pkhbt.w r10, r10, r11, lsl #16
 str.w  r8, [r2], #4
 str.w  r10, [r2], #4
 ldr.n r3, [r0, #104]
 ldr.n r4, [r0, #108]
 ldr.w  r12, [r1, #120]
 smladx.w r6, r3, r12, r6
 smuadx.w r8, r4, r12
 smladx.w r8, r3, r14, r8
 smuadx.w r10, r4, r14
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smuad.w r9, r3, r14
 smlatt.w r9, r4, r12, r9
 smultt.w r11, r4, r14
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 ldr.w  r12, [r1, #104]
 ldr.w  r14, [r1, #108]
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 smladx.w r6, r3, r12, r6
 smladx.w r8, r4, r12, r8
 smladx.w r8, r3, r14, r8
 smladx.w r10, r4, r14, r10
 smlabb.w r5, r3, r12, r5
 smlabb.w r7, r3, r14, r7
 pkhbt.w r3, r4, r3
 smlad.w r7, r3, r12, r7
 smlad.w r9, r3, r14, r9
 smlatt.w r9, r4, r12, r9
 smlatt.w r11, r4, r14, r11
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r14, r5, r12
 mla.w r5, r3, r14, r5
 smmulr.w r14, r6, r12
 mla.w r6, r3, r14, r6
 pkhbt.w r5, r5, r6, lsl #16
 smmulr.w r14, r7, r12
 mla.w r7, r3, r14, r7
 smmulr.w r14, r8, r12
 mla.w r8, r3, r14, r8
 pkhbt.w r7, r7, r8, lsl #16
 str.w  r5, [r2], #4
 str.w  r7, [r2], #4
 ldr.w r3, [r0, #120]
 ldr.w  r12, [r1, #112]
 ldr.w  r14, [r1, #116]
 smladx.w r10, r3, r12, r10
 smuadx.w r5, r4, r12
 smladx.w r5, r3, r14, r5
 smuadx.w r7, r4, r14
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smuad.w r6, r3, r14
 smlatt.w r6, r4, r12, r6
 smultt.w r8, r4, r14
 ldr.w  r12, [r1, #120]
 ldr.w  r14, [r1, #124]
 ldr.n r3, [r0, #112]
 ldr.n r4, [r0, #116]
 smladx.w r10, r3, r12, r10
 smladx.w r5, r4, r12, r5
 smladx.w r5, r3, r14, r5
 smladx.w r7, r4, r14, r7
 smlabb.w r9, r3, r12, r9
 smlabb.w r11, r3, r14, r11
 pkhbt.w r3, r4, r3
 smlad.w r11, r3, r12, r11
 smlad.w r6, r3, r14, r6
 smlatt.w r6, r4, r12, r6
 smlatt.w r8, r4, r14, r8
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 pkhbt.w r9, r9, r10, lsl #16
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 pkhbt.w r11, r11, r5, lsl #16
 str.w  r9, [r2], #4
 str.w  r11, [r2], #4
 ldr.n r3, [r0, #120]
 ldr.n r4, [r0, #124]
 ldr.w  r12, [r1, #120]
 smladx.w r7, r3, r12, r7
 smuadx.w r9, r4, r12
 smladx.w r9, r3, r14, r9
 smuadx.w r11, r4, r14
 smlabb.w r6, r3, r12, r6
 smlabb.w r8, r3, r14, r8
 pkhbt.w r3, r4, r3
 smlad.w r8, r3, r12, r8
 smuad.w r10, r3, r14
 smlatt.w r10, r4, r12, r10
 smultt.w r5, r4, r14
 vmov.w r3, s8
 vmov.w r12, s7
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 pkhbt.w r6, r6, r7, lsl #16
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 smmulr.w r4, r9, r12
 mla.w r9, r3, r4, r9
 pkhbt.w r8, r8, r9, lsl #16
 str.w  r6, [r2], #4
 str.w  r8, [r2], #4
 smmulr.w r4, r10, r12
 mla.w r10, r3, r4, r10
 smmulr.w r4, r11, r12
 mla.w r11, r3, r4, r11
 pkhbt.w r10, r10, r11, lsl #16
 smmulr.w r4, r5, r12
 mla.w r5, r3, r4, r5
 bfc.w r5, #16, #16
 str.w  r10, [r2], #4
 str.w  r5, [r2], #4
 add.w  r0, r0, #128
 add.w  r1, r1, #128
 vmov.w r14, s17
 subs.w  r14, r14, #1
 bne.w  T128x6_muls1

T128x6_collect:
 vmov.w r2, s3
 vmov.w r3, s4

T128x6_col_64_ov:
 vmov.w r0, s8
 vmov.w r1, s7
 mov.w  r6, #32768
 mov.w  r12, #0

T128x6_col_64_ov1:
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 beq.w  T128x6_col_64_add
 ldrsh.w  r11, [r3], #2
 ldrsh.w  r5, [r3], #2
 add.w r12, r5
 cmp.w  r11, #0
 bne.n  T128x6_col_64_ov2
 mov.n r12, r4
 b.w  T128x6_col_64_ov1

T128x6_col_64_ov2:
 mov.w  r5, r11, asr #1

T128x6_col_64_ov3:
 ldrsh.w  r10, [r3], #2

T128x6_col_64_ov4:
 ldr.w  r8, [r2, r12, lsl #2]
 smlawb.w r7, r1, r8, r6
 smlatb.w r9, r7, r0, r8
 smlawt.w r7, r1, r8, r6
 smultb.w r7, r7, r0
 add.w  r7, r8, r7, lsl #16
 pkhbt.w r8, r9, r7
 str.w  r8, [r2, r12, lsl #2]
 add.w  r12, r12, #1
 subs.w  r10, r10, #1
 bgt.w  T128x6_col_64_ov4
 ldrsh.w  r10, [r3], #2
 add.n r12, r10
 subs.n r5, #1
 bgt.n  T128x6_col_64_ov3
 cmp.n r12, r4
 bge.w  T128x6_col_64_ov1
 sub.w  r3, r3, r11, lsl #1
 b.w  T128x6_col_64_ov2

T128x6_col_64_add:
 ldrsh.w  r14, [r3], #2
 add.w  r12, r2, r14, lsl #3
 mov.w r1, r2
 mov.w  r10, #64
 mov.w  r0, #128
 add.w  r11, r0, r0, lsl #1

T128x6_col_64_add1:
 ldr.w r4, [r1, r0]
 ldr.w  r6, [r1, r0, lsl #1]
 ssub16.w r4, r4, r6
 ldr.w  r6, [r1, r11]
 sadd16.w r8, r4, r6
 ldr.w r6, [r1, #0]
 ssub16.w r4, r4, r6
 ldr.w  r6, [r12, r0]
 ssub16.w r8, r6, r8
 str.w  r8, [r1, r0, lsl #1]
 ldr.w  r6, [r12], #4
 sadd16.w r4, r4, r6
 str.w r4, [r1, r0]
 add.w  r1, r1, #4
 subs.w  r14, r14, #2
 beq.w  T128x6_col_64_end
 subs.w  r10, r10, #2
 ittt.n eq
 addeq.n r1, r11
 addeq.w r12, r0
 moveq.w  r10, #64
 b.w  T128x6_col_64_add1

T128x6_col_64_end:
 vmov.w r0, s0
 vmov.w r1, s3
 mov.w  r14, #512

T128x6_mv_back_loop:
 ldmia.w  r1!, {r4, r5, r6, r7, r8, r9, r10, r11}
 str.w  r4, [r0], #4
 str.w  r5, [r0], #4
 str.w  r6, [r0], #4
 str.w  r7, [r0], #4
 str.w  r8, [r0], #4
 str.w  r9, [r0], #4
 str.w  r10, [r0], #4
 str.w  r11, [r0], #4
 subs.w  r14, r14, #32
 bne.w  T128x6_mv_back_loop
 mov.w  r14, #2048
 mov.w  r4, #0
 mov.w  r5, #0
 mov.w  r6, #0
 mov.w  r7, #0
 mov.w  r8, #0
 mov.w  r9, #0
 mov.w  r10, #0
 mov.w  r11, #0

T128x6_clear_loop:
 str.w  r4, [r0], #4
 str.w  r5, [r0], #4
 str.w  r6, [r0], #4
 str.w  r7, [r0], #4
 str.w  r8, [r0], #4
 str.w  r9, [r0], #4
 str.w  r10, [r0], #4
 str.w  r11, [r0], #4
 subs.w  r14, r14, #32
 bne.w  T128x6_clear_loop
 mov.w  r14, #512

T128x6_mv_back_loop1:
 ldmia.w  r1!, {r4, r5, r6, r7, r8, r9, r10, r11}
 str.w  r4, [r0], #4
 str.w  r5, [r0], #4
 str.w  r6, [r0], #4
 str.w  r7, [r0], #4
 str.w  r8, [r0], #4
 str.w  r9, [r0], #4
 str.w  r10, [r0], #4
 str.w  r11, [r0], #4
 subs.w  r14, r14, #32
 bne.w  T128x6_mv_back_loop1

T128x6_gather:
 vmov.w r0, s0
 vmov.w r1, s3
 add.w  r0, r0, #256
 mov.w  r12, #512
 vmov.w r11, s7
 vmov.w r7, s8

T128x6_gather1:
 vmov.w r9, s10
 mov.w  r14, #0

T128x6_gather2:
 ldr.w  r8, [r1, r14]
 str.w  r8, [r9], #4
 add.w  r14, r14, #512
 cmp.w  r14, #5632
 bne.w  T128x6_gather2
 vmov.w r9, s10
 vmov.w r10, s16
 mov.w  r2, #0

T128x6_gather3:
 ldr.n r6, [r0, r2]
 sxth.n r4, r6
 mov.w  r5, r6, asr #16
 mov.w  r3, #0

T128x6_gather4:
 ldrsh.w  r14, [r10], #2
 ldr.w  r8, [r9, r3, lsl #2]
 smlabb.w r4, r14, r8, r4
 smlabt.w r5, r14, r8, r5
 add.w  r3, r3, #1
 cmp.n r3, #11
 bcc.n  T128x6_gather4
 smmulr.w r6, r4, r11
 mla.w r4, r7, r6, r4
 smmulr.w r6, r5, r11
 mla.w r5, r7, r6, r5
 pkhbt.w r4, r4, r5, lsl #16
 str.w r4, [r0, r2]
 add.w  r2, r2, #256
 cmp.w  r2, #2304
 bne.w  T128x6_gather3
 add.w  r0, r0, #4
 add.w  r1, r1, #4
 subs.w  r12, r12, #4
 bne.w  T128x6_gather1

T128x6_end:
 vmov.w r12, s1
 add.w  r13, r13, r12, lsl #2
 add.w sp, #96
 vpop.w {s16-s31}
 ldmia.w  r13!, {r4, r5, r6, r7, r8, r9, r10, r11, r14}
 bx.n r14
 nop.n
