  .global gf_polymul_768x768
  .type  gf_polymul_768x768, %function
 .p2align  2,,3
 .syntax    unified
 .text

/*

temp.o:     file format elf32-littlearm


Disassembly of section .text:
*/

KA_exp_ov_768:
 .short  0xffff

KA_exp_add_768_768:
 .short  0x00c0

KA_exp_ov_768_384:
 .short  0xffff

KA_exp_add_768_384:
 .short  0x0120

KA_exp_ov_768_192:
 .short  0xffff

KA_exp_add_768_192:
 .short  0x01b0

KA_exp_ov_768_96:
 .word  0x050f04e0
 .short  0xffff

KA_exp_add_768_96:
 .short  0x0288

KA_mul_ov_768:
 .word  0x07970000
 .word  0x0051ffff

KA_col_768_ov:
 .short  0x0510

KA_col_ov_768_96:
 .short  0x0018
 .word  0x00780047
 .word  0x00d800a7
 .word  0x01380107
 .word  0x01980167
 .word  0x01f801c7
 .word  0x02580227
 .word  0x02b80287
 .word  0x031802e7
 .word  0x03780347
 .word  0x03d803a7
 .word  0x04380407
 .word  0x04980467
 .word  0x04f804c7
 .word  0x05580527
 .word  0x05b80587
 .word  0x061805e7
 .word  0x06780647
 .word  0x06d806a7
 .word  0x07380707
 .word  0x07980767
 .word  0x07f807c7
 .word  0x08580827
 .word  0x08b80887
 .word  0x091808e7
 .word  0x09780947
 .word  0x09d809a7
 .word  0xffff0a07

KA_col_add_768_96:
 .short  0x0360

KA_col_ov_768_192:
 .short  0x0032
 .word  0x0064005a
 .word  0x00f2008d
 .word  0x0124011a
 .word  0x01b2014d
 .word  0x01e401da
 .word  0x0272020d
 .word  0x02a4029a
 .word  0x033202cd
 .word  0x0364035a
 .word  0x03f2038d
 .word  0x0424041a
 .word  0x04b2044d
 .word  0x04e404da
 .word  0x0572050d
 .word  0x05a4059a
 .word  0x063205cd
 .word  0x0664065a
 .word  0xffff068d

KA_col_add_768_192:
 .short  0x0240

KA_col_ov_768_384:
 .short  0x0030
 .word  0x005b0031
 .word  0x008e0077
 .word  0x00a80091
 .word  0x00ee00d7
 .word  0x010800f1
 .word  0x014e0123
 .word  0x01b0014f
 .word  0x01db01b1
 .word  0x020e01f7
 .word  0x02280211
 .word  0x026e0257
 .word  0x02880271
 .word  0x02ce02a3
 .word  0x033002cf
 .word  0x035b0331
 .word  0x038e0377
 .word  0x03a80391
 .word  0x03ee03d7
 .word  0x040803f1
 .word  0x044e0423
 .word  0xffff044f

KA_col_add_768_384:
 .short  0x0180
 nop

gf_polymul_768x768:
 stmdb.w sp!, {r4, r5, r6, r7, r8, r9, r10, r11, r14}
 vpush.w {s16-s31}
 movw.w r12, #7776
 sub.w  sp, sp, r12, lsl #2
 vmov.w s0, r0
 mov.w r3, sp
 add.w  r0, sp, r12
 vmov.w s1, r12
 vmov.w s2, r0
 add.w  r14, r0, r12
 vmov.w s3, r14

 movw.w r14, :lower16:KA_exp_ov_768

 movt.w r14, :upper16:KA_exp_ov_768
 vmov.w s4, r14
 movw.w r12, #4591
 movw.w r14, #15631
 vmov.w s6, r14
 rsb.w r12, r12, #0
 vmov.w s8, r12
 movw.w r14, #18015
 movt.w r14, #14
 vmov.w s7, r14
 mov.w  r14, #1536

KA768_mv_loop:
 ldr.w  r4, [r1], #4
 ldr.w  r5, [r1], #4
 ldr.w  r6, [r1], #4
 ldr.w  r7, [r1], #4
 ldr.w  r8, [r1], #4
 ldr.w  r9, [r1], #4
 ldr.w  r10, [r1], #4
 ldr.w  r11, [r1], #4
 stmia.w  r3!, {r4, r5, r6, r7, r8, r9, r10, r11}
 ldr.w  r4, [r2], #4
 ldr.w  r5, [r2], #4
 ldr.w  r6, [r2], #4
 ldr.w  r7, [r2], #4
 ldr.w  r8, [r2], #4
 ldr.w  r9, [r2], #4
 ldr.w  r10, [r2], #4
 ldr.w  r11, [r2], #4
 stmia.w  r0!, {r4, r5, r6, r7, r8, r9, r10, r11}
 subs.w  r14, r14, #32
 bne.w  KA768_mv_loop

