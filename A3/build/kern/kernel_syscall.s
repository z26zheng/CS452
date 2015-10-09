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
	.align	2
	.global	check_tid
	.type	check_tid, %function
check_tid:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	and	r3, r3, #31
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #5
	cmp	r3, #0
	bne	.L11
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L13
.L11:
	ldr	r3, [fp, #-24]
	add	r1, r3, #4
	ldr	r3, [fp, #-28]
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
	ldr	r3, [r3, #16]
	mov	r2, r3, lsr #5
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #5
	cmp	r2, r3
	bne	.L14
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	cmp	r3, #5
	bne	.L16
.L14:
	mvn	r3, #1
	str	r3, [fp, #-32]
	b	.L13
.L16:
	mov	r3, #0
	str	r3, [fp, #-32]
.L13:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	bge	.L19
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-68]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L27
.L19:
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
	bne	.L22
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
	b	.L27
.L22:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L24
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #44]
	b	.L26
.L24:
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
.L26:
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #0]
	mov	r3, #1
	str	r3, [r2, #28]
.L27:
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
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #56
	str	r0, [fp, #-68]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L29
	ldr	r2, [fp, #-52]
	mov	r3, #3
	str	r3, [r2, #28]
	b	.L34
.L29:
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #40]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #48]
	ldr	r3, [fp, #-52]
	str	r2, [r3, #40]
	ldr	r2, [fp, #-48]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	bne	.L32
	ldr	r2, [fp, #-52]
	mov	r3, #0
	str	r3, [r2, #44]
.L32:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #72
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]
	sub	r2, fp, #56
	mov	r0, r3
	mov	r1, #56
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]
	sub	r2, fp, #60
	mov	r0, r3
	mov	r1, #64
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #56
	bl	get_message_tid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #0]
	sub	r2, fp, #64
	mov	r0, r3
	mov	r1, #60
	bl	get_message(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
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
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	kmemcpy(PLT)
	ldr	r2, [fp, #-48]
	mov	r3, #2
	str	r3, [r2, #28]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-68]
	ldr	r1, [fp, #-52]
	bl	add_to_priority(PLT)
.L34:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	bge	.L36
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L43
.L36:
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
	beq	.L39
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	mvn	r3, #2
	str	r3, [r2, #12]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L43
.L39:
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
	bge	.L41
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #0]
	mvn	r3, #3
	str	r3, [r2, #12]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L43
.L41:
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
.L43:
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
	bls	.L45
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mvn	r3, #0
	str	r3, [r2, #12]
	b	.L47
.L45:
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	tds_create_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L48
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mvn	r3, #1
	str	r3, [r2, #12]
	b	.L47
.L48:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
	ldr	r2, [fp, #-28]
	ldr	r3, .L51
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r3, .L51
	str	r1, [r2, r3]
.L47:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L52:
	.align	2
.L51:
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
	b	.L56
.L57:
	ldr	r2, [fp, #-16]
	mvn	r3, #2
	str	r3, [r2, #12]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #48]
	str	r3, [fp, #-16]
.L56:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L57
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r3, #5
	str	r3, [r2, #28]
	ldr	r2, [fp, #-20]
	ldr	r3, .L62
	ldr	r3, [r2, r3]
	sub	r1, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r3, .L62
	str	r1, [r2, r3]
	ldr	r2, [fp, #-20]
	ldr	r3, .L62
	ldr	r3, [r2, r3]
	cmp	r3, #1
	bgt	.L61
	ldr	r1, [fp, #-20]
	ldr	r2, .L62+4
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L62+8
	mov	r3, #0
	str	r3, [r1, r2]
.L61:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L63:
	.align	2
.L62:
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
	ldr	r1, .L70
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
.L71:
	.align	2
.L70:
	.word	1574956
	.size	handle_await_event, .-handle_await_event
	.align	2
	.global	handle_timer_int
	.type	handle_timer_int, %function
handle_timer_int:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, .L77
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L77+4
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L73
	ldr	r2, [fp, #-24]
	ldr	r3, .L77+8
	ldr	r3, [r2, r3]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r1, [fp, #-24]
	ldr	r2, .L77+4
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L77+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	add_to_priority(PLT)
	b	.L75
.L73:
	ldr	r2, [fp, #-24]
	ldr	r3, .L77+8
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-24]
	ldr	r3, .L77+8
	str	r1, [r2, r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	add_to_priority(PLT)
.L75:
	ldr	r2, [fp, #-20]
	mov	r3, #1
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	-2139029364
	.word	1574956
	.word	1574960
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
	beq	.L81
	b	.L82
.L81:
	ldr	r0, [fp, #-16]
	bl	handle_timer_int(PLT)
.L82:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_hwi, .-handle_hwi
	.ident	"GCC: (GNU) 4.0.2"
