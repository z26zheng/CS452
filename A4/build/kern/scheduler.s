	.file	"scheduler.c"
	.text
	.align	2
	.global	init_schedulers
	.type	init_schedulers, %function
init_schedulers:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L8
	stmfd	sp!, {r4, lr}
	mov	lr, #0
	mov	ip, r0
	add	r2, r0, r2
	mov	r4, lr
.L2:
	mov	r3, lr, asl #4
	str	lr, [r3, r2]
	add	lr, lr, #1
	add	r3, r3, r2
	cmp	lr, #17
	str	r4, [r3, #12]
	str	r4, [r3, #4]
	str	r4, [r3, #8]
	bne	.L2
	ldr	r3, .L8+4
	mov	r1, #9
	ldr	r2, .L8+8
	str	r1, [ip, r3]
	sub	r1, r1, #8
	sub	r3, r3, #120
	str	r4, [ip, r2]
	str	r1, [ip, r3]
	mov	r2, #28
	add	r3, r3, #4
	str	r2, [ip, r3]
	add	r1, r1, #1
	add	r3, r3, #4
	str	r1, [ip, r3]
	add	r2, r2, #1
	add	r3, r3, #4
	str	r2, [ip, r3]
	add	r1, r1, #12
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #5
	add	r3, r3, #4
	str	r2, [ip, r3]
	sub	r1, r1, #11
	add	r3, r3, #4
	str	r1, [ip, r3]
	add	r2, r2, #6
	add	r3, r3, #4
	str	r2, [ip, r3]
	add	r1, r1, #19
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #10
	add	r3, r3, #4
	str	r2, [ip, r3]
	sub	r1, r1, #7
	add	r3, r3, #4
	str	r1, [ip, r3]
	ldr	r2, .L8+12
	add	r3, r3, #4
	mov	r0, #25
	str	r0, [ip, r3]
	sub	r1, r1, #11
	add	r3, r3, #8
	str	lr, [ip, r2]
	str	r1, [ip, r3]
	mov	r2, #8
	add	r3, r3, #4
	str	r2, [ip, r3]
	add	r1, r1, #27
	add	r3, r3, #4
	str	r1, [ip, r3]
	add	r2, r2, #19
	add	r3, r3, #4
	str	r2, [ip, r3]
	sub	r1, r1, #18
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #4
	add	r3, r3, #4
	str	r2, [ip, r3]
	add	r1, r1, #8
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #4
	add	r3, r3, #4
	str	r2, [ip, r3]
	sub	r1, r1, #5
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #12
	add	r3, r3, #4
	str	r2, [ip, r3]
	add	r1, r1, #10
	add	r3, r3, #4
	str	r1, [ip, r3]
	add	r2, r2, #5
	add	r3, r3, #4
	str	r2, [ip, r3]
	sub	r1, r1, #8
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #6
	add	r3, r3, #4
	str	r2, [ip, r3]
	sub	r1, r1, #7
	add	r3, r3, #4
	str	r1, [ip, r3]
	sub	r2, r2, #1
	add	r3, r3, #4
	str	r2, [ip, r3]
	ldr	r2, .L8+16
	sub	r1, r1, #1
	add	r3, r3, #4
	str	r1, [ip, r3]
	str	r4, [ip, r2]
	ldmfd	sp!, {r4, pc}
.L9:
	.align	2
.L8:
	.word	1574552
	.word	1574952
	.word	1574828
	.word	1574880
	.word	1574824
	.size	init_schedulers, .-init_schedulers
	.align	2
	.global	add_to_priority
	.type	add_to_priority, %function
add_to_priority:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L16
	ldr	lr, [r1, #24]
	add	r3, r0, r3
	add	ip, r3, lr, asl #4
	ldr	r3, [ip, #12]
	ldr	r4, .L16+4
	cmp	r3, #0
	strne	r1, [r3, #36]
	ldr	r3, [ip, #8]
	ldr	r2, [r0, r4]
	cmp	r3, #0
	mov	r3, #0
	str	r3, [r1, #28]
	add	r3, r3, #1
	orr	r2, r2, r3, asl lr
	str	r2, [r0, r4]
	ldr	r3, [ip, #4]
	streq	r1, [ip, #8]
	add	r3, r3, #1
	str	r1, [ip, #12]
	str	r3, [ip, #4]
	ldmfd	sp!, {r4, pc}
.L17:
	.align	2
.L16:
	.word	1574552
	.word	1574824
	.size	add_to_priority, .-add_to_priority
	.align	2
	.global	schedule
	.type	schedule, %function
schedule:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L25
	mov	r4, r0
	ldr	r1, [r0, r5]
	bl	get_lowest_set_bit(PLT)
	ldr	r3, .L25+4
	cmp	r0, #0
	add	r3, r4, r3
	add	r1, r3, r0, asl #4
	mov	ip, r0
	beq	.L21
	ldr	ip, [r1, #8]
	ldr	r3, [ip, #36]
	cmp	r3, #0
	ldreq	r2, [r4, r5]
	str	r3, [r1, #8]
	streq	r3, [r1, #12]
	addeq	r3, r3, #1
	eoreq	r2, r2, r3, asl r0
	streq	r2, [r4, r5]
	ldr	r2, [r1, #4]
	mov	r3, #0
	sub	r2, r2, #1
	str	r3, [ip, #36]
	str	r2, [r1, #4]
.L21:
	mov	r0, ip
	ldmfd	sp!, {r4, r5, pc}
.L26:
	.align	2
.L25:
	.word	1574824
	.word	1574552
	.size	schedule, .-schedule
	.ident	"GCC: (GNU) 4.0.2"
