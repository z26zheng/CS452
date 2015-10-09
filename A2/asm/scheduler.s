	.file	"scheduler.c"
	.text
	.align	2
	.global	get_highest_priority
	.type	get_highest_priority, %function
get_highest_priority:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L3
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-20]
	and	r1, r2, r3
	mov	r3, r1
	mov	r3, r3, asl #9
	rsb	r3, r1, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r3, r3, asl #5
	rsb	r3, r1, r3
	mov	r3, r3, asl #2
	add	r3, r3, r1
	mov	r2, r3, asl #4
	rsb	r2, r3, r2
	mov	r2, r2, asl #4
	add	r3, r2, r1
	mov	r3, r3, lsr #27
	ldr	r2, [fp, #-24]
	ldr	r1, .L3+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	1574804
	.word	1574808
	.size	get_highest_priority, .-get_highest_priority
	.align	2
	.global	init_schedulers
	.type	init_schedulers, %function
init_schedulers:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L6
.L7:
	ldr	r3, [fp, #-24]
	ldr	r2, .L10
	add	r2, r3, r2
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #4
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L6:
	ldr	r3, [fp, #-20]
	cmp	r3, #16
	ble	.L7
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+4
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+12
	mov	r3, #1
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+16
	mov	r3, #28
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+20
	mov	r3, #2
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+24
	mov	r3, #29
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+28
	mov	r3, #14
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+32
	mov	r3, #24
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+36
	mov	r3, #3
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+40
	mov	r3, #30
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+44
	mov	r3, #22
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+48
	mov	r3, #20
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+52
	mov	r3, #15
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+56
	mov	r3, #25
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+60
	mov	r3, #17
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+64
	mov	r3, #4
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+68
	mov	r3, #8
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+72
	mov	r3, #31
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+76
	mov	r3, #27
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+80
	mov	r3, #13
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+84
	mov	r3, #23
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+88
	mov	r3, #21
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+92
	mov	r3, #19
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+96
	mov	r3, #16
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+100
	mov	r3, #7
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+104
	mov	r3, #26
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+108
	mov	r3, #12
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+112
	mov	r3, #18
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+116
	mov	r3, #6
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+120
	mov	r3, #11
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+124
	mov	r3, #5
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+128
	mov	r3, #10
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L10+132
	mov	r3, #9
	str	r3, [r1, r2]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	1574548
	.word	1574804
	.word	1574808
	.word	1574812
	.word	1574816
	.word	1574820
	.word	1574824
	.word	1574828
	.word	1574832
	.word	1574836
	.word	1574840
	.word	1574844
	.word	1574848
	.word	1574852
	.word	1574856
	.word	1574860
	.word	1574864
	.word	1574868
	.word	1574872
	.word	1574876
	.word	1574880
	.word	1574884
	.word	1574888
	.word	1574892
	.word	1574896
	.word	1574900
	.word	1574904
	.word	1574908
	.word	1574912
	.word	1574916
	.word	1574920
	.word	1574924
	.word	1574928
	.word	1574932
	.size	init_schedulers, .-init_schedulers
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Assert failed (%s:%d):\011%s\012\015\012\015\000"
	.align	2
.LC1:
	.ascii	"scheduler.c\000"
	.align	2
.LC2:
	.ascii	"ERROR: should not pass in priority = 0\000"
	.text
	.align	2
	.global	add_to_priority
	.type	add_to_priority, %function
add_to_priority:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L13
	ldr	r3, .L25+4
	add	r3, sl, r3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L25+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L25+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #59
	bl	bwprintf(PLT)
.L13:
	ldr	r3, [fp, #-32]
	ldr	r2, .L25+16
	add	r2, r3, r2
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #4
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L15
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #36]
.L15:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L17
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #8]
.L17:
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #28]
	ldr	r2, [fp, #-32]
	ldr	r3, .L25+20
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-28]
	mov	r3, #1
	mov	r3, r3, asl r2
	orr	r1, r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L25+20
	str	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L19
	mov	r0, #1
	ldr	r3, .L25+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L25+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #75
	bl	bwprintf(PLT)
.L19:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	cmp	r3, #32
	bls	.L23
	mov	r0, #1
	ldr	r3, .L25+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L25+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #76
	bl	bwprintf(PLT)
.L23:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC2(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	1574548
	.word	1574804
	.size	add_to_priority, .-add_to_priority
	.align	2
	.global	schedule
	.type	schedule, %function
schedule:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	ldr	r0, [fp, #-28]
	bl	get_highest_priority(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L28
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L30
.L28:
	ldr	r3, [fp, #-28]
	ldr	r2, .L34
	add	r2, r3, r2
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #4
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #36]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L31
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r2, [fp, #-28]
	ldr	r3, .L34+4
	ldr	r1, [r2, r3]
	mov	r2, #1
	ldr	r3, [fp, #-24]
	mov	r3, r2, asl r3
	eor	r1, r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, .L34+4
	str	r1, [r2, r3]
.L31:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-32]
.L30:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	1574548
	.word	1574804
	.size	schedule, .-schedule
	.ident	"GCC: (GNU) 4.0.2"
