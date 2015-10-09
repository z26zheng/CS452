	.file	"rail_server.c"
	.text
	.align	2
	.global	rail_graph_worker
	.type	rail_graph_worker, %function
rail_graph_worker:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #108
	bl	MyParentTid(PLT)
	add	r4, sp, #4
	mov	r3, #2
	mov	r2, #0
	mov	r5, r0
	mov	r0, r4
	str	r3, [sp, #88]
	str	r2, [sp, #100]
	str	r4, [sp, #96]
	bl	init_rail_cmds(PLT)
	add	r8, sp, #88
	add	r7, sp, #104
	mov	r6, #4
.L2:
	mov	r1, r8
	mov	r2, #16
	mov	r3, r7
	mov	r0, r5
	str	r6, [sp, #0]
	bl	Send(PLT)
	mov	r0, r4
	bl	init_rail_cmds(PLT)
	ldr	r0, [sp, #104]
	mov	r1, r4
	bl	get_next_command(PLT)
	b	.L2
	.size	rail_graph_worker, .-rail_graph_worker
	.align	2
	.global	sensor_data_courier
	.type	sensor_data_courier, %function
sensor_data_courier:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	bl	MyParentTid(PLT)
	mov	r2, #0
	add	r3, sp, #24
	mov	r7, r0
	mov	r0, #7
	str	r3, [sp, #12]
	str	r2, [sp, #16]
	str	r2, [sp, #4]
	bl	WhoIs(PLT)
	add	r5, sp, #20
	mov	r6, r0
	add	r4, sp, #4
.L6:
	mov	r1, r5
	mov	r3, r5
	mov	ip, #4
	mov	r0, r6
	mov	r2, #0
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #12]
	mov	ip, #0
	str	r2, [r3, #0]
	mov	r0, r7
	mov	r1, r4
	mov	r2, #16
	mov	r3, r4
	str	ip, [sp, #0]
	bl	Send(PLT)
	b	.L6
	.size	sensor_data_courier, .-sensor_data_courier
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0337\033[1A\033[2K\015Train %d FINISHED INITIALIZI"
	.ascii	"NG\0338\000"
	.align	2
.LC1:
	.ascii	"\0337\033[3A\033[2K\015Expected distance to sensor "
	.ascii	"N/A: N/A   \0338\000"
	.align	2
.LC2:
	.ascii	"\0337\033[4A\033[2K\015Actual distance to sensor N/"
	.ascii	"A: N/A   \0338\000"
	.align	2
.LC3:
	.ascii	"\0337\033[5A\033[2K\015Distance difference: N/A   \033"
	.ascii	"8\000"
	.align	2
.LC4:
	.ascii	"\0337\033[3A\033[2K\015Expected distance to sensor "
	.ascii	"%c%c%c: %d    \0338\000"
	.align	2
.LC5:
	.ascii	"\0337\033[4A\033[2K\015Actual distance to sensor %c"
	.ascii	"%c%c: %d    \0338\000"
	.align	2
.LC6:
	.ascii	"\0337\033[5A\033[2K\015Distance difference: %d    \033"
	.ascii	"8\000"
	.align	2
.LC7:
	.ascii	"\0337\033[16;30HWOAH NELLY, ALMOST LOST THE TRAIN a"
	.ascii	"t time: %d\0338\000"
	.align	2
.LC8:
	.ascii	"\0337\033[7A\033[2K\015Next expected sensor: %c%c%c"
	.ascii	"    \0338\000"
	.text
	.align	2
	.global	sensor_worker
	.type	sensor_worker, %function
sensor_worker:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L33
	sub	sp, sp, #76
	mov	r4, #0
	add	r8, sp, #44
	mov	r3, #7
.L29:
	add	sl, pc, sl
	mov	r1, r8
	mov	r2, r4
	add	r0, sp, #72
	str	r3, [sp, #44]
	str	r4, [sp, #52]
	str	r4, [sp, #56]
	bl	Receive(PLT)
	mov	r2, r4
	ldr	r0, [sp, #72]
	mov	r1, r8
	bl	Reply(PLT)
	ldr	r0, .L33+4
	ldr	r3, .L33+8
	ldr	lr, .L33+12
	str	r0, [sp, #40]
	str	r3, [sp, #36]
	ldr	r0, .L33+16
	ldr	r3, .L33+20
	str	lr, [sp, #32]
	ldr	lr, .L33+24
	str	r0, [sp, #28]
	str	r3, [sp, #24]
	str	lr, [sp, #20]
	ldr	r0, .L33+28
	ldr	r3, .L33+32
	ldr	lr, .L33+36
	add	fp, sp, #60
	add	r9, sp, #68
	str	r0, [sp, #16]
	str	r3, [sp, #12]
	str	lr, [sp, #8]
	b	.L30
.L20:
	mov	r0, r5
	bl	predict_next_sensor_static(PLT)
.L22:
	mov	r0, r5
	bl	predict_next_fallback_sensors_static(PLT)
	ldr	r0, [r5, #88]
	mov	r1, r9
	bl	sensor_id_to_name(PLT)
	ldr	lr, [sp, #8]
	ldrb	ip, [sp, #70]	@ zero_extendqisi2
	ldrb	r2, [sp, #68]	@ zero_extendqisi2
	ldrb	r3, [sp, #69]	@ zero_extendqisi2
	mov	r0, #1
	add	r1, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
.L30:
	mov	r3, fp
	mov	ip, #8
	mov	r2, #16
	mov	r1, r8
	ldr	r0, [sp, #72]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r4, [sp, #64]
	ldr	r6, [sp, #60]
	mov	r0, r4
	mov	r1, r6
	bl	get_expected_train_idx(PLT)
	cmn	r0, #1
	addne	r3, r0, r0, asl #2
	rsbne	r3, r0, r3, asl #4
	addne	r3, r0, r3, asl #2
	moveq	r5, #0
	addne	r5, r4, r3, asl #2
	bl	Time(PLT)
	cmp	r5, #0
	mov	r7, r0
	beq	.L30
	ldr	r3, [r5, #8]
	cmp	r3, #5
	beq	.L31
	ldr	r3, [r5, #88]
	cmp	r6, r3
	beq	.L32
	ldr	lr, [sp, #12]
	mov	r0, #1
	add	r1, sl, lr
	mov	r2, r7
	bl	Printf(PLT)
.L19:
	ldr	r3, [r5, #156]
	str	r3, [r5, #124]
.L16:
	str	r5, [sp, #52]
	ldr	r3, [r5, #8]
	str	r7, [r5, #112]
	cmp	r3, #4
	mov	r3, #0
	str	r6, [r5, #84]
	str	r3, [r5, #128]
	bne	.L20
	mov	r0, r5
	bl	predict_next_sensor_dynamic(PLT)
	b	.L22
.L32:
	ldr	r2, [r5, #112]
	ldr	r3, [r5, #108]
	mov	r0, r5
	mov	r1, r7
	bl	update_velocity(PLT)
	ldr	r0, [r5, #88]
	mov	r1, r9
	bl	sensor_id_to_name(PLT)
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	ldr	r4, .L33+40
	str	r3, [sp, #0]
	ldr	ip, [r5, #128]
	ldr	r0, [sp, #24]
	smull	lr, r1, r4, ip
	mov	ip, ip, asr #31
	rsb	ip, ip, r1, asr #2
	ldrb	r2, [sp, #68]	@ zero_extendqisi2
	add	r1, sl, r0
	ldrb	r3, [sp, #69]	@ zero_extendqisi2
	mov	r0, #1
	str	ip, [sp, #4]
	bl	Printf(PLT)
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	ldr	lr, [sp, #20]
	str	r3, [sp, #0]
	ldr	ip, [r5, #108]
	ldrb	r2, [sp, #68]	@ zero_extendqisi2
	ldrb	r3, [sp, #69]	@ zero_extendqisi2
	add	r1, sl, lr
	mov	r0, #1
	str	ip, [sp, #4]
	bl	Printf(PLT)
	ldr	r2, [r5, #128]
	ldr	r1, [r5, #108]
	smull	r0, r3, r4, r2
	mov	r2, r2, asr #31
	rsb	r2, r2, r3, asr #2
	ldr	r3, [sp, #16]
	rsb	r2, r1, r2
	mov	r0, #1
	add	r1, sl, r3
	bl	Printf(PLT)
	b	.L19
.L31:
	mov	r1, #0
	mov	r0, r5
	bl	set_train_speed(PLT)
	mov	r0, r5
	bl	init_58(PLT)
	ldr	r0, [sp, #40]
	mov	r3, #0
	ldr	r2, [r5, #80]
	add	r1, sl, r0
	str	r3, [r5, #8]
	str	r3, [r5, #148]
	str	r3, [r5, #152]
	str	r7, [r5, #160]
	mov	r0, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #36]
	mov	r0, #1
	add	r1, sl, r3
	bl	Printf(PLT)
	ldr	lr, [sp, #32]
	mov	r0, #1
	add	r1, sl, lr
	bl	Printf(PLT)
	ldr	r3, [sp, #28]
	mov	r0, #1
	add	r1, sl, r3
	bl	Printf(PLT)
	b	.L16
.L34:
	.align	2
.L33:
	.word	_GLOBAL_OFFSET_TABLE_-(.L29+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	1717986919
	.size	sensor_worker, .-sensor_worker
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"\0337\033[9A\033[2K\015Current destination: N/A\033"
	.ascii	"8\000"
	.align	2
.LC10:
	.ascii	"\0337\033[9A\033[2K\015Current destination: %c%c%c\033"
	.ascii	"8\000"
	.align	2
.LC11:
	.ascii	"\0337\033[1A\033[2K\015Train %d now facing forwards"
	.ascii	"\0338\000"
	.align	2
.LC12:
	.ascii	"\0337\033[1A\033[2K\015Train %d now facing backward"
	.ascii	"s\0338\000"
	.text
	.align	2
	.global	train_exe_worker
	.type	train_exe_worker, %function
train_exe_worker:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L62
	sub	sp, sp, #68
	mov	r3, #3
.L58:
	add	sl, pc, sl
	mov	r4, #0
	add	r1, sp, #56
	mov	r2, #4
	add	r0, sp, #60
	add	r7, sp, #40
	str	r3, [sp, #40]
	str	r4, [sp, #48]
	str	r4, [sp, #52]
	bl	Receive(PLT)
	mov	r1, r7
	mov	r2, r4
	ldr	r0, [sp, #60]
	bl	Reply(PLT)
	ldr	r1, .L62+4
	ldr	r3, .L62+8
	ldr	r9, .L62+12
	ldr	fp, .L62+16
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	add	r6, sp, #12
	add	r8, sp, #65
.L59:
	mov	ip, #28
	ldr	r0, [sp, #60]
	mov	r1, r7
	mov	r2, #16
	mov	r3, r6
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #20]
	cmp	r0, #0
	blgt	Delay(PLT)
.L37:
	ldr	r3, [sp, #12]
	cmp	r3, #7
	addls	pc, pc, r3, asl #2
	b	.L59
	.p2align 2
.L47:
	b	.L39
	b	.L40
	b	.L41
	b	.L42
	b	.L43
	b	.L44
	b	.L45
	b	.L46
.L39:
	ldr	r0, [sp, #56]
	mov	r3, #2
	str	r3, [r0, #8]
	mov	r1, #0
	bl	set_train_speed(PLT)
	ldr	r3, [sp, #56]
	mov	r2, #0
	str	r2, [r3, #8]
	b	.L59
.L40:
	ldr	r3, [sp, #56]
	mov	r2, #4
	str	r2, [r3, #8]
	mov	r0, r3
	ldr	r4, [r3, #148]
	bl	get_cur_stopping_time(PLT)
	mov	r1, #0
	mov	r5, r0
	ldr	r0, [sp, #56]
	bl	set_train_speed(PLT)
	ldr	r3, .L62+20
	mov	r0, r5, asr #31
	smull	r1, r2, r3, r5
	rsb	r0, r0, r2, asr #2
	add	r0, r0, #2
	bl	Delay(PLT)
	mov	r4, r4, asl #16
	mov	r1, #15
	ldr	r0, [sp, #56]
	bl	set_train_speed(PLT)
	mov	r1, r4, asr #16
	ldr	r0, [sp, #56]
	bl	set_train_speed(PLT)
	ldr	r3, [sp, #56]
	mov	r2, #0
	str	r2, [r3, #8]
	b	.L59
.L41:
	ldr	r1, [sp, #16]
	ldr	r0, [sp, #56]
	mov	r3, #1
	mov	r1, r1, asl #16
	str	r3, [r0, #8]
	mov	r1, r1, asr #16
	bl	set_train_speed(PLT)
	ldr	r3, [sp, #56]
	mov	r2, #0
	str	r2, [r3, #8]
	b	.L59
.L42:
	ldr	r0, [sp, #56]
	mov	r3, #5
	str	r3, [r0, #8]
	mov	r1, #2
	bl	set_train_speed(PLT)
	b	.L59
.L43:
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #56]
	mov	r0, r3
	str	r3, [r2, #92]
	ldr	r3, [sp, #28]
	mov	r1, r8
	str	r3, [r2, #104]
	bl	sensor_id_to_name(PLT)
	ldr	r3, [sp, #56]
	ldr	r2, [r3, #92]
	cmn	r2, #1
	beq	.L60
	ldrb	ip, [sp, #67]	@ zero_extendqisi2
	ldrb	r2, [sp, #65]	@ zero_extendqisi2
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	mov	r0, #1
	add	r1, sl, r9
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L59
.L44:
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #56]
	str	r2, [r3, #144]
	b	.L59
.L45:
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #56]
	str	r2, [r3, #140]
	b	.L59
.L46:
	ldr	r2, [sp, #56]
	ldr	r3, [r2, #164]
	eor	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2, #164]
	bne	.L61
	ldr	r2, [r2, #80]
	mov	r0, #1
	add	r1, sl, fp
	bl	Printf(PLT)
	b	.L59
.L61:
	ldr	r3, [sp, #4]
	ldr	r2, [r2, #80]
	mov	r0, #1
	add	r1, sl, r3
	bl	Printf(PLT)
	b	.L59
.L60:
	ldr	r3, [sp, #8]
	mov	r0, #1
	add	r1, sl, r3
	bl	Printf(PLT)
	b	.L59
.L63:
	.align	2
.L62:
	.word	_GLOBAL_OFFSET_TABLE_-(.L58+8)
	.word	.LC9(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	1717986919
	.size	train_exe_worker, .-train_exe_worker
	.align	2
	.global	switch_exe_worker
	.type	switch_exe_worker, %function
switch_exe_worker:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r3, #4
	sub	sp, sp, #40
	mov	r4, #0
	mov	r2, r3
	add	r5, sp, r3
	add	r1, sp, #32
	add	r0, sp, #36
	str	r3, [sp, #4]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	bl	Receive(PLT)
	mov	r2, r4
	ldr	r0, [sp, #36]
	mov	r1, r5
	bl	Reply(PLT)
	add	r4, sp, #20
.L77:
	mov	ip, #12
	mov	r1, r5
	ldr	r0, [sp, #36]
	mov	r3, r4
	mov	r2, #16
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #24]
	cmp	r0, #0
	blgt	Delay(PLT)
.L66:
	ldr	r3, [sp, #20]
	ldr	r0, [sp, #28]
	cmp	r3, #0
	mov	r1, #33
	mov	r2, r0
	beq	.L76
	cmp	r3, #1
	bne	.L77
	mov	r2, r0
	mov	r1, #34
.L76:
	ldr	r0, [sp, #32]
	mov	r0, r0, asl #16
	mov	r0, r0, asr #16
	bl	set_switch(PLT)
	b	.L77
	.size	switch_exe_worker, .-switch_exe_worker
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"\0337\033[6A\033[2K\015mm past last sensor: N/A\033"
	.ascii	"8\000"
	.align	2
.LC14:
	.ascii	"\0337\033[8A\033[2K\015Current velocity: N/A\0338\000"
	.align	2
.LC15:
	.ascii	"\0337\033[18;22H%d    \0338\000"
	.align	2
.LC16:
	.ascii	"\0337\033[16;19H%d    \0338\000"
	.text
	.align	2
	.global	update_trains
	.type	update_trains, %function
update_trains:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L90
	sub	sp, sp, #12
	mov	r2, #4
.L88:
	add	sl, pc, sl
	mov	r1, sp
	add	r0, sp, r2
	bl	Receive(PLT)
	mov	r2, #0
	add	r1, sp, #8
	ldr	r0, [sp, #4]
	bl	Reply(PLT)
	ldr	r1, .L90+4
	ldr	r3, [sp, #0]
	add	r1, sl, r1
	mov	r0, #1
	str	r3, [sp, #8]
	bl	Printf(PLT)
	ldr	r1, .L90+8
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	ldr	r7, .L90+12
	ldr	r8, .L90+16
.L89:
	mov	r0, #1
	bl	Delay(PLT)
	ldr	r5, [sp, #8]
	mov	r6, r0
	ldr	r3, [r5, #8]
	mov	r1, r0
	cmp	r3, #6
	mov	r0, r5
	beq	.L89
	bl	get_cur_velocity(PLT)
	ldr	r4, [sp, #8]
	str	r0, [r5, #156]
	mov	r1, r6
	mov	r0, r4
	bl	get_mm_past_last_landmark(PLT)
	ldr	lr, .L90+20
	ldr	ip, [sp, #8]
	smull	r3, r2, lr, r6
	mov	r3, r6, asr #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, asl #2
	ldr	r2, [ip, #156]
	cmp	r6, r3, asl #1
	str	r0, [r4, #128]
	add	r1, sl, r7
	mov	r0, #1
	str	r2, [ip, #120]
	str	r6, [ip, #116]
	bne	.L89
	ldr	r2, [ip, #128]
	smull	ip, r3, lr, r2
	mov	r2, r2, asr #31
	rsb	r2, r2, r3, asr #2
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	mov	r0, #1
	ldr	r2, [r3, #156]
	add	r1, sl, r8
	bl	Printf(PLT)
	b	.L89
.L91:
	.align	2
.L90:
	.word	_GLOBAL_OFFSET_TABLE_-(.L88+8)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	1717986919
	.size	update_trains, .-update_trains
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"ERROR: failed to register rail_server, aborting ..."
	.ascii	"\012\015\000"
	.text
	.align	2
	.global	rail_server
	.type	rail_server, %function
rail_server:
	@ args = 0, pretend = 0, frame = 8524
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L142
	sub	sp, sp, #8512
.L138:
	add	sl, pc, sl
	sub	sp, sp, #16
	mov	r0, #6
	bl	RegisterAs(PLT)
	cmn	r0, #1
	beq	.L140
.L93:
	add	r4, sp, #80
	add	r9, sp, #6912
	sub	r4, r4, #44
	add	r9, r9, #48
	add	r1, sp, #8256
	mov	r0, r4
	add	r1, r1, #52
	sub	r9, r9, #12
	str	r1, [sp, #20]
	bl	init_tracka(PLT)
	ldr	r2, [sp, #20]
	mov	r1, r4
	mov	r0, r9
	bl	init_trains(PLT)
	ldr	r0, [sp, #20]
	bl	init_switches(PLT)
	ldr	r3, .L142+4
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L142+8
	mov	fp, r0
	ldr	r1, [sl, r3]
	mov	r0, #13
	add	r6, sp, #8512
	bl	Create(PLT)
	add	r6, r6, #12
	add	ip, sp, #8192
	add	r1, sp, #8512
	mov	r4, #0
	mov	r2, #4
	str	r9, [ip, #328]
	add	r1, r1, #8
	mov	r3, r6
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L142+12
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	add	r2, sp, #8512
	add	lr, sp, #8192
	mov	r1, #4
	add	r3, sp, #8448
	add	r2, r2, #4
	ldr	r7, .L142+16
	mov	r5, r4
	str	r1, [lr, #248]
	str	r3, [lr, #324]
	str	r2, [lr, #252]
	str	r1, [lr, #236]
	str	r4, [lr, #240]
	str	r4, [lr, #244]
.L95:
	ldr	r1, [sl, r7]
	mov	r0, #10
	bl	Create(PLT)
	add	r5, r5, #1
	mov	r1, r6
	mov	r2, r4
	mov	r3, r6
	str	r4, [sp, #0]
	bl	Send(PLT)
	cmp	r5, #4
	bne	.L95
	ldr	r3, .L142+20
	add	r2, sp, #8448
	ldr	r1, [sl, r3]
	add	r3, sp, #8192
	add	r2, r2, #52
	str	r9, [r3, #304]
	mov	r0, #10
	str	r2, [sp, #8]
	bl	Create(PLT)
	add	ip, sp, #8192
	str	r4, [sp, #0]
	mov	r2, r5
	ldr	r1, [sp, #8]
	mov	r3, r6
	str	r9, [ip, #308]
	str	r0, [sp, #32]
	bl	Send(PLT)
	add	r7, sp, #8448
	add	r5, sp, #8192
	ldr	r8, .L142+24
	add	r7, r7, #60
	mov	r4, #1
	add	r5, r5, #32
.L97:
	ldr	r1, [sl, r8]
	mov	r0, #10
	bl	Create(PLT)
	cmp	r4, #18
	add	ip, r4, #134
	add	lr, sp, #8192
	str	r4, [lr, #316]
	str	r0, [r5, #-4]
	strgt	ip, [lr, #316]
	mov	r2, #4
	mov	ip, #0
	mov	r1, r7
	mov	r3, r6
	add	r4, r4, #1
	add	r5, r5, r2
	str	ip, [sp, #0]
	bl	Send(PLT)
	cmp	r4, #23
	bne	.L97
	ldr	r3, [sp, #20]
	ldr	r1, .L142+28
	add	r2, sp, #8192
	str	r3, [r2, #296]
	add	ip, sp, #8448
	add	lr, sp, #8384
	add	r2, sp, #8448
	str	r1, [sp, #24]
	add	r5, sp, #8448
	add	r8, sp, #8384
	add	ip, ip, #44
	add	lr, lr, #16
	add	r7, sp, #8448
	add	r1, sp, #8512
	add	r2, r2, #56
	add	r5, r5, #16
	add	r8, r8, #44
	str	ip, [sp, #12]
	str	lr, [sp, #16]
	add	r7, r7, #32
	str	r1, [sp, #28]
	str	r2, [sp, #4]
.L139:
	mov	r0, r6
	mov	r1, r5
	mov	r2, #16
	bl	Receive(PLT)
	add	ip, sp, #8192
	ldr	r3, [ip, #272]
	cmp	r3, #7
	addls	pc, pc, r3, asl #2
	b	.L139
	.p2align 2
.L107:
	b	.L102
	b	.L103
	b	.L104
	b	.L139
	b	.L105
	b	.L139
	b	.L139
	b	.L106
.L102:
	add	lr, sp, #8192
	mov	r1, r5
	mov	r2, #0
	ldr	r0, [lr, #332]
	bl	Reply(PLT)
	mov	r0, r8
	bl	empty(PLT)
	cmp	r0, #0
	bne	.L139
	add	r2, sp, #8192
	ldr	r3, [r2, #280]
	mov	r1, r8
	add	r0, r0, #4
	ldr	r4, [r3, #0]
	bl	pop_back(PLT)
	add	r3, sp, #8192
	ldr	r0, [r0, #0]
	ldr	r1, [sp, #12]
	mov	r2, #8
	str	r4, [r3, #300]
	bl	Reply(PLT)
	b	.L139
.L103:
	add	ip, sp, #8192
	mov	r1, r5
	ldr	r0, [ip, #332]
	mov	r2, #0
	bl	Reply(PLT)
	add	r1, sp, #8192
	ldr	lr, [r1, #280]
	ldr	r4, [lr, #0]
	cmp	r4, #0
	beq	.L109
	cmp	r4, #58
	bne	.L139
	ldr	r3, [lr, #4]
	ldr	r0, [sp, #32]
	str	r3, [r1, #208]
	ldr	r2, [lr, #12]
	add	r3, sp, #8192
	str	r2, [r3, #212]
	ldr	ip, [lr, #8]
	ldr	r1, [sp, #16]
	str	ip, [r3, #216]
	ldr	r3, [lr, #16]
	add	ip, sp, #8192
	str	r3, [ip, #220]
	ldr	ip, [lr, #20]
	add	r3, sp, #8192
	str	ip, [r3, #224]
	ldr	r3, [lr, #24]
	add	ip, sp, #8192
	str	r3, [ip, #228]
	ldr	ip, [lr, #28]
	add	lr, sp, #8192
	mov	r2, #28
	str	ip, [lr, #232]
	bl	Reply(PLT)
	b	.L139
.L104:
	add	ip, sp, #8192
	ldr	r4, [ip, #280]
	ldr	r3, [r4, #0]
	cmp	r3, #58
	beq	.L141
.L115:
	ldr	r2, [r4, #36]
	cmn	r2, #1
	beq	.L117
	ldr	r3, [r4, #40]
	add	r1, sp, #8192
	str	r3, [r1, #288]
	add	lr, sp, #8512
	add	lr, lr, #16
	ldr	r3, [r4, #44]
	add	r2, lr, r2, asl #2
	add	ip, sp, #8192
	ldr	r0, [r2, #-312]
	mov	r1, r7
	mov	r2, #12
	str	r3, [ip, #292]
	bl	Reply(PLT)
.L117:
	ldr	r2, [r4, #48]
	cmn	r2, #1
	beq	.L119
	ldr	r3, [r4, #52]
	add	r1, sp, #8192
	str	r3, [r1, #288]
	add	lr, sp, #8512
	add	lr, lr, #16
	ldr	r3, [r4, #56]
	add	r2, lr, r2, asl #2
	add	ip, sp, #8192
	ldr	r0, [r2, #-312]
	mov	r1, r7
	mov	r2, #12
	str	r3, [ip, #292]
	bl	Reply(PLT)
.L119:
	ldr	r2, [r4, #60]
	cmn	r2, #1
	beq	.L121
	ldr	r3, [r4, #64]
	add	r1, sp, #8192
	str	r3, [r1, #288]
	add	lr, sp, #8512
	add	lr, lr, #16
	ldr	r3, [r4, #68]
	add	r2, lr, r2, asl #2
	add	ip, sp, #8192
	ldr	r0, [r2, #-312]
	mov	r1, r7
	mov	r2, #12
	str	r3, [ip, #292]
	bl	Reply(PLT)
.L121:
	ldr	r2, [r4, #72]
	cmn	r2, #1
	beq	.L139
	ldr	r3, [r4, #76]
	add	r1, sp, #8192
	add	lr, sp, #8512
	str	r3, [r1, #288]
	add	lr, lr, #16
	ldr	r3, [r4, #80]
	add	r2, lr, r2, asl #2
	add	ip, sp, #8192
	ldr	r0, [r2, #-312]
	mov	r1, r7
	mov	r2, #12
	str	r3, [ip, #292]
	bl	Reply(PLT)
	b	.L139
.L105:
	add	lr, sp, #4096
	ldr	r3, [lr, #2860]
	cmp	r3, #6
	beq	.L139
	mov	r0, r9
	bl	predict_next_sensor_static(PLT)
	add	r1, sp, #4096
	ldr	r0, [r1, #2940]
	ldr	r1, [sp, #28]
	bl	sensor_id_to_name(PLT)
	add	lr, sp, #8448
	ldrb	ip, [lr, #66]	@ zero_extendqisi2
	ldr	lr, [sp, #24]
	add	r3, sp, #8448
	ldrb	r2, [r3, #64]	@ zero_extendqisi2
	mov	r0, #1
	ldrb	r3, [r3, #65]	@ zero_extendqisi2
	add	r1, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L139
.L106:
	add	ip, sp, #8192
	ldr	r3, [ip, #332]
	mov	r0, #4
	str	r3, [ip, #312]
	mov	r1, r8
	ldr	r2, [sp, #4]
	bl	push_front(PLT)
	add	lr, sp, #8192
	ldr	r3, [lr, #280]
	cmp	r3, #0
	beq	.L139
	add	ip, sp, #4096
	ldr	r3, [ip, #2944]
	cmn	r3, #1
	beq	.L139
	ldr	r3, [ip, #2860]
	cmp	r3, #4
	beq	.L139
	add	r3, sp, #8192
	mov	r0, fp
	ldr	r1, [sp, #8]
	mov	r2, #4
	str	r9, [r3, #308]
	bl	Reply(PLT)
	b	.L139
.L109:
	ldr	r3, [lr, #36]
	cmp	r3, #0
	beq	.L139
	cmp	r3, #18
	add	r1, sp, #8512
	subgt	r3, r3, #134
	add	r1, r1, #16
	add	r3, r1, r3, asl #2
	ldr	ip, [lr, #40]
	ldr	r0, [r3, #-312]
	add	r3, sp, #8192
	mov	r1, r7
	mov	r2, #12
	str	ip, [r3, #288]
	str	r4, [r3, #292]
	bl	Reply(PLT)
	b	.L139
.L141:
	ldr	r3, [r4, #4]
	ldr	r0, [sp, #32]
	str	r3, [ip, #208]
	ldr	r2, [r4, #12]
	ldr	r1, [sp, #16]
	str	r2, [ip, #212]
	ldr	r3, [r4, #8]
	mov	r2, #28
	str	r3, [ip, #216]
	bl	Reply(PLT)
	b	.L115
.L140:
	ldr	r1, .L142+32
	add	r0, r0, #2
	add	r1, sl, r1
	bl	bwputstr(PLT)
	bl	Exit(PLT)
	b	.L93
.L143:
	.align	2
.L142:
	.word	_GLOBAL_OFFSET_TABLE_-(.L138+8)
	.word	rail_graph_worker(GOT)
	.word	update_trains(GOT)
	.word	sensor_data_courier(GOT)
	.word	sensor_worker(GOT)
	.word	train_exe_worker(GOT)
	.word	switch_exe_worker(GOT)
	.word	.LC8(GOTOFF)
	.word	.LC17(GOTOFF)
	.size	rail_server, .-rail_server
	.ident	"GCC: (GNU) 4.0.2"
