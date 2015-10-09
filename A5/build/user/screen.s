	.file	"screen.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0337\033[1A\033[2K\015Invalid command\0338\000"
	.text
	.align	2
	.global	output_invalid
	.type	output_invalid, %function
output_invalid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L4
	ldr	r1, .L4+4
.L3:
	add	sl, pc, sl
	add	r1, sl, r1
	mov	r2, #28
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.size	output_invalid, .-output_invalid
	.align	2
	.global	get_cmd
	.type	get_cmd, %function
get_cmd:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r1, [r0, #0]	@ zero_extendqisi2
	@ lr needed for prologue
	cmp	r1, #113
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	bne	.L7
	cmp	r2, #0
	cmpne	r2, #32
	moveq	r0, #99
	bxeq	lr
.L9:
	cmp	r3, #32
	beq	.L36
.L17:
	mvn	r0, #0
	bx	lr
.L36:
	cmp	r1, #116
	movne	r0, #0
	moveq	r0, #1
	cmp	r2, #114
	cmpeq	r1, #116
	moveq	r0, #0
	bxeq	lr
	cmp	r2, #105
	movne	r3, #0
	andeq	r3, r0, #1
	cmp	r3, #0
	movne	r0, #5
	bxne	lr
	cmp	r2, #99
	movne	r3, #0
	moveq	r3, #1
	cmp	r1, #97
	cmpeq	r2, #99
	moveq	r0, #7
	bxeq	lr
	cmp	r1, #100
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	movne	r0, #8
	bxne	lr
	cmp	r2, #100
	movne	r3, #0
	moveq	r3, #1
	cmp	r1, #99
	cmpeq	r2, #100
	moveq	r0, #9
	bxeq	lr
	tst	r0, r3
	movne	r0, #6
	bxne	lr
	cmp	r1, #114
	cmpeq	r2, #118
	moveq	r0, #1
	bxeq	lr
	cmp	r1, #115
	cmpeq	r2, #119
	moveq	r0, #2
	bxeq	lr
	b	.L17
.L7:
	cmp	r1, #103
	bne	.L12
	cmp	r2, #0
	cmpne	r2, #32
	moveq	r0, #3
	bne	.L9
	bx	lr
.L12:
	cmp	r1, #107
	bne	.L9
	cmp	r2, #0
	cmpne	r2, #32
	moveq	r0, #4
	bne	.L9
	bx	lr
	.size	get_cmd, .-get_cmd
	.align	2
	.global	parse_short
	.type	parse_short, %function
parse_short:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [r1, #0]
	mov	r2, r0
	ldrb	ip, [r0, lr]	@ zero_extendqisi2
	cmp	ip, #32
	cmpne	ip, #0
	moveq	r0, #0
	movne	r0, #1
	ldreq	pc, [sp], #4
	sub	r3, ip, #48
	cmp	r3, #9
	addls	r2, r2, lr
	movls	r3, #0
	bhi	.L42
.L43:
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	add	lr, lr, #1
	str	lr, [r1, #0]
	add	r3, r3, r3, asl #2
	add	r3, ip, r3, asl #1
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	sub	r3, r3, #48
	mov	r3, r3, asl #16
	cmp	ip, #0
	cmpne	ip, #32
	sub	r0, ip, #48
	mov	r3, r3, lsr #16
	add	r2, r2, #1
	beq	.L47
	cmp	r0, #9
	bls	.L43
.L42:
	mvn	r0, #0
	ldr	pc, [sp], #4
.L47:
	mov	r3, r3, asl #16
	mov	r0, r3, asr #16
	ldr	pc, [sp], #4
	.size	parse_short, .-parse_short
	.align	2
	.global	parse_curve_straight
	.type	parse_curve_straight, %function
parse_curve_straight:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #0]
	@ lr needed for prologue
	ldrb	r3, [r3, r0]	@ zero_extendqisi2
	mov	r2, #33
	cmp	r3, #83
	beq	.L51
	cmp	r3, #67
	mvnne	r2, #0
	moveq	r2, #34
.L51:
	mov	r0, r2
	bx	lr
	.size	parse_curve_straight, .-parse_curve_straight
	.align	2
	.global	parse_sensor_name
	.type	parse_sensor_name, %function
parse_sensor_name:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, [r1, #0]
	mov	lr, r1
	ldrb	r2, [r3, r0]	@ zero_extendqisi2
	add	ip, r3, #1
	str	ip, [r1, #0]
	mov	r2, r2, asl #20
	add	r1, r3, #2
	ldrb	ip, [r0, ip]	@ zero_extendqisi2
	sub	r2, r2, #68157440
	str	r1, [lr, #0]
	mov	r2, r2, lsr #16
	ldrb	r1, [r0, r1]	@ zero_extendqisi2
	add	r4, r3, #3
	add	r3, r2, ip
	sub	r3, r3, #49
	mov	r3, r3, asl #16
	cmp	r1, #0
	cmpne	r1, #32
	mov	r0, r3, lsr #16
	beq	.L58
	add	r3, ip, ip, asl #2
	add	r3, r2, r3, asl #1
	sub	r3, r3, #480
	mov	r3, r3, asl #16
	cmp	ip, #48
	movne	r2, r3, lsr #16
	add	r3, r2, r1
	sub	r3, r3, #49
	mov	r3, r3, asl #16
	str	r4, [lr, #0]
	mov	r0, r3, lsr #16
.L58:
	mov	r0, r0, asl #16
	mov	r0, r0, asr #16
	ldmfd	sp!, {r4, pc}
	.size	parse_sensor_name, .-parse_sensor_name
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"\0337\033[1A\033[2K\015Train %d set to %d\0338\000"
	.text
	.align	2
	.global	handle_move
	.type	handle_move, %function
handle_move:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	sub	sp, sp, #8
	add	r7, sp, #8
	mov	r1, #3
	ldr	sl, .L71
	str	r1, [r7, #-4]!
.L70:
	add	sl, pc, sl
	mov	r1, r7
	mov	r8, r2
	mov	r9, r3
	mov	r5, r0
	bl	parse_short(PLT)
	ldr	r3, [sp, #4]
	mov	r4, r0, asl #16
	add	r3, r3, #1
	mov	r0, r5
	mov	r1, r7
	str	r3, [sp, #4]
	bl	parse_short(PLT)
	mov	r0, r0, asl #16
	mov	r4, r4, lsr #16
	mov	r0, r0, lsr #16
	mov	r4, r4, asl #16
	eor	r3, r0, #32768
	mov	r6, r4, asr #16
	mov	r3, r3, lsr #15
	cmp	r6, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	beq	.L63
	ldr	r2, [r8, #8]
	cmp	r0, #0
	mov	r4, r0, asl #16
	movne	r3, #2
	mov	r5, #0
	mov	r4, r4, asr #16
	streq	r0, [r2, #4]
	strne	r3, [r2, #4]
	str	r6, [r2, #0]
	str	r5, [r2, #8]
	str	r4, [r2, #12]
	mov	r1, r8
	mov	r3, r7
	mov	r2, #16
	mov	r0, r9
	str	r5, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L71+4
	mov	r0, #1
	mov	r2, r6
	add	r1, sl, r1
	mov	r3, r4
	bl	Printf(PLT)
	mov	r0, r5
.L68:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L63:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L68
.L72:
	.align	2
.L71:
	.word	_GLOBAL_OFFSET_TABLE_-(.L70+8)
	.word	.LC1(GOTOFF)
	.size	handle_move, .-handle_move
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"\0337\033[1A\033[2K\015Train %d reversed\0338\000"
	.text
	.align	2
	.global	handle_rev
	.type	handle_rev, %function
handle_rev:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #8
	add	r4, sp, #8
	mov	r1, #3
	ldr	sl, .L80
	str	r1, [r4, #-4]!
	mov	r1, r4
.L78:
	add	sl, pc, sl
	mov	r6, r2
	mov	r5, r3
	bl	parse_short(PLT)
	mov	r2, #16
	mov	ip, r0, asl r2
	mov	r3, r4
	mov	r4, ip, asr r2
	mov	r7, #0
	cmp	r4, r7
	mov	r8, #1
	mov	r1, r6
	mov	r0, r5
	ble	.L79
	ldr	ip, [r6, #8]
	mvn	lr, #0
	str	lr, [ip, #12]
	str	r7, [ip, #8]
	stmia	ip, {r4, r8}	@ phole stm
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L80+4
	mov	r0, r8
	add	r1, sl, r1
	mov	r2, r4
	bl	Printf(PLT)
	mov	r0, r7
.L76:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L79:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L76
.L81:
	.align	2
.L80:
	.word	_GLOBAL_OFFSET_TABLE_-(.L78+8)
	.word	.LC2(GOTOFF)
	.size	handle_rev, .-handle_rev
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"\0337\033[1A\033[2K\015Train %d initializing\0338\000"
	.text
	.align	2
	.global	handle_init
	.type	handle_init, %function
handle_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #8
	add	r4, sp, #8
	ldr	sl, .L89
	mov	r8, #3
	str	r8, [r4, #-4]!
.L87:
	add	sl, pc, sl
	mov	r6, r1
	mov	r1, r4
	mov	r5, r2
	bl	parse_short(PLT)
	mov	r2, #16
	mov	ip, r0, asl r2
	mov	r3, r4
	mov	r4, ip, asr r2
	mov	r7, #0
	cmp	r4, r7
	mov	r1, r6
	mov	r0, r5
	ble	.L88
	ldr	ip, [r6, #8]
	mvn	lr, #0
	str	r8, [ip, #4]
	str	lr, [ip, #12]
	str	r7, [ip, #8]
	str	r4, [ip, #0]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L89+4
	mov	r0, #1
	mov	r2, r4
	add	r1, sl, r1
	bl	Printf(PLT)
	mov	r0, r7
.L85:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L88:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L85
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.L87+8)
	.word	.LC3(GOTOFF)
	.size	handle_init, .-handle_init
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"\0337\033[1A\033[2K\015Switch %d set to %c\0338\000"
	.text
	.align	2
	.global	handle_switch
	.type	handle_switch, %function
handle_switch:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #8
	add	r7, sp, #8
	mov	r3, #3
	ldr	sl, .L102
	str	r3, [r7, #-4]!
.L101:
	add	sl, pc, sl
	mov	r8, r1
	mov	r1, r7
	mov	r9, r2
	mov	r5, r0
	bl	parse_short(PLT)
	ldr	r3, [sp, #4]
	mov	r4, r0, asl #16
	add	r3, r3, #1
	mov	r0, r5
	mov	r1, r7
	str	r3, [sp, #4]
	bl	parse_curve_straight(PLT)
	mov	r4, r4, lsr #16
	sub	r3, r4, #153
	mov	r0, r0, asl #16
	mov	r4, r4, asl #16
	mov	r0, r0, asr #16
	mov	r2, r4, asr #16
	cmp	r0, #0
	cmpgt	r2, #0
	mov	r3, r3, asl #16
	ble	.L92
	cmp	r2, #18
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #196608
	movls	r1, #0
	cmp	r1, #0
	beq	.L94
.L92:
	bl	output_invalid(PLT)
	mvn	r0, #0
.L95:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L94:
	cmp	r0, #33
	mov	r2, r1
	mov	fp, #83
	beq	.L99
	cmp	r0, #34
	mov	r2, #1
	mvn	r0, #0
	bne	.L95
	mov	fp, #67
.L99:
	ldr	r3, [r8, #8]
	mov	r6, r4, asr #16
	mov	r5, #1
	mov	r4, #0
	str	r2, [r3, #40]
	str	r5, [r3, #32]
	str	r6, [r3, #36]
	str	r4, [r3, #44]
	mov	r1, r8
	mov	r3, r7
	mov	r2, #16
	mov	r0, r9
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L102+4
	mov	r0, r5
	add	r1, sl, r1
	mov	r2, r6
	mov	r3, fp
	bl	Printf(PLT)
	mov	r0, r4
	b	.L95
.L103:
	.align	2
.L102:
	.word	_GLOBAL_OFFSET_TABLE_-(.L101+8)
	.word	.LC4(GOTOFF)
	.size	handle_switch, .-handle_switch
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"\0337\033[1A\033[2K\015Train %d is no longer destin"
	.ascii	"ed for anything. =(\0338\000"
	.align	2
.LC6:
	.ascii	"\0337\033[1A\033[2K\015Train %d is destined for %dm"
	.ascii	"m past %c%c%c\0338\000"
	.text
	.align	2
	.global	handle_dest
	.type	handle_dest, %function
handle_dest:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L116
	sub	sp, sp, #24
	add	r8, sp, #16
.L113:
	add	sl, pc, sl
	mov	r3, #3
	mov	r6, r1
	mov	r1, r8
	mov	r5, r0
	str	r2, [sp, #12]
	str	r3, [sp, #16]
	bl	parse_short(PLT)
	ldr	r3, [sp, #16]
	mov	r4, r0, asl #16
	add	r3, r3, #1
	mov	r1, r8
	mov	r0, r5
	str	r3, [sp, #16]
	bl	parse_sensor_name(PLT)
	ldr	r3, [sp, #16]
	mov	r2, r0, asl #16
	add	r3, r3, #1
	mov	r0, r5
	mov	r1, r8
	str	r3, [sp, #16]
	mov	r5, r2, lsr #16
	bl	parse_short(PLT)
	mov	r4, r4, lsr #16
	add	r3, r5, #1
	mov	r4, r4, asl #16
	mov	ip, r3, asl #16
	ldr	r3, [sp, #16]
	mov	r7, r4, asr #16
	mov	r0, r0, asl #16
	add	r3, r3, #1
	cmp	r7, #0
	str	r3, [sp, #16]
	mov	r0, r0, lsr #16
	ble	.L114
	mov	r2, r0, asl #16
	mov	r3, r5, asl #16
	cmp	ip, #5242880
	mov	r5, r3, asr #16
	mov	r9, r2, asr #16
	mov	fp, #0
	mov	r3, r8
	mov	r1, r6
	ldr	r0, [sp, #12]
	mov	r2, #16
	bhi	.L114
	ldr	ip, [r6, #8]
	str	r7, [ip, #0]
	ldr	lr, [r6, #8]
	mov	ip, #4
	str	ip, [lr, #4]
	ldr	r4, [r6, #8]
	sub	ip, ip, #5
	str	ip, [r4, #12]
	ldr	lr, [r6, #8]
	str	fp, [lr, #8]
	ldr	ip, [r6, #8]
	str	r5, [ip, #16]
	ldr	lr, [r6, #8]
	str	r9, [lr, #20]
	str	fp, [sp, #0]
	bl	Send(PLT)
	mov	r0, r5
	add	r1, sp, #21
	bl	sensor_id_to_name(PLT)
	ldr	r1, .L116+4
	cmn	r5, #1
	mov	r2, r7
	add	r1, sl, r1
	mov	r0, #1
	mov	r3, r9
	beq	.L115
	ldr	r1, .L116+8
	ldrb	ip, [sp, #21]	@ zero_extendqisi2
	ldrb	lr, [sp, #22]	@ zero_extendqisi2
	ldrb	r4, [sp, #23]	@ zero_extendqisi2
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r7
	stmia	sp, {ip, lr}	@ phole stm
	str	r4, [sp, #8]
	bl	Printf(PLT)
	mov	r0, fp
.L107:
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L115:
	bl	Printf(PLT)
	mov	r0, fp
	b	.L107
.L114:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L107
.L117:
	.align	2
.L116:
	.word	_GLOBAL_OFFSET_TABLE_-(.L113+8)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	handle_dest, .-handle_dest
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"\0337\033[1A\033[2K\015Train %d is acceleration rat"
	.ascii	"e set for %d.\0338\000"
	.text
	.align	2
	.global	handle_accel
	.type	handle_accel, %function
handle_accel:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #8
	add	r5, sp, #8
	mov	r3, #3
	ldr	sl, .L125
	str	r3, [r5, #-4]!
.L123:
	add	sl, pc, sl
	mov	r8, r1
	mov	r1, r5
	mov	r7, r2
	mov	r6, r0
	bl	parse_short(PLT)
	ldr	r3, [sp, #4]
	mov	r1, r5
	add	r3, r3, #1
	mov	r4, r0, asl #16
	mov	r0, r6
	str	r3, [sp, #4]
	bl	parse_short(PLT)
	mov	r2, #16
	mov	lr, r0, asl r2
	mov	r4, r4, lsr #16
	mov	r4, r4, asl r2
	mov	lr, lr, lsr r2
	mov	r4, r4, asr r2
	mov	lr, lr, asl r2
	ldr	ip, [sp, #4]
	mov	r6, #0
	add	ip, ip, #1
	cmp	r4, r6
	mov	r3, r5
	mov	r1, r8
	mov	r0, r7
	str	ip, [sp, #4]
	mov	r5, lr, asr r2
	ble	.L124
	ldr	ip, [r8, #8]
	mov	lr, #5
	str	lr, [ip, #4]
	str	r5, [ip, #24]
	str	r4, [ip, #0]
	str	r6, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L125+4
	mov	r0, #1
	mov	r2, r4
	add	r1, sl, r1
	mov	r3, r5
	bl	Printf(PLT)
	mov	r0, r6
.L121:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L124:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L121
.L126:
	.align	2
.L125:
	.word	_GLOBAL_OFFSET_TABLE_-(.L123+8)
	.word	.LC7(GOTOFF)
	.size	handle_accel, .-handle_accel
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"\0337\033[1A\033[2K\015Train %d is deceleration rat"
	.ascii	"e set for %d.\0338\000"
	.text
	.align	2
	.global	handle_decel
	.type	handle_decel, %function
handle_decel:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #8
	add	r5, sp, #8
	mov	r3, #3
	ldr	sl, .L134
	str	r3, [r5, #-4]!
.L132:
	add	sl, pc, sl
	mov	r8, r1
	mov	r1, r5
	mov	r7, r2
	mov	r6, r0
	bl	parse_short(PLT)
	ldr	r3, [sp, #4]
	mov	r1, r5
	add	r3, r3, #1
	mov	r4, r0, asl #16
	mov	r0, r6
	str	r3, [sp, #4]
	bl	parse_short(PLT)
	mov	r2, #16
	mov	lr, r0, asl r2
	mov	r4, r4, lsr #16
	mov	r4, r4, asl r2
	mov	lr, lr, lsr r2
	mov	r4, r4, asr r2
	mov	lr, lr, asl r2
	ldr	ip, [sp, #4]
	mov	r6, #0
	add	ip, ip, #1
	cmp	r4, r6
	mov	r3, r5
	mov	r1, r8
	mov	r0, r7
	str	ip, [sp, #4]
	mov	r5, lr, asr r2
	ble	.L133
	ldr	ip, [r8, #8]
	mov	lr, #6
	str	lr, [ip, #4]
	str	r5, [ip, #28]
	str	r4, [ip, #0]
	str	r6, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L134+4
	mov	r0, #1
	mov	r2, r4
	add	r1, sl, r1
	mov	r3, r5
	bl	Printf(PLT)
	mov	r0, r6
.L130:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L133:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L130
.L135:
	.align	2
.L134:
	.word	_GLOBAL_OFFSET_TABLE_-(.L132+8)
	.word	.LC8(GOTOFF)
	.size	handle_decel, .-handle_decel
	.align	2
	.global	handle_ch_dir
	.type	handle_ch_dir, %function
handle_ch_dir:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #8
	add	r4, sp, #8
	mov	r3, #3
	str	r3, [r4, #-4]!
	mov	r7, r1
	mov	r1, r4
	mov	r5, r2
	bl	parse_short(PLT)
	mov	r0, r0, asl #16
	mov	r6, r0, asr #16
	cmp	r6, #0
	mov	r3, r4
	mov	r0, r5
	mov	r1, r7
	mov	r4, #0
	mov	r2, #16
	ble	.L141
	ldr	lr, [r7, #8]
	mov	ip, #7
	stmia	lr, {r6, ip}	@ phole stm
	str	r4, [sp, #0]
	bl	Send(PLT)
	mov	r0, r4
.L139:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L141:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L139
	.size	handle_ch_dir, .-handle_ch_dir
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"\0337\033[1A\033[2K\015Track ON\0338\000"
	.text
	.align	2
	.global	handle_go
	.type	handle_go, %function
handle_go:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L145
.L144:
	add	sl, pc, sl
	bl	track_go(PLT)
	ldr	r1, .L145+4
	mov	r2, #21
	add	r1, sl, r1
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L146:
	.align	2
.L145:
	.word	_GLOBAL_OFFSET_TABLE_-(.L144+8)
	.word	.LC9(GOTOFF)
	.size	handle_go, .-handle_go
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"\0337\033[1A\033[2K\015Track OFF\0338\000"
	.text
	.align	2
	.global	handle_kill
	.type	handle_kill, %function
handle_kill:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L150
.L149:
	add	sl, pc, sl
	bl	track_stop(PLT)
	ldr	r1, .L150+4
	mov	r2, #22
	add	r1, sl, r1
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L151:
	.align	2
.L150:
	.word	_GLOBAL_OFFSET_TABLE_-(.L149+8)
	.word	.LC10(GOTOFF)
	.size	handle_kill, .-handle_kill
	.align	2
	.global	handle_quit
	.type	handle_quit, %function
handle_quit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #99
	@ lr needed for prologue
	bx	lr
	.size	handle_quit, .-handle_quit
	.align	2
	.global	process_buffer
	.type	process_buffer, %function
process_buffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r7, r1
	mov	r5, r2
	mov	r6, r3
	mov	r4, r0
	bl	get_cmd(PLT)
	cmp	r0, #99
	addls	pc, pc, r0, asl #2
	b	.L155
	.p2align 2
.L167:
	b	.L156
	b	.L157
	b	.L158
	b	.L159
	b	.L160
	b	.L161
	b	.L162
	b	.L163
	b	.L164
	b	.L165
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L155
	b	.L166
.L156:
	mov	r0, r4
	mov	r1, r7
	mov	r2, r5
	mov	r3, r6
	bl	handle_move(PLT)
.L168:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L166:
	mov	r0, r5
	mov	r1, r6
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	handle_quit(PLT)
.L155:
	bl	output_invalid(PLT)
	b	.L168
.L165:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	handle_ch_dir(PLT)
	b	.L168
.L164:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	handle_decel(PLT)
	b	.L168
.L163:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	handle_accel(PLT)
	b	.L168
.L162:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	handle_dest(PLT)
	b	.L168
.L161:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	handle_init(PLT)
	b	.L168
.L160:
	bl	handle_kill(PLT)
	b	.L168
.L159:
	bl	handle_go(PLT)
	b	.L168
.L158:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	handle_switch(PLT)
	b	.L168
.L157:
	mov	r0, r4
	mov	r1, r7
	mov	r2, r5
	mov	r3, r6
	bl	handle_rev(PLT)
	b	.L168
	.size	process_buffer, .-process_buffer
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"\033[1D \033[1D\000"
	.align	2
.LC12:
	.ascii	"\033[24;0H\033[2K\033[24;0H>\000"
	.align	2
.LC13:
	.ascii	"\0337\033[1A\033[2K\015Shutting down. Goodbye!\033["
	.ascii	"24;0H\033[2K\000"
	.text
	.align	2
	.global	parse_user_input
	.type	parse_user_input, %function
parse_user_input:
	@ args = 0, pretend = 0, frame = 352
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #352
	ldr	sl, .L199
	mov	r3, #0
	add	r0, sp, #12
	str	r0, [sp, #8]
	mov	r1, r3
.L195:
	add	sl, pc, sl
.L171:
	ldr	r2, [sp, #8]
	mov	r0, #0	@ movhi
	strh	r0, [r3, r2]	@ movhi
	add	r3, r3, #2
	cmp	r3, #160
	bne	.L171
	ldr	r2, .L199+4
	ldr	r3, .L199+8
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	add	r2, sp, #172
	mov	r3, #1
	mov	r0, #6
	str	r3, [sp, #336]
	str	r2, [sp, #344]
	str	r1, [sp, #348]
	mov	r4, r1
	bl	WhoIs(PLT)
	ldr	r8, .L199+12
	mov	r7, r0
	add	r9, sp, #256
	add	fp, sp, #336
.L196:
	mov	r0, #1
	bl	Getc(PLT)
	and	r6, r0, #255
	cmp	r6, #8
	movne	r3, #0
	moveq	r3, #1
	cmp	r4, #0
	movle	r3, #0
	cmp	r3, #0
	bne	.L197
	cmp	r6, #13
	beq	.L198
.L176:
	cmp	r4, #79
	bgt	.L196
.L180:
	sub	r2, r6, #65
	sub	r3, r6, #97
	cmp	r3, #25
	cmphi	r2, #25
	bls	.L183
	sub	r3, r6, #48
	cmp	r6, #32
	cmpne	r3, #9
	bhi	.L196
.L183:
	add	r0, sp, #352
	add	r3, r0, r4
	mov	r1, r6
	mov	r0, #1
	strb	r6, [r3, #-96]
	add	r4, r4, r0
	bl	Putc(PLT)
	b	.L196
.L197:
	add	r0, sp, #352
	sub	r4, r4, #1
	add	ip, r0, r4
	mov	r3, #0
	mov	r0, #1
	add	r1, sl, r8
	mov	r2, #9
	strb	r3, [ip, #-96]
	bl	Putstr(PLT)
	cmp	r6, #13
	bne	.L176
.L198:
	add	r2, sp, #352
	add	r3, r2, r4
	ldr	r2, [sp, #4]
	mov	r4, #0
	add	r1, sl, r2
	strb	r4, [r3, #-96]
	mov	r2, #19
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r2, fp
	mov	r3, r7
	mov	r0, r9
	ldr	r1, [sp, #8]
	bl	process_buffer(PLT)
	mvn	r2, #0
	mov	r3, #120
	cmp	r0, #99
	str	r3, [sp, #196]
	str	r2, [sp, #212]
	str	r4, [sp, #172]
	str	r2, [sp, #176]
	str	r4, [sp, #180]
	str	r4, [sp, #184]
	str	r2, [sp, #188]
	str	r4, [sp, #192]
	str	r4, [sp, #208]
	str	r4, [sp, #216]
	bne	.L180
	ldr	r3, [sp, #0]
	mov	r0, #1
	add	r1, sl, r3
	mov	r2, #45
	bl	Putstr(PLT)
	mov	r4, #25
	add	r5, sp, #112
.L181:
	mov	r0, r4
	mov	r2, #0	@ movhi
	add	r4, r4, #1
	mov	r1, #0
	strh	r2, [r5, #-50]	@ movhi
	bl	set_train_speed_old(PLT)
	cmp	r4, #80
	add	r5, r5, #2
	bne	.L181
	mov	r0, #500
	bl	Delay(PLT)
	ldr	r0, .L199+16
	bl	Kill_the_system(PLT)
	sub	r4, r4, #80
	b	.L180
.L200:
	.align	2
.L199:
	.word	_GLOBAL_OFFSET_TABLE_-(.L195+8)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	-559038737
	.size	parse_user_input, .-parse_user_input
	.ident	"GCC: (GNU) 4.0.2"
