 	.global gf_polymul_768x768
 	.type	gf_polymul_768x768, %function
 	.p2align	2,,3
 	.syntax		unified
 	.text


vzero:
	.word	0
vqi:
	.word	935519

//#define qinv	935519
#define	q	4591
#define	N	768

	h	.req		r0
	f	.req		r1
	g	.req		r2
	ff0	.req		r3
	ff1	.req		r4
	g0	.req		r5
	g1	.req		r6
	t	.req		r7
	h1	.req		r8
	h2	.req		r9
	h3	.req		r10
	h4	.req		r11
	h5	.req		r12
	fg	.req		r14
	hs	.req		s0
	fs	.req		s1
	gs	.req		s2
	qi	.req		s3
	h0	.req		s4
	h6	.req		s5
	i 	.req		s6
	gg	.req		s7	// g at the beginning of small loop
	ff	.req		s7	// f at the beginning of small loop
	gf	.req		s8	// bound for the large loop

gf_polymul_768x768:
	push	{r0-r11,lr}
	vmov	hs, h
	vmov	fs, f
	vmov	gs, g
	//movw	t, #(qinv % 65536)
	//movt	t, #(qinv / 65536)
	//vmov	qi, t		// qinv
	vldr	qi, vqi
	vmov	gg, g		// bound of g

	vldr	i, vzero
	vmov	h0, i
	mov	h1, #0
	mov	h2, #0

	mov	fg, g		// "last g" for small loop
	vmov	gg, g
	add	t, g, #2*N
	vmov	gf, t		// bound starting g for the large loop

loop:
	mov	h3, #0
	mov	h4, #0
	mov	h5, #0
	vldr	h6, vzero
				// f is the input f, g is g+i (as short*)
