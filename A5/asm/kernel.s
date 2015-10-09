	.file	"kernel.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"#################################\012\015\000"
	.align	2
.LC1:
	.ascii	"#\011OPT:\011ON\011\011#\012\015\000"
	.align	2
.LC2:
	.ascii	"#\011CACHE:\011OFF\011\011#\012\015\000"
	.align	2
.LC3:
	.ascii	"#\011ASSERT:\011OFF\011\011#\012\015\000"
	.text
	.align	2
	.global	print_env
	.type	print_env, %function
print_env:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L4
	ldr	r3, .L4+4
.L3:
	add	sl, pc, sl
	add	r4, sl, r3
	mov	r1, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L4+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L4+12
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L4+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r1, r4
	mov	r0, #1
	ldmfd	sp!, {r4, sl, lr}
	b	bwprintf(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	print_env, .-print_env
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
	@ link register save eliminated.
	ldr	r3, .L10
	mvn	r0, #0
	str	r0, [r3, #0]
	ldr	r2, .L10+4
	ldr	r3, .L10+8
	mov	r1, #1
	str	r1, [r3, #0]
	@ lr needed for prologue
	str	r0, [r2, #0]
	bx	lr
.L11:
	.align	2
.L10:
	.word	-2146697196
	.word	-2146762732
	.word	-2139029364
	.size	hwi_cleanup, .-hwi_cleanup
	.align	2
	.global	hwi_init
	.type	hwi_init, %function
hwi_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L14
	ldr	r3, .L14+4
	ldr	r2, [r0, #0]
	mov	r1, #0
	orr	r2, r2, #524288
	str	r1, [r3, #0]
	@ lr needed for prologue
	str	r2, [r0, #0]
	bx	lr
.L15:
	.align	2
.L14:
	.word	-2146697200
	.word	-2146697204
	.size	hwi_init, .-hwi_init
	.align	2
	.global	kernel_init
	.type	kernel_init, %function
kernel_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L18
	ldr	r2, .L18+4
	mov	r1, #0
	stmfd	sp!, {r4, lr}
	str	r1, [r0, r3]
	str	r1, [r0, r2]
	sub	r3, r3, #4
	sub	r2, r2, #276
	mov	r4, r0
	str	r1, [r0, r3]
	str	r1, [r0, r2]
	str	r1, [r0, #0]
	bl	hwi_cleanup(PLT)
	bl	hwi_init(PLT)
	bl	init_kernelentry(PLT)
	mov	r0, r4
	bl	tds_init(PLT)
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	b	init_schedulers(PLT)
.L19:
	.align	2
.L18:
	.word	1574960
	.word	1574824
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
	b	.L47
	.p2align 2
.L42:
	b	.L32
	b	.L33
	b	.L34
	b	.L35
	b	.L36
	b	.L37
	b	.L38
	b	.L39
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L40
	b	.L41
.L47:
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
.L32:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_create(PLT)
.L41:
	mov	r6, #0
	mov	r7, #1
.L43:
	ldr	r3, .L50
	ldr	r4, [r3, r6, asl #11]
	b	.L44
.L45:
	eor	r4, r4, r7, asl r3
	bl	handle_hwi(PLT)
.L44:
	mov	r1, r4
	mov	r0, r5
	bl	get_lowest_set_bit(PLT)
	subs	r3, r0, #0
	add	r1, r3, r6
	mov	r0, r5
	bne	.L45
	add	r6, r6, #32
	cmp	r6, #64
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	b	.L43
.L40:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_exit(PLT)
.L51:
	.align	2
.L50:
	.word	-2146762752
	.size	handle, .-handle
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"LOADING... WE ARE FASTER THAN WINDOWS :)\015\012\000"
	.align	2
.LC5:
	.ascii	"FINISHED INITIALIZATION. WOO!\015\012\000"
	.align	2
.LC6:
	.ascii	"\012\015Exit Main\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1574964
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L59
	sub	sp, sp, #1572864
	sub	sp, sp, #2096
	sub	sp, sp, #4
.L57:
	add	sl, pc, sl
	bl	print_env(PLT)
	ldr	r2, .L59+4
	ldr	r1, .L59+8
	ldr	r4, .L59+12
	add	r2, sp, r2
	add	r1, sl, r1
	mov	r0, #1
	add	r4, r2, r4
	bl	bwputstr(PLT)
	mov	r0, sp
	bl	kernel_init(PLT)
	ldr	r3, .L59+16
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
	ldr	r1, .L59+20
	mov	r0, #1
	add	r1, sl, r1
	bl	bwputstr(PLT)
	b	.L53
.L58:
	bl	activate(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	handle(PLT)
.L53:
	mov	r0, r4
	bl	schedule(PLT)
	subs	r1, r0, #0
	mov	r0, r4
	bne	.L58
	bl	hwi_cleanup(PLT)
	ldr	r1, .L59+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r0, #0
	add	sp, sp, #52
	add	sp, sp, #2048
	add	sp, sp, #1572864
	ldmfd	sp!, {r4, sl, pc}
.L60:
	.align	2
.L59:
	.word	_GLOBAL_OFFSET_TABLE_-(.L57+8)
	.word	1574964
	.word	.LC4(GOTOFF)
	.word	-1574964
	.word	first_user_task(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
