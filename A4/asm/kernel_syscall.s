	.file	"kernel_syscall.c"
	.text
	.align	2
	.global	kmemcpy
	.type	kmemcpy, %function
kmemcpy:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	ip, r2, #1
	cmn	ip, #1
	@ lr needed for prologue
	add	r3, r2, r0
	add	r1, r2, r1
	bxeq	lr
	mov	r2, r3
	rsb	r3, ip, r3
	sub	r0, r3, #1
.L4:
	ldrb	r3, [r1, #-1]!	@ zero_extendqisi2
	strb	r3, [r2, #-1]!
	cmp	r2, r0
	bne	.L4
	bx	lr
	.size	kmemcpy, .-kmemcpy
	.align	2
	.global	get_message_tid
	.type	get_message_tid, %function
get_message_tid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	mov	r3, r0
	mov	r2, r1
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	mov	r0, r1
	bx	lr
	.size	get_message_tid, .-get_message_tid
	.align	2
	.global	get_message
	.type	get_message, %function
get_message:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, r2
	@ lr needed for prologue
	mov	r3, r0
	mov	r2, r1
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	str	r1, [ip, #0]
	bx	lr
	.size	get_message, .-get_message
	.align	2
	.global	check_tid
	.type	check_tid, %function
check_tid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	and	r2, r1, #31
	add	r3, r2, r2, asl #1
	add	r2, r2, r3, asl #2
	add	r0, r0, #4
	movs	r1, r1, lsr #5
	@ lr needed for prologue
	mvn	ip, #0
	add	r2, r0, r2, asl #2
	beq	.L15
	ldr	r3, [r2, #16]
	mvn	ip, #1
	cmp	r1, r3, lsr #5
	bne	.L15
	ldr	r3, [r2, #28]
	cmp	r3, #5
	addne	ip, ip, #2
.L15:
	mov	r0, ip
	bx	lr
	.size	check_tid, .-check_tid
	.align	2
	.global	handle_send
	.type	handle_send, %function
handle_send:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #0]
	sub	sp, sp, #12
	mov	r6, r0
	mov	r1, #72
	ldr	r0, [r3, #0]
	bl	get_message_tid(PLT)
	ldr	r3, [r6, #0]
	mov	r4, r0
	add	r2, sp, #8
	ldr	r0, [r3, #0]
	mov	r1, #56
	bl	get_message(PLT)
	ldr	r3, [r6, #0]
	add	r2, sp, #4
	mov	r1, #64
	mov	r9, r0
	ldr	r0, [r3, #0]
	bl	get_message(PLT)
	mov	r1, r4
	mov	r0, r6
	bl	check_tid(PLT)
	and	r4, r4, #31
	add	r3, r4, r4, asl #1
	add	r4, r4, r3, asl #2
	mov	r8, r4, asl #2
	subs	ip, r0, #0
	add	r4, r6, #4
	add	r7, r4, r8
	mov	r0, r6
	blt	.L30
	ldr	r3, [r7, #28]
	mov	r1, #56
	cmp	r3, #3
	beq	.L31
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L32
	ldr	r1, [r6, #0]
	ldr	r3, [r7, #44]
	str	r1, [r3, #48]
	ldr	r2, [r6, #0]
	mov	r3, #0
	str	r2, [r7, #44]
	ldr	r1, [r6, #0]
	str	r3, [r1, #48]
.L28:
	ldr	r2, [r6, #0]
	mov	r3, #1
	str	r3, [r2, #28]
.L29:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L32:
	ldr	r3, [r6, #0]
	str	r3, [r7, #40]
	ldr	r2, [r6, #0]
	str	r2, [r7, #44]
	b	.L28
.L31:
	ldr	r0, [r4, r8]
	bl	get_message_tid(PLT)
	mov	r1, #60
	mov	r5, r0
	mov	r2, sp
	ldr	r0, [r4, r8]
	bl	get_message(PLT)
	ldr	r2, [r6, #0]
	mov	r1, r9
	ldr	r3, [r2, #16]
	str	r3, [r5, #0]
	ldr	r3, [sp, #0]
	ldr	r4, [sp, #8]
	cmp	r4, r3
	movge	r4, r3
	mov	r2, r4
	bl	kmemcpy(PLT)
	str	r4, [r7, #12]
	mov	r1, r7
	mov	r0, r6
	bl	add_to_priority(PLT)
	ldr	r2, [r6, #0]
	mov	r3, #2
	str	r3, [r2, #28]
	b	.L29
.L30:
	ldr	r1, [r6, #0]
	str	ip, [r1, #12]
	bl	add_to_priority(PLT)
	b	.L29
	.size	handle_send, .-handle_send
	.align	2
	.global	handle_receive
	.type	handle_receive, %function
handle_receive:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, [r0, #0]
	sub	sp, sp, #12
	ldr	r6, [r7, #40]
	mov	r1, #72
	cmp	r6, #0
	moveq	r3, #3
	mov	r8, r0
	streq	r3, [r7, #28]
	beq	.L39
	ldr	r2, [r6, #48]
	mov	r3, #0
	cmp	r2, r3
	streq	r2, [r7, #44]
	str	r3, [r6, #48]
	str	r2, [r7, #40]
	ldr	r0, [r6, #0]
	bl	get_message_tid(PLT)
	mov	r1, #56
	add	r2, sp, #8
	ldr	r0, [r6, #0]
	bl	get_message(PLT)
	add	r2, sp, #4
	mov	r4, r0
	mov	r1, #64
	ldr	r0, [r6, #0]
	bl	get_message(PLT)
	mov	r1, #56
	ldr	r0, [r7, #0]
	bl	get_message_tid(PLT)
	mov	r1, #60
	mov	r5, r0
	mov	r2, sp
	ldr	r0, [r7, #0]
	bl	get_message(PLT)
	ldr	r3, [r6, #16]
	mov	r1, r4
	str	r3, [r5, #0]
	ldr	r3, [sp, #0]
	ldr	r4, [sp, #8]
	cmp	r4, r3
	movge	r4, r3
	mov	r2, r4
	bl	kmemcpy(PLT)
	mov	r3, #2
	str	r3, [r6, #28]
	str	r4, [r7, #12]
	mov	r0, r8
	mov	r1, r7
	bl	add_to_priority(PLT)
.L39:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.size	handle_receive, .-handle_receive
	.align	2
	.global	handle_reply
	.type	handle_reply, %function
handle_reply:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #0]
	mov	r5, r0
	sub	sp, sp, #8
	ldr	r0, [r3, #0]
	mov	r1, #56
	bl	get_message_tid(PLT)
	mov	r4, r0
	mov	r1, r4
	mov	r0, r5
	bl	check_tid(PLT)
	and	r4, r4, #31
	add	r3, r4, r4, asl #1
	add	r4, r4, r3, asl #2
	mov	r8, r4, asl #2
	add	r6, r5, #4
	subs	r2, r0, #0
	add	r7, r6, r8
	mov	r0, r5
	blt	.L49
	ldr	r3, [r7, #28]
	mov	r0, r5
	cmp	r3, #2
	add	r2, sp, #4
	mov	r1, #60
	beq	.L44
	ldr	r1, [r5, #0]
	mvn	r3, #2
	str	r3, [r1, #12]
	bl	add_to_priority(PLT)
.L48:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L44:
	ldr	r3, [r5, #0]
	ldr	r0, [r3, #0]
	bl	get_message(PLT)
	mov	r2, sp
	mov	r4, r0
	mov	r1, #64
	ldr	r0, [r6, r8]
	bl	get_message(PLT)
	ldmia	sp, {r3, ip}	@ phole ldm
	mov	r1, r4
	cmp	r3, ip
	mov	r2, ip
	blt	.L50
	bl	kmemcpy(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, [r5, #0]
	mov	r1, #0
	str	r2, [r7, #12]
	mov	r0, r5
	str	r1, [r3, #12]
	mov	r1, r7
	bl	add_to_priority(PLT)
	mov	r0, r5
	ldr	r1, [r5, #0]
	bl	add_to_priority(PLT)
	b	.L48
.L50:
	ldr	r1, [r5, #0]
	mvn	r3, #3
	mov	r0, r5
	str	r3, [r1, #12]
	bl	add_to_priority(PLT)
	b	.L48
.L49:
	ldr	r1, [r5, #0]
	str	r2, [r1, #12]
	bl	add_to_priority(PLT)
	b	.L48
	.size	handle_reply, .-handle_reply
	.align	2
	.global	handle_create
	.type	handle_create, %function
handle_create:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	lr, [r0, #0]
	mov	r4, r0
	ldr	r3, [lr, #0]
	msr cpsr_c, #0xdf
	add r3, r3, #56
	ldmfd r3, {r0, r1}
	msr cpsr_c, #0xd3
	
	mov	ip, r0
	cmp	ip, #16
	mvnhi	r3, #0
	mov	r2, r1
	mov	r0, r4
	mov	r1, ip
	strhi	r3, [lr, #12]
	bls	.L58
.L54:
	mov	r0, r4
	mov	r1, lr
	ldmfd	sp!, {r4, lr}
	b	add_to_priority(PLT)
.L58:
	bl	tds_create_td(PLT)
	subs	r3, r0, #0
	mov	r1, r3
	mov	r0, r4
	beq	.L59
	ldr	r2, [r4, #0]
	ldr	r3, [r3, #16]
	str	r3, [r2, #12]
	bl	add_to_priority(PLT)
	ldr	r2, .L60
	ldr	lr, [r4, #0]
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	b	.L54
.L59:
	ldr	lr, [r4, #0]
	mvn	r3, #1
	str	r3, [lr, #12]
	b	.L54
.L61:
	.align	2
.L60:
	.word	1574548
	.size	handle_create, .-handle_create
	.align	2
	.global	handle_pass
	.type	handle_pass, %function
handle_pass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #0]
	@ lr needed for prologue
	b	add_to_priority(PLT)
	.size	handle_pass, .-handle_pass
	.align	2
	.global	handle_exit
	.type	handle_exit, %function
handle_exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r0, [r0, #0]
	ldr	r4, [r0, #40]
	cmp	r4, #0
	beq	.L65
	mvn	r6, #2
.L66:
	str	r6, [r4, #12]
	mov	r1, r4
	mov	r0, r5
	bl	add_to_priority(PLT)
	ldr	r4, [r4, #48]
	cmp	r4, #0
	bne	.L66
	ldr	r0, [r5, #0]
.L65:
	ldr	r3, .L72
	mov	r1, #5
	ldr	r2, [r5, r3]
	str	r1, [r0, #28]
	sub	r2, r2, #1
	cmp	r2, #1
	str	r2, [r5, r3]
	ldrle	r1, .L72+4
	ldrle	r2, .L72+8
	movle	r3, #0
	strle	r3, [r5, r2]
	strle	r3, [r5, r1]
	ldmfd	sp!, {r4, r5, r6, pc}
.L73:
	.align	2
.L72:
	.word	1574548
	.word	1574816
	.word	1574820
	.size	handle_exit, .-handle_exit
	.align	2
	.global	handle_my_tid
	.type	handle_my_tid, %function
handle_my_tid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	@ lr needed for prologue
	ldr	r2, [r3, #16]
	mov	r1, r3
	str	r2, [r3, #12]
	b	add_to_priority(PLT)
	.size	handle_my_tid, .-handle_my_tid
	.align	2
	.global	handle_my_parent_tid
	.type	handle_my_parent_tid, %function
handle_my_parent_tid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	@ lr needed for prologue
	ldr	r2, [r3, #20]
	mov	r1, r3
	str	r2, [r3, #12]
	b	add_to_priority(PLT)
	.size	handle_my_parent_tid, .-handle_my_parent_tid
	.align	2
	.global	handle_await_event
	.type	handle_await_event, %function
handle_await_event:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [r0, #0]
	@ lr needed for prologue
	mov	r1, r0
	ldr	r3, [ip, #0]
	msr cpsr_c, #0xdf
	add r3, r3, #56
	ldmfd r3, {r0}
	msr cpsr_c, #0xd3
	
	ldr	r3, .L80
	add	r1, r1, r0, asl #2
	mov	r2, #4
	str	ip, [r1, r3]
	str	r2, [ip, #28]
	bx	lr
.L81:
	.align	2
.L80:
	.word	1574956
	.size	handle_await_event, .-handle_await_event
	.align	2
	.global	handle_timer_int
	.type	handle_timer_int, %function
handle_timer_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	ip, .L87
	ldr	r5, .L87+4
	ldr	r2, [r0, ip]
	mov	lr, #0
	cmp	r2, lr
	mov	r6, r5
	mov	r4, r0
	mov	r1, r2
	beq	.L83
	ldr	r3, [r0, r5]
	str	lr, [r0, ip]
	add	r3, r3, #1
	str	r3, [r2, #12]
	str	lr, [r0, r5]
	bl	add_to_priority(PLT)
	mov	r0, r4
	ldr	r1, [r4, #0]
	bl	add_to_priority(PLT)
	ldr	r3, .L87+8
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L83:
	ldr	r3, [r0, r5]
	ldr	r1, [r0, #0]
	add	r3, r3, #1
	str	r3, [r0, r5]
	bl	add_to_priority(PLT)
	ldr	r3, .L87+8
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L88:
	.align	2
.L87:
	.word	1574956
	.word	1574960
	.word	-2139029364
	.size	handle_timer_int, .-handle_timer_int
	.align	2
	.global	handle_hwi
	.type	handle_hwi, %function
handle_hwi:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #51
	@ lr needed for prologue
	bxne	lr
	b	handle_timer_int(PLT)
	.size	handle_hwi, .-handle_hwi
	.ident	"GCC: (GNU) 4.0.2"
