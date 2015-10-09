	.file	"sensor.c"
	.text
	.align	2
	.global	sensor_init
	.type	sensor_init, %function
sensor_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L10
.L9:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L2
.L3:
	ldr	r1, [fp, #-20]
	ldr	r3, .L10+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	ble	.L3
	ldr	r3, .L10+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L10+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L10+12
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L10+16
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L5
.L6:
	ldr	r1, [fp, #-20]
	ldr	r3, .L10+20
	ldr	r2, [sl, r3]
	mov	r3, #0
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L5:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	ble	.L6
	ldr	r3, .L10+24
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L10+24
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L10+28
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L10+32
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L10+36
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.L9+8)
	.word	sensor_buf(GOT)
	.word	buf_idx_tail(GOT)
	.word	buf_idx_head(GOT)
	.word	size(GOT)
	.word	print_buf(GOT)
	.word	buf_tail(GOT)
	.word	buf_head(GOT)
	.word	psize(GOT)
	.word	sensor_future_time(GOT)
	.size	sensor_init, .-sensor_init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Assert failed (%s:%d)\012\015\012\015\000"
	.align	2
.LC1:
	.ascii	"sensor.c\000"
	.text
	.align	2
	.global	push_2print_buf
	.type	push_2print_buf, %function
push_2print_buf:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	mov	r3, r0
	str	r1, [fp, #-24]
	strb	r3, [fp, #-20]
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #8
	ble	.L13
	mov	r0, #1
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L21+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #41
	bl	bwprintf(PLT)
.L13:
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	ldr	r1, [r3, #0]
	ldr	r3, .L21+16
	ldr	r2, [sl, r3]
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, r1]
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-24]
	and	r1, r3, #255
	ldr	r3, .L21+16
	ldr	r2, [sl, r3]
	mov	r3, r1
	strb	r3, [r2, r0]
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	ble	.L15
	ldr	r3, .L21+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
.L15:
	ldr	r3, .L21+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L21+20
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L21+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #5
	ble	.L19
	ldr	r3, .L21+20
	ldr	r2, [sl, r3]
	mov	r3, #5
	str	r3, [r2, #0]
.L19:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	buf_head(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	print_buf(GOT)
	.word	psize(GOT)
	.size	push_2print_buf, .-push_2print_buf
	.align	2
	.global	pop_2print_buf
	.type	pop_2print_buf, %function
pop_2print_buf:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L31
.L30:
	add	sl, pc, sl
	ldr	r3, .L31+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	.L29
	ldr	r3, .L31+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #8
	ble	.L26
	mov	r0, #1
	ldr	r3, .L31+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L31+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #60
	bl	bwprintf(PLT)
.L26:
	ldr	r3, .L31+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L31+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L31+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L31+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L31+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	ble	.L29
	ldr	r3, .L31+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
.L29:
	ldmfd	sp, {sl, fp, sp, pc}
.L32:
	.align	2
.L31:
	.word	_GLOBAL_OFFSET_TABLE_-(.L30+8)
	.word	psize(GOT)
	.word	buf_tail(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	pop_2print_buf, .-pop_2print_buf
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\033[s\033[K\033[%d;20H %c%d \033[u\000"
	.text
	.align	2
	.global	print_print_buf
	.type	print_print_buf, %function
print_print_buf:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L39
.L38:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L34
.L35:
	ldr	r3, [fp, #-20]
	add	ip, r3, #7
	ldr	r3, .L39+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L39+8
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	lr, r3
	ldr	r3, .L39+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L39+8
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L39+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, ip
	mov	r3, lr
	bl	plprintf(PLT)
	bl	pop_2print_buf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L34:
	ldr	r3, .L39+16
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	blt	.L35
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
	.word	buf_tail(GOT)
	.word	print_buf(GOT)
	.word	.LC2(GOTOFF)
	.word	psize(GOT)
	.size	print_print_buf, .-print_print_buf
	.align	2
	.global	sensor_get_cidx
	.type	sensor_get_cidx, %function
sensor_get_cidx:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L44
.L43:
	add	sl, pc, sl
	ldr	r3, .L44+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	and	r3, r3, #255
	add	r3, r3, #65
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L43+8)
	.word	buf_idx_tail(GOT)
	.size	sensor_get_cidx, .-sensor_get_cidx
	.align	2
	.global	sensor_get_didx
	.type	sensor_get_didx, %function
sensor_get_didx:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L49
.L48:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, .L49+4
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #31
	add	r3, r2, r1
	and	r3, r3, #1
	rsb	r3, r1, r3
	mov	r2, r3, asl #3
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	add	r3, r3, #8
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L50:
	.align	2
.L49:
	.word	_GLOBAL_OFFSET_TABLE_-(.L48+8)
	.word	buf_idx_tail(GOT)
	.size	sensor_get_didx, .-sensor_get_didx
	.align	2
	.global	sensor_is_ready
	.type	sensor_is_ready, %function
sensor_is_ready:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L58
.L57:
	add	sl, pc, sl
	ldr	r3, .L58+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	bgt	.L52
	bl	timer_get_time(PLT)
	mov	r2, r0
	ldr	r3, .L58+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bcc	.L52
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L55
.L52:
	mov	r3, #0
	str	r3, [fp, #-20]
.L55:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L59:
	.align	2
.L58:
	.word	_GLOBAL_OFFSET_TABLE_-(.L57+8)
	.word	size(GOT)
	.word	sensor_future_time(GOT)
	.size	sensor_is_ready, .-sensor_is_ready
	.section	.rodata
	.align	2
.LC3:
	.ascii	"\000"
	.text
	.align	2
	.global	sensor_check_byte
	.type	sensor_check_byte, %function
sensor_check_byte:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L82
.L81:
	add	sl, pc, sl
	ldr	r3, .L82+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	blt	.L61
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	ble	.L63
.L61:
	mov	r0, #1
	ldr	r3, .L82+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L82+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #96
	bl	bwprintf(PLT)
.L63:
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	blt	.L64
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	ble	.L66
.L64:
	mov	r0, #1
	ldr	r3, .L82+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L82+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #97
	bl	bwprintf(PLT)
.L66:
	ldr	r3, .L82+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L80
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	ldr	r2, [r3, #0]
	ldr	r3, .L82+24
	ldr	r3, [sl, r3]
	ldrb	r3, [r3, r2]
	strb	r3, [fp, #-33]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L69
.L70:
	ldrb	r2, [fp, #-33]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	mov	r3, r2, asr r3
	and	r3, r3, #1
	str	r3, [fp, #-28]
	bl	sensor_get_cidx(PLT)
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldr	r0, [fp, #-32]
	bl	sensor_get_didx(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	bne	.L71
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	push_2print_buf(PLT)
	bl	print_print_buf(PLT)
	b	.L73
.L71:
	mov	r0, #1
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
.L73:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L69:
	ldr	r3, [fp, #-32]
	cmp	r3, #7
	ble	.L70
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	bne	.L75
	ldr	r3, .L82+8
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L77
.L75:
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L82+8
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
.L77:
	ldr	r3, .L82+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	ldr	r3, .L82+20
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L82+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bge	.L80
	mov	r0, #1
	ldr	r3, .L82+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L82+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #123
	bl	bwprintf(PLT)
.L80:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L83:
	.align	2
.L82:
	.word	_GLOBAL_OFFSET_TABLE_-(.L81+8)
	.word	buf_idx_head(GOT)
	.word	buf_idx_tail(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	size(GOT)
	.word	sensor_buf(GOT)
	.word	.LC3(GOTOFF)
	.size	sensor_check_byte, .-sensor_check_byte
	.align	2
	.global	sensor_get_byte
	.type	sensor_get_byte, %function
sensor_get_byte:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L100
.L99:
	add	sl, pc, sl
	ldr	r3, .L100+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	blt	.L85
	ldr	r3, .L100+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	ble	.L87
.L85:
	mov	r0, #1
	ldr	r3, .L100+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L100+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #129
	bl	bwprintf(PLT)
.L87:
	ldr	r3, .L100+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	blt	.L88
	ldr	r3, .L100+8
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	ble	.L90
.L88:
	mov	r0, #1
	ldr	r3, .L100+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L100+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #130
	bl	bwprintf(PLT)
.L90:
	ldr	r3, .L100+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #10
	beq	.L98
	mov	r0, #0
	bl	plgetc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldr	r3, .L100+4
	ldr	r3, [sl, r3]
	ldr	r1, [r3, #0]
	ldr	r3, .L100+24
	ldr	r2, [sl, r3]
	ldrb	r3, [fp, #-17]
	strb	r3, [r2, r1]
	ldr	r3, .L100+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #9
	bne	.L93
	ldr	r3, .L100+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L95
.L93:
	ldr	r3, .L100+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L100+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
.L95:
	ldr	r3, .L100+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, .L100+20
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldr	r3, .L100+20
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #10
	ble	.L96
	mov	r0, #1
	ldr	r3, .L100+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L100+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #145
	bl	bwprintf(PLT)
.L96:
	bl	sensor_check_byte(PLT)
.L98:
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L101:
	.align	2
.L100:
	.word	_GLOBAL_OFFSET_TABLE_-(.L99+8)
	.word	buf_idx_head(GOT)
	.word	buf_idx_tail(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	size(GOT)
	.word	sensor_buf(GOT)
	.size	sensor_get_byte, .-sensor_get_byte
	.align	2
	.global	sensor_send_request
	.type	sensor_send_request, %function
sensor_send_request:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L105
.L104:
	add	sl, pc, sl
	mov	r0, #0
	mov	r1, #133
	bl	plbufc(PLT)
	bl	timer_get_time(PLT)
	mov	r3, r0
	add	r3, r3, #10
	mov	r2, r3
	ldr	r3, .L105+4
	ldr	r3, [sl, r3]
	str	r2, [r3, #0]
	ldmfd	sp, {sl, fp, sp, pc}
.L106:
	.align	2
.L105:
	.word	_GLOBAL_OFFSET_TABLE_-(.L104+8)
	.word	sensor_future_time(GOT)
	.size	sensor_send_request, .-sensor_send_request
	.bss
sensor_buf:
	.space	10
	.align	2
buf_idx_head:
	.space	4
	.align	2
buf_idx_tail:
	.space	4
	.align	2
size:
	.space	4
print_buf:
	.space	10
	.align	2
buf_head:
	.space	4
	.align	2
buf_tail:
	.space	4
	.align	2
psize:
	.space	4
	.align	2
sensor_future_time:
	.space	4
	.ident	"GCC: (GNU) 4.0.2"
