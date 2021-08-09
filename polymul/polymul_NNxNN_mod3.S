#define NN 128
#define M_CONC(A,B) M_CONC_(A,B)
#define M_CONC_(A,B) A##B
#define polymul_mod3 M_CONC(M_CONC(M_CONC(gf_polymul_,NN),M_CONC(x,NN)),_mod3)

	.macro	reduce3_255, res, scr, dst
	and	\scr, \res, #0x0F0F0F0F
	and	\res, \res, #0xF0F0F0F0
	.ifb	\dst
	add	\res, \scr, \res, LSR #4
	.else
	add	\dst, \scr, \res, LSR #4
	.endif
	.endm		

	.macro	reduce3_30, res, scr
	and	\scr, \res, #0x03030303
	and	\res, \res, #0x1C1C1C1C
	add	\res, \scr, \res, LSR #2
	.endm
	
	.macro	reduce3_5, res, scr, F3
	usub8	\scr, \res, \F3
	sel	\res, \scr, \res
	.endm
	
// void gf_polymul_mod3 (int *h, int *f, int *g);
	.p2align	2,,3	
	.syntax		unified
	.text
	.global polymul_mod3
	.type	polymul_mod3, %function

	h	.req	r0
	f	.req	r1
	g	.req	r2
	k	.req	r3
	ff0	.req	r4
	ff1	.req	r5
	g0	.req	r6
	g1	.req	r7
	h0	.req	r8
	h1	.req	r9
	h2	.req	r10
	h3	.req	r11
	fg	.req	r12	// f or g at the end of the small loop
	s	.req	r14

	ff	.req	s1
	gg	.req	s2
	hh	.req	s0
	f_	.req	s3	// f at the beginning of small loop
	g_	.req	s3	// g at the beginning of small loop
	bd	.req	s4	
	
polymul_mod3 :
	push {r4-r11,lr}
	vmov	ff, f
	vmov	gg, g
	vmov	hh, h
	vmov	g_, g		

	mov	fg, g		// ending g for smalL loop
	mov	h0, #0
	mov	h1, #0
	add	s, g, #NN
	vmov	bd, s		// bound starting g for the large loop

loop:	
	mov	h2, #0
	mov	h3, #0
	mov	k, 7
	
loop1:
	cmp	g, fg
	bcc	loop2
	ldr	ff1, [f, #4]
	ldr	ff0, [f], #8
	ldr	g1, [g, #4]
	ldr	g0, [g], #-8
	
	umlal	h0, h1, ff0, g0
	umlal	h1, h2, ff0, g1
	umlal	h1, h2, ff1, g0
	umlal	h2, h3, ff1, g1

	subs	k, k, #1
	bne	loop1

	// need to reduce
	mov		k, #7
	reduce3_255	h0, s
	reduce3_255	h1, s
	reduce3_255	h2, s
	reduce3_255	h3, s
	//reduce3_30	h0, s
	//reduce3_30	h1, s
	//reduce3_30	h2, s
	//reduce3_30	h3, s
	b		loop1

loop2:	// end of small loop, init next iter large loop
	reduce3_255	h0, s
	reduce3_255	h1, s
	reduce3_30	h0, s
	reduce3_30	h1, s
	reduce3_30	h0, s
	reduce3_30	h1, s
	mov		g0, #0x03030303
	reduce3_5	h0, s, g0
	reduce3_5	h1, s, g0
	str		h1, [h, #4]
	str		h0, [h], #8
	reduce3_255	h2, s, h0
	reduce3_255	h3, s, h1

	vmov		f, ff
	vmov		g, g_
	add		g, g, #8
	vmov		s, bd
	cmp		g, s
	vmov		g_, g
	bcc		loop
	
loopx:
	vmov		g, gg
	add		g, g, #(NN-8)	// g start at g+n-4
	vmov		gg, g		// save starting value for g
	add		s, f, #NN
	vmov		bd, s
	add		fg, f, #(NN-8)
	add		f, f, #8
	vmov		f_, f


loop3:
	mov		h2, #0
	mov		h3, #0
	mov		k, #7

loop4:				// f is f+i-n+8, g is g+n-8
	cmp		fg, f
	bcc		loop5
	
	ldr	ff1, [f, #4]
	ldr	ff0, [f], #8
	ldr	g1, [g, #4]
	ldr	g0, [g], #-8
	
	umlal	h0, h1, ff0, g0
	umlal	h1, h2, ff0, g1
	umlal	h1, h2, ff1, g0
	umlal	h2, h3, ff1, g1

	subs	k, k, #1
	bne 	loop4

	// need to reduce
	mov		k, #7
	reduce3_255	h0, s
	reduce3_255	h1, s
	reduce3_255	h2, s
	reduce3_255	h3, s
	//reduce3_30	h0, s
	//reduce3_30	h1, s
	//reduce3_30	h2, s
	//reduce3_30	h3, s
	b		loop4
	
loop5:	
	reduce3_255	h0, s
	reduce3_255	h1, s
	reduce3_30	h0, s
	reduce3_30	h1, s
	reduce3_30	h0, s
	reduce3_30	h1, s
	mov		g0, #0x03030303
	reduce3_5	h0, s, g0
	reduce3_5	h1, s, g0
	str		h1, [h, #4]
	str		h0, [h], #8
	reduce3_255	h2, s, h0
	reduce3_255	h3, s, h1

	vmov		f, f_
	vmov		g, gg
	add		f, f, #8
	vmov		s, bd
	cmp		f, s
	vmov		f_, f
	bcc		loop3

	reduce3_30	h0, s
	reduce3_30	h1, s
	reduce3_30	h0, s
	reduce3_30	h1, s
	mov		g0, #0x03030303
	reduce3_5	h0, s, g0
	reduce3_5	h1, s, g0
	str		h1, [h, #4]
	str		h0, [h], #8

	pop		{r4-r11,pc}
	
