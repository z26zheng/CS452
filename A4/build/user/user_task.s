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
	.ascii	"\033[2J\000"
	.text
	.align	2
	.global	a4_test_task
	.type	a4_test_task, %function
a4_test_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L32
	mov	r1, #2400
.L31:
	add	sl, pc, sl
	mov	r0, #0
	bl	setspeed(PLT)
	mov	r0, #1000
	bl	wait_cycles(PLT)
	mov	r0, #0
	bl	enable_two_stop_bits(PLT)
	mov	r0, #0
	mov	r1, r0
	bl	setfifo(PLT)
	mov	r0, #1
	mov	r1, r0
	bl	setfifo(PLT)
	ldr	r3, .L32+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+28
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+32
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r1, .L32+36
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	bl	initialize_track(PLT)
	ldr	r3, .L32+40
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L32+44
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	COM2_Out_Server(GOT)
	.word	COM2_In_Server(GOT)
	.word	COM1_Out_Server(GOT)
	.word	COM1_In_Server(GOT)
	.word	clock_server(GOT)
	.word	clock_user_task(GOT)
	.word	.LC0(GOTOFF)
	.word	track_sensor_task(GOT)
	.word	parse_user_input(GOT)
	.size	a4_test_task, .-a4_test_task
	.align	2
	.global	a4_test_task2
	.type	a4_test_task2, %function
a4_test_task2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L37
	mov	r1, #0
.L36:
	add	sl, pc, sl
	mov	r0, #1
	bl	setfifo(PLT)
	ldr	r3, .L37+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+12
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+20
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+24
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L38:
	.align	2
.L37:
	.word	_GLOBAL_OFFSET_TABLE_-(.L36+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	COM2_Out_Server(GOT)
	.word	COM2_In_Server(GOT)
	.word	clock_server(GOT)
	.word	parse_user_input(GOT)
	.size	a4_test_task2, .-a4_test_task2
	.align	2
	.global	first_user_task
	.type	first_user_task, %function
first_user_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	bl	a4_test_task(PLT)
	ldr	lr, [sp], #4
	b	Exit(PLT)
	.size	first_user_task, .-first_user_task
	.ident	"GCC: (GNU) 4.0.2"
