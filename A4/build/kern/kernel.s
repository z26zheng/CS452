	.file	"kernel.c"
	.text
	.align	2
	.global	cache_init
	.type	cache_init, %function
cache_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	MRC p15, 0, r0, c1, c0, 0
	ORR r0, r0, #0x5
	ORR r0, r0, #0x1000
	MCR p15, 0, r0, c1, c0, 0
	
	bx	lr
	.size	cache_init, .-cache_init
	.align	2
	.global	hwi_cleanup
	.type	hwi_cleanup, %function
hwi_cleanup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L5
	ldr	lr, .L5+4
	ldr	r4, .L5+8
	mvn	ip, #0
	ldr	r1, [lr, #0]
	ldr	r0, [r4, #0]
	str	ip, [r3, #0]
	ldr	r3, .L5+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L5+16
	bic	r1, r1, #121
	bic	r0, r0, #120
	str	r1, [lr, #0]
	str	r0, [r4, #0]
	str	ip, [r3, #0]
	ldmfd	sp!, {r4, pc}
.L6:
	.align	2
.L5:
	.word	-2146697196
	.word	-2138308588
	.word	-2138243052
	.word	-2139029364
	.word	-2146762732
	.size	hwi_cleanup, .-hwi_cleanup
	.align	2
	.global	hwi_init
	.type	hwi_init, %function
hwi_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L9
	ldr	r0, .L9+4
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	bic	r3, r3, #5767168
	orr	r2, r2, #5767168
	str	r3, [r1, #0]
	@ lr needed for prologue
	str	r2, [r0, #0]
	bx	lr
.L10:
	.align	2
.L9:
	.word	-2146697204
	.word	-2146697200
	.size	hwi_init, .-hwi_init
	.align	2
	.global	kernel_init
	.type	kernel_init, %function
kernel_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L18
	ldr	r1, .L18+4
	mov	r2, #0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	str	r2, [r4, r3]
	mov	r0, r2
	str	r2, [r4, #0]
	add	r1, r4, r1
	mov	r3, r2
.L12:
	add	r3, r3, #1
	cmp	r3, #5
	str	r0, [r1], #4
	bne	.L12
	ldr	r3, .L18+8
	ldr	r2, .L18+12
	str	r0, [r4, r3]
	mov	r1, #2
	add	r3, r3, #4
	str	r0, [r4, r2]
	str	r1, [r4, r3]
	bl	hwi_cleanup(PLT)
	bl	hwi_init(PLT)
	bl	init_kernelentry(PLT)
	bl	cache_init(PLT)
	mov	r0, r4
	bl	tds_init(PLT)
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	b	init_schedulers(PLT)
.L19:
	.align	2
.L18:
	.word	1574824
	.word	1574956
	.word	1574976
	.word	1574548
	.size	kernel_init, .-kernel_init
	.align	2
	.global	get_lowest_set_bit
	.type	get_lowest_set_bit, %function
get_lowest_set_bit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r2, r1, #0
	and	r2, r2, r1
	rsb	r3, r2, r2, asl #9
	add	r3, r2, r3, asl #3
	rsb	r3, r2, r3, asl #5
	add	r3, r2, r3, asl #2
	rsb	r3, r3, r3, asl #4
	add	r2, r2, r3, asl #4
	mov	r2, r2, lsr #27
	ldr	r3, .L22
	add	r0, r0, r2, asl #2
	ldr	r0, [r0, r3]
	@ lr needed for prologue
	bx	lr
.L23:
	.align	2
.L22:
	.word	1574828
	.size	get_lowest_set_bit, .-get_lowest_set_bit
	.align	2
	.global	clean_set_bit
	.type	clean_set_bit, %function
clean_set_bit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	mov	r2, #1
	eor	r3, r3, r2, asl r1
	@ lr needed for prologue
	str	r3, [r0, #0]
	bx	lr
	.size	clean_set_bit, .-clean_set_bit
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #4
	add	r3, sp, #4
	mvn	r2, #0
	str	r2, [r3, #-4]!
	mov	r4, r1
	str	r1, [r0, #0]
	mov	r3, sp
	ldr	r0, [r1, #12]
	ldr	r2, [r4, #8]
	ldr	r1, [r1, #0]
	bl	kernel_exit(PLT)
	mov r0, r0
	mov r1, r1
	mov r2, r2
	mov r3, r3
	
	str	r3, [r4, #12]
	ldr	r3, [sp, #0]
	str	r1, [r4, #0]
	cmp	r3, #171
	moveq	r0, #100
	str	r2, [r4, #8]
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	activate, .-activate
	.align	2
	.global	handle
	.type	handle, %function
handle:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r1, r1, #1
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r5, r0
	cmp	r1, #99
	addls	pc, pc, r1, asl #2
	b	.L49
	.p2align 2
.L43:
	b	.L32
	b	.L33
	b	.L34
	b	.L35
	b	.L36
	b	.L37
	b	.L38
	b	.L39
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L49
	b	.L40
	b	.L41
	b	.L42
.L32:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_create(PLT)
.L42:
	mov	r6, #0
	mov	r7, #1
.L44:
	ldr	r3, .L52
	ldr	r4, [r3, r6, asl #11]
	b	.L45
.L46:
	eor	r4, r4, r7, asl r3
	bl	handle_hwi(PLT)
.L45:
	mov	r1, r4
	mov	r0, r5
	bl	get_lowest_set_bit(PLT)
	subs	r3, r0, #0
	add	r1, r3, r6
	mov	r0, r5
	bne	.L46
	add	r6, r6, #32
	cmp	r6, #64
	bne	.L44
	ldr	r1, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	add_to_priority(PLT)
.L41:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_exit(PLT)
.L40:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_death(PLT)
.L49:
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L39:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_await_event(PLT)
.L38:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_reply(PLT)
.L37:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_receive(PLT)
.L36:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_send(PLT)
.L35:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_pass(PLT)
.L34:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_my_parent_tid(PLT)
.L33:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_my_tid(PLT)
.L53:
	.align	2
.L52:
	.word	-2146762752
	.size	handle, .-handle
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1574984
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	sub	sp, sp, #1572864
	sub	sp, sp, #2112
	ldr	sl, .L61
	ldr	r2, .L61+4
	sub	sp, sp, #8
	ldr	r4, .L61+8
.L59:
	add	sl, pc, sl
	add	r2, sp, r2
	mov	r0, sp
	add	r4, r2, r4
	bl	kernel_init(PLT)
	ldr	r3, .L61+12
	mov	r1, #8
	ldr	r2, [sl, r3]
	mov	r0, sp
	bl	tds_create_td(PLT)
	add	r2, sp, #1572864
	ldr	r3, [r2, #1684]
	mov	r1, r0
	add	r3, r3, #1
	mov	r0, sp
	str	r3, [r2, #1684]
	bl	add_to_priority(PLT)
	b	.L55
.L60:
	bl	activate(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	handle(PLT)
.L55:
	mov	r0, r4
	bl	schedule(PLT)
	subs	r1, r0, #0
	mov	r0, r4
	bne	.L60
	bl	hwi_cleanup(PLT)
	mov	r0, #0
	add	sp, sp, #72
	add	sp, sp, #2048
	add	sp, sp, #1572864
	ldmfd	sp!, {r4, sl, pc}
.L62:
	.align	2
.L61:
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	1574984
	.word	-1574984
	.word	first_user_task(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
