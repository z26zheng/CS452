	.file	"timer.c"
	.data
	.align	2
	.type	pre_tick, %object
	.size	pre_tick, 4
pre_tick:
	.word	200
	.text
	.align	2
	.global	timer_init
	.type	timer_init, %function
timer_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L4+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #200
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r2, r3, #8
	mov	r3, #192
	str	r3, [r2, #0]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	glb_time(GOT)
	.size	timer_init, .-timer_init
	.align	2
	.global	timer_get
	.type	timer_get, %function
timer_get:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	timer_get, .-timer_get
	.align	2
	.global	timer_ready
	.type	timer_ready, %function
timer_ready:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L15
.L14:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	timer_get(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L9
	ldr	r3, .L15+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	bcs	.L9
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L12
.L9:
	mov	r3, #0
	str	r3, [fp, #-28]
.L12:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.L14+8)
	.word	pre_tick(GOT)
	.size	timer_ready, .-timer_ready
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[s\033[3;5HTimer: %d min, %d sec, %d dsec\012\015"
	.ascii	"\033[u\000"
	.text
	.align	2
	.global	timer_update_buf
	.type	timer_update_buf, %function
timer_update_buf:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	ldr	r3, .L20+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L20+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L20+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L20+8
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #6
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r2, r3
	mov	r2, r2, asl #2
	add	r2, r2, r3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	rsb	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L20+12
	umull	r1, r3, r2, r3
	mov	r3, r3, lsr #3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-28]
	rsb	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L20+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	plprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	glb_time(GOT)
	.word	458129845
	.word	-858993459
	.word	.LC0(GOTOFF)
	.size	timer_update_buf, .-timer_update_buf
	.align	2
	.global	timer_get_time
	.type	timer_get_time, %function
timer_get_time:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	ldr	r3, .L25+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	glb_time(GOT)
	.size	timer_get_time, .-timer_get_time
	.bss
	.align	2
glb_time:
	.space	4
	.ident	"GCC: (GNU) 4.0.2"
