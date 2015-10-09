	.file	"user_task.c"
	.text
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
	b	.L2
.L3:
	bl	Pass(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L2:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	ble	.L3
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
	b	.L7
.L8:
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
.L7:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L8
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
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L17+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #1000
	str	r3, [fp, #-24]
	b	.L12
.L13:
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
.L12:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L13
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	user_receive_task(GOT)
	.size	user_send_task, .-user_send_task
	.section	.rodata
	.align	2
.LC0:
	.ascii	"average duration in ticks:: %d\012\015\000"
	.text
	.align	2
	.global	a2_test_task
	.type	a2_test_task, %function
a2_test_task:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L22
.L21:
	add	sl, pc, sl
	ldr	r0, .L22+4
	bl	start_clock(PLT)
	bl	get_timer_val(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #3
	ldr	r3, .L22+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	bl	get_timer_val(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	rsb	r2, r3, r2
	mov	r0, #1
	ldr	r3, .L22+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	100000000
	.word	user_send_task(GOT)
	.word	.LC0(GOTOFF)
	.size	a2_test_task, .-a2_test_task
	.align	2
	.global	a2_user_task
	.type	a2_user_task, %function
a2_user_task:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L27
.L26:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r0, #1
	ldr	r3, .L27+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	mov	r0, #2
	ldr	r3, .L27+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	mov	r0, #10
	ldr	r3, .L27+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r0, #10
	ldr	r3, .L27+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #10
	ldr	r3, .L27+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #10
	ldr	r3, .L27+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #10
	ldr	r3, .L27+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	nameserver_main(GOT)
	.word	rps_server(GOT)
	.word	rps_client1(GOT)
	.size	a2_user_task, .-a2_user_task
	.section	.rodata
	.align	2
.LC1:
	.ascii	"First: exiting\012\015\000"
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
	ldr	sl, .L32
.L31:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	bl	a2_user_task(PLT)
	mov	r0, #1
	ldr	r3, .L32+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC1(GOTOFF)
	.size	first_user_task, .-first_user_task
	.ident	"GCC: (GNU) 4.0.2"
