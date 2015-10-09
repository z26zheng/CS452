	.file	"kernel.c"
	.text
	.align	2
	.global	cache_init
	.type	cache_init, %function
cache_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	MRC p15, 0, r0, c1, c0, 0
	ORR r0, r0, #0x5
	ORR r0, r0, #0x1000
	MCR p15, 0, r0, c1, c0, 0
	
	ldmfd	sp, {fp, sp, pc}
	.size	cache_init, .-cache_init
	.align	2
	.global	kernel_init
	.type	kernel_init, %function
kernel_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r1, [fp, #-16]
	ldr	r2, .L5
	mov	r3, #0
	str	r3, [r1, r2]
	bl	init_kernelentry(PLT)
	ldr	r0, [fp, #-16]
	bl	tds_init(PLT)
	ldr	r0, [fp, #-16]
	bl	init_schedulers(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	1574804
	.size	kernel_init, .-kernel_init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Assert failed (%s:%d):\011%s\012\015\012\015\000"
	.align	2
.LC1:
	.ascii	"kernel.c\000"
	.text
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-36]
	ldr	r1, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	mov	r0, r2
	mov	r2, r3
	bl	kernel_exit(PLT)
	mov r0, r0
	mov r1, r1
	mov r2, r2
	
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-24]
	str	r3, [r1, #0]
	str	r2, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	sub	r3, r3, #48896
	sub	r3, r3, #252
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1676]
	cmp	r2, r3
	beq	.L8
	mov	r0, #1
	ldr	r3, .L12+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L12+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #55
	bl	bwprintf(PLT)
.L8:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	activate, .-activate
	.align	2
	.global	handle
	.type	handle, %function
handle:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #4
	beq	.L19
	ldr	r3, [fp, #-24]
	cmp	r3, #4
	bgt	.L24
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	beq	.L17
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bgt	.L18
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	beq	.L16
	b	.L25
.L24:
	ldr	r3, [fp, #-24]
	cmp	r3, #6
	beq	.L21
	ldr	r3, [fp, #-24]
	cmp	r3, #6
	blt	.L20
	ldr	r3, [fp, #-24]
	cmp	r3, #7
	beq	.L22
	ldr	r3, [fp, #-24]
	cmp	r3, #99
	beq	.L23
	b	.L25
.L16:
	ldr	r0, [fp, #-16]
	bl	handle_create(PLT)
	b	.L25
.L17:
	ldr	r0, [fp, #-16]
	bl	handle_my_tid(PLT)
	b	.L25
.L18:
	ldr	r0, [fp, #-16]
	bl	handle_my_parent_tid(PLT)
	b	.L25
.L20:
	ldr	r0, [fp, #-16]
	bl	handle_send(PLT)
	b	.L25
.L21:
	ldr	r0, [fp, #-16]
	bl	handle_receive(PLT)
	b	.L25
.L22:
	ldr	r0, [fp, #-16]
	bl	handle_reply(PLT)
	b	.L25
.L19:
	ldr	r0, [fp, #-16]
	bl	handle_pass(PLT)
	b	.L25
.L23:
	ldr	r0, [fp, #-16]
	bl	handle_exit(PLT)
.L25:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle, .-handle
	.section	.rodata
	.align	2
.LC2:
	.ascii	"LOADING... WE ARE FASTER THAN WINDOWS :)\015\012\000"
	.align	2
.LC3:
	.ascii	"FINISHED INITIALIZATION. WOO!\015\012\000"
	.align	2
.LC4:
	.ascii	"\012\015Exit Main\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1574956
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1572864
	sub	sp, sp, #2080
	sub	sp, sp, #12
	ldr	sl, .L32
.L31:
	add	sl, pc, sl
	ldr	r3, .L32+4
	sub	r2, fp, #16
	str	r0, [r2, r3]
	ldr	r3, .L32+8
	sub	r2, fp, #16
	str	r1, [r2, r3]
	mov	r0, #1
	ldr	r3, .L32+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	ldr	r3, .L32+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	bl	kernel_init(PLT)
	ldr	r3, .L32+20
	ldr	r3, [sl, r3]
	mov	r2, r3
	ldr	r3, .L32+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, #5
	bl	tds_create_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L32+16
	sub	r2, fp, #16
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	add_to_priority(PLT)
	mov	r0, #1
	ldr	r3, .L32+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
.L27:
	ldr	r3, .L32+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	bl	schedule(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L28
	ldr	r3, .L32+16
	sub	r2, fp, #16
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L32+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	handle(PLT)
	b	.L27
.L28:
	mov	r0, #1
	ldr	r3, .L32+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	-1574952
	.word	-1574956
	.word	.LC2(GOTOFF)
	.word	-1574948
	.word	first_user_task(GOT)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
