	.file	"user_task.c"
	.text
	.align	2
	.global	idle_task
	.type	idle_task, %function
idle_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
.L2:
	b	.L2
	.size	idle_task, .-idle_task
	.align	2
	.global	gen_user_task
	.type	gen_user_task, %function
gen_user_task:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #4
	str	r3, [fp, #-20]
	sub	r3, fp, #32
	str	r3, [fp, #-24]
	b	.L5
.L6:
	bl	Pass(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L5:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	ble	.L6
	sub	r3, fp, #32
	sub	r2, fp, #36
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	gen_user_task, .-gen_user_task
	.align	2
	.global	user_receive_task
	.type	user_receive_task, %function
user_receive_task:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #1000
	str	r3, [fp, #-24]
	mov	r3, #4
	str	r3, [fp, #-16]
	b	.L10
.L11:
	sub	r2, fp, #32
	sub	r3, fp, #28
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-16]
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	bl	Reply(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
.L10:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L11
	bl	Exit(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	user_receive_task, .-user_receive_task
	.align	2
	.global	user_send_task
	.type	user_send_task, %function
user_send_task:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L20+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #1000
	str	r3, [fp, #-24]
	b	.L15
.L16:
	sub	r2, fp, #32
	sub	ip, fp, #36
	mov	r3, #4
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
.L15:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L16
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	user_receive_task(GOT)
	.size	user_send_task, .-user_send_task
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Total_time: %d\011Tid: %d, with delay time %d, dela"
	.ascii	"yed %d/%d times\015\012\000"
	.text
	.align	2
	.global	clock_client
	.type	clock_client, %function
clock_client:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	ldr	sl, .L28
.L27:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-56]
	mov	r3, #4
	str	r3, [fp, #-48]
	mov	r3, #8
	str	r3, [fp, #-44]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	sub	r2, fp, #56
	sub	ip, fp, #64
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r2
	ldr	r2, [fp, #-48]
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L23
.L24:
	ldr	r0, [fp, #-36]
	bl	Delay(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	bl	Time(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	ldr	r3, [fp, #-36]
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #8]
	mov	r0, #1
	ldr	r3, .L28+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-52]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L23:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L24
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	_GLOBAL_OFFSET_TABLE_-(.L27+8)
	.word	.LC0(GOTOFF)
	.size	clock_client, .-clock_client
	.align	2
	.global	a3_test_task
	.type	a3_test_task, %function
a3_test_task:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	r0, .L36
	bl	start_clock(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L31
.L32:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L31:
	ldr	r2, [fp, #-24]
	ldr	r3, .L36+4
	cmp	r2, r3
	bhi	.L35
	ldr	r2, [fp, #-20]
	ldr	r3, .L36+4
	cmp	r2, r3
	bls	.L32
.L35:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	5080
	.word	2999
	.size	a3_test_task, .-a3_test_task
	.align	2
	.global	a3_user_task
	.type	a3_user_task, %function
a3_user_task:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #52
	ldr	sl, .L53
.L52:
	add	sl, pc, sl
	mov	r0, #2
	ldr	r3, .L53+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	mov	r0, #16
	ldr	r3, .L53+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	mov	r0, #2
	ldr	r3, .L53+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	mov	r3, #4
	str	r3, [fp, #-40]
	mov	r3, #8
	str	r3, [fp, #-36]
	mov	r0, #3
	ldr	r3, .L53+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	sub	r2, fp, #60
	sub	r3, fp, #56
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-40]
	bl	Receive(PLT)
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bne	.L39
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L39
	mov	r3, #10
	str	r3, [fp, #-68]
	mov	r3, #20
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	sub	r2, fp, #68
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-36]
	bl	Reply(PLT)
.L39:
	mov	r0, #4
	ldr	r3, .L53+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	sub	r2, fp, #60
	sub	r3, fp, #56
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-40]
	bl	Receive(PLT)
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bne	.L42
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L42
	mov	r3, #23
	str	r3, [fp, #-68]
	mov	r3, #9
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	sub	r2, fp, #68
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-36]
	bl	Reply(PLT)
.L42:
	mov	r0, #5
	ldr	r3, .L53+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	sub	r2, fp, #60
	sub	r3, fp, #56
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-40]
	bl	Receive(PLT)
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bne	.L45
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L45
	mov	r3, #33
	str	r3, [fp, #-68]
	mov	r3, #6
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	sub	r2, fp, #68
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-36]
	bl	Reply(PLT)
.L45:
	mov	r0, #6
	ldr	r3, .L53+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	sub	r2, fp, #60
	sub	r3, fp, #56
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-40]
	bl	Receive(PLT)
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bne	.L51
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L51
	mov	r3, #71
	str	r3, [fp, #-68]
	mov	r3, #3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	sub	r2, fp, #68
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-36]
	bl	Reply(PLT)
.L51:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L52+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	clock_server(GOT)
	.word	clock_client(GOT)
	.size	a3_user_task, .-a3_user_task
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Exit first_user_task\012\015\000"
	.text
	.align	2
	.global	first_user_task
	.type	first_user_task, %function
first_user_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L58
.L57:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	bl	a3_user_task(PLT)
	mov	r0, #1
	ldr	r3, .L58+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L59:
	.align	2
.L58:
	.word	_GLOBAL_OFFSET_TABLE_-(.L57+8)
	.word	.LC1(GOTOFF)
	.size	first_user_task, .-first_user_task
	.ident	"GCC: (GNU) 4.0.2"
