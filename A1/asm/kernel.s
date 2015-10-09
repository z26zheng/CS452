	.file	"kernel.c"
	.text
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
	ldr	r2, .L3
	mov	r3, #0
	str	r3, [r1, r2]
	bl	init_regs(PLT)
	bl	init_kernelentry(PLT)
	ldr	r0, [fp, #-16]
	bl	tds_init(PLT)
	ldr	r0, [fp, #-16]
	bl	init_schedulers(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	1574420
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
	ldr	sl, .L10
.L9:
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
	ldr	r3, [r3, #1292]
	cmp	r2, r3
	beq	.L6
	mov	r0, #1
	ldr	r3, .L10+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L10+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #40
	bl	bwprintf(PLT)
.L6:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.L9+8)
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
	cmp	r3, #3
	beq	.L16
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bgt	.L19
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	beq	.L14
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	beq	.L15
	b	.L20
.L19:
	ldr	r3, [fp, #-24]
	cmp	r3, #4
	beq	.L17
	ldr	r3, [fp, #-24]
	cmp	r3, #99
	beq	.L18
	b	.L20
.L14:
	ldr	r0, [fp, #-16]
	bl	handle_create(PLT)
	b	.L20
.L15:
	ldr	r0, [fp, #-16]
	bl	handle_my_tid(PLT)
	b	.L20
.L16:
	ldr	r0, [fp, #-16]
	bl	handle_my_parent_tid(PLT)
	b	.L20
.L17:
	ldr	r0, [fp, #-16]
	bl	handle_pass(PLT)
	b	.L20
.L18:
	ldr	r0, [fp, #-16]
	bl	handle_kill(PLT)
.L20:
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
	.ascii	"\012\015Goodbye\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1574572
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1572864
	sub	sp, sp, #1696
	sub	sp, sp, #12
	ldr	sl, .L27
.L26:
	add	sl, pc, sl
	ldr	r3, .L27+4
	sub	r2, fp, #16
	str	r0, [r2, r3]
	ldr	r3, .L27+8
	sub	r2, fp, #16
	str	r1, [r2, r3]
	mov	r0, #1
	ldr	r3, .L27+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	ldr	r3, .L27+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	bl	kernel_init(PLT)
	mov	r0, #1
	ldr	r3, .L27+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	ldr	r3, .L27+24
	ldr	r3, [sl, r3]
	mov	r2, r3
	ldr	r3, .L27+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, #5
	bl	tds_create_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L27+16
	sub	r2, fp, #16
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	add_to_priority(PLT)
.L22:
	ldr	r3, .L27+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	bl	schedule(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L23
	ldr	r3, .L27+16
	sub	r2, fp, #16
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L27+16
	sub	r1, fp, #16
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	handle(PLT)
	b	.L22
.L23:
	mov	r0, #1
	ldr	r3, .L27+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	-1574568
	.word	-1574572
	.word	.LC2(GOTOFF)
	.word	-1574564
	.word	.LC3(GOTOFF)
	.word	first_user_task(GOT)
	.word	.LC4(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
