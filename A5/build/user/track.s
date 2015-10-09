	.file	"track.c"
	.text
	.align	2
	.global	track_go
	.type	track_go, %function
track_go:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #96
	mov	r0, #0
	bl	Putc(PLT)
	mov	r0, #0
	ldr	pc, [sp], #4
	.size	track_go, .-track_go
	.align	2
	.global	track_stop
	.type	track_stop, %function
track_stop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #97
	mov	r0, #0
	bl	Putc(PLT)
	mov	r0, #0
	ldr	pc, [sp], #4
	.size	track_stop, .-track_stop
	.align	2
	.global	set_train_speed
	.type	set_train_speed, %function
set_train_speed:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r1, r1, asl #16
	cmp	r1, #6553600
	movhi	r6, #0
	mov	r4, r0
	ldr	r2, [r0, #148]
	movhi	r1, r6
	movls	r6, r1, asr #16
	ldr	r3, [r4, #8]
	cmp	r1, #983040
	movle	r5, r6
	subgt	r5, r6, #15
	cmp	r2, #15
	movle	r0, r2
	subgt	r0, r2, #15
	cmp	r3, #5
	sub	sp, sp, #4
	beq	.L27
	cmp	r5, r0
	beq	.L17
	rsbs	r3, r5, #1
	movcc	r3, #0
	cmp	r5, #7
	orrgt	r3, r3, #1
	cmp	r3, #0
	bne	.L28
.L19:
	ldr	r3, [r4, #80]
	mov	r0, #0
	add	r1, sp, #2
	mov	r2, #2
	strb	r5, [sp, #2]
	strb	r3, [sp, #3]
	bl	Putstr(PLT)
.L17:
	mov	r0, r6
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, pc}
.L28:
	cmp	r1, #983040
	ldreq	r3, [r4, #164]
	eoreq	r3, r3, #1
	streq	r3, [r4, #164]
	beq	.L19
	cmp	r5, r0
	addgt	r3, r5, #15
	str	r5, [r4, #148]
	str	r2, [r4, #152]
	strgt	r3, [r4, #148]
	bl	Time(PLT)
	str	r0, [r4, #160]
	b	.L19
.L27:
	ldr	r3, [r4, #80]
	add	r1, sp, #2
	mov	r2, #2
	mov	r0, #0
	strb	r5, [sp, #2]
	strb	r3, [sp, #3]
	bl	Putstr(PLT)
	b	.L17
	.size	set_train_speed, .-set_train_speed
	.align	2
	.global	set_train_speed_old
	.type	set_train_speed_old, %function
set_train_speed_old:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r1, r1, asl #16
	mov	r1, r1, lsr #16
	mov	r3, r1, asl #16
	sub	sp, sp, #4
	mov	r4, #0
	cmp	r3, #6553600
	mov	r0, r0, asl #16
	mov	lr, r4
	mov	ip, r0, lsr #16
	andls	lr, r1, #255
	mov	r2, #2
	add	r1, sp, #2
	mov	r0, #0
	movls	r4, r3, asr #16
	strb	lr, [sp, #2]
	strb	ip, [sp, #3]
	bl	Putstr(PLT)
	mov	r0, r4
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	set_train_speed_old, .-set_train_speed_old
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0337\033[%d;%dH sw%d: %c\0338\000"
	.text
	.align	2
	.global	update_switch_output
	.type	update_switch_output, %function
update_switch_output:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	mov	r0, r0, asl #16
	mov	ip, r0, asr #16
	ldr	sl, .L48
	cmp	ip, #153
.L47:
	add	sl, pc, sl
	and	lr, r1, #255
	mov	r0, r0, lsr #16
	sub	sp, sp, #8
	sub	r1, ip, #1
	moveq	r0, #4
	moveq	r2, #2
	beq	.L37
	cmp	ip, #154
	moveq	r0, #4
	moveq	r2, #3
	beq	.L37
	cmp	ip, #155
	moveq	r0, #5
	moveq	r2, #0
	beq	.L37
	cmp	ip, #156
	moveq	r0, #5
	moveq	r2, #1
	beq	.L37
	sub	r3, r0, #1
	mov	r3, r3, asl #16
	cmp	r3, #1114112
	bhi	.L44
	mov	r3, r1, asr #31
	mov	r3, r3, lsr #30
	add	r2, r1, r3
	cmp	r1, #0
	addlt	r1, ip, #2
	and	r2, r2, #3
	rsb	r2, r3, r2
	mov	r0, r1, asr #2
.L37:
	add	r3, r2, r2, asl #2
	ldr	r1, .L48+4
	add	r3, r2, r3, asl #1
	add	r1, sl, r1
	add	r2, r0, #9
	add	r3, r3, #20
	mov	r0, #1
	stmia	sp, {ip, lr}	@ phole stm
	bl	Printf(PLT)
.L44:
	mov	r0, #0
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L49:
	.align	2
.L48:
	.word	_GLOBAL_OFFSET_TABLE_-(.L47+8)
	.word	.LC0(GOTOFF)
	.size	update_switch_output, .-update_switch_output
	.align	2
	.global	kill_switch
	.type	kill_switch, %function
kill_switch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #32
	mov	r0, #0
	bl	Putc(PLT)
	mov	r0, #0
	ldr	pc, [sp], #4
	.size	kill_switch, .-kill_switch
	.align	2
	.global	set_switch_old
	.type	set_switch_old, %function
set_switch_old:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r0, r0, asl #16
	sub	sp, sp, #4
	mov	r4, r1, asl #16
	mov	r2, #2
	add	r1, sp, #2
	mov	r5, r0, lsr #16
	mov	r4, r4, lsr #16
	mov	r0, #0
	strb	r4, [sp, #2]
	strb	r5, [sp, #3]
	mov	r4, r4, asl #16
	bl	Putstr(PLT)
	mov	r0, #20
	bl	Delay(PLT)
	bl	kill_switch(PLT)
	mov	r1, r4, asr #16
	cmp	r1, #33
	moveq	r1, #83
	beq	.L56
	cmp	r1, #34
	movne	r1, #47
	moveq	r1, #67
.L56:
	mov	r0, r5, asl #16
	mov	r0, r0, asr #16
	bl	update_switch_output(PLT)
	mov	r0, #0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
	.size	set_switch_old, .-set_switch_old
	.align	2
	.global	set_switch
	.type	set_switch, %function
set_switch:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, r1, asl #16
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r0, r0, asl #16
	mov	lr, r1, lsr #16
	mov	r4, r0, asr #16
	mov	r3, lr, asl #16
	mov	r3, r3, asr #16
	cmp	r4, #18
	mov	ip, r4
	subgt	ip, r4, #134
	cmp	r3, #33
	moveq	r3, #0
	sub	sp, sp, #4
	mov	r6, r0, lsr #16
	mov	r5, #83
	streq	r3, [r2, ip, asl #2]
	beq	.L65
	cmp	r3, #34
	moveq	r3, #1
	sub	r5, r5, #36
	streq	r3, [r2, ip, asl #2]
	moveq	r5, #67
.L65:
	mov	r2, #2
	add	r1, sp, r2
	mov	r0, #0
	strb	lr, [sp, #2]
	strb	r6, [sp, #3]
	bl	Putstr(PLT)
	mov	r0, #20
	bl	Delay(PLT)
	bl	kill_switch(PLT)
	mov	r0, r4
	mov	r1, r5
	bl	update_switch_output(PLT)
	mov	r0, #0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, pc}
	.size	set_switch, .-set_switch
	.align	2
	.global	sensor_id_to_name
	.type	sensor_id_to_name, %function
sensor_id_to_name:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0, asr #31
	mov	r3, r3, lsr #28
	add	r2, r0, r3
	and	r2, r2, #15
	rsb	r2, r3, r2
	ldr	r3, .L69
	add	r2, r2, #1
	str	lr, [sp, #-4]!
	smull	lr, ip, r3, r2
	mov	lr, r2, asr #31
	rsb	lr, lr, ip, asr #2
	add	r3, r0, #15
	cmp	r0, #0
	add	ip, lr, lr, asl #2
	movlt	r0, r3
	sub	r2, r2, ip, asl #1
	mov	r0, r0, asr #4
	add	r0, r0, #65
	add	r2, r2, #48
	add	lr, lr, #48
	strb	r2, [r1, #2]
	strb	r0, [r1, #0]
	strb	lr, [r1, #1]
	ldr	pc, [sp], #4
.L70:
	.align	2
.L69:
	.word	1717986919
	.size	sensor_id_to_name, .-sensor_id_to_name
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"\0337\033[2;0HINITIALIZING\033[5;0HRECENT SENSORS:\015"
	.ascii	"\012---------------\015\012\0338\000"
	.align	2
.LC2:
	.ascii	"\0337\033[5;20HSwitches:\033[6;20H---------\033[24;"
	.ascii	"0H\0338\000"
	.align	2
.LC3:
	.ascii	"\033[2;0H\033[2K\033[24;0H>\000"
	.text
	.align	2
	.global	initialize_track
	.type	initialize_track, %function
initialize_track:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L98
	ldr	r1, .L98+4
.L92:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	ldr	r1, .L98+8
	mov	r2, #43
	add	r1, sl, r1
	mov	r0, #1
	bl	Putstr(PLT)
	bl	track_go(PLT)
	mov	r5, #0
	b	.L72
.L74:
	cmp	r4, #19
	mov	r0, #154
	mov	r1, #34
	add	r4, r4, #1
	beq	.L94
.L72:
	cmp	r5, #20
	beq	.L95
	cmp	r5, #21
	beq	.L96
	add	r4, r5, #1
	mov	r0, r4, asl #16
	mov	r0, r0, asr #16
	mov	r1, #34
	bl	set_switch_old(PLT)
	mov	r6, #0
.L93:
	cmp	r6, #0
	mov	r0, #153
	mov	r1, #33
	mov	r5, r4
	bne	.L97
.L73:
	cmp	r4, #18
	bne	.L74
	bl	set_switch_old(PLT)
	add	r4, r4, #1
	cmp	r6, #0
	mov	r0, #153
	mov	r1, #33
	mov	r5, r4
	beq	.L73
.L97:
	ldr	r1, .L98+12
	mov	r2, #22
	add	r1, sl, r1
	sub	r0, r0, #152
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L94:
	bl	set_switch_old(PLT)
	b	.L93
.L96:
	mov	r0, #156
	mov	r1, #33
	bl	set_switch_old(PLT)
	add	r4, r5, #1
	mov	r6, #1
	b	.L93
.L95:
	mov	r0, #155
	mov	r1, #34
	bl	set_switch_old(PLT)
	add	r4, r5, #1
	mov	r6, #0
	b	.L93
.L99:
	.align	2
.L98:
	.word	_GLOBAL_OFFSET_TABLE_-(.L92+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	initialize_track, .-initialize_track
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"\0337\033[%d;0H     %c%c%c  \0338\000"
	.text
	.align	2
	.global	track_sensor_task
	.type	track_sensor_task, %function
track_sensor_task:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L136
	sub	sp, sp, #88
	mvn	r3, #122
.L134:
	add	sl, pc, sl
	mov	r0, #7
	strb	r3, [sp, #86]
	bl	RegisterAs(PLT)
	ldr	r1, .L136+4
	add	r2, sp, #86
	mov	fp, #0
	str	r1, [sp, #12]
	str	r2, [sp, #20]
	add	r3, sp, #72
	add	lr, sp, #87
	add	r1, sp, #76
	add	r2, sp, #83
	str	fp, [sp, #48]
	str	fp, [sp, #40]
	str	r3, [sp, #8]
	str	lr, [sp, #16]
	str	r1, [sp, #28]
	str	r2, [sp, #24]
.L135:
	mov	r0, #0
	ldr	r1, [sp, #20]
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r3, #0
	str	r3, [sp, #44]
	mov	r9, r3
.L102:
	mov	r0, #0
	bl	Getc(PLT)
	ands	r0, r0, #255
	str	r0, [sp, #36]
	beq	.L103
	mov	r3, r9, lsr #31
	add	r2, r9, r3
	and	r2, r2, #1
	add	r1, r9, r9, lsr #31
	rsb	r2, r3, r2
	mov	r1, r1, asr #1
	cmp	r2, #1
	mov	r1, r1, asl #4
	moveq	r5, #8
	movne	r5, #0
	str	r1, [sp, #32]
	mov	r6, #7
.L108:
	ldr	lr, [sp, #36]
	ldr	r1, [sp, #32]
	mov	r3, lr, asr r6
	tst	r3, #1
	add	r4, r1, r5
	ldreq	r4, [sp, #48]
	beq	.L111
	ldr	r3, [sp, #48]
	add	r2, sp, #88
	add	lr, fp, #1
	cmp	r4, r3
	add	r8, r2, fp, asl #2
	mov	r7, lr, asr #31
	ldr	r1, [sp, #16]
	mov	r2, #0
	ldr	r0, [sp, #8]
	str	r4, [sp, #48]
	str	r4, [sp, #76]
	addeq	r5, r5, #1
	beq	.L114
	ldr	r3, .L136+8
	str	r4, [r8, #-36]
	smull	fp, ip, r3, lr
	rsb	fp, r7, ip, asr #1
	add	r3, fp, fp, asl #2
	rsb	fp, r3, lr
	bl	Receive(PLT)
	ldr	lr, [sp, #40]
	mov	r3, #1
	add	lr, lr, #1
	ldr	r0, [sp, #72]
	ldr	r1, [sp, #28]
	mov	r2, #4
	str	lr, [sp, #40]
	str	r3, [sp, #44]
	bl	Reply(PLT)
.L111:
	add	r5, r5, #1
	str	r4, [sp, #48]
.L114:
	subs	r6, r6, #1
	bcs	.L108
.L103:
	add	r9, r9, #1
	cmp	r9, #10
	bne	.L102
	ldr	lr, [sp, #44]
	sub	r3, fp, #1
	cmp	lr, #0
	beq	.L135
	ldr	r2, [sp, #40]
	cmp	r2, #0
	movgt	r5, #0
	ble	.L135
.L118:
	cmn	r3, #1
	addeq	r3, r3, #5
	add	r1, sp, #88
	add	r2, r1, r3, asl #2
	mov	r6, #3
	subne	r6, r3, #1
	ldr	r3, [r2, #-36]
	ldr	r1, [sp, #24]
	mov	r0, r3
	str	r3, [sp, #76]
	bl	sensor_id_to_name(PLT)
	ldr	lr, [sp, #12]
	ldrb	ip, [sp, #84]	@ zero_extendqisi2
	ldrb	r4, [sp, #85]	@ zero_extendqisi2
	ldrb	r3, [sp, #83]	@ zero_extendqisi2
	add	r2, r5, #7
	mov	r0, #1
	add	r5, r5, #1
	add	r1, sl, lr
	str	ip, [sp, #0]
	str	r4, [sp, #4]
	bl	Printf(PLT)
	cmp	r5, #5
	mov	r3, r6
	beq	.L135
	ldr	r1, [sp, #40]
	cmp	r5, r1
	bne	.L118
	b	.L135
.L137:
	.align	2
.L136:
	.word	_GLOBAL_OFFSET_TABLE_-(.L134+8)
	.word	.LC4(GOTOFF)
	.word	1717986919
	.size	track_sensor_task, .-track_sensor_task
	.ident	"GCC: (GNU) 4.0.2"