KA768_exp:
 vmov.w r12, s1
 mov.w r0, sp
 add.w  r1, r0, r12
 mov.w  r2, #768
 vmov.w r3, s4

KA768_exp_loop1:
 cmp.n r2, #48
 beq.n  KA768_exp_end1

KA768_exp_reduce:
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 beq.w  KA768_exp_adds
 vmov.w r6, s8
 vmov.w r7, s7
 mov.w  r10, #32768

KA768_exp_red1:
 ldrsh.w  r5, [r3], #2

KA768_exp_red2:
 ldr.w  r8, [r0, r4, lsl #2]
 ldr.w  r9, [r1, r4, lsl #2]
 smlawb.w r11, r7, r8, r10
 smlatb.w r12, r11, r6, r8
 smlawt.w r11, r7, r8, r10
 smultb.w r11, r11, r6
 add.w  r11, r8, r11, lsl #16
 pkhbt.w r8, r12, r11
 str.w  r8, [r0, r4, lsl #2]
 add.w  r4, r4, #1
 cmp.n r4, r5
 bls.n  KA768_exp_red2
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 bne.w  KA768_exp_red1

KA768_exp_adds:
 ldrsh.w  r4, [r3], #2
 add.w  r5, r0, r4, lsl #3
 add.w  r6, r1, r4, lsl #3
 add.n r0, r2
 add.n r1, r2
 rsb.w r2, r2, #0
 mov.w r12, r2

KA768_exp_adds1:
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
 beq.n  KA768_exp_end
 adds.w  r12, r12, #8
 ittt.n eq
 subeq.n r0, r0, r2
 subeq.n r1, r1, r2
 moveq.n r12, r2
 b.w  KA768_exp_adds1

KA768_exp_end:
 rsb.w r2, r2, #0
 mov.w r0, sp
 vmov.w r1, s2
 mov.w  r2, r2, lsr #1
 b.w  KA768_exp_loop1

KA768_exp_end1:
 ldrsh.w  r2, [r3], #2
 cmp.w  r2, #4294967295
 beq.w  KA768_muls
 mov.w  r8, #32768
 vmov.w r6, s8
 vmov.w r7, s7

KA768_mul_ov1:
 ldrsh.w  r11, [r3], #2

KA768_mul_ov2:
 ldr.w  r4, [r0, r2, lsl #2]
 ldr.w  r5, [r1, r2, lsl #2]
 smlawb.w r9, r7, r4, r8
 smlatb.w r10, r9, r6, r4
 smlawt.w r9, r7, r4, r8
 smultb.w r9, r9, r6
 add.w  r9, r4, r9, lsl #16
 pkhbt.w r4, r10, r9
 smlawb.w r9, r7, r5, r8
 smlatb.w r10, r9, r6, r5
 smlawt.w r9, r7, r5, r8
 smultb.w r9, r9, r6
 add.w  r9, r5, r9, lsl #16
 pkhbt.w r5, r10, r9
 str.w  r4, [r0, r2, lsl #2]
 str.w  r5, [r1, r2, lsl #2]
 add.w  r2, r2, #1
 cmp.n r2, r11
 bls.n  KA768_mul_ov2
 ldrsh.w  r2, [r3], #2
 cmp.w  r2, #4294967295
 bne.w  KA768_mul_ov1

KA768_muls:
 ldrsh.w  r14, [r3], #2
 vmov.w s4, r3
 vmov.w r2, s3

KA768_muls1:
 vmov.w s9, r14
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
 ldr.n r3, [r0, #8]
 ldr.n r4, [r0, #12]
 ldr.w  r12, [r1, #88]
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
 ldr.w r3, [r0, #88]
 ldr.w  r12, [r1, #16]
 ldr.w  r14, [r1, #20]
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
 ldr.n r3, [r0, #24]
 ldr.n r4, [r0, #28]
 ldr.w  r12, [r1, #88]
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
 ldr.w r3, [r0, #88]
 ldr.w  r12, [r1, #32]
 ldr.w  r14, [r1, #36]
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
 ldr.n r3, [r0, #40]
 ldr.n r4, [r0, #44]
 ldr.w  r12, [r1, #88]
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
 ldr.w r3, [r0, #88]
 ldr.w  r12, [r1, #48]
 ldr.w  r14, [r1, #52]
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
 ldr.n r3, [r0, #56]
 ldr.n r4, [r0, #60]
 ldr.w  r12, [r1, #88]
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
 ldr.w r3, [r0, #88]
 ldr.w  r12, [r1, #64]
 ldr.w  r14, [r1, #68]
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
 ldr.n r3, [r0, #72]
 ldr.n r4, [r0, #76]
 ldr.w  r12, [r1, #88]
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
 ldr.w r3, [r0, #88]
 ldr.w  r12, [r1, #80]
 ldr.w  r14, [r1, #84]
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
 ldr.n r3, [r0, #88]
 ldr.n r4, [r0, #92]
 ldr.w  r12, [r1, #88]
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
 smmulr.w r4, r6, r12
 mla.w r6, r3, r4, r6
 smmulr.w r4, r7, r12
 mla.w r7, r3, r4, r7
 pkhbt.w r6, r6, r7, lsl #16
 smmulr.w r4, r8, r12
 mla.w r8, r3, r4, r8
 bfc.w r8, #16, #16
 str.w  r6, [r2], #4
 str.w  r8, [r2], #4
 add.w  r0, r0, #96
 add.w  r1, r1, #96
 vmov.w r14, s9
 subs.w  r14, r14, #1
 bne.w  KA768_muls1

KA768_collect:
 vmov.w r2, s3
 vmov.w r3, s4

KA768_col_48_add:
 ldrsh.w  r14, [r3], #2
 add.w  r12, r2, r14, lsl #3
 mov.w r1, r2
 mov.w  r10, #48
 mov.w  r0, #96
 add.w  r11, r0, r0, lsl #1

KA768_col_48_add1:
 ldr.w r4, [r1, r0]
 ldr.w  r6, [r1, r0, lsl #1]
 ldr.w  r7, [r1, r11]
 ssub16.w r4, r4, r6
 sadd16.w r8, r4, r7
 ldr.w r6, [r1, #0]
 ldr.w  r7, [r12, r0]
 ssub16.w r4, r4, r6
 ssub16.w r8, r7, r8
 ldr.w  r6, [r12], #4
 str.w  r8, [r1, r0, lsl #1]
 sadd16.w r4, r4, r6
 str.w r4, [r1, r0]
 add.w  r1, r1, #4
 subs.w  r14, r14, #2
 beq.w  KA768_col_48_end
 subs.w  r10, r10, #2
 ittt.n eq
 addeq.n r1, r11
 addeq.w r12, r0
 moveq.w  r10, #48
 b.w  KA768_col_48_add1

KA768_col_48_end:
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 beq.w  KA768_col_96_add
 vmov.w r0, s8
 vmov.w r1, s7
 mov.w  r6, #32768

KA768_col_96_ov1:
 ldrsh.w  r5, [r3], #2

KA768_col_96_ov2:
 ldr.w  r8, [r2, r4, lsl #2]
 smlawb.w r7, r1, r8, r6
 smlatb.w r9, r7, r0, r8
 smlawt.w r7, r1, r8, r6
 smultb.w r7, r7, r0
 add.w  r7, r8, r7, lsl #16
 pkhbt.w r8, r9, r7
 str.w  r8, [r2, r4, lsl #2]
 add.w  r4, r4, #1
 cmp.n r4, r5
 bls.n  KA768_col_96_ov2
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 bne.w  KA768_col_96_ov1

KA768_col_96_add:
 ldrsh.w  r14, [r3], #2
 add.w  r12, r2, r14, lsl #3
 mov.w r1, r2
 mov.w  r10, #96
 mov.w  r0, #192
 add.w  r11, r0, r0, lsl #1

KA768_col_96_add1:
 ldr.w r4, [r1, r0]
 ldr.w  r6, [r1, r0, lsl #1]
 ldr.w  r7, [r1, r11]
 ssub16.w r4, r4, r6
 sadd16.w r8, r4, r7
 ldr.w r6, [r1, #0]
 ldr.w  r7, [r12, r0]
 ssub16.w r4, r4, r6
 ssub16.w r8, r7, r8
 ldr.w  r6, [r12], #4
 str.w  r8, [r1, r0, lsl #1]
 sadd16.w r4, r4, r6
 str.w r4, [r1, r0]
 add.w  r1, r1, #4
 subs.w  r14, r14, #2
 beq.w  KA768_col_192_ov
 subs.w  r10, r10, #2
 ittt.n eq
 addeq.n r1, r11
 addeq.w r12, r0
 moveq.w  r10, #96
 b.w  KA768_col_96_add1

KA768_col_192_ov:
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 beq.w  KA768_col_192_add
 vmov.w r0, s8
 vmov.w r1, s7
 mov.w  r6, #32768

KA768_col_192_ov1:
 ldrsh.w  r5, [r3], #2

KA768_col_192_ov2:
 ldr.w  r8, [r2, r4, lsl #2]
 smlawb.w r7, r1, r8, r6
 smlatb.w r9, r7, r0, r8
 smlawt.w r7, r1, r8, r6
 smultb.w r7, r7, r0
 add.w  r7, r8, r7, lsl #16
 pkhbt.w r8, r9, r7
 str.w  r8, [r2, r4, lsl #2]
 add.w  r4, r4, #1
 cmp.n r4, r5
 bls.n  KA768_col_192_ov2
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 bne.w  KA768_col_192_ov1

KA768_col_192_add:
 ldrsh.w  r14, [r3], #2
 add.w  r12, r2, r14, lsl #3
 mov.w r1, r2
 mov.w  r10, #192
 mov.w  r0, #384
 add.w  r11, r0, r0, lsl #1

KA768_col_192_add1:
 ldr.w r4, [r1, r0]
 ldr.w  r6, [r1, r0, lsl #1]
 ldr.w  r7, [r1, r11]
 ssub16.w r4, r4, r6
 sadd16.w r8, r4, r7
 ldr.w r6, [r1, #0]
 ldr.w  r7, [r12, r0]
 ssub16.w r4, r4, r6
 ssub16.w r8, r7, r8
 ldr.w  r6, [r12], #4
 str.w  r8, [r1, r0, lsl #1]
 sadd16.w r4, r4, r6
 str.w r4, [r1, r0]
 add.w  r1, r1, #4
 subs.w  r14, r14, #2
 beq.w  KA768_col_192_end
 subs.w  r10, r10, #2
 ittt.n eq
 addeq.n r1, r11
 addeq.w r12, r0
 moveq.w  r10, #192
 b.w  KA768_col_192_add1

KA768_col_192_end:
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 beq.w  KA768_col_384_add
 vmov.w r0, s8
 vmov.w r1, s7
 mov.w  r6, #32768

KA768_col_384_ov1:
 ldrsh.w  r5, [r3], #2

KA768_col_384_ov2:
 ldr.w  r8, [r2, r4, lsl #2]
 smlawb.w r7, r1, r8, r6
 smlatb.w r9, r7, r0, r8
 smlawt.w r7, r1, r8, r6
 smultb.w r7, r7, r0
 add.w  r7, r8, r7, lsl #16
 pkhbt.w r8, r9, r7
 str.w  r8, [r2, r4, lsl #2]
 add.w  r4, r4, #1
 cmp.n r4, r5
 bls.n  KA768_col_384_ov2
 ldrsh.w  r4, [r3], #2
 cmp.w  r4, #4294967295
 bne.w  KA768_col_384_ov1

KA768_col_384_add:
 ldrsh.w  r14, [r3], #2
 add.w  r12, r2, r14, lsl #3
 mov.w r1, r2
 mov.w  r10, #384
 mov.w  r0, #768
 add.w  r11, r0, r0, lsl #1

KA768_col_384_add1:
 ldr.w r4, [r1, r0]
 ldr.w  r6, [r1, r0, lsl #1]
 ldr.w  r7, [r1, r11]
 ssub16.w r4, r4, r6
 sadd16.w r8, r4, r7
 ldr.w r6, [r1, #0]
 ldr.w  r7, [r12, r0]
 ssub16.w r4, r4, r6
 ssub16.w r8, r7, r8
 ldr.w  r6, [r12], #4
 str.w  r8, [r1, r0, lsl #1]
 sadd16.w r4, r4, r6
 str.w r4, [r1, r0]
 add.w  r1, r1, #4
 subs.w  r14, r14, #2
 beq.w  KA768_col_384_end
 subs.w  r10, r10, #2
 ittt.n eq
 addeq.n r1, r11
 addeq.w r12, r0
 moveq.w  r10, #384
 b.w  KA768_col_384_add1

KA768_col_384_end:
 vmov.w r0, s0
 mov.w  r14, #3072

KA768_mv_back_loop:
 ldmia.w  r2!, {r4, r5, r6, r7, r8, r9, r10, r11}
 str.w  r4, [r0], #4
 str.w  r5, [r0], #4
 str.w  r6, [r0], #4
 str.w  r7, [r0], #4
 str.w  r8, [r0], #4
 str.w  r9, [r0], #4
 str.w  r10, [r0], #4
 str.w  r11, [r0], #4
 subs.w  r14, r14, #32
 bne.w  KA768_mv_back_loop

KA768_end:
 vmov.w r12, s1
 add.w  sp, sp, r12, lsl #2
 vpop.w {s16-s31}
 ldmia.w  sp!, {r4, r5, r6, r7, r8, r9, r10, r11, r14}
 bx.n r14
 nop.n
 nop.w
