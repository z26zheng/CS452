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
	
	sub	r3, r0, #1
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L79
	.p2align 2
.L84:
	b	.L80
	b	.L81
	b	.L82
	b	.L83
.L83:
	ldr	r2, .L86
	ldr	r3, [r2, #0]
	orr	r3, r3, #80
	str	r3, [r2, #0]
.L79:
	add	r3, r1, r0, asl #2
	ldr	r1, .L86+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L80:
	ldr	r2, .L86+8
	ldr	r3, [r2, #0]
	orr	r3, r3, #40
	str	r3, [r2, #0]
	add	r3, r1, r0, asl #2
	ldr	r1, .L86+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L81:
	ldr	r2, .L86+8
	ldr	r3, [r2, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	add	r3, r1, r0, asl #2
	ldr	r1, .L86+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L82:
	ldr	r2, .L86
	ldr	r3, [r2, #0]
	orr	r3, r3, #32
	str	r3, [r2, #0]
	add	r3, r1, r0, asl #2
	ldr	r1, .L86+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L87:
	.align	2
.L86:
	.word	-2138243052
	.word	1574956
	.word	-2138308588
	.size	handle_await_event, .-handle_await_event
	.align	2
	.global	handle_timer_int
	.type	handle_timer_int, %function
handle_timer_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	lr, .L93
	ldr	r6, .L93+4
	ldr	r2, [r0, lr]
	mov	r5, #0
	cmp	r2, r5
	ldreq	r3, [r0, r6]
	mov	r4, r6
	addeq	r3, r3, #1
	mov	r1, r2
	streq	r3, [r0, r6]
	beq	.L91
	ldr	r3, [r0, r6]
	str	r5, [r0, lr]
	add	r3, r3, #1
	str	r3, [r2, #12]
	str	r5, [r0, r6]
	bl	add_to_priority(PLT)
.L91:
	ldr	r3, .L93+8
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L94:
	.align	2
.L93:
	.word	1574956
	.word	1574976
	.word	-2139029364
	.size	handle_timer_int, .-handle_timer_int
	.align	2
	.global	handle_uart1_combined_int
	.type	handle_uart1_combined_int, %function
handle_uart1_combined_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L114
	mov	r6, r0
	ldr	ip, [r3, #0]
	tst	ip, #4
	beq	.L96
	sub	r3, r3, #4
	ldr	r2, [r3, #0]
	tst	r2, #32
	beq	.L110
.L96:
	tst	ip, #1
	beq	.L99
	ldr	r3, .L114+4
	ldr	r2, [r3, #0]
	tst	r2, #1
	bne	.L111
.L99:
	tst	ip, #2
	beq	.L103
	ldr	r3, .L114+8
	ldr	r2, [r3, #0]
	tst	r2, #64
	bne	.L112
.L103:
	ldr	lr, .L114+12
	ldr	r3, [r6, lr]
	tst	r3, #1
	ldmeqfd	sp!, {r4, r5, r6, pc}
.L113:
	tst	r3, #2
	ldmeqfd	sp!, {r4, r5, r6, pc}
	ldr	r0, .L114+16
	mov	r2, #0
	ldr	r1, [r6, r0]
	ldr	ip, .L114+20
	bic	r3, r3, #3
	str	r3, [r6, lr]
	str	r2, [r1, #12]
	ldr	r3, [ip, #0]
	str	r2, [r6, r0]
	bic	r3, r3, #40
	mov	r0, r6
	str	r3, [ip, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	add_to_priority(PLT)
.L111:
	sub	r3, r3, #236
	ldr	r2, [r3, #0]
	tst	r2, #1
	beq	.L99
	ldr	r1, .L114+12
	ldr	r0, .L114+20
	ldr	r3, [r6, r1]
	orr	r3, r3, #2
	str	r3, [r6, r1]
	ldr	r2, [r0, #0]
	bic	r2, r2, #8
	str	r2, [r0, #0]
	b	.L99
.L110:
	ldr	r1, .L114+12
	ldr	r0, .L114+20
	ldr	r3, [r6, r1]
	orr	r3, r3, #1
	str	r3, [r6, r1]
	ldr	r2, [r0, #0]
	bic	r2, r2, #32
	str	r2, [r0, #0]
	b	.L96
.L112:
	ldr	lr, .L114+20
	ldr	r4, .L114
	ldr	r5, .L114+24
	sub	r3, r3, #24
	ldr	ip, [r3, #0]
	ldr	r2, [lr, #0]
	ldr	r0, [r4, #0]
	ldr	r1, [r6, r5]
	mov	r3, #0
	bic	r2, r2, #16
	bic	r0, r0, #2
	and	ip, ip, #255
	str	r2, [lr, #0]
	str	r3, [r6, r5]
	str	r0, [r4, #0]
	str	ip, [r1, #12]
	mov	r0, r6
	bl	add_to_priority(PLT)
	ldr	lr, .L114+12
	ldr	r3, [r6, lr]
	tst	r3, #1
	bne	.L113
	ldmfd	sp!, {r4, r5, r6, pc}
.L115:
	.align	2
.L114:
	.word	-2138308580
	.word	-2138308348
	.word	-2138308584
	.word	1574980
	.word	1574960
	.word	-2138308588
	.word	1574964
	.size	handle_uart1_combined_int, .-handle_uart1_combined_int
	.align	2
	.global	handle_uart2_combined_int
	.type	handle_uart2_combined_int, %function
handle_uart2_combined_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r3, .L138
	ldr	ip, .L138+4
	ldr	r5, [r3, #0]
	ldr	r4, [ip, #0]
	tst	r5, #4
	mov	r7, r0
	beq	.L117
	ands	ip, r4, #32
	beq	.L136
.L117:
	mov	r3, r5, lsr #1
	ands	r6, r3, #1
	bne	.L120
	tst	r5, #8
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
.L120:
	ands	lr, r4, #16
	ldmnefd	sp!, {r4, r5, r6, r7, pc}
	ldr	ip, .L138+8
	ldr	r4, [r7, ip]
	ldr	r3, [r4, #0]
	msr cpsr_c, #0xdf
	add r3, r3, #56
	ldmfd r3, {r0, r1, r2}
	msr cpsr_c, #0xd3
	
	cmp	r6, #0
	str	lr, [r7, ip]
	mov	lr, r1
	mov	ip, r2
	beq	.L124
	ldr	r1, .L138+12
	ldr	r0, .L138
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	bic	r3, r3, #16
	bic	r2, r2, #2
	str	r3, [r1, #0]
	str	r2, [r0, #0]
.L126:
	cmp	ip, #0
	ble	.L132
.L137:
	ldr	r2, .L138+4
	ldr	r3, [r2, #0]
	ands	r3, r3, #16
	ldreq	r0, .L138+16
	moveq	r1, r3
	bne	.L132
.L129:
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	strb	r3, [lr, r1]
	add	r1, r1, #1
	cmp	ip, r1
	beq	.L130
	ldr	r3, [r2, #0]
	tst	r3, #16
	beq	.L129
	b	.L130
.L124:
	tst	r5, #8
	beq	.L126
	ldr	r1, .L138+12
	ldr	r0, .L138
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	bic	r3, r3, #64
	bic	r2, r2, #8
	cmp	ip, #0
	str	r3, [r1, #0]
	str	r2, [r0, #0]
	bgt	.L137
.L132:
	mov	r1, #0
.L130:
	ldr	r2, .L138+12
	str	r1, [r4, #12]
	ldr	r3, [r2, #0]
	mov	r0, r7
	bic	r3, r3, #80
	mov	r1, r4
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	add_to_priority(PLT)
.L136:
	ldr	r3, .L138+20
	ldr	r2, .L138+12
	ldr	r1, [r0, r3]
	str	ip, [r0, r3]
	str	ip, [r1, #12]
	ldr	r3, [r2, #0]
	bic	r3, r3, #32
	str	r3, [r2, #0]
	bl	add_to_priority(PLT)
	b	.L117
.L139:
	.align	2
.L138:
	.word	-2138243044
	.word	-2138243048
	.word	1574972
	.word	-2138243052
	.word	-2138243072
	.word	1574968
	.size	handle_uart2_combined_int, .-handle_uart2_combined_int
	.align	2
	.global	handle_hwi
	.type	handle_hwi, %function
handle_hwi:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #52
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	beq	.L143
	cmp	r1, #54
	beq	.L144
	cmp	r1, #51
	ldmnefd	sp!, {r4, pc}
	ldmfd	sp!, {r4, lr}
	b	handle_timer_int(PLT)
.L143:
	bl	handle_uart1_combined_int(PLT)
.L144:
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	b	handle_uart2_combined_int(PLT)
	.size	handle_hwi, .-handle_hwi
	.align	2
	.global	handle_death
	.type	handle_death, %function
handle_death:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #0]
	@ lr needed for prologue
	mov	ip, r0
	ldr	r3, [r1, #0]
	msr cpsr_c, #0xdf
	add r3, r3, #56
	ldmfd r3, {r0}
	msr cpsr_c, #0xd3
	
	ldr	r2, .L155
	cmp	r0, r2
	beq	.L154
	mov	r0, ip
	b	add_to_priority(PLT)
.L154:
	add	r0, ip, #1572864
	mov	r3, #0
	add	r0, r0, #1696
	mov	r2, r3
.L149:
	add	r3, r3, #1
	cmp	r3, #17
	str	r2, [r0], #16
	bxeq	lr
	add	r3, r3, #1
	cmp	r3, #17
	str	r2, [r0], #16
	bne	.L149
	bx	lr
.L156:
	.align	2
.L155:
	.word	-559038737
	.size	handle_death, .-handle_death
	.ident	"GCC: (GNU) 4.0.2"
