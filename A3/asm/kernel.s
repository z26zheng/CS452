	.file	"kernel.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"#################################\012\015\000"
	.align	2
.LC1:
	.ascii	"#\011OPT:\011OFF\011\011#\012\015\000"
	.align	2
.LC2:
	.ascii	"#\011CACHE:\011OFF\011\011#\012\015\000"
	.align	2
.LC3:
	.ascii	"#\011ASSERT:\011LEVEL %d\011\011#\012\015\000"
	.text
	.align	2
	.global	print_env
	.type	print_env, %function
print_env:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #0
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
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
	.global	hwi_cleanup
	.type	hwi_cleanup, %function
hwi_cleanup:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	r2, .L10
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L10+4
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L10+8
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #0]
	ldmfd	sp, {r3, fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	-2146762732
	.word	-2146697196
	.word	-2139029364
	.size	hwi_cleanup, .-hwi_cleanup
	.align	2
	.global	hwi_init
	.type	hwi_init, %function
hwi_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	r2, .L14
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L14+4
	ldr	r3, .L14+4
	ldr	r3, [r3, #0]
	orr	r3, r3, #524288
	str	r3, [r2, #0]
	ldmfd	sp, {fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	-2146697204
	.word	-2146697200
	.size	hwi_init, .-hwi_init
	.align	2
	.global	kernel_init
	.type	kernel_init, %function
kernel_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r1, [fp, #-20]
	ldr	r2, .L21
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L17
.L18:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r1, .L21+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L17:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	ble	.L18
	ldr	r1, [fp, #-20]
	ldr	r2, .L21+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L21+12
	mov	r3, #0
	str	r3, [r1, r2]
	bl	hwi_cleanup(PLT)
	bl	hwi_init(PLT)
	bl	init_kernelentry(PLT)
	ldr	r0, [fp, #-20]
	bl	tds_init(PLT)
	ldr	r0, [fp, #-20]
	bl	init_schedulers(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	1574824
	.word	1574956
	.word	1574548
	.word	1574960
	.size	kernel_init, .-kernel_init
	.align	2
	.global	get_lowest_set_bit
	.type	get_lowest_set_bit, %function
get_lowest_set_bit:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-24]
	and	r3, r2, r3
	mov	r1, r3
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
	ldr	r2, [fp, #-20]
	ldr	r1, .L25
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	1574828
	.size	get_lowest_set_bit, .-get_lowest_set_bit
	.align	2
	.global	clean_set_bit
	.type	clean_set_bit, %function
clean_set_bit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	mov	r2, #1
	ldr	r3, [fp, #-20]
	mov	r3, r2, asl r3
	eor	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	clean_set_bit, .-clean_set_bit
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Assert failed (%s:%d):\011%s\012\015\012\015\000"
	.align	2
.LC5:
	.ascii	"kernel.c\000"
	.text
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L39
.L38:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	sub	ip, fp, #24
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, ip
	bl	kernel_exit(PLT)
	mov r0, r0
	mov r1, r1
	mov r2, r2
	mov r3, r3
	
	str	r0, [fp, #-20]
	mov	r0, r1
	ldr	r1, [fp, #-32]
	str	r0, [r1, #0]
	mov	r1, r2
	ldr	r2, [fp, #-32]
	str	r1, [r2, #8]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	cmp	r3, #171
	beq	.L30
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	beq	.L30
	mov	r0, #1
	ldr	r3, .L39+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L39+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #112
	bl	bwprintf(PLT)
.L30:
	ldr	r3, [fp, #-24]
	cmp	r3, #171
	bne	.L33
	mov	r3, #100
	str	r3, [fp, #-20]
.L33:
	mvn	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	sub	r3, r3, #48896
	sub	r3, r3, #252
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #1676]
	cmp	r2, r3
	beq	.L35
	mov	r0, #1
	ldr	r3, .L39+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L39+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #122
	bl	bwprintf(PLT)
.L35:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	activate, .-activate
	.align	2
	.global	handle
	.type	handle, %function
handle:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	cmp	r3, #99
	addls	pc, pc, r3, asl #2
	b	.L60
	.p2align 2
.L53:
	b	.L43
	b	.L44
	b	.L45
	b	.L46
	b	.L47
	b	.L48
	b	.L49
	b	.L50
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L60
	b	.L51
	b	.L54
.L55:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #16
	add	r3, r3, #-2147483648
	add	r3, r3, #720896
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	b	.L56
.L57:
	sub	r3, fp, #24
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	clean_set_bit(PLT)
	ldr	r3, [fp, #-16]
	mov	r2, r3, asl #5
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-20]
	bl	handle_hwi(PLT)
.L56:
	ldr	r3, [fp, #-24]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	get_lowest_set_bit(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L57
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L54:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	ble	.L55
	b	.L60
.L43:
	ldr	r0, [fp, #-28]
	bl	handle_create(PLT)
	b	.L60
.L44:
	ldr	r0, [fp, #-28]
	bl	handle_my_tid(PLT)
	b	.L60
.L45:
	ldr	r0, [fp, #-28]
	bl	handle_my_parent_tid(PLT)
	b	.L60
.L47:
	ldr	r0, [fp, #-28]
	bl	handle_send(PLT)
	b	.L60
.L48:
	ldr	r0, [fp, #-28]
	bl	handle_receive(PLT)
	b	.L60
.L49:
	ldr	r0, [fp, #-28]
	bl	handle_reply(PLT)
	b	.L60
.L46:
	ldr	r0, [fp, #-28]
	bl	handle_pass(PLT)
	b	.L60
.L50:
	ldr	r0, [fp, #-28]
	bl	handle_await_event(PLT)
	b	.L60
.L51:
	ldr	r0, [fp, #-28]
	bl	handle_exit(PLT)
.L60:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle, .-handle
	.section	.rodata
	.align	2
.LC6:
	.ascii	"LOADING... WE ARE FASTER THAN WINDOWS :)\015\012\000"
	.align	2
.LC7:
	.ascii	"FINISHED INITIALIZATION. WOO!\015\012\000"
	.align	2
.LC8:
	.ascii	"\012\015Exit Main\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1574984
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1572864
	sub	sp, sp, #2112
	sub	sp, sp, #8
	ldr	sl, .L67
.L66:
	add	sl, pc, sl
	ldr	r3, .L67+4
	sub	r2, fp, #16
	str	r0, [r2, r3]
	ldr	r3, .L67+8
	sub	r0, fp, #16
	str	r1, [r0, r3]
	bl	print_env(PLT)
	mov	r0, #1
	ldr	r3, .L67+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	sub	r3, fp, #1572864
	sub	r3, r3, #16
	sub	r3, r3, #2112
	mov	r0, r3
	bl	kernel_init(PLT)
	ldr	r3, .L67+16
	ldr	r3, [sl, r3]
	mov	r2, r3
	sub	r3, fp, #1572864
	sub	r3, r3, #16
	sub	r3, r3, #2112
	mov	r0, r3
	mov	r1, #8
	bl	tds_create_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L67+20
	ldr	r2, .L67+24
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	add	r1, r3, #1
	ldr	r3, .L67+20
	ldr	r2, .L67+24
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	sub	r3, fp, #1572864
	sub	r3, r3, #16
	sub	r3, r3, #2112
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	add_to_priority(PLT)
	mov	r0, #1
	ldr	r3, .L67+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
.L62:
	sub	r3, fp, #1572864
	sub	r3, r3, #16
	sub	r3, r3, #2112
	mov	r0, r3
	bl	schedule(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L63
	sub	r3, fp, #1572864
	sub	r3, r3, #16
	sub	r3, r3, #2112
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	sub	r3, fp, #1572864
	sub	r3, r3, #16
	sub	r3, r3, #2112
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	handle(PLT)
	b	.L62
.L63:
	bl	hwi_cleanup(PLT)
	mov	r0, #1
	ldr	r3, .L67+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	_GLOBAL_OFFSET_TABLE_-(.L66+8)
	.word	-1574980
	.word	-1574984
	.word	.LC6(GOTOFF)
	.word	first_user_task(GOT)
	.word	-1574976
	.word	1574548
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
