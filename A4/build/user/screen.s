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
	ldrb	r2, [r0, #0]	@ zero_extendqisi2
	@ lr needed for prologue
	cmp	r2, #113
	ldrb	r1, [r0, #2]	@ zero_extendqisi2
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	bne	.L7
	cmp	r3, #0
	cmpne	r3, #32
	moveq	r0, #99
	bxeq	lr
.L9:
	cmp	r1, #32
	beq	.L26
.L17:
	mvn	r0, #0
	bx	lr
.L26:
	cmp	r2, #116
	cmpeq	r3, #114
	moveq	r0, #0
	bxeq	lr
	cmp	r2, #114
	cmpeq	r3, #118
	moveq	r0, #1
	bxeq	lr
	cmp	r2, #115
	cmpeq	r3, #119
	moveq	r0, #2
	bxeq	lr
	b	.L17
.L7:
	cmp	r2, #103
	bne	.L12
	cmp	r3, #0
	cmpne	r3, #32
	moveq	r0, #3
	bne	.L9
	bx	lr
.L12:
	cmp	r2, #107
	bne	.L9
	cmp	r3, #0
	cmpne	r3, #32
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
	bhi	.L32
.L33:
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
	beq	.L37
	cmp	r0, #9
	bls	.L33
.L32:
	mvn	r0, #0
	ldr	pc, [sp], #4
.L37:
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
	beq	.L41
	cmp	r3, #67
	mvnne	r2, #0
	moveq	r2, #34
.L41:
	mov	r0, r2
	bx	lr
	.size	parse_curve_straight, .-parse_curve_straight
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
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L51
	sub	sp, sp, #4
	mov	r3, #3
	add	r4, sp, #4
.L50:
	add	sl, pc, sl
	str	r3, [r4, #-4]!
	mov	r7, r1
	mov	r1, sp
	mov	r6, r0
	bl	parse_short(PLT)
	ldr	r3, [sp, #0]
	mov	r1, sp
	add	r3, r3, #1
	mov	r5, r0, asl #16
	mov	r0, r6
	str	r3, [sp, #0]
	bl	parse_short(PLT)
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	mov	r5, r5, lsr #16
	mov	r2, r3, asl #16
	mov	r5, r5, asl #16
	eor	r3, r3, #32768
	mov	r5, r5, asr #16
	mov	r3, r3, lsr #15
	cmp	r5, #0
	movle	r3, #0
	andgt	r3, r3, #1
	mov	r4, r2, asr #16
	cmp	r3, #0
	mov	r1, r4
	mov	r0, r5
	beq	.L46
	bl	set_train_speed(PLT)
	ldr	r1, .L51+4
	mov	r3, r5, asl #1
	strh	r0, [r3, r7]	@ movhi
	add	r1, sl, r1
	mov	r0, #1
	mov	r2, r5
	mov	r3, r4
	bl	Printf(PLT)
	mov	r0, #0
.L48:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L46:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L48
.L52:
	.align	2
.L51:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
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
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L60
	sub	sp, sp, #4
	add	r3, sp, #4
	mov	r2, #3
.L58:
	add	sl, pc, sl
	str	r2, [r3, #-4]!
	mov	r4, r1
	mov	r1, sp
	bl	parse_short(PLT)
	mov	r3, r0, asl #16
	mov	r5, r3, asr #16
	ldr	r1, .L60+4
	mov	r0, #1
	cmp	r5, #0
	add	r1, sl, r1
	mov	r2, r5
	mov	r3, r5, asl r0
	ble	.L59
	ldrh	r4, [r3, r4]
	bl	Printf(PLT)
	mov	r1, #0
	mov	r0, r5
	bl	set_train_speed(PLT)
	ldr	r0, .L60+8
	bl	Delay(PLT)
	mov	r4, r4, asl #16
	mov	r1, #15
	mov	r0, r5
	bl	set_train_speed(PLT)
	mov	r0, r5
	mov	r1, r4, asr #16
	bl	set_train_speed(PLT)
	mov	r0, #0
.L56:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, sl, pc}
.L59:
	bl	output_invalid(PLT)
	mvn	r0, #0
	b	.L56
.L61:
	.align	2
.L60:
	.word	_GLOBAL_OFFSET_TABLE_-(.L58+8)
	.word	.LC2(GOTOFF)
	.word	350
	.size	handle_rev, .-handle_rev
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"\0337\033[1A\033[2K\015Switch %d set to %c\0338\000"
	.text
	.align	2
	.global	handle_switch
	.type	handle_switch, %function
handle_switch:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L73
	sub	sp, sp, #4
	mov	r3, #3
	add	r4, sp, #4
.L72:
	add	sl, pc, sl
	str	r3, [r4, #-4]!
	mov	r1, sp
	mov	r6, r0
	bl	parse_short(PLT)
	ldr	r3, [sp, #0]
	mov	r5, r0, asl #16
	add	r3, r3, #1
	mov	r0, r6
	mov	r1, sp
	str	r3, [sp, #0]
	bl	parse_curve_straight(PLT)
	mov	r5, r5, lsr #16
	mov	r0, r0, asl #16
	mov	r4, r5, asl #16
	mov	r6, r0, asr #16
	mov	r2, r4, asr #16
	sub	r3, r5, #153
	cmp	r6, #0
	cmpgt	r2, #0
	mov	r3, r3, asl #16
	ble	.L63
	cmp	r2, #18
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #196608
	movls	r1, #0
	cmp	r1, #0
	bne	.L63
	cmp	r6, #33
	mov	r3, #83
	beq	.L70
	cmp	r6, #34
	movne	r3, #47
	moveq	r3, #67
.L70:
	ldr	r1, .L73+4
	mov	r4, r4, asr #16
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	Printf(PLT)
	mov	r0, r4
	mov	r1, r6
	bl	set_switch(PLT)
	mov	r0, #0
	b	.L66
.L63:
	bl	output_invalid(PLT)
	mvn	r0, #0
.L66:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	.LC3(GOTOFF)
	.size	handle_switch, .-handle_switch
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"\0337\033[1A\033[2K\015Track ON\0338\000"
	.text
	.align	2
	.global	handle_go
	.type	handle_go, %function
handle_go:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L78
.L77:
	add	sl, pc, sl
	bl	track_go(PLT)
	ldr	r1, .L78+4
	mov	r2, #21
	add	r1, sl, r1
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L79:
	.align	2
.L78:
	.word	_GLOBAL_OFFSET_TABLE_-(.L77+8)
	.word	.LC4(GOTOFF)
	.size	handle_go, .-handle_go
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"\0337\033[1A\033[2K\015Track OFF\0338\000"
	.text
	.align	2
	.global	handle_kill
	.type	handle_kill, %function
handle_kill:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L83
.L82:
	add	sl, pc, sl
	bl	track_stop(PLT)
	ldr	r1, .L83+4
	mov	r2, #22
	add	r1, sl, r1
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L84:
	.align	2
.L83:
	.word	_GLOBAL_OFFSET_TABLE_-(.L82+8)
	.word	.LC5(GOTOFF)
	.size	handle_kill, .-handle_kill
	.align	2
	.global	process_buffer
	.type	process_buffer, %function
process_buffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r6, r1
	mov	r5, r0
	bl	get_cmd(PLT)
	cmp	r0, #2
	mov	r4, r0
	beq	.L89
	ble	.L97
	cmp	r0, #4
	beq	.L91
	bge	.L98
	bl	handle_go(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L97:
	cmp	r0, #0
	bne	.L99
	mov	r0, r5
	mov	r1, r6
	bl	handle_move(PLT)
.L96:
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L89:
	mov	r0, r5
	bl	handle_switch(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L99:
	cmp	r0, #1
	beq	.L100
.L86:
	bl	output_invalid(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L98:
	cmp	r0, #99
	bne	.L86
	b	.L96
.L91:
	bl	handle_kill(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L100:
	mov	r0, r5
	mov	r1, r6
	bl	handle_rev(PLT)
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.size	process_buffer, .-process_buffer
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"\033[1D \033[1D\000"
	.align	2
.LC7:
	.ascii	"\033[24;0H\033[2K\033[24;0H>\000"
	.align	2
.LC8:
	.ascii	"\0337\033[1A\033[2K\015Shutting down. Goodbye!\033["
	.ascii	"24;0H\033[2K\000"
	.text
	.align	2
	.global	parse_user_input
	.type	parse_user_input, %function
parse_user_input:
	@ args = 0, pretend = 0, frame = 244
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L130
	sub	sp, sp, #244
	mov	r3, #0
	add	r9, sp, #4
.L126:
	add	sl, pc, sl
.L102:
	mov	r2, #0	@ movhi
	strh	r2, [r3, r9]	@ movhi
	add	r3, r3, #2
	cmp	r3, #160
	bne	.L102
	ldr	r3, .L130+4
	ldr	r7, .L130+8
	ldr	fp, .L130+12
	str	r3, [sp, #0]
	mov	r4, #0
	add	r8, sp, #164
.L127:
	mov	r0, #1
	bl	Getc(PLT)
	and	r6, r0, #255
	cmp	r6, #8
	movne	r3, #0
	moveq	r3, #1
	cmp	r4, #0
	movle	r3, #0
	cmp	r3, #0
	bne	.L128
	cmp	r6, #13
	beq	.L129
.L107:
	cmp	r4, #79
	bgt	.L127
.L111:
	sub	r2, r6, #65
	sub	r3, r6, #97
	cmp	r3, #25
	cmphi	r2, #25
	bls	.L114
	sub	r3, r6, #48
	cmp	r6, #32
	cmpne	r3, #9
	bhi	.L127
.L114:
	add	r2, sp, #244
	add	r3, r2, r4
	mov	r1, r6
	mov	r0, #1
	strb	r6, [r3, #-80]
	add	r4, r4, r0
	bl	Putc(PLT)
	b	.L127
.L128:
	add	r2, sp, #244
	sub	r4, r4, #1
	add	ip, r2, r4
	mov	r3, #0
	mov	r0, #1
	add	r1, sl, r7
	mov	r2, #9
	strb	r3, [ip, #-80]
	bl	Putstr(PLT)
	cmp	r6, #13
	bne	.L107
.L129:
	add	r2, sp, #244
	add	r3, r2, r4
	mov	r4, #0
	mov	r2, #19
	add	r1, sl, fp
	strb	r4, [r3, #-80]
	mov	r0, #1
	bl	Putstr(PLT)
	mov	r0, r8
	mov	r1, r9
	bl	process_buffer(PLT)
	cmp	r0, #99
	bne	.L111
	ldr	r3, [sp, #0]
	mov	r0, #1
	add	r1, sl, r3
	mov	r2, #45
	bl	Putstr(PLT)
	mov	r4, #25
	add	r5, sp, #104
.L112:
	mov	r2, #0	@ movhi
	mov	r0, r4
	mov	r1, #0
	strh	r2, [r5, #-50]	@ movhi
	add	r4, r4, #1
	bl	set_train_speed(PLT)
	mov	r0, #10
	bl	Delay(PLT)
	cmp	r4, #80
	add	r5, r5, #2
	bne	.L112
	mov	r0, #500
	bl	Delay(PLT)
	ldr	r0, .L130+16
	bl	Kill_the_system(PLT)
	sub	r4, r4, #80
	b	.L111
.L131:
	.align	2
.L130:
	.word	_GLOBAL_OFFSET_TABLE_-(.L126+8)
	.word	.LC8(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	-559038737
	.size	parse_user_input, .-parse_user_input
	.ident	"GCC: (GNU) 4.0.2"
