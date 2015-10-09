	.file	"user_task.c"
	.text
	.align	2
	.global	idle_task
	.type	idle_task, %function
idle_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
.L3:
	b	.L3
	.size	idle_task, .-idle_task
	.align	2
	.global	gen_user_task
	.type	gen_user_task, %function
gen_user_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #5
	sub	sp, sp, #8
.L7:
	bl	Pass(PLT)
	subs	r4, r4, #1
	bne	.L7
	add	r1, sp, #4
	mov	r2, #4
	mov	r0, sp
	bl	Receive(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, pc}
	.size	gen_user_task, .-gen_user_task
	.align	2
	.global	user_receive_task
	.type	user_receive_task, %function
user_receive_task:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, .L18
	sub	sp, sp, #12
	add	r7, sp, #4
	mov	r6, sp
	add	r5, sp, #8
.L13:
	mov	r1, r7
	mov	r2, #4
	mov	r0, r5
	bl	Receive(PLT)
	sub	r4, r4, #1
	ldr	r0, [sp, #8]
	mov	r1, r6
	mov	r2, #4
	bl	Reply(PLT)
	cmn	r4, #1
	bne	.L13
	bl	Exit(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L19:
	.align	2
.L18:
	.word	999
	.size	user_receive_task, .-user_receive_task
	.align	2
	.global	user_send_task
	.type	user_send_task, %function
user_send_task:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L27
	ldr	r3, .L27+4
.L26:
	add	sl, pc, sl
	sub	sp, sp, #12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r4, .L27+8
	mov	r6, r0
	add	r8, sp, #8
	add	r7, sp, #4
	mov	r5, #4
.L21:
	sub	r4, r4, #1
	mov	r0, r6
	mov	r1, r8
	mov	r2, r5
	mov	r3, r7
	str	r5, [sp, #0]
	bl	Send(PLT)
	cmn	r4, #1
	bne	.L21
	bl	Exit(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	user_receive_task(GOT)
	.word	999
	.size	user_send_task, .-user_send_task
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Total_time: %d\011Tid: %d, with delay time %d, dela"
	.ascii	"yed %d/%d times\015\012\000"
	.text
	.align	2
	.global	clock_client
	.type	clock_client, %function
clock_client:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L37
	sub	sp, sp, #24
.L35:
	add	sl, pc, sl
	bl	MyTid(PLT)
	add	r4, sp, #24
	str	r0, [r4, #-4]!
	mov	r7, r0
	bl	MyParentTid(PLT)
	mov	r1, r4
	mov	ip, #8
	mov	r2, #4
	add	r3, sp, #12
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r4, [sp, #16]
	ldr	r6, [sp, #12]
	cmp	r4, #0
	bgt	.L36
.L30:
	bl	Exit(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L36:
	ldr	r8, .L37+4
	mov	r5, #0
.L32:
	mov	r0, r6
	bl	Delay(PLT)
	bl	Time(PLT)
	add	r5, r5, #1
	mov	r2, r0
	add	r1, sl, r8
	mov	r0, #1
	mov	r3, r7
	str	r6, [sp, #0]
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	bwprintf(PLT)
	cmp	r4, r5
	bne	.L32
	b	.L30
.L38:
	.align	2
.L37:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
	.word	.LC0(GOTOFF)
	.size	clock_client, .-clock_client
	.align	2
	.global	a3_test_task
	.type	a3_test_task, %function
a3_test_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r0, .L45
	bl	start_clock(PLT)
	ldr	r5, .L45+4
	mov	r4, #0
.L40:
	add	r4, r4, #1
	mov	r0, #0
	bl	AwaitEvent(PLT)
	cmp	r4, r5
	bls	.L40
	ldmfd	sp!, {r4, r5, pc}
.L46:
	.align	2
.L45:
	.word	5080
	.word	2999
	.size	a3_test_task, .-a3_test_task
	.align	2
	.global	a3_user_task
	.type	a3_user_task, %function
a3_user_task:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L66
	ldr	r3, .L66+4
.L61:
	add	sl, pc, sl
	sub	sp, sp, #16
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	Create(PLT)
	ldr	r3, .L66+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L66+12
	ldr	r6, .L66+16
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	Create(PLT)
	ldr	r1, [sl, r6]
	mov	r0, #3
	bl	Create(PLT)
	add	r7, sp, #8
	add	r5, sp, #12
	mov	r2, #4
	mov	r4, r0
	mov	r1, r7
	mov	r0, r5
	bl	Receive(PLT)
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	cmp	r2, r3
	beq	.L62
.L48:
	ldr	r1, [sl, r6]
	mov	r0, #4
	bl	Create(PLT)
	mov	r2, #4
	mov	r4, r0
	mov	r1, r7
	mov	r0, r5
	bl	Receive(PLT)
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	cmp	r2, r3
	beq	.L63
.L51:
	ldr	r1, [sl, r6]
	mov	r0, #5
	bl	Create(PLT)
	mov	r2, #4
	mov	r4, r0
	mov	r1, r7
	mov	r0, r5
	bl	Receive(PLT)
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	cmp	r2, r3
	beq	.L64
.L54:
	ldr	r1, [sl, r6]
	mov	r0, #6
	bl	Create(PLT)
	mov	r2, #4
	mov	r4, r0
	mov	r1, r7
	mov	r0, r5
	bl	Receive(PLT)
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	cmp	r2, r3
	beq	.L65
.L60:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L65:
	cmp	r4, r2
	bne	.L60
	mov	r3, #71
	mov	ip, #3
	mov	r0, r4
	mov	r1, sp
	mov	r2, #8
	stmia	sp, {r3, ip}	@ phole stm
	bl	Reply(PLT)
	b	.L60
.L64:
	cmp	r4, r2
	bne	.L54
	mov	r3, #33
	mov	ip, #6
	mov	r0, r4
	mov	r1, sp
	mov	r2, #8
	stmia	sp, {r3, ip}	@ phole stm
	bl	Reply(PLT)
	b	.L54
.L63:
	cmp	r4, r2
	bne	.L51
	mov	r3, #23
	mov	ip, #9
	mov	r0, r4
	mov	r1, sp
	mov	r2, #8
	stmia	sp, {r3, ip}	@ phole stm
	bl	Reply(PLT)
	b	.L51
.L62:
	cmp	r4, r2
	bne	.L48
	mov	r3, #10
	mov	ip, #20
	mov	r0, r4
	mov	r1, sp
	mov	r2, #8
	stmia	sp, {r3, ip}	@ phole stm
	bl	Reply(PLT)
	b	.L48
.L67:
	.align	2
.L66:
	.word	_GLOBAL_OFFSET_TABLE_-(.L61+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	clock_server(GOT)
	.word	clock_client(GOT)
	.size	a3_user_task, .-a3_user_task
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Exit first_user_task\012\015\000"
	.text
	.align	2
	.global	first_user_task
	.type	first_user_task, %function
first_user_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L71
	mov	r1, #0
.L70:
	add	sl, pc, sl
	mov	r0, #1
	bl	bwsetfifo(PLT)
	bl	a3_user_task(PLT)
	ldr	r1, .L71+4
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L72:
	.align	2
.L71:
	.word	_GLOBAL_OFFSET_TABLE_-(.L70+8)
	.word	.LC1(GOTOFF)
	.size	first_user_task, .-first_user_task
	.ident	"GCC: (GNU) 4.0.2"
