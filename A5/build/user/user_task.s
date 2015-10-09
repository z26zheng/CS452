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
	ldr	r3, .L32+48
	mov	r0, #15
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
	.word	com2_out_server(GOT)
	.word	com2_in_server(GOT)
	.word	com1_out_server(GOT)
	.word	com1_in_server(GOT)
	.word	clock_server(GOT)
	.word	clock_user_task(GOT)
	.word	.LC0(GOTOFF)
	.word	track_sensor_task(GOT)
	.word	parse_user_input(GOT)
	.word	idle_percent_task(GOT)
	.size	a4_test_task, .-a4_test_task
	.align	2
	.global	a4_test_task2
	.type	a4_test_task2, %function
a4_test_task2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L37
	mov	r1, #2400
.L36:
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
	ldr	r3, .L37+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+28
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r1, .L37+32
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	bl	initialize_track(PLT)
	ldr	r3, .L37+36
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+40
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L37+44
	mov	r0, #15
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
	.word	com2_out_server(GOT)
	.word	com2_in_server(GOT)
	.word	com1_out_server(GOT)
	.word	com1_in_server(GOT)
	.word	clock_server(GOT)
	.word	.LC0(GOTOFF)
	.word	parse_user_input(GOT)
	.word	calibrate_train_velocity(GOT)
	.word	idle_percent_task(GOT)
	.size	a4_test_task2, .-a4_test_task2
	.align	2
	.global	a4_test_task3
	.type	a4_test_task3, %function
a4_test_task3:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L42
	mov	r1, #2400
.L41:
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
	ldr	r3, .L42+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+28
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r1, .L42+32
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	bl	initialize_track(PLT)
	ldr	r3, .L42+36
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+40
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L42+44
	mov	r0, #15
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L43:
	.align	2
