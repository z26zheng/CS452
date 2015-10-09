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
	and	r2, r1, #127
	add	r3, r2, r2, asl #1
	add	r2, r2, r3, asl #2
	add	r0, r0, #4
	movs	r1, r1, lsr #7
	@ lr needed for prologue
	mvn	ip, #0
	add	r2, r0, r2, asl #2
	beq	.L15
	ldr	r3, [r2, #16]
	mvn	ip, #1
	cmp	r1, r3, lsr #7
	bne	.L15
	ldr	r3, [r2, #28]
	cmp	r3, #5
	addne	ip, ip, #2
.L15:
	mov	r0, ip
	bx	lr
	.size	check_tid, .-check_tid
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
	bls	.L27
.L23:
	mov	r0, r4
	mov	r1, lr
	ldmfd	sp!, {r4, lr}
	b	add_to_priority(PLT)
.L27:
	bl	tds_create_td(PLT)
	subs	r3, r0, #0
	mov	r1, r3
	mov	r0, r4
	beq	.L28
	ldr	r2, [r4, #0]
	ldr	r3, [r3, #16]
	str	r3, [r2, #12]
	bl	add_to_priority(PLT)
	ldr	r2, .L29
	ldr	lr, [r4, #0]
	ldr	r3, [r4, r2]
	add	r3, r3, #1
	str	r3, [r4, r2]
	b	.L23
.L28:
	ldr	lr, [r4, #0]
	mvn	r3, #1
	str	r3, [lr, #12]
	b	.L23
.L30:
	.align	2
.L29:
	.word	14686740
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
	beq	.L34
	mvn	r6, #2
.L35:
	str	r6, [r4, #12]
	mov	r1, r4
	mov	r0, r5
	bl	add_to_priority(PLT)
	ldr	r4, [r4, #48]
	cmp	r4, #0
	bne	.L35
	ldr	r0, [r5, #0]
.L34:
	ldr	r3, .L41
	mov	r1, #5
	ldr	r2, [r5, r3]
	str	r1, [r0, #28]
	sub	r2, r2, #1
	cmp	r2, #1
	str	r2, [r5, r3]
	ldrle	r1, .L41+4
	ldrle	r2, .L41+8
	movle	r3, #0
	strle	r3, [r5, r2]
	strle	r3, [r5, r1]
	ldmfd	sp!, {r4, r5, r6, pc}
.L42:
	.align	2
.L41:
	.word	14686740
	.word	14687008
	.word	14687012
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
	b	.L48
	.p2align 2
.L53:
	b	.L49
	b	.L50
	b	.L51
	b	.L52
.L52:
	ldr	r2, .L55
	ldr	r3, [r2, #0]
	orr	r3, r3, #80
	str	r3, [r2, #0]
.L48:
	add	r3, r1, r0, asl #2
	ldr	r1, .L55+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L49:
	ldr	r2, .L55+8
	ldr	r3, [r2, #0]
	orr	r3, r3, #40
	str	r3, [r2, #0]
	add	r3, r1, r0, asl #2
	ldr	r1, .L55+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L50:
	ldr	r2, .L55+8
	ldr	r3, [r2, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	add	r3, r1, r0, asl #2
	ldr	r1, .L55+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L51:
	ldr	r2, .L55
	ldr	r3, [r2, #0]
	orr	r3, r3, #32
	str	r3, [r2, #0]
	add	r3, r1, r0, asl #2
	ldr	r1, .L55+4
	mov	r2, #4
	str	r2, [ip, #28]
	str	ip, [r3, r1]
	bx	lr
.L56:
	.align	2
.L55:
	.word	-2138243052
	.word	14687148
	.word	-2138308588
	.size	handle_await_event, .-handle_await_event
	.align	2
	.global	handle_timer_int
	.type	handle_timer_int, %function
handle_timer_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	ip, .L64
	ldr	r6, .L64+4
	ldr	r2, [r0, ip]
	mov	r5, #0
	cmp	r2, r5
	ldreq	r3, [r0, r6]
	mov	lr, r6
	addeq	r3, r3, #1
	mov	r4, r0
	mov	r1, r2
	streq	r3, [r0, r6]
	beq	.L60
	ldr	r3, [r0, r6]
	str	r5, [r0, ip]
	add	r3, r3, #1
	str	r3, [r2, #12]
	str	r5, [r0, r6]
	bl	add_to_priority(PLT)
.L60:
	ldr	r1, .L64+8
	ldr	r0, [r4, #0]
	ldr	r3, [r4, r1]
	ldr	ip, .L64+12
	add	r3, r3, #1
	str	r3, [r4, r1]
	ldr	r2, [r0, #24]
	cmp	r2, #16
	ldreq	r3, [r4, ip]
	mov	r2, #1
	addeq	r3, r3, #1
	streq	r3, [r4, ip]
	ldr	r3, .L64+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, pc}
.L65:
	.align	2
.L64:
	.word	14687148
	.word	14687168
	.word	14687184
	.word	14687188
	.word	-2139029364
	.size	handle_timer_int, .-handle_timer_int
	.align	2
	.global	handle_uart1_combined_int
	.type	handle_uart1_combined_int, %function
handle_uart1_combined_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L85
	mov	r6, r0
	ldr	ip, [r3, #0]
	tst	ip, #4
	beq	.L67
	sub	r3, r3, #4
	ldr	r2, [r3, #0]
	tst	r2, #32
	beq	.L81
.L67:
	tst	ip, #1
	beq	.L70
	ldr	r3, .L85+4
	ldr	r2, [r3, #0]
	tst	r2, #1
	bne	.L82
.L72:
	ldr	r2, .L85
	ldr	r3, [r2, #0]
	bic	r3, r3, #1
	str	r3, [r2, #0]
.L70:
	tst	ip, #2
	beq	.L74
	ldr	r3, .L85+4
	ldr	r2, [r3, #0]
	tst	r2, #64
	bne	.L83
.L74:
	ldr	lr, .L85+8
	ldr	r3, [r6, lr]
	tst	r3, #1
	ldmeqfd	sp!, {r4, r5, r6, pc}
.L84:
	tst	r3, #2
	ldmeqfd	sp!, {r4, r5, r6, pc}
	ldr	r0, .L85+12
	mov	r2, #0
	ldr	r1, [r6, r0]
	ldr	ip, .L85+16
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
.L82:
	ldr	r1, .L85+8
	ldr	r0, .L85+16
	ldr	r3, [r6, r1]
	orr	r3, r3, #2
	str	r3, [r6, r1]
	ldr	r2, [r0, #0]
	bic	r2, r2, #8
	str	r2, [r0, #0]
	b	.L72
.L81:
	ldr	r1, .L85+8
	ldr	r0, .L85+16
	ldr	r3, [r6, r1]
	orr	r3, r3, #1
	str	r3, [r6, r1]
	ldr	r2, [r0, #0]
	bic	r2, r2, #32
	str	r2, [r0, #0]
	b	.L67
.L83:
	ldr	lr, .L85+16
	ldr	r4, .L85
	ldr	r5, .L85+20
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
	ldr	lr, .L85+8
	ldr	r3, [r6, lr]
	tst	r3, #1
	bne	.L84
	ldmfd	sp!, {r4, r5, r6, pc}
.L86:
	.align	2
.L85:
	.word	-2138308580
	.word	-2138308584
	.word	14687172
	.word	14687152
	.word	-2138308588
	.word	14687156
	.size	handle_uart1_combined_int, .-handle_uart1_combined_int
	.align	2
	.global	handle_uart2_combined_int
	.type	handle_uart2_combined_int, %function
handle_uart2_combined_int:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r3, .L109
	ldr	ip, .L109+4
	ldr	r5, [r3, #0]
	ldr	r4, [ip, #0]
	tst	r5, #4
	mov	r7, r0
	beq	.L88
	ands	ip, r4, #32
	beq	.L107
.L88:
	mov	r3, r5, lsr #1
	ands	r6, r3, #1
	bne	.L91
	tst	r5, #8
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
.L91:
	ands	lr, r4, #16
	ldmnefd	sp!, {r4, r5, r6, r7, pc}
	ldr	ip, .L109+8
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
	beq	.L95
	ldr	r1, .L109+12
	ldr	r0, .L109
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	bic	r3, r3, #16
	bic	r2, r2, #2
	str	r3, [r1, #0]
	str	r2, [r0, #0]
.L97:
	cmp	ip, #0
	ble	.L103
.L108:
	ldr	r2, .L109+4
	ldr	r3, [r2, #0]
	ands	r3, r3, #16
	ldreq	r0, .L109+16
	moveq	r1, r3
	bne	.L103
.L100:
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	strb	r3, [lr, r1]
	add	r1, r1, #1
	cmp	ip, r1
	beq	.L101
	ldr	r3, [r2, #0]
	tst	r3, #16
	beq	.L100
	b	.L101
.L95:
	tst	r5, #8
	beq	.L97
	ldr	r1, .L109+12
	ldr	r0, .L109
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	bic	r3, r3, #64
	bic	r2, r2, #8
	cmp	ip, #0
	str	r3, [r1, #0]
	str	r2, [r0, #0]
	bgt	.L108
.L103:
	mov	r1, #0
.L101:
	ldr	r2, .L109+12
	str	r1, [r4, #12]
	ldr	r3, [r2, #0]
	mov	r0, r7
	bic	r3, r3, #80
	mov	r1, r4
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	add_to_priority(PLT)
.L107:
	ldr	r3, .L109+20
	ldr	r2, .L109+12
	ldr	r1, [r0, r3]
	str	ip, [r0, r3]
	str	ip, [r1, #12]
	ldr	r3, [r2, #0]
	bic	r3, r3, #32
	str	r3, [r2, #0]
	bl	add_to_priority(PLT)
	b	.L88
.L110:
	.align	2
.L109:
	.word	-2138243044
	.word	-2138243048
	.word	14687164
	.word	-2138243052
	.word	-2138243072
	.word	14687160
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
	beq	.L114
	cmp	r1, #54
	beq	.L115
	cmp	r1, #51
	ldmnefd	sp!, {r4, pc}
	ldmfd	sp!, {r4, lr}
	b	handle_timer_int(PLT)
.L114:
	bl	handle_uart1_combined_int(PLT)
.L115:
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
	
	ldr	r2, .L126
	cmp	r0, r2
	beq	.L125
	mov	r0, ip
	b	add_to_priority(PLT)
.L125:
	ldr	r2, .L126+4
	mov	r3, #0
	add	r2, ip, r2
	mov	r1, r3
.L120:
	add	r3, r3, #1
	cmp	r3, #17
	str	r1, [r2], #16
	bxeq	lr
	add	r3, r3, #1
	cmp	r3, #17
	str	r1, [r2], #16
	bne	.L120
	bx	lr
.L127:
	.align	2
.L126:
	.word	-559038737
	.word	14686752
	.size	handle_death, .-handle_death
	.global	__divsi3
	.align	2
	.global	handle_idle_task_pct_cum
	.type	handle_idle_task_pct_cum, %function
handle_idle_task_pct_cum:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L130
	ldr	r5, .L130+4
	ldr	r1, [r0, r3]
	ldr	r2, [r0, r5]
	ldr	lr, .L130+8
	sub	r3, r3, #4
	add	r2, r2, r1
	ldr	ip, [r0, r3]
	ldr	r1, [r0, lr]
	mov	r4, r0
	add	r0, r2, r2, asl #2
	add	r1, r1, ip
	add	r0, r0, r0, asl #2
	str	r1, [r4, lr]
	str	r2, [r4, r5]
	mov	r0, r0, asl #2
	bl	__divsi3(PLT)
	ldr	r1, [r4, #0]
	str	r0, [r1, #12]
	mov	r0, r4
	ldmfd	sp!, {r4, r5, lr}
	b	add_to_priority(PLT)
.L131:
	.align	2
.L130:
	.word	14687188
	.word	14687180
	.word	14687176
	.size	handle_idle_task_pct_cum, .-handle_idle_task_pct_cum
	.align	2
	.global	handle_idle_task_pct_rec
	.type	handle_idle_task_pct_rec, %function
handle_idle_task_pct_rec:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L134
	mov	r4, r0
	ldr	r0, [r0, r6]
	ldr	r5, .L134+4
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	ldr	r1, [r4, r5]
	mov	r0, r0, asl #2
	bl	__divsi3(PLT)
	ldr	r1, [r4, #0]
	mov	r3, #0
	str	r0, [r1, #12]
	mov	r0, r4
	str	r3, [r4, r6]
	str	r3, [r4, r5]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	add_to_priority(PLT)
.L135:
	.align	2
.L134:
	.word	14687188
	.word	14687184
	.size	handle_idle_task_pct_rec, .-handle_idle_task_pct_rec
	.align	2
	.global	handle_send
	.type	handle_send, %function
handle_send:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r3, [r0, #0]
	mov	r5, r0
	ldr	ip, [r3, #0]
	mov	r2, #72
	mov	r3, ip
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	sub	r2, r2, #16
	mov	r3, ip
	mov	r4, r1
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	mov	r3, ip
	mov	r6, r1
	mov	r7, r0
	add	r2, r2, #8
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	mov	r0, r5
	mov	r1, r4
	bl	check_tid(PLT)
	subs	r3, r0, #0
	blt	.L150
	and	r3, r4, #127
	add	r2, r3, r3, asl #1
	add	r3, r3, r2, asl #2
	mov	ip, r3, asl #2
	add	r2, r5, #4
	add	r4, r2, ip
	ldr	r3, [r4, #28]
	cmp	r3, #3
	beq	.L151
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L152
	ldr	r1, [r5, #0]
	ldr	r3, [r4, #44]
	str	r1, [r3, #48]
	ldr	r2, [r5, #0]
	mov	r3, #0
	str	r2, [r4, #44]
	ldr	r1, [r5, #0]
	str	r3, [r1, #48]
	ldr	r2, [r5, #0]
	mov	r3, #1
	str	r3, [r2, #28]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L151:
	ldr	ip, [r2, ip]
	mov	r2, #56
	mov	r3, ip
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	mov	r3, ip
	mov	lr, r1
	add	r2, r2, #4
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	ldr	r2, [r5, #0]
	cmp	r6, r1
	movlt	r1, r6
	ldr	r3, [r2, #16]
	sub	ip, r1, #1
	cmn	ip, #1
	str	r3, [lr, #0]
	add	r0, r0, r1
	add	r2, r7, r1
	beq	.L141
	rsb	r3, ip, r0
	sub	ip, r3, #1
.L143:
	ldrb	r3, [r2, #-1]!	@ zero_extendqisi2
	strb	r3, [r0, #-1]!
	cmp	r0, ip
	bne	.L143
.L141:
	str	r1, [r4, #12]
	mov	r0, r5
	mov	r1, r4
	bl	add_to_priority(PLT)
	ldr	r2, [r5, #0]
	mov	r3, #2
	str	r3, [r2, #28]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L152:
	ldr	r3, [r5, #0]
	str	r3, [r4, #40]
	ldr	r2, [r5, #0]
	mov	r3, #1
	str	r2, [r4, #44]
	ldr	r2, [r5, #0]
	str	r3, [r2, #28]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L150:
	ldr	r1, [r5, #0]
	mov	r0, r5
	str	r3, [r1, #12]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	add_to_priority(PLT)
	.size	handle_send, .-handle_send
	.align	2
	.global	handle_receive
	.type	handle_receive, %function
handle_receive:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r6, [r0, #0]
	mov	r8, r0
	ldr	r7, [r6, #40]
	cmp	r7, #0
	moveq	r3, #3
	streq	r3, [r6, #28]
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
	ldr	r2, [r7, #48]
	ldr	ip, [r7, #0]
	cmp	r2, #0
	mov	r3, #0
	str	r3, [r7, #48]
	str	r2, [r6, #40]
	streq	r2, [r6, #44]
	mov	r3, ip
	mov	r2, #72
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	sub	r2, r2, #16
	mov	r3, ip
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	mov	r3, ip
	mov	r4, r1
	mov	r5, r0
	add	r2, r2, #8
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	ldr	ip, [r6, #0]
	sub	r2, r2, #8
	mov	r3, ip
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	mov	r3, ip
	mov	lr, r1
	add	r2, r2, #4
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	cmp	r4, r1
	movge	r4, r1
	ldr	r3, [r7, #16]
	sub	r2, r4, #1
	cmn	r2, #1
	str	r3, [lr, #0]
	add	r0, r0, r4
	add	r5, r5, r4
	beq	.L159
	rsb	r3, r2, r0
	sub	r2, r3, #1
.L161:
	ldrb	r3, [r5, #-1]!	@ zero_extendqisi2
	strb	r3, [r0, #-1]!
	cmp	r0, r2
	bne	.L161
.L159:
	mov	r3, #2
	mov	r0, r8
	mov	r1, r6
	str	r3, [r7, #28]
	str	r4, [r6, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	add_to_priority(PLT)
	.size	handle_receive, .-handle_receive
	.align	2
	.global	handle_reply
	.type	handle_reply, %function
handle_reply:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	ip, [r0, #0]
	mov	r5, r0
	mov	r2, #56
	ldr	r3, [ip, #0]
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r1}
	msr cpsr_c, #0xd3
	
	mov	r4, r1
	bl	check_tid(PLT)
	subs	r3, r0, #0
	blt	.L178
	and	r3, r4, #127
	add	r2, r3, r3, asl #1
	add	r3, r3, r2, asl #2
	mov	lr, r3, asl #2
	add	ip, r5, #4
	add	r4, ip, lr
	ldr	r3, [r4, #28]
	cmp	r3, #2
	beq	.L167
	ldr	r1, [r5, #0]
	mvn	r3, #2
	mov	r0, r5
	str	r3, [r1, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	add_to_priority(PLT)
.L167:
	ldr	r6, [r5, #0]
	mov	r2, #60
	ldr	r3, [r6, #0]
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	ldr	r3, [ip, lr]
	add	r2, r2, #4
	mov	ip, r1
	mov	lr, r0
	msr cpsr_c, #0xdf
	add r3, r3, r2
	ldmfd r3!, {r0, r1}
	msr cpsr_c, #0xd3
	
	cmp	ip, r1
	bgt	.L179
	sub	r3, ip, #1
	cmn	r3, #1
	add	r0, r0, ip
	add	r2, lr, ip
	beq	.L171
	rsb	r3, r3, r0
	sub	r1, r3, #1
.L173:
	ldrb	r3, [r2, #-1]!	@ zero_extendqisi2
	strb	r3, [r0, #-1]!
	cmp	r0, r1
	bne	.L173
	ldr	r6, [r5, #0]
.L171:
	mov	r3, #0
	str	ip, [r4, #12]
	mov	r1, r4
	mov	r0, r5
	str	r3, [r6, #12]
	bl	add_to_priority(PLT)
	ldr	r1, [r5, #0]
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	b	add_to_priority(PLT)
.L179:
	mvn	r3, #3
	mov	r0, r5
	mov	r1, r6
	str	r3, [r6, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	add_to_priority(PLT)
.L178:
	ldr	r1, [r5, #0]
	mov	r0, r5
	str	r3, [r1, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	add_to_priority(PLT)
	.size	handle_reply, .-handle_reply
	.ident	"GCC: (GNU) 4.0.2"
