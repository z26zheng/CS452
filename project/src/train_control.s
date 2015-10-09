	.file	"train_control.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[s\033[%d;%dH %c \033[u\000"
	.text
	.align	2
	.global	print_sw
	.type	print_sw, %function
print_sw:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #33
	bne	.L2
	mov	r3, #83
	strb	r3, [fp, #-25]
.L2:
	ldr	r3, [fp, #-36]
	cmp	r3, #34
	bne	.L4
	mov	r3, #67
	strb	r3, [fp, #-25]
.L4:
	ldr	r3, [fp, #-32]
	cmp	r3, #18
	ble	.L6
	ldr	r3, [fp, #-32]
	sub	r3, r3, #128
	str	r3, [fp, #-20]
	b	.L8
.L6:
	ldr	r3, [fp, #-32]
	add	r3, r3, #6
	str	r3, [fp, #-20]
.L8:
	mov	r3, #10
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L11+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	bl	plprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC0(GOTOFF)
	.size	print_sw, .-print_sw
	.align	2
	.global	train_init
	.type	train_init, %function
train_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	ldr	r3, .L16+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	ldr	r1, .L16+8
	bl	com_buf_init(PLT)
	ldr	r3, .L16+12
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L16+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r0, #1
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #2
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #3
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #4
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #5
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #6
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #7
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #8
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #9
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #10
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #11
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #12
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #13
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #14
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #15
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #16
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #17
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #18
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #153
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #154
	mov	r1, #33
	bl	track_sw(PLT)
	mov	r0, #155
	mov	r1, #34
	bl	track_sw(PLT)
	mov	r0, #156
	mov	r1, #33
	bl	track_sw(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	train_buf(GOT)
	.word	1800
	.word	train_pre_speed(GOT)
	.word	future_time(GOT)
	.size	train_init, .-train_init
	.align	2
	.global	train_buf_push_back
	.type	train_buf_push_back, %function
train_buf_push_back:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	mov	r3, r0
	strb	r3, [fp, #-20]
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, r2
	bl	com_buf_push_back(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	train_buf(GOT)
	.size	train_buf_push_back, .-train_buf_push_back
	.align	2
	.global	train_buf_pop_front
	.type	train_buf_pop_front, %function
train_buf_pop_front:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L26
.L25:
	add	sl, pc, sl
	ldr	r3, .L26+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	train_buf(GOT)
	.size	train_buf_pop_front, .-train_buf_pop_front
	.align	2
	.global	train_buf_pop_back
	.type	train_buf_pop_back, %function
train_buf_pop_back:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L31
.L30:
	add	sl, pc, sl
	ldr	r3, .L31+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_back(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.L30+8)
	.word	train_buf(GOT)
	.size	train_buf_pop_back, .-train_buf_pop_back
	.align	2
	.global	train_speed
	.type	train_speed, %function
train_speed:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r0, #0
	mov	r1, #96
	bl	plbufc(PLT)
	mov	r0, #0
	mov	r1, #128
	bl	plbufc(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	plbufc(PLT)
	mov	r0, #0
	mov	r1, #128
	bl	plbufc(PLT)
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	plbufc(PLT)
	mov	r0, #0
	mov	r1, #128
	bl	plbufc(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_speed, .-train_speed
	.align	2
	.global	train_rv
	.type	train_rv, %function
train_rv:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L38
.L37:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r0, [fp, #-20]
	mov	r1, #0
	bl	train_speed(PLT)
	bl	timer_get_time(PLT)
	mov	r3, r0
	add	r2, r3, #25
	ldr	r3, .L38+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r0, #0
	mov	r1, #129
	bl	plbufc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #15
	bl	train_speed(PLT)
	ldr	r3, .L38+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	train_speed(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L39:
	.align	2
.L38:
	.word	_GLOBAL_OFFSET_TABLE_-(.L37+8)
	.word	future_time(GOT)
	.word	train_pre_speed(GOT)
	.size	train_rv, .-train_rv
	.align	2
	.global	track_sw
	.type	track_sw, %function
track_sw:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L43
.L42:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	print_sw(PLT)
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	plbufc(PLT)
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, #0
	mov	r1, r3
	bl	plbufc(PLT)
	bl	timer_get_time(PLT)
	mov	r3, r0
	add	r2, r3, #2
	ldr	r3, .L43+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	mov	r0, #0
	mov	r1, #32
	bl	plbufc(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L44:
	.align	2
.L43:
	.word	_GLOBAL_OFFSET_TABLE_-(.L42+8)
	.word	future_time(GOT)
	.size	track_sw, .-track_sw
	.align	2
	.global	train_is_future
	.type	train_is_future, %function
train_is_future:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L48
.L47:
	add	sl, pc, sl
	bl	timer_get_time(PLT)
	mov	r2, r0
	ldr	r3, .L48+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	movcc	r3, #0
	movcs	r3, #1
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	_GLOBAL_OFFSET_TABLE_-(.L47+8)
	.word	future_time(GOT)
	.size	train_is_future, .-train_is_future
	.align	2
	.global	train_do_command
	.type	train_do_command, %function
train_do_command:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L59
.L58:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #200
	beq	.L53
	ldr	r3, [fp, #-36]
	cmp	r3, #300
	beq	.L54
	ldr	r3, [fp, #-36]
	cmp	r3, #100
	beq	.L52
	b	.L51
.L52:
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	train_speed(PLT)
	ldr	r3, .L59+4
	ldr	r2, [sl, r3]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	b	.L55
.L53:
	ldr	r0, [fp, #-24]
	bl	train_rv(PLT)
	b	.L55
.L54:
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	track_sw(PLT)
	b	.L55
.L51:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L56
.L55:
	mov	r3, #0
	str	r3, [fp, #-32]
.L56:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L60:
	.align	2
.L59:
	.word	_GLOBAL_OFFSET_TABLE_-(.L58+8)
	.word	train_pre_speed(GOT)
	.size	train_do_command, .-train_do_command
	.align	2
	.global	train_parse_command
	.type	train_parse_command, %function
train_parse_command:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	mvn	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	bl	get_input.1296(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	parse_input.1307(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	bl	get_input.1296(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	parse_input.1307(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-28]
	bl	get_input.1296(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	parse_input.1307(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	bl	train_do_command(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	train_parse_command, .-train_parse_command
	.align	2
	.type	parse_input.1307, %function
parse_input.1307:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-20]
	mov	r3, r2
	strb	r3, [fp, #-24]
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #116
	bne	.L64
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #114
	bne	.L64
	mov	r3, #100
	str	r3, [fp, #-28]
	b	.L67
.L64:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #114
	bne	.L68
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #118
	bne	.L68
	mov	r3, #200
	str	r3, [fp, #-28]
	b	.L67
.L68:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #115
	bne	.L71
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #119
	bne	.L71
	mov	r3, #300
	str	r3, [fp, #-28]
	b	.L67
.L71:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #83
	bne	.L74
	mov	r3, #33
	str	r3, [fp, #-28]
	b	.L67
.L74:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L76
	mov	r3, #34
	str	r3, [fp, #-28]
	b	.L67
.L76:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	mov	r0, r3
	bl	is_int.1303(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L78
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-16]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r0, r3
	bl	is_int.1303(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L80
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r3, r3, #48
	str	r3, [fp, #-16]
.L80:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
	b	.L67
.L78:
	mvn	r3, #0
	str	r3, [fp, #-28]
.L67:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parse_input.1307, .-parse_input.1307
	.align	2
	.type	is_int.1303, %function
is_int.1303:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L84
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L84
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L87
.L84:
	mov	r3, #0
	str	r3, [fp, #-20]
.L87:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	is_int.1303, .-is_int.1303
	.align	2
	.type	get_input.1296, %function
get_input.1296:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L95
.L94:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, .L95+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #0
	bl	com_buf_peek_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	b	.L90
.L91:
	ldr	r3, .L95+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_front(PLT)
	ldr	r3, .L95+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	mov	r1, #0
	bl	com_buf_peek_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
.L90:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L91
	ldr	r3, .L95+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_front(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r3, .L95+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_front(PLT)
	mov	r3, r0
	ldr	r2, [fp, #-28]
	strb	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L96:
	.align	2
.L95:
	.word	_GLOBAL_OFFSET_TABLE_-(.L94+8)
	.word	train_buf(GOT)
	.size	get_input.1296, .-get_input.1296
	.bss
	.align	2
train_buf:
	.space	1808
	.align	2
train_pre_speed:
	.space	4
	.align	2
future_time:
	.space	4
	.ident	"GCC: (GNU) 4.0.2"