.L42:
	.word	_GLOBAL_OFFSET_TABLE_-(.L41+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	com2_out_server(GOT)
	.word	com2_in_server(GOT)
	.word	com1_out_server(GOT)
	.word	com1_in_server(GOT)
	.word	clock_server(GOT)
	.word	.LC0(GOTOFF)
	.word	parse_user_input(GOT)
	.word	calibrate_stopping_distance(GOT)
	.word	idle_percent_task(GOT)
	.size	a4_test_task3, .-a4_test_task3
	.align	2
	.global	a4_test_task4
	.type	a4_test_task4, %function
a4_test_task4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L47
	mov	r1, #2400
.L46:
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
	ldr	r3, .L47+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+28
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r1, .L47+32
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	bl	initialize_track(PLT)
	ldr	r3, .L47+36
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+40
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+44
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L47+48
	mov	r0, #15
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.L46+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	com2_out_server(GOT)
	.word	com2_in_server(GOT)
	.word	com1_out_server(GOT)
	.word	com1_in_server(GOT)
	.word	clock_server(GOT)
	.word	.LC0(GOTOFF)
	.word	parse_user_input(GOT)
	.word	clock_user_task(GOT)
	.word	calibrate_accel_time(GOT)
	.word	idle_percent_task(GOT)
	.size	a4_test_task4, .-a4_test_task4
	.align	2
	.global	a4_test_task5
	.type	a4_test_task5, %function
a4_test_task5:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L52
	mov	r1, #2400
.L51:
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
	ldr	r3, .L52+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+28
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r1, .L52+32
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	bl	initialize_track(PLT)
	ldr	r3, .L52+36
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+40
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+44
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+48
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L52+52
	mov	r0, #15
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L53:
	.align	2
.L52:
	.word	_GLOBAL_OFFSET_TABLE_-(.L51+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	com2_out_server(GOT)
	.word	com2_in_server(GOT)
	.word	com1_out_server(GOT)
	.word	com1_in_server(GOT)
	.word	clock_server(GOT)
	.word	.LC0(GOTOFF)
	.word	track_sensor_task(GOT)
	.word	rail_server(GOT)
	.word	parse_user_input(GOT)
	.word	clock_user_task(GOT)
	.word	idle_percent_task(GOT)
	.size	a4_test_task5, .-a4_test_task5
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"node_num: %d, dist: %d, path: %d, step: %d\015\012\000"
	.align	2
.LC2:
	.ascii	"Fallback sensor: %d\015\012\000"
	.align	2
.LC3:
	.ascii	"FUUUUUCCCCKKKKKK\000"
	.align	2
.LC4:
	.ascii	"i: %d, actual input: %s, sensor_num: %d, other_num:"
	.ascii	" %d\015\012\000"
	.text
	.align	2
	.global	dijkstra_test
	.type	dijkstra_test, %function
dijkstra_test:
	@ args = 0, pretend = 0, frame = 10116
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L81
	sub	sp, sp, #10112
	sub	sp, sp, #12
.L77:
	add	sl, pc, sl
	mov	r1, #2400
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
	ldr	r3, .L81+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L81+8
	mov	r0, #16
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L81+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L81+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L81+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L81+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L81+28
	add	r0, sp, #76
	sub	r0, r0, #52
	ldr	r1, [sl, r3]
	str	r0, [sp, #20]
	add	fp, sp, #9344
	mov	r0, #3
	add	r9, sp, #8768
	bl	Create(PLT)
	add	fp, fp, #12
	ldr	r0, [sp, #20]
	add	r9, r9, #12
	add	r8, sp, #8192
	bl	init_tracka(PLT)
	add	r8, r8, #12
	ldr	r0, [sp, #20]
	mov	r1, #2
	mov	r2, fp
	mov	r3, r9
	str	r8, [sp, #0]
	bl	dijkstra(PLT)
	mov	r6, #0
	ldr	r7, .L81+32
	mov	r5, r6
.L55:
	ldr	ip, [r5, fp]
	ldr	r4, [r5, r8]
	ldr	r3, [r5, r9]
	mov	r2, r6
	mov	r0, #1
	add	r6, r6, #1
	add	r1, sl, r7
	str	ip, [sp, #0]
	str	r4, [sp, #4]
	bl	Printf(PLT)
	cmp	r6, #144
	add	r5, r5, #4
	bne	.L55
	add	r5, sp, #9920
	add	r5, r5, #12
	mov	r0, r5
	add	r4, sp, #6912
	bl	init_switches(PLT)
	add	r4, r4, #28
	add	r0, sp, #9984
	sub	r4, r4, #4
	add	r0, r0, #40
	bl	init_rail_cmds(PLT)
	mov	r2, r5
	ldr	r1, [sp, #20]
	mov	r0, r4
	bl	init_trains(PLT)
	mov	r3, #8
	add	r2, sp, #4096
	str	r3, [r2, #2988]
	ldr	r2, [r2, #2844]
	mov	r1, #0
	str	r1, [r2, #56]
	add	r5, sp, #4096
	ldr	r3, [r5, #2988]
	add	r6, sp, #10112
	add	r3, r3, r3, asl #3
	add	r6, r6, #12
	add	r2, r6, r3, asl #2
	str	r1, [r2, #-2984]
	mov	r3, #7
	mov	r2, #6
	str	r3, [r5, #2924]
	str	r2, [r5, #2928]
	mov	r0, r4
	bl	predict_next_fallback_sensors_static(PLT)
	add	r5, sp, #6912
	ldr	r6, .L81+36
	add	r5, r5, #44
.L57:
	ldr	r3, [r4, #168]
	mov	r0, #1
	cmn	r3, #1
	add	r1, sl, r6
	add	r4, r4, #4
	mov	r2, r3
	beq	.L59
	bl	Printf(PLT)
	cmp	r5, r4
	bne	.L57
.L59:
	mov	r0, #100
	bl	Delay(PLT)
	ldr	ip, .L81+40
	add	lr, sp, #9984
	mov	r0, #0
	mov	r3, #32
	add	r8, sp, #10048
	add	r9, sp, #10112
	str	ip, [sp, #16]
	mov	r1, #57
	strb	r3, [lr, #130]
	mov	r2, #53
	add	r3, r3, #18
	mov	r6, r0
	add	r8, r8, #63
	add	r9, r9, #8
	strb	r2, [lr, #131]
	strb	r3, [lr, #132]
	strb	r1, [lr, #134]
	strb	r1, [lr, #133]
	strb	r0, [lr, #135]
	b	.L60
.L61:
	ldr	ip, [sp, #16]
	mov	r2, r6
	mov	r0, #1
	add	r1, sl, ip
	mov	r3, r8
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	add	r6, r6, #1
	bl	Printf(PLT)
	mov	r0, #1
	bl	Delay(PLT)
	cmp	r6, #80
	beq	.L78
.L60:
	add	r2, sp, #8192
	mov	r7, #0
	str	r7, [r2, #1928]
	mov	r0, r6
	mov	r1, r8
	bl	sensor_id_to_name(PLT)
	mov	r1, r9
	mov	r0, r8
	bl	parse_sensor_name(PLT)
	add	r4, sp, #8192
	ldr	r3, [r4, #1928]
	mov	r2, r0, asl #16
	add	r3, r3, #1
	str	r3, [r4, #1928]
	mov	r1, r9
	mov	r0, r8
	mov	r5, r2, asr #16
	bl	parse_short(PLT)
	ldr	r3, .L81+44
	mov	r0, r0, asl #16
	mov	r4, r0, asr #16
	ldr	r1, .L81+48
	cmp	r4, r3
	cmpeq	r5, r6
	add	r1, sl, r1
	mov	r0, #1
	beq	.L61
	bl	Printf(PLT)
	b	.L61
.L78:
	mov	fp, r7
	b	.L64
.L67:
	ldr	r6, [sp, #16]
	mov	r2, r7
	mov	r0, #1
	add	r1, sl, r6
	mov	r3, r8
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	add	r7, r7, #1
	bl	Printf(PLT)
	mov	r0, #1
	bl	Delay(PLT)
	cmp	r7, #80
	beq	.L79
.L64:
	add	lr, sp, #9984
	mov	r3, #32
	mov	r2, #53
	mov	ip, #57
	strb	r3, [lr, #130]
	strb	r2, [lr, #131]
	add	r3, r3, #18
	add	r2, sp, #8192
	mov	r0, r7
	mov	r1, r8
	strb	r3, [lr, #132]
	strb	ip, [lr, #134]
	str	fp, [r2, #1928]
	strb	ip, [lr, #133]
	strb	fp, [lr, #135]
	add	r4, sp, #9984
	bl	sensor_id_to_name(PLT)
	ldrb	r3, [r4, #128]	@ zero_extendqisi2
	mov	r1, r9
	cmp	r3, #48
	mov	r0, r8
	beq	.L80
.L65:
	bl	parse_sensor_name(PLT)
	add	r4, sp, #8192
	ldr	r3, [r4, #1928]
	mov	r2, r0, asl #16
	add	r3, r3, #1
	str	r3, [r4, #1928]
	mov	r1, r9
	mov	r0, r8
	mov	r5, r2, asr #16
	bl	parse_short(PLT)
	ldr	r3, .L81+44
	mov	r0, r0, asl #16
	mov	r4, r0, asr #16
	ldr	r1, .L81+48
	cmp	r4, r3
	cmpeq	r5, r7
	add	r1, sl, r1
	mov	r0, #1
	beq	.L67
	bl	Printf(PLT)
	b	.L67
.L80:
	ldrb	r5, [r4, #129]	@ zero_extendqisi2
	add	r2, sp, #9984
	str	r5, [sp, #12]
	ldr	r3, [sp, #12]
	ldrb	r6, [r4, #130]	@ zero_extendqisi2
	str	r6, [sp, #8]
	strb	r3, [r2, #128]
	ldr	r3, [sp, #8]
	ldrb	ip, [r4, #131]	@ zero_extendqisi2
	ldrb	lr, [r4, #132]	@ zero_extendqisi2
	ldrb	r5, [r2, #134]	@ zero_extendqisi2
	ldrb	r4, [r4, #133]	@ zero_extendqisi2
	ldrb	r6, [r2, #135]	@ zero_extendqisi2
	strb	r3, [r2, #129]
	strb	ip, [r2, #130]
	strb	lr, [r2, #131]
	strb	r4, [r2, #132]
	strb	r5, [r2, #133]
	strb	r6, [r2, #134]
	b	.L65
.L79:
	mov	r0, #100
	bl	Delay(PLT)
	add	sp, sp, #908
	add	sp, sp, #9216
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L82:
	.align	2
.L81:
	.word	_GLOBAL_OFFSET_TABLE_-(.L77+8)
	.word	nameserver_main(GOT)
	.word	idle_task(GOT)
	.word	com2_out_server(GOT)
	.word	com2_in_server(GOT)
	.word	com1_out_server(GOT)
	.word	com1_in_server(GOT)
	.word	clock_server(GOT)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	5299
	.word	.LC3(GOTOFF)
	.size	dijkstra_test, .-dijkstra_test
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"Exit first_user_task\012\015\000"
	.text
	.align	2
	.global	first_user_task
	.type	first_user_task, %function
first_user_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L86
.L85:
	add	sl, pc, sl
	bl	a4_test_task5(PLT)
	ldr	r1, .L86+4
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L87:
	.align	2
.L86:
	.word	_GLOBAL_OFFSET_TABLE_-(.L85+8)
	.word	.LC5(GOTOFF)
	.size	first_user_task, .-first_user_task
	.align	2
	.global	ring_buf_test
	.type	ring_buf_test, %function
ring_buf_test:
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	sub	sp, sp, #116
	add	r7, sp, #84
	add	r4, sp, #40
	add	r3, sp, #72
	mov	r6, #1
	add	ip, sp, #108
	mov	fp, #0
	mov	r1, r4
	mov	r2, r7
	str	r3, [sp, #108]
	mov	r0, #4
	mov	r3, #2
	mov	r8, #4
	str	ip, [sp, #56]
	str	r3, [sp, #40]
	str	r3, [sp, #52]
	str	fp, [sp, #44]
	str	fp, [sp, #48]
	str	r6, [sp, #84]
	bl	push_front(PLT)
	mov	r3, #2
	mov	r1, r4
	mov	r2, r7
	mov	r0, #4
	str	r3, [sp, #84]
	mov	r9, #3
	bl	push_front(PLT)
	mov	r1, r4
	mov	r2, r7
	mov	r0, r8
	str	r9, [sp, #84]
	bl	push_front(PLT)
	mov	r2, r7
	mov	r1, r4
	mov	r0, r8
	str	r8, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	top_back(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	top_back(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	top_front(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	top_front(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	pop_back(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	pop_front(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	pop_back(PLT)
	mov	r1, r4
	mov	r2, r7
	mov	r3, #12
	mov	r0, r8
	str	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r4
	mov	r2, r7
	mov	r3, #13
	mov	r0, r8
	str	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r4
	mov	r2, r7
	mov	r3, #14
	mov	r0, r8
	str	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r4
	mov	r2, r7
	mov	r3, #15
	mov	r0, r8
	add	r5, sp, #20
	str	r3, [sp, #84]
	bl	push_front(PLT)
	add	r3, sp, #113
	add	ip, sp, #104
	mov	r1, r5
	mov	r2, r7
	str	r3, [sp, #104]
	mov	r0, r6
	mov	r3, #97
	str	ip, [sp, #36]
	strb	r3, [sp, #84]
	str	r9, [sp, #20]
	str	fp, [sp, #24]
	str	fp, [sp, #28]
	str	r9, [sp, #32]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r2, r7
	mov	r3, #98
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r2, r7
	mov	r3, #99
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r2, r7
	mov	r3, #100
	mov	r1, r5
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r2, r7
	mov	r3, #101
	mov	r1, r5
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r1, r5
	mov	r2, r7
	mov	r3, #102
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r2, r7
	mov	r3, #103
	mov	r1, r5
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r1, r5
	mov	r2, r7
	mov	r3, #104
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r2, r7
	mov	r3, #105
	mov	r1, r5
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r2, r7
	mov	r3, #106
	mov	r1, r5
	mov	r0, r6
	strb	r3, [sp, #84]
	bl	push_front(PLT)
	mov	r1, r5
	mov	r0, r6
	bl	pop_front(PLT)
	mov	r3, #2
	add	r5, sp, #80
	str	r3, [sp, #96]
	add	r3, sp, #60
	add	ip, sp, #88
	mov	r1, sp
	mov	r2, r5
	str	r3, [sp, #88]
	mov	r0, r8
	add	r3, sp, #100
	str	ip, [sp, #16]
	str	r3, [sp, #80]
	str	r6, [sp, #100]
	str	fp, [sp, #8]
	str	r9, [sp, #12]
	str	r9, [sp, #92]
	stmia	sp, {r9, fp}	@ phole stm
	bl	push_front(PLT)
	add	r3, sp, #96
	mov	r1, sp
	mov	r2, r5
	mov	r0, r8
	str	r3, [sp, #80]
	bl	push_front(PLT)
	add	r3, sp, #92
	mov	r2, r5
	mov	r1, sp
	mov	r0, r8
	str	r3, [sp, #80]
	bl	push_front(PLT)
	mov	r1, sp
	mov	r0, r8
	bl	pop_front(PLT)
	mov	r1, sp
	mov	r0, r8
	bl	pop_front(PLT)
	mov	r0, r8
	mov	r1, sp
	mov	r4, sp
	bl	pop_front(PLT)
	add	sp, sp, #116
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
	.size	ring_buf_test, .-ring_buf_test
	.ident	"GCC: (GNU) 4.0.2"
