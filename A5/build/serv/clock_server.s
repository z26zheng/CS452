	.file	"clock_server.c"
	.text
	.align	2
	.global	start_clock
	.type	start_clock, %function
start_clock:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r1, .L3+4
	ldr	r2, [r3, #0]
	@ lr needed for prologue
	orr	r2, r2, #200
	str	r0, [r1, #0]
	str	r2, [r3, #0]
	bx	lr
.L4:
	.align	2
.L3:
	.word	-2139029368
	.word	-2139029376
	.size	start_clock, .-start_clock
	.align	2
	.global	get_timer_val
	.type	get_timer_val, %function
get_timer_val:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	@ lr needed for prologue
	ldr	r0, [r3, #0]
	bx	lr
.L8:
	.align	2
.L7:
	.word	-2139029372
	.size	get_timer_val, .-get_timer_val
	.align	2
	.global	clock_clients_init
	.type	clock_clients_init, %function
clock_clients_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	@ lr needed for prologue
	mov	r2, r3
.L10:
	add	r3, r3, #1
	cmp	r3, #128
	str	r2, [r0, #0]
	str	r2, [r0, #8]
	add	r0, r0, #12
	bne	.L10
	bx	lr
	.size	clock_clients_init, .-clock_clients_init
	.align	2
	.global	notifier
	.type	notifier, %function
notifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #16
	bl	MyParentTid(PLT)
	mov	r3, #3
	mov	r2, #18
	mov	r4, r0
	str	r3, [sp, #8]
	strb	r2, [sp, #15]
	add	r7, sp, #4
	add	r6, sp, #15
	mov	r5, #1
.L17:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r1, r7
	str	r0, [sp, #4]
	mov	r2, #8
	mov	r0, r4
	mov	r3, r6
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L17
	.size	notifier, .-notifier
	.align	2
	.global	insert_client
	.type	insert_client, %function
insert_client:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [r1, #0]
	mov	r2, r1
	cmp	ip, #0
	beq	.L30
	ldr	r1, [r0, #0]
	ldr	r3, [ip, #4]
	ldr	lr, [r1, #4]
	cmp	lr, r3
	bhi	.L29
	str	ip, [r1, #8]
.L30:
	ldr	r3, [r0, #0]
	str	r3, [r2, #0]
	ldr	pc, [sp], #4
.L25:
	mov	ip, r2
.L29:
	ldr	r2, [ip, #8]
	cmp	r2, #0
	beq	.L26
	ldr	r3, [r2, #4]
	cmp	lr, r3
	bhi	.L25
.L26:
	str	r2, [r1, #8]
	ldr	r3, [r0, #0]
	str	r3, [ip, #8]
	ldr	pc, [sp], #4
	.size	insert_client, .-insert_client
	.align	2
	.global	clock_server
	.type	clock_server, %function
clock_server:
	@ args = 0, pretend = 0, frame = 1576
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L68
	sub	sp, sp, #1568
.L63:
	add	sl, pc, sl
	sub	sp, sp, #8
	mov	r0, #1
	bl	RegisterAs(PLT)
	cmn	r0, #1
	beq	.L67
.L32:
	add	r6, sp, #8
	mov	r0, r6
	bl	clock_clients_init(PLT)
	ldr	r3, .L68+4
	mov	r2, #4
	ldr	r1, [sl, r3]
	mov	r4, #0
	mov	r3, #18
	mov	r0, #2
	strb	r3, [sp, #1575]
	str	r2, [sp, #1548]
	str	r4, [sp, #1568]
	bl	Create(PLT)
	mov	r9, r0
	ldr	r0, .L68+8
	bl	start_clock(PLT)
	add	r3, sp, #1552
	add	r3, r3, #8
	add	r8, sp, #1552
	add	fp, sp, #1568
	add	r5, sp, #1536
	str	r3, [sp, #4]
	add	r3, sp, #1568
	add	r7, sp, #1552
	add	r8, r8, #12
	add	fp, fp, #7
	add	r5, r5, #8
	str	r3, [sp, #0]
.L66:
	mov	r0, r8
	mov	r1, r7
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r3, [sp, #1556]
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L35
	.p2align 2
.L40:
	b	.L64
	b	.L37
	b	.L38
	b	.L39
.L64:
	ldr	r0, [sp, #1564]
	mov	r1, r5
	mov	r2, #8
	str	r4, [sp, #1544]
	bl	Reply(PLT)
	b	.L66
.L37:
	ldr	r3, [sp, #1564]
	ldr	r0, [sp, #1568]
	and	r2, r3, #127
	add	r2, r2, r2, asl #1
	mov	r2, r2, asl #2
	str	r3, [r6, r2]
	ldr	r3, [sp, #1552]
	add	ip, r6, r2
	add	r1, r4, r3
	cmp	r0, #0
	str	r1, [ip, #4]
	beq	.L65
	ldr	r3, [r0, #4]
	cmp	r1, r3
	bhi	.L61
	str	r0, [ip, #8]
.L65:
	str	ip, [sp, #1568]
	b	.L66
.L48:
	mov	r0, r2
.L61:
	ldr	r2, [r0, #8]
	cmp	r2, #0
	beq	.L49
	ldr	r3, [r2, #4]
	cmp	r1, r3
	bhi	.L48
.L49:
	str	r2, [ip, #8]
	str	ip, [r0, #8]
	b	.L66
.L38:
	ldr	lr, [sp, #1552]
	cmp	r4, lr
	bcs	.L64
	ldr	r3, [sp, #1564]
	ldr	r0, [sp, #4]
	and	r3, r3, #127
	add	r2, r3, r3, asl #1
	mov	r2, r2, asl #2
	add	ip, r6, r2
	ldr	r1, [sp, #0]
	str	lr, [ip, #4]
	str	r3, [r6, r2]
	str	ip, [sp, #1560]
	bl	insert_client(PLT)
	b	.L66
.L35:
	mvn	r3, #0
	ldr	r0, [sp, #1564]
	mov	r1, r5
	mov	r2, #8
	str	r3, [sp, #1544]
	bl	Reply(PLT)
	b	.L66
.L39:
	mov	r0, r9
	mov	r1, fp
	mov	r2, #1
	bl	Reply(PLT)
	ldr	r0, [sp, #1568]
	ldr	r3, [sp, #1552]
	cmp	r0, #0
	add	r4, r4, r3
	beq	.L66
	ldr	r3, [r0, #4]
	cmp	r4, r3
	bcc	.L66
.L57:
	str	r4, [sp, #1544]
	mov	r1, r5
	mov	r2, #8
	ldr	r0, [r0, #0]
	bl	Reply(PLT)
	ldr	r3, [sp, #1568]
	mov	r1, #0
	ldr	r2, [r3, #8]
	str	r1, [r3, #4]
	subs	r0, r2, #0
	str	r2, [sp, #1568]
	str	r1, [r3, #0]
	str	r1, [r3, #8]
	beq	.L66
	ldr	r3, [r0, #4]
	cmp	r3, r4
	bls	.L57
	b	.L66
.L67:
	bl	Exit(PLT)
	b	.L32
.L69:
	.align	2
.L68:
	.word	_GLOBAL_OFFSET_TABLE_-(.L63+8)
	.word	notifier(GOT)
	.word	5080
	.size	clock_server, .-clock_server
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #8
	sub	sp, sp, #20
	subs	lr, r0, #0
	mov	r2, r4
	mov	ip, #0
	mov	r0, #139
	add	r1, sp, #12
	add	r3, sp, #4
	ble	.L73
	mov	ip, #1
	str	ip, [sp, #16]
	str	lr, [sp, #12]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #4]
.L73:
	mov	r0, ip
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
	.size	Delay, .-Delay
	.align	2
	.global	DelayUntil
	.type	DelayUntil, %function
DelayUntil:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #8
	sub	sp, sp, #20
	subs	lr, r0, #0
	mov	r2, r4
	mov	r0, #139
	add	r1, sp, #12
	add	r3, sp, #4
	ble	.L76
	mov	ip, #2
	str	ip, [sp, #16]
	str	lr, [sp, #12]
	str	r4, [sp, #0]
	bl	Send(PLT)
.L76:
	mov	r0, #0
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
	.size	DelayUntil, .-DelayUntil
	.align	2
	.global	Time
	.type	Time, %function
Time:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #8
	sub	sp, sp, #20
	mov	ip, #0
	mov	r2, r4
	add	r1, sp, #12
	add	r3, sp, #4
	mov	r0, #139
	str	ip, [sp, #16]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #4]
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
	.size	Time, .-Time
	.ident	"GCC: (GNU) 4.0.2"
