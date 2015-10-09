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
	.size	set_train_speed, .-set_train_speed
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
	ldr	sl, .L25
	cmp	ip, #153
.L23:
	add	sl, pc, sl
	and	lr, r1, #255
	mov	r0, r0, lsr #16
	sub	sp, sp, #8
	sub	r1, ip, #1
	moveq	r0, #4
	moveq	r2, #2
	beq	.L13
	cmp	ip, #154
	moveq	r0, #4
	moveq	r2, #3
	beq	.L13
	cmp	ip, #155
	moveq	r0, #5
	moveq	r2, #0
	beq	.L13
	cmp	ip, #156
	moveq	r0, #5
	moveq	r2, #1
	beq	.L13
	sub	r3, r0, #1
	mov	r3, r3, asl #16
	cmp	r3, #1114112
	bhi	.L20
	mov	r3, r1, asr #31
	mov	r3, r3, lsr #30
	add	r2, r1, r3
	cmp	r1, #0
	addlt	r1, ip, #2
	and	r2, r2, #3
	rsb	r2, r3, r2
	mov	r0, r1, asr #2
.L13:
	add	r3, r2, r2, asl #2
	ldr	r1, .L25+4
	add	r3, r2, r3, asl #1
	add	r1, sl, r1
	add	r2, r0, #9
	add	r3, r3, #20
	mov	r0, #1
	stmia	sp, {ip, lr}	@ phole stm
	bl	Printf(PLT)
.L20:
	mov	r0, #0
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L23+8)
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
	.global	set_switch
	.type	set_switch, %function
set_switch:
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
	beq	.L33
	cmp	r1, #34
	movne	r1, #47
	moveq	r1, #67
.L33:
	mov	r0, r5, asl #16
	mov	r0, r0, asr #16
	bl	update_switch_output(PLT)
	mov	r0, #0
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
	.size	set_switch, .-set_switch
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
	ldr	sl, .L62
	ldr	r1, .L62+4
.L56:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	ldr	r1, .L62+8
	mov	r2, #43
	add	r1, sl, r1
	mov	r0, #1
	bl	Putstr(PLT)
	bl	track_go(PLT)
	mov	r5, #0
	b	.L36
.L38:
	cmp	r4, #19
	mov	r0, #154
	mov	r1, #34
	add	r4, r4, #1
	beq	.L58
.L36:
	cmp	r5, #20
	beq	.L59
	cmp	r5, #21
	beq	.L60
	add	r4, r5, #1
	mov	r0, r4, asl #16
	mov	r0, r0, asr #16
	mov	r1, #34
	bl	set_switch(PLT)
	mov	r6, #0
.L57:
	mov	r0, #10
	bl	Delay(PLT)
	cmp	r6, #0
	mov	r0, #153
	mov	r1, #33
	mov	r5, r4
	bne	.L61
.L37:
	cmp	r4, #18
	bne	.L38
	bl	set_switch(PLT)
	mov	r0, #10
	bl	Delay(PLT)
	add	r4, r4, #1
	cmp	r6, #0
	mov	r0, #153
	mov	r1, #33
	mov	r5, r4
	beq	.L37
.L61:
	ldr	r1, .L62+12
	mov	r2, #22
	add	r1, sl, r1
	sub	r0, r0, #152
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L58:
	bl	set_switch(PLT)
	b	.L57
.L60:
	mov	r0, #156
	mov	r1, #34
	bl	set_switch(PLT)
	add	r4, r5, #1
	mov	r6, #1
	b	.L57
.L59:
	mov	r0, #155
	mov	r1, #33
	bl	set_switch(PLT)
	add	r4, r5, #1
	mov	r6, #0
	b	.L57
.L63:
	.align	2
.L62:
	.word	_GLOBAL_OFFSET_TABLE_-(.L56+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	initialize_track, .-initialize_track
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"\0337\033[%d;0H     %c%d  \0338\000"
	.text
	.align	2
	.global	track_sensor_task
	.type	track_sensor_task, %function
track_sensor_task:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r1, .L94
	sub	sp, sp, #36
	mov	r6, #0
	ldr	sl, .L94+4
	str	r1, [sp, #4]
	mov	fp, r6
	str	r6, [sp, #8]
.L93:
	add	sl, pc, sl
.L65:
	mov	r0, #0
	mov	r1, #133
	bl	Putc(PLT)
	mov	r2, #0
	str	r2, [sp, #12]
	mov	r9, r2
	mov	r8, r2
.L66:
	mov	r0, #0
	bl	Getc(PLT)
	ands	r7, r0, #255
	beq	.L67
	mov	r2, r9, lsr #31
	add	r3, r9, r2
	and	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movne	lr, #1
	moveq	lr, #9
	mov	r0, #7
.L72:
	mov	r3, r7, asr r0
	tst	r3, #1
	add	ip, r8, lr
	beq	.L73
	add	r1, r6, #1
	add	r3, sp, #36
	cmp	ip, fp
	mov	r4, r1, asr #31
	add	r5, r3, r6, asl #2
	mov	fp, ip
	beq	.L73
	ldr	r3, .L94+8
	mov	fp, ip
	smull	r6, r2, r3, r1
	rsb	r6, r4, r2, asr #1
	add	r3, r6, r6, asl #2
	rsb	r6, r3, r1
	ldr	r1, [sp, #8]
	mov	r2, #1
	add	r1, r1, #1
	str	r1, [sp, #8]
	str	r2, [sp, #12]
	str	ip, [r5, #-20]
.L73:
	subs	r0, r0, #1
	add	lr, lr, #1
	bcs	.L72
.L67:
	add	r9, r9, #1
	cmp	r9, #10
	add	r8, r8, #100
	bne	.L66
	ldr	r3, [sp, #12]
	cmp	r3, #0
	sub	r3, r6, #1
	beq	.L79
	ldr	r2, [sp, #8]
	cmp	r2, #0
	movgt	r4, #0
	ble	.L79
.L82:
	cmn	r3, #1
	addeq	r3, r3, #5
	add	lr, sp, #36
	mov	r5, #3
	subne	r5, r3, #1
	add	r3, lr, r3, asl #2
	ldr	ip, [r3, #-20]
	ldr	r3, .L94+12
	ldr	lr, [sp, #4]
	smull	r1, r0, r3, ip
	mov	r1, ip, asr #31
	rsb	r1, r1, r0, asr #5
	add	r3, r1, r1, lsr #31
	mov	r3, r3, asr #1
	add	r1, r1, r1, asl #2
	add	r1, r1, r1, asl #2
	add	r3, r3, #65
	sub	ip, ip, r1, asl #2
	add	r2, r4, #7
	and	r3, r3, #255
	add	r4, r4, #1
	mov	r0, #1
	add	r1, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	cmp	r4, #5
	mov	r3, r5
	beq	.L79
	ldr	r1, [sp, #8]
	cmp	r4, r1
	bne	.L82
.L79:
	mov	r0, #10
	bl	Delay(PLT)
	b	.L65
.L95:
	.align	2
.L94:
	.word	.LC4(GOTOFF)
	.word	_GLOBAL_OFFSET_TABLE_-(.L93+8)
	.word	1717986919
	.word	1374389535
	.size	track_sensor_task, .-track_sensor_task
	.ident	"GCC: (GNU) 4.0.2"