loop1:				// f increases, g decreases until < fg
	cmp	g, fg
	bcc	loop2		// go to end of small loop if g<fg
	ldr	ff1, [f, #4]
	ldr	ff0, [f], #8
	ldr	g1, [g, #4]
	ldr	g0, [g], #-8

	vmov	t, h0		// SMLAxx
	smlabb	t, ff0, g0, t
	vmov	h0, t
	smladx	h1, ff0, g0, h1
	smladx	h3, ff0, g1, h3
	smladx	h3, ff1, g0, h3
	smladx	h5, ff1, g1, h5
	smlabb	h2, ff0, g1, h2
	smlatt	h4, ff1, g0, h4
	vmov	t, h6
	smlatt	t, ff1, g1, t
	vmov	h6, t
	pkhtb	ff0, ff0, ff1
	smlad	h2, ff0, g0, h2
	smlad	h4, ff0, g1, h4

	vmov	t, fs
	sub	t, f, t
	tst	t, #0xf8
	bne	loop1		// don't need to reduce

	vmov	ff0, qi
	mov	ff1, #q

	vmov	g0, h0		// reduce h0..h6
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	vmov	h0, g0
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	smmulr	t, h3, ff0
	mls	h3, t, ff1, h3
	smmulr	t, h4, ff0
	mls	h4, t, ff1, h4
	smmulr	t, h5, ff0
	mls	h5, t, ff1, h5
	vmov	g1, h6
	smmulr	t, g1, ff0
	mls	g1, t, ff1, g1
	vmov	h6, g1
	b	loop1

loop2:				// end of small loop, init next iter large loop

	vmov	ff0, qi
	mov	ff1, #q

	vmov	g0, h0		// reduce h0..h6, save h0...h3, move h4, h5, h6
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	pkhbt	h1, g0, h1, lsl #16
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	smmulr	t, h3, ff0
	mls	h3, t, ff1, h3
	smmulr	t, h3, ff0
	mls	h3, t, ff1, h3
	pkhbt	h2, h2, h3, lsl #16
	str	h2, [h, #4]
	str	h1, [h], #8
	smmulr	t, h4, ff0
	mls	h4, t, ff1, h4
	vmov	h0, h4
	smmulr	t, h5, ff0
	mls	h1, t, ff1, h5
	vmov	h2, h6
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2

	vmov	f, fs		// restore f to starting value
	vmov	g, gg		// load starting value of g for small loop
	add 	g, g, #8
	vmov	t, gf		// load g+N (as short *)
	cmp	g, t		// too large?
	vmov	gg, g
	bcc	loop		// end of large loop, go back to beginning

loopx:

	vmov	g, gs
	add	g, g, #(2*N-8)	// g starts at g+n-4
	vmov	gs, g		// save starting value of g
	add	t, f, #(2*N)
	vmov	gf, t		// bound starting f for large loop
	add	fg, f, #2*N-8	// bounds f for small loop
	add	f, f, #8	// set up starting f
	vmov	ff, f


loop3:
	mov	h3, #0
	mov	h4, #0
	mov	h5, #0
	vldr	h6, vzero

loop4:				// f is f+i-n+4, g is g+n-4 (as short*)
	cmp	fg, f
	bcc	loop5		// go to end of small loop
	ldr	ff1, [f, #4]	// f increases until >fg, g decreases
	ldr	ff0, [f], #8
	ldr	g1, [g, #4]
	ldr	g0, [g], #-8

	vmov	t, h0		// SMLAxx
	smlabb	t, ff0, g0, t
	vmov	h0, t
	smladx	h1, ff0, g0, h1
	smladx	h3, ff0, g1, h3
	smladx	h3, ff1, g0, h3
	smladx	h5, ff1, g1, h5
	smlabb	h2, ff0, g1, h2
	smlatt	h4, ff1, g0, h4
	vmov	t, h6
	smlatt	t, ff1, g1, t
	vmov	h6, t
	pkhtb	ff0, ff0, ff1
	smlad	h2, ff0, g0, h2
	smlad	h4, ff0, g1, h4

	vmov	t, ff
	sub	t, f, t
	tst	t, #0xf8
	bne	loop4		// don't need to reduce

	vmov	ff0, qi
	mov	ff1, #q

	vmov	g0, h0		// reduce h0..h6
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	vmov	h0, g0
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	smmulr	t, h3, ff0
	mls	h3, t, ff1, h3
	smmulr	t, h4, ff0
	mls	h4, t, ff1, h4
	smmulr	t, h5, ff0
	mls	h5, t, ff1, h5
	vmov	g1, h6
	smmulr	t, g1, ff0
	mls	g1, t, ff1, g1
	vmov	h6, g1
	b	loop4


loop5:				// end of small loop, init next iter large loop

	vmov	ff0, qi
	mov	ff1, #q

	vmov	g0, h0		// reduce h0..h6, save h0...h3, move h4, h5, h6
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	pkhbt	h1, g0, h1, lsl #16
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	smmulr	t, h3, ff0
	mls	h3, t, ff1, h3
	smmulr	t, h3, ff0
	mls	h3, t, ff1, h3
	pkhbt	h2, h2, h3, lsl #16
	str	h2, [h, #4]
	str	h1, [h], #8
	smmulr	t, h4, ff0
	mls	h4, t, ff1, h4
	vmov	h0, h4
	smmulr	t, h5, ff0
	mls	h1, t, ff1, h5
	vmov	h2, h6
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2

	vmov	f, ff		// restore f to starting value
	vmov	g, gs		// load starting value of g for small loop
	add 	f, f, #8
	vmov	t, gf		// load f+N (as short *)
	cmp	f, t		// too large?
	vmov	ff, f
	bcc	loop3		// end of large loop, go back to beginning

	vmov	g0, h0		// reduce h0..h2
	smmulr	t, g0, ff0
	mls	g0, t, ff1, g0
	smmulr	t, h1, ff0
	mls	h1, t, ff1, h1
	pkhbt	h1, g0, h1, lsl #16
	smmulr	t, h2, ff0
	mls	h2, t, ff1, h2
	str	h2, [h, #4]
	str	h1, [h]

	pop	{r0-r11,pc}
