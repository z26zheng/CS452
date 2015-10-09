	.file	"clock.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0337\033[HTime: %d min, %d sec, %d dsec\0338\000"
	.text
	.align	2
	.global	clock_user_task
	.type	clock_user_task, %function
clock_user_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L7
	ldr	r4, .L7+4
	ldr	r5, .L7+8
	sub	sp, sp, #4
.L5:
	add	sl, pc, sl
.L3:
	mov	r0, #10
	bl	Delay(PLT)
	smull	r2, r3, r4, r0
	mov	ip, r0, asr #31
	rsb	ip, ip, r3, asr #2
	smull	r3, r0, r4, ip
	mov	lr, ip, asr #31
	ldr	r3, .L7+12
	rsb	r0, lr, r0, asr #2
	smull	r6, r1, r3, r0
	ldr	r3, .L7+16
	add	r1, r1, r0
	smull	r6, r2, r3, ip
	mov	r3, r0, asr #31
	rsb	r3, r3, r1, asr #5
	rsb	r3, r3, r3, asl #4
	add	r1, r0, r0, asl #2
	sub	ip, ip, r1, asl #1
	sub	r3, r0, r3, asl #2
	rsb	r2, lr, r2, asr #6
	mov	r0, #1
	add	r1, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L3
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	1717986919
	.word	.LC0(GOTOFF)
	.word	-2004318071
	.word	458129845
	.size	clock_user_task, .-clock_user_task
	.ident	"GCC: (GNU) 4.0.2"
