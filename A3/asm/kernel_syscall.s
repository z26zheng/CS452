	.file	"kernel_syscall.c"
	.text
	.align	2
	.global	kmemcpy
	.type	kmemcpy, %function
kmemcpy:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	strb	r3, [r2, #0]
.L2:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kmemcpy, .-kmemcpy
	.align	2
	.global	get_message_tid
	.type	get_message_tid, %function
get_message_tid:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	mov	r3, r1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	get_message_tid, .-get_message_tid
	.align	2
	.global	get_message
	.type	get_message, %function
get_message:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	get_message, .-get_message
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Assert failed (%s:%d):\011%s\012\015\012\015\000"
	.align	2
.LC1:
	.ascii	"kernel_syscall.c\000"
	.text
	.align	2
	.global	check_tid
	.type	check_tid, %function
check_tid:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	and	r3, r3, #31
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L11
	mov	r0, #1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L23+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #61
	bl	bwprintf(PLT)
.L11:
	ldr	r3, [fp, #-24]
	cmp	r3, #31
	ble	.L13
	mov	r0, #1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L23+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #62
	bl	bwprintf(PLT)
.L13:
	ldr	r3, [fp, #-32]
	mov	r3, r3, lsr #5
	cmp	r3, #0
	bne	.L15
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L17
.L15:
	ldr	r3, [fp, #-28]
	add	r1, r3, #4
	ldr	r3, [fp, #-32]
	and	r2, r3, #31
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	mov	r2, r3, lsr #5
	ldr	r3, [fp, #-32]
	mov	r3, r3, lsr #5
	cmp	r2, r3
	bne	.L18
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #28]
	cmp	r3, #5
	bne	.L20
.L18:
	mvn	r3, #1
	str	r3, [fp, #-36]
	b	.L17
.L20:
	mov	r3, #0
	str	r3, [fp, #-36]
.L17:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	check_tid, .-check_tid
	.align	2
	.global	handle_send
	.type	handle_send, %function
handle_send:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #56
	str	r0, [fp, #-68]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #72
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	sub	r2, fp, #56
	mov	r0, r3
	mov	r1, #56
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	sub	r2, fp, #60
	mov	r0, r3
	mov	r1, #64
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r0, [fp, #-68]
	ldr	r1, [fp, #-52]
	bl	check_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bge	.L26
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-68]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L34
.L26:
	ldr	r3, [fp, #-68]
	add	r1, r3, #4
	ldr	r3, [fp, #-52]
	and	r2, r3, #31
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	cmp	r3, #3
	bne	.L29
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #56
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, #60
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-48]
	mov	r2, r3
	bl	kmemcpy(PLT)
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-68]
	ldr	r1, [fp, #-36]
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	mov	r3, #2
	str	r3, [r2, #28]
	b	.L34
.L29:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #44]
	b	.L33
.L31:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #44]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	str	r3, [r2, #48]
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #44]
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #48]
.L33:
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	mov	r3, #1
	str	r3, [r2, #28]
.L34:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_send, .-handle_send
	.align	2
	.global	handle_receive
	.type	handle_receive, %function
handle_receive:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #56
	ldr	sl, .L45
.L44:
	add	sl, pc, sl
	str	r0, [fp, #-72]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L36
	ldr	r2, [fp, #-56]
	mov	r3, #3
	str	r3, [r2, #28]
	b	.L43
.L36:
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #40]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #28]
	cmp	r3, #1
	beq	.L39
	mov	r0, #1
	ldr	r3, .L45+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L45+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #166
	bl	bwprintf(PLT)
.L39:
	ldr	r3, [fp, #-52]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-56]
	str	r2, [r3, #40]
	ldr	r2, [fp, #-52]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L41
	ldr	r2, [fp, #-56]
	mov	r3, #0
	str	r3, [r2, #44]
.L41:
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #72
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	sub	r2, fp, #60
	mov	r0, r3
	mov	r1, #56
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, #64
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #56
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #0]
	sub	r2, fp, #68
	mov	r0, r3
	mov	r1, #60
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-52]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-44]
	mov	r2, r3
	bl	kmemcpy(PLT)
	ldr	r2, [fp, #-52]
	mov	r3, #2
	str	r3, [r2, #28]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-72]
	ldr	r1, [fp, #-56]
	bl	add_to_priority(PLT)
.L43:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	handle_receive, .-handle_receive
	.align	2
	.global	handle_reply
	.type	handle_reply, %function
handle_reply:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #56
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-32]
	bl	check_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L48
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L55
.L48:
	ldr	r3, [fp, #-44]
	add	r1, r3, #4
	ldr	r3, [fp, #-32]
	and	r2, r3, #31
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	cmp	r3, #2
	beq	.L51
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	mvn	r3, #2
	str	r3, [r2, #12]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L55
.L51:
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, #60
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, fp, #40
	mov	r0, r3
	mov	r1, #64
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bge	.L53
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	mvn	r3, #3
	str	r3, [r2, #12]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L55
.L53:
	ldr	r3, [fp, #-36]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	kmemcpy(PLT)
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
.L55:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_reply, .-handle_reply
	.align	2
	.global	handle_create
	.type	handle_create, %function
handle_create:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	msr cpsr_c, #0xdf
	add r3, r3, #56
	ldmfd r3, {r0, r1}
	msr cpsr_c, #0xd3
	
	str	r0, [fp, #-24]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r3, #16
	bls	.L57
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mvn	r3, #0
	str	r3, [r2, #12]
	b	.L59
.L57:
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	tds_create_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L60
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mvn	r3, #1
	str	r3, [r2, #12]
	b	.L59
.L60:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
	ldr	r2, [fp, #-28]
	ldr	r3, .L63
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r3, .L63
	str	r1, [r2, r3]
.L59:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L64:
	.align	2
.L63:
	.word	1574548
	.size	handle_create, .-handle_create
	.align	2
	.global	handle_pass
	.type	handle_pass, %function
handle_pass:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	add_to_priority(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
	.size	handle_pass, .-handle_pass
	.align	2
	.global	handle_exit
	.type	handle_exit, %function
handle_exit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #40]
	str	r3, [fp, #-16]
	b	.L68
.L69:
	ldr	r2, [fp, #-16]
	mvn	r3, #2
	str	r3, [r2, #12]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #48]
	str	r3, [fp, #-16]
.L68:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L69
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r3, #5
	str	r3, [r2, #28]
	ldr	r2, [fp, #-20]
	ldr	r3, .L74
	ldr	r3, [r2, r3]
	sub	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, .L74
	str	r1, [r2, r3]
	ldr	r2, [fp, #-20]
	ldr	r3, .L74
	ldr	r3, [r2, r3]
	cmp	r3, #1
	bgt	.L73
	ldr	r1, [fp, #-20]
	ldr	r2, .L74+4
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L74+8
	mov	r3, #0
	str	r3, [r1, r2]
.L73:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L75:
	.align	2
.L74:
	.word	1574548
	.word	1574816
	.word	1574820
	.size	handle_exit, .-handle_exit
	.align	2
	.global	handle_my_tid
	.type	handle_my_tid, %function
handle_my_tid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_my_tid, .-handle_my_tid
	.align	2
	.global	handle_my_parent_tid
	.type	handle_my_parent_tid, %function
handle_my_parent_tid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_my_parent_tid, .-handle_my_parent_tid
	.align	2
	.global	handle_await_event
	.type	handle_await_event, %function
handle_await_event:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	msr cpsr_c, #0xdf
	add r3, r3, #56
	ldmfd r3, {r0}
	msr cpsr_c, #0xd3
	
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	ip, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r1, .L82
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r3, #4
	str	r3, [r2, #28]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L83:
	.align	2
.L82:
	.word	1574956
	.size	handle_await_event, .-handle_await_event
	.align	2
	.global	handle_timer_int
	.type	handle_timer_int, %function
handle_timer_int:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L92
.L91:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, .L92+4
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, .L92+8
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L85
	ldr	r2, [fp, #-28]
	ldr	r3, .L92+12
	ldr	r3, [r2, r3]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r1, [fp, #-28]
	ldr	r2, .L92+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-28]
	ldr	r2, .L92+12
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-20]
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L89
	mov	r0, #1
	ldr	r3, .L92+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L92+20
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, .L92+24
	bl	bwprintf(PLT)
	b	.L89
.L85:
	ldr	r2, [fp, #-28]
	ldr	r3, .L92+12
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r3, .L92+12
	str	r1, [r2, r3]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	add_to_priority(PLT)
.L89:
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L93:
	.align	2
.L92:
	.word	_GLOBAL_OFFSET_TABLE_-(.L91+8)
	.word	-2139029364
	.word	1574956
	.word	1574960
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	365
	.size	handle_timer_int, .-handle_timer_int
	.align	2
	.global	handle_hwi
	.type	handle_hwi, %function
handle_hwi:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #51
	beq	.L96
	b	.L97
.L96:
	ldr	r0, [fp, #-16]
	bl	handle_timer_int(PLT)
.L97:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_hwi, .-handle_hwi
	.ident	"GCC: (GNU) 4.0.2"
