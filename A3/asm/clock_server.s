	.file	"clock_server.c"
	.text
	.align	2
	.global	start_clock
	.type	start_clock, %function
start_clock:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, .L3
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, .L3+4
	ldr	r3, .L3+4
	ldr	r3, [r3, #0]
	orr	r3, r3, #200
	str	r3, [r2, #0]
	ldmfd	sp, {r3, fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	-2139029376
	.word	-2139029368
	.size	start_clock, .-start_clock
	.align	2
	.global	get_timer_val
	.type	get_timer_val, %function
get_timer_val:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp, {fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	-2139029372
	.size	get_timer_val, .-get_timer_val
	.align	2
	.global	clock_clients_init
	.type	clock_clients_init, %function
clock_clients_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L10
.L11:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-16]
	cmp	r3, #31
	ble	.L11
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	clock_clients_init, .-clock_clients_init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Assert failed (%s:%d):\011%s\012\015\012\015\000"
	.align	2
.LC1:
	.ascii	"clock_server.c\000"
	.align	2
.LC2:
	.ascii	"ERROR: interrupt eventid is incorrect\000"
	.text
	.align	2
	.global	notifier
	.type	notifier, %function
notifier:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #8
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-28]
	mov	r3, #18
	strb	r3, [fp, #-33]
.L15:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bgt	.L16
	ldr	r3, .L20+4
	add	r3, sl, r3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L20+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L20+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #41
	bl	bwprintf(PLT)
.L16:
	sub	r3, fp, #32
	sub	ip, fp, #33
	mov	r2, #1
	str	r2, [sp, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	ldr	r2, [fp, #-20]
	mov	r3, ip
	bl	Send(PLT)
	b	.L15
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	.LC2(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	notifier, .-notifier
	.align	2
	.global	insert_client
	.type	insert_client, %function
insert_client:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L23
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	b	.L32
.L23:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L26
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	b	.L32
.L26:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	b	.L28
.L29:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
.L28:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L30
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L29
.L30:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
.L32:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	insert_client, .-insert_client
	.section	.rodata
	.align	2
.LC3:
	.ascii	"ERROR: failed to register clock_server, aborting.\000"
	.align	2
.LC4:
	.ascii	"ERROR: clock_server receives invalid msg type\000"
	.text
	.align	2
	.global	clock_server
	.type	clock_server, %function
clock_server:
	@ args = 0, pretend = 0, frame = 436
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #436
	ldr	sl, .L53
.L52:
	add	sl, pc, sl
	mov	r0, #1
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmn	r3, #1
	bne	.L34
	mov	r0, #1
	ldr	r3, .L53+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	bl	Exit(PLT)
.L34:
	mov	r3, #0
	str	r3, [fp, #-32]
	sub	r3, fp, #416
	mov	r0, r3
	bl	clock_clients_init(PLT)
	mov	r3, #0
	str	r3, [fp, #-420]
	mov	r3, #18
	strb	r3, [fp, #-425]
	mov	r3, #4
	str	r3, [fp, #-440]
	mov	r3, #8
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L53+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r0, .L53+12
	bl	start_clock(PLT)
	b	.L51
.L36:
.L51:
	sub	r2, fp, #436
	sub	r3, fp, #424
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	Receive(PLT)
	ldr	r3, [fp, #-432]
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L37
	.p2align 2
.L42:
	b	.L38
	b	.L39
	b	.L40
	b	.L41
.L41:
	sub	r3, fp, #424
	sub	r3, r3, #1
	ldr	r0, [fp, #-24]
	mov	r1, r3
	mov	r2, #1
	bl	Reply(PLT)
	ldr	r3, [fp, #-436]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	str	r3, [fp, #-32]
	b	.L43
.L44:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-444]
	ldr	r3, [fp, #-420]
	ldr	r3, [r3, #0]
	sub	r2, fp, #444
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	ldr	r2, [fp, #-420]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-420]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-420]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-420]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-420]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #8]
.L43:
	ldr	r3, [fp, #-420]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [fp, #-420]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bls	.L44
	b	.L36
.L38:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-444]
	ldr	r3, [fp, #-424]
	sub	r2, fp, #444
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	b	.L36
.L39:
	ldr	r3, [fp, #-424]
	and	r2, r3, #31
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	sub	r3, fp, #416
	add	r3, r3, r2
	str	r3, [fp, #-448]
	ldr	r2, [fp, #-448]
	ldr	r3, [fp, #-424]
	str	r3, [r2, #0]
	ldr	r1, [fp, #-448]
	ldr	r3, [fp, #-436]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [r1, #4]
	sub	r3, fp, #448
	sub	r2, fp, #420
	mov	r0, r3
	mov	r1, r2
	bl	insert_client(PLT)
	b	.L36
.L40:
	ldr	r3, [fp, #-436]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bhi	.L48
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-444]
	ldr	r3, [fp, #-424]
	sub	r2, fp, #444
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	b	.L36
.L48:
	ldr	r3, [fp, #-424]
	and	r2, r3, #31
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	sub	r3, fp, #416
	add	r3, r3, r2
	str	r3, [fp, #-452]
	ldr	r2, [fp, #-452]
	ldr	r3, [fp, #-424]
	and	r3, r3, #31
	str	r3, [r2, #0]
	ldr	r2, [fp, #-452]
	ldr	r3, [fp, #-436]
	str	r3, [r2, #4]
	sub	r3, fp, #452
	sub	r2, fp, #420
	mov	r0, r3
	mov	r1, r2
	bl	insert_client(PLT)
	b	.L36
.L37:
	mov	r0, #1
	ldr	r3, .L53+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-444]
	ldr	r3, [fp, #-424]
	sub	r2, fp, #444
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	b	.L36
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L52+8)
	.word	.LC3(GOTOFF)
	.word	notifier(GOT)
	.word	5080
	.word	.LC4(GOTOFF)
	.size	clock_server, .-clock_server
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bgt	.L56
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L58
.L56:
	mov	r0, #1
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L59
	mvn	r3, #0
	str	r3, [fp, #-44]
	b	.L58
.L59:
	mov	r3, #8
	str	r3, [fp, #-16]
	mov	r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-28]
	sub	r2, fp, #28
	sub	ip, fp, #36
	ldr	r3, [fp, #-16]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	ldr	r2, [fp, #-16]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, #0
	str	r3, [fp, #-44]
.L58:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Delay, .-Delay
	.align	2
	.global	DelayUntil
	.type	DelayUntil, %function
DelayUntil:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bgt	.L63
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L65
.L63:
	mov	r0, #1
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L66
	mvn	r3, #0
	str	r3, [fp, #-44]
	b	.L65
.L66:
	mov	r3, #8
	str	r3, [fp, #-16]
	mov	r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-28]
	sub	r2, fp, #28
	sub	ip, fp, #36
	ldr	r3, [fp, #-16]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	ldr	r2, [fp, #-16]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, #0
	str	r3, [fp, #-44]
.L65:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	DelayUntil, .-DelayUntil
	.align	2
	.global	Time
	.type	Time, %function
Time:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	mov	r0, #1
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L70
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L72
.L70:
	mov	r3, #8
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	sub	r2, fp, #28
	sub	ip, fp, #36
	ldr	r3, [fp, #-16]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	ldr	r2, [fp, #-16]
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-40]
.L72:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Time, .-Time
	.ident	"GCC: (GNU) 4.0.2"
