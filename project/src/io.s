	.file	"io.c"
	.text
	.align	2
	.global	com_buf_init
	.type	com_buf_init, %function
com_buf_init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L3
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1800]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1804]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	com_buf_init, .-com_buf_init
	.section	.rodata
	.align	2
.LC0:
	.ascii	"DEBUG: com buf full, char to push: %d\012\015\000"
	.text
	.align	2
	.global	com_buf_push_back
	.type	com_buf_push_back, %function
com_buf_push_back:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L14
.L13:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L7
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L9
.L7:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1800]
	ldr	r3, .L14+4
	cmp	r2, r3
	ble	.L10
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r2, .L14+8
	add	r2, sl, r2
	mov	r1, r2
	mov	r2, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L9
.L10:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #1800]
	ldr	r2, [fp, #-20]
	ldrb	r3, [fp, #-24]
	strb	r3, [r2, r1]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1800]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1800]
	mov	r3, #0
	str	r3, [fp, #-28]
.L9:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	1799
	.word	.LC0(GOTOFF)
	.size	com_buf_push_back, .-com_buf_push_back
	.align	2
	.global	com_buf_peek_front
	.type	com_buf_peek_front, %function
com_buf_peek_front:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #1800]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L17
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L19
.L17:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldrb	r3, [r2, r3]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-32]
.L19:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	com_buf_peek_front, .-com_buf_peek_front
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%c\000"
	.text
	.align	2
	.global	com_buf_printf
	.type	com_buf_printf, %function
com_buf_printf:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L27
.L26:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #1804]
	str	r3, [fp, #-24]
	b	.L22
.L23:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, r2]
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L27+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L22:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #1800]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L23
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	.LC1(GOTOFF)
	.size	com_buf_printf, .-com_buf_printf
	.section	.rodata
	.align	2
.LC2:
	.ascii	"DEBUG: print com%d_buf: \012\015\000"
	.align	2
.LC3:
	.ascii	"\012\015\000"
	.text
	.align	2
	.global	plbufprintf
	.type	plbufprintf, %function
plbufprintf:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L35
.L34:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	mov	r0, #1
	ldr	r3, .L35+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L31
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	beq	.L32
	b	.L30
.L31:
	ldr	r3, .L35+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_printf(PLT)
	b	.L30
.L32:
	ldr	r3, .L35+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_printf(PLT)
.L30:
	mov	r0, #1
	ldr	r3, .L35+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L34+8)
	.word	.LC2(GOTOFF)
	.word	com1_buf(GOT)
	.word	com2_buf(GOT)
	.word	.LC3(GOTOFF)
	.size	plbufprintf, .-plbufprintf
	.align	2
	.global	com_buf_pop_front
	.type	com_buf_pop_front, %function
com_buf_pop_front:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1800]
	cmp	r2, r3
	bne	.L38
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L40
.L38:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, r2]
	strb	r3, [fp, #-13]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1804]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1800]
	cmp	r2, r3
	bne	.L41
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1804]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1800]
.L41:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-24]
.L40:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	com_buf_pop_front, .-com_buf_pop_front
	.align	2
	.global	com_buf_pop_back
	.type	com_buf_pop_back, %function
com_buf_pop_back:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1800]
	cmp	r2, r3
	bne	.L45
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L47
.L45:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1800]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, r2]
	strb	r3, [fp, #-13]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1800]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1800]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1800]
	cmp	r2, r3
	bne	.L48
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #1804]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1804]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1800]
.L48:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-24]
.L47:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	com_buf_pop_back, .-com_buf_pop_back
	.align	2
	.global	buf_size
	.type	buf_size, %function
buf_size:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1800]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1804]
	rsb	r3, r3, r2
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	buf_size, .-buf_size
	.align	2
	.global	com_buf_size
	.type	com_buf_size, %function
com_buf_size:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L60
.L59:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L56
	b	.L54
.L55:
	ldr	r3, .L60+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	buf_size(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L57
.L56:
	ldr	r3, .L60+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	buf_size(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L57
.L54:
	mvn	r3, #0
	str	r3, [fp, #-24]
.L57:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L61:
	.align	2
.L60:
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	com1_buf(GOT)
	.word	com2_buf(GOT)
	.size	com_buf_size, .-com_buf_size
	.section	.rodata
	.align	2
.LC4:
	.ascii	"ERROR: com_set_fifo failed on COM%d\012\015\000"
	.text
	.align	2
	.global	com_set_fifo
	.type	com_set_fifo, %function
com_set_fifo:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L73
.L72:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L64
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	beq	.L65
	b	.L63
.L64:
	ldr	r3, .L73+4
	str	r3, [fp, #-24]
	b	.L66
.L65:
	ldr	r3, .L73+8
	str	r3, [fp, #-24]
	b	.L66
.L63:
	mov	r0, #1
	ldr	r3, .L73+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L67
.L66:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L68
	ldr	r3, [fp, #-20]
	orr	r3, r3, #16
	str	r3, [fp, #-36]
	b	.L70
.L68:
	ldr	r3, [fp, #-20]
	bic	r3, r3, #16
	str	r3, [fp, #-36]
.L70:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-40]
.L67:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	-2138308600
	.word	-2138243064
	.word	.LC4(GOTOFF)
	.size	com_set_fifo, .-com_set_fifo
	.section	.rodata
	.align	2
.LC5:
	.ascii	"ERROR: com_enable failed on COM%d\012\015\000"
	.text
	.align	2
	.global	com_enable
	.type	com_enable, %function
com_enable:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L83
.L82:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L77
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L78
	b	.L76
.L77:
	ldr	r3, .L83+4
	str	r3, [fp, #-20]
	b	.L79
.L78:
	ldr	r3, .L83+8
	str	r3, [fp, #-20]
	b	.L79
.L76:
	mov	r0, #1
	ldr	r3, .L83+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L80
.L79:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r2, r3, #1
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
.L80:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L84:
	.align	2
.L83:
	.word	_GLOBAL_OFFSET_TABLE_-(.L82+8)
	.word	-2138308588
	.word	-2138243052
	.word	.LC5(GOTOFF)
	.size	com_enable, .-com_enable
	.align	2
	.global	com1_setup_bits
	.type	com1_setup_bits, %function
com1_setup_bits:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	r3, .L87
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	orr	r2, r3, #104
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldmfd	sp, {r3, fp, sp, pc}
.L88:
	.align	2
.L87:
	.word	-2138308600
	.size	com1_setup_bits, .-com1_setup_bits
	.align	2
	.global	coms_init
	.type	coms_init, %function
coms_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r0, #0
	bl	com_enable(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L90
	mov	r0, #1
	bl	com_enable(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L92
.L90:
	mvn	r3, #0
	str	r3, [fp, #-16]
	b	.L93
.L92:
	mov	r0, #0
	mov	r1, #2400
	bl	com_set_speed(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L94
	mvn	r3, #0
	str	r3, [fp, #-16]
	b	.L93
.L94:
	bl	com1_setup_bits(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	com_set_fifo(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L96
	mov	r0, #1
	mov	r1, #0
	bl	com_set_fifo(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L98
.L96:
	mvn	r3, #0
	str	r3, [fp, #-16]
	b	.L93
.L98:
	bl	com_bufs_init(PLT)
	mov	r3, #0
	str	r3, [fp, #-16]
.L93:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	coms_init, .-coms_init
	.align	2
	.global	com_bufs_init
	.type	com_bufs_init, %function
com_bufs_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L103
.L102:
	add	sl, pc, sl
	ldr	r3, .L103+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	ldr	r1, .L103+8
	bl	com_buf_init(PLT)
	ldr	r3, .L103+12
	ldr	r3, [sl, r3]
	mov	r0, r3
	ldr	r1, .L103+8
	bl	com_buf_init(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L104:
	.align	2
.L103:
	.word	_GLOBAL_OFFSET_TABLE_-(.L102+8)
	.word	com1_buf(GOT)
	.word	1800
	.word	com2_buf(GOT)
	.size	com_bufs_init, .-com_bufs_init
	.section	.rodata
	.align	2
.LC6:
	.ascii	"ERROR: com_set_speed failed on COM%d\012\015\000"
	.text
	.align	2
	.global	com_set_speed
	.type	com_set_speed, %function
com_set_speed:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L116
.L115:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r2, [fp, #-28]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L107
	ldr	r2, [fp, #-40]
	cmp	r2, #1
	beq	.L108
	b	.L106
.L107:
	ldr	r3, .L116+4
	str	r3, [fp, #-24]
	ldr	r3, .L116+8
	str	r3, [fp, #-20]
	b	.L109
.L108:
	ldr	r3, .L116+12
	str	r3, [fp, #-24]
	ldr	r3, .L116+16
	str	r3, [fp, #-20]
	b	.L109
.L106:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L110
.L109:
	ldr	r2, [fp, #-32]
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #2400
	beq	.L112
	ldr	r3, .L116+20
	ldr	r2, [fp, #-44]
	cmp	r2, r3
	beq	.L113
	b	.L111
.L113:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #3
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L110
.L112:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #191
	str	r3, [r2, #0]
	mov	r2, #0
	str	r2, [fp, #-36]
	b	.L110
.L111:
	mov	r0, #1
	ldr	r3, .L116+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-36]
.L110:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L117:
	.align	2
.L116:
	.word	_GLOBAL_OFFSET_TABLE_-(.L115+8)
	.word	-2138308596
	.word	-2138308592
	.word	-2138243060
	.word	-2138243056
	.word	115200
	.word	.LC6(GOTOFF)
	.size	com_set_speed, .-com_set_speed
	.align	2
	.global	plputc_check
	.type	plputc_check, %function
plputc_check:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L120
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L121
	b	.L119
.L120:
	ldr	r3, .L125
	str	r3, [fp, #-16]
	b	.L122
.L121:
	ldr	r3, .L125+4
	str	r3, [fp, #-16]
	b	.L122
.L119:
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L123
.L122:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	str	r3, [fp, #-24]
.L123:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L126:
	.align	2
.L125:
	.word	-2138308584
	.word	-2138243048
	.size	plputc_check, .-plputc_check
	.align	2
	.global	com_check_cts
	.type	com_check_cts, %function
com_check_cts:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L129
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L130
	b	.L128
.L129:
	ldr	r3, .L134
	str	r3, [fp, #-16]
	b	.L131
.L130:
	ldr	r3, .L134+4
	str	r3, [fp, #-16]
	b	.L131
.L128:
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L132
.L131:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	str	r3, [fp, #-24]
.L132:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L135:
	.align	2
.L134:
	.word	-2138308584
	.word	-2138243048
	.size	com_check_cts, .-com_check_cts
	.align	2
	.global	plputc
	.type	plputc, %function
plputc:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L138
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L139
	b	.L137
.L138:
	ldr	r3, .L143
	str	r3, [fp, #-16]
	b	.L140
.L139:
	ldr	r3, .L143+4
	str	r3, [fp, #-16]
	b	.L140
.L137:
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L141
.L140:
	ldrb	r2, [fp, #-24]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
.L141:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L144:
	.align	2
.L143:
	.word	-2138308608
	.word	-2138243072
	.size	plputc, .-plputc
	.align	2
	.global	plputbufc
	.type	plputbufc, %function
plputbufc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	plputc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plputbufc, .-plputbufc
	.align	2
	.global	plerasefrontc
	.type	plerasefrontc, %function
plerasefrontc:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L153
.L152:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L149
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L150
	b	.L148
.L149:
	ldr	r3, .L153+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_back(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	b	.L148
.L150:
	ldr	r3, .L153+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_back(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
.L148:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L154:
	.align	2
.L153:
	.word	_GLOBAL_OFFSET_TABLE_-(.L152+8)
	.word	com1_buf(GOT)
	.word	com2_buf(GOT)
	.size	plerasefrontc, .-plerasefrontc
	.section	.rodata
	.align	2
.LC7:
	.ascii	"ERROR: plpeekbufc failed \012\015\000"
	.text
	.align	2
	.global	plpeekbufc
	.type	plpeekbufc, %function
plpeekbufc:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L163
.L162:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L157
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L158
	b	.L156
.L157:
	ldr	r3, .L163+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	com_buf_peek_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	b	.L159
.L158:
	ldr	r3, .L163+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	com_buf_peek_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	b	.L159
.L156:
	mov	r0, #1
	ldr	r3, .L163+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #255
	str	r3, [fp, #-32]
	b	.L160
.L159:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	str	r3, [fp, #-32]
.L160:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L164:
	.align	2
.L163:
	.word	_GLOBAL_OFFSET_TABLE_-(.L162+8)
	.word	com1_buf(GOT)
	.word	com2_buf(GOT)
	.word	.LC7(GOTOFF)
	.size	plpeekbufc, .-plpeekbufc
	.section	.rodata
	.align	2
.LC8:
	.ascii	"ERROR: get_buf_char failed\012\015\000"
	.text
	.align	2
	.global	plpopbufc
	.type	plpopbufc, %function
plpopbufc:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L173
.L172:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L167
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L168
	b	.L166
.L167:
	ldr	r3, .L173+4
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	b	.L169
.L168:
	ldr	r3, .L173+8
	ldr	r3, [sl, r3]
	mov	r0, r3
	bl	com_buf_pop_front(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	b	.L169
.L166:
	mov	r0, #1
	ldr	r3, .L173+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #255
	str	r3, [fp, #-28]
	b	.L170
.L169:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	str	r3, [fp, #-28]
.L170:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L174:
	.align	2
.L173:
	.word	_GLOBAL_OFFSET_TABLE_-(.L172+8)
	.word	com1_buf(GOT)
	.word	com2_buf(GOT)
	.word	.LC8(GOTOFF)
	.size	plpopbufc, .-plpopbufc
	.align	2
	.global	plbufc
	.type	plbufc, %function
plbufc:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L183
.L182:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L177
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L178
	b	.L176
.L177:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	ldr	r2, .L183+4
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	com_buf_push_back(PLT)
	b	.L179
.L178:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	ldr	r2, .L183+8
	ldr	r2, [sl, r2]
	mov	r0, r2
	mov	r1, r3
	bl	com_buf_push_back(PLT)
	b	.L179
.L176:
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L180
.L179:
	mov	r3, #0
	str	r3, [fp, #-28]
.L180:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L184:
	.align	2
.L183:
	.word	_GLOBAL_OFFSET_TABLE_-(.L182+8)
	.word	com1_buf(GOT)
	.word	com2_buf(GOT)
	.size	plbufc, .-plbufc
	.align	2
	.global	plputstr
	.type	plputstr, %function
plputstr:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L186
.L187:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	plputc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L188
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L190
.L188:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L186:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L187
	mov	r3, #0
	str	r3, [fp, #-24]
.L190:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plputstr, .-plputstr
	.align	2
	.global	plputw
	.type	plputw, %function
plputw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L194
.L195:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L194:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L198
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L195
	b	.L198
.L199:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	plputc(PLT)
.L198:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L199
	b	.L201
.L202:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	plputc(PLT)
.L201:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L202
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plputw, .-plputw
	.align	2
	.global	plbufw
	.type	plbufw, %function
plbufw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L206
.L207:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L206:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L210
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L207
	b	.L210
.L211:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	plbufc(PLT)
.L210:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L211
	b	.L213
.L214:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	plbufc(PLT)
.L213:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L214
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plbufw, .-plbufw
	.align	2
	.global	plgetc
	.type	plgetc, %function
plgetc:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L219
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L220
	b	.L218
.L219:
	ldr	r3, .L224
	str	r3, [fp, #-20]
	b	.L221
.L220:
	ldr	r3, .L224+4
	str	r3, [fp, #-20]
	b	.L221
.L218:
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L222
.L221:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-28]
.L222:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L225:
	.align	2
.L224:
	.word	-2138308608
	.word	-2138243072
	.size	plgetc, .-plgetc
	.align	2
	.global	plgetc_check
	.type	plgetc_check, %function
plgetc_check:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L228
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	beq	.L229
	b	.L227
.L228:
	ldr	r3, .L233
	str	r3, [fp, #-16]
	b	.L230
.L229:
	ldr	r3, .L233+4
	str	r3, [fp, #-16]
	b	.L230
.L227:
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L231
.L230:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	and	r3, r3, #64
	str	r3, [fp, #-24]
.L231:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L234:
	.align	2
.L233:
	.word	-2138308584
	.word	-2138243048
	.size	plgetc_check, .-plgetc_check
	.align	2
	.global	pla2d
	.type	pla2d, %function
pla2d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L236
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L236
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L239
.L236:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L240
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L240
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L239
.L240:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L243
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L243
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L239
.L243:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L239:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pla2d, .-pla2d
	.align	2
	.global	pla2i
	.type	pla2i, %function
pla2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L248
.L249:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L250
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L248:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	pla2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L249
.L250:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pla2i, .-pla2i
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	plui2a
	.type	plui2a, %function
plui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L254
.L255:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L254:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L255
	b	.L267
.L258:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L259
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L259
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L257
.L259:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L262
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L264
.L262:
	mov	r3, #87
	str	r3, [fp, #-40]
.L264:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L257:
.L267:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L258
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plui2a, .-plui2a
	.align	2
	.global	pli2a
	.type	pli2a, %function
pli2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L269
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L269:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	plui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pli2a, .-pli2a
	.align	2
	.global	plformat
	.type	plformat, %function
plformat:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	b	.L291
.L274:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L275
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	plbufc(PLT)
	b	.L273
.L275:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L278
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L277
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L277
	b	.L279
.L278:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L277
.L279:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #40
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	pla2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L277:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L284
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L287
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L282
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L288
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L290
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L281
	b	.L273
.L288:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L283
	b	.L273
.L287:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L285
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L286
	b	.L273
.L282:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	plbufc(PLT)
	b	.L273
.L284:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #0
	bl	plbufw(PLT)
	b	.L273
.L285:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	plui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	plbufw(PLT)
	b	.L273
.L283:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	pli2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	plbufw(PLT)
	b	.L273
.L286:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	plui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	plbufw(PLT)
	b	.L273
.L281:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	plbufc(PLT)
.L273:
.L291:
	ldr	r1, [fp, #-40]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-40]
	cmp	r2, #0
	bne	.L274
.L290:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plformat, .-plformat
	.align	2
	.global	plprintf
	.type	plprintf, %function
plprintf:
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #-16]
	bl	plformat(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	plprintf, .-plprintf
	.align	2
	.global	bwputc
	.type	bwputc, %function
bwputc:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L296
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L297
	b	.L295
.L296:
	ldr	r3, .L302
	str	r3, [fp, #-20]
	ldr	r3, .L302+4
	str	r3, [fp, #-16]
	b	.L298
.L297:
	ldr	r3, .L302+8
	str	r3, [fp, #-20]
	ldr	r3, .L302+12
	str	r3, [fp, #-16]
	b	.L298
.L295:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L299
.L298:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L298
	ldrb	r2, [fp, #-28]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-32]
.L299:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L303:
	.align	2
.L302:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	bwputc, .-bwputc
	.align	2
	.global	c2x
	.type	c2x, %function
c2x:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bhi	.L305
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L307
.L305:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L307:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	c2x, .-c2x
	.align	2
	.global	bwputx
	.type	bwputx, %function
bwputx:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	mov	r3, r1
	strb	r3, [fp, #-24]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	bwputc(PLT)
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwputx, .-bwputx
	.align	2
	.global	bwputr
	.type	bwputr, %function
bwputr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	sub	r3, fp, #28
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L312
.L313:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	bwputx(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L312:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L313
	ldr	r0, [fp, #-24]
	mov	r1, #32
	bl	bwputc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwputr, .-bwputr
	.align	2
	.global	bwputstr
	.type	bwputstr, %function
bwputstr:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L317
.L318:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	bwputc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L319
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L321
.L319:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L317:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L318
	mov	r3, #0
	str	r3, [fp, #-24]
.L321:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwputstr, .-bwputstr
	.align	2
	.global	bwputw
	.type	bwputw, %function
bwputw:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L325
.L326:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L325:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L329
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bgt	.L326
	b	.L329
.L330:
	ldrb	r3, [fp, #-32]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	bwputc(PLT)
.L329:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	cmp	r2, #0
	bne	.L330
	b	.L332
.L333:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	bwputc(PLT)
.L332:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	cmp	r2, #0
	bne	.L333
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwputw, .-bwputw
	.align	2
	.global	bwgetc
	.type	bwgetc, %function
bwgetc:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L338
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L339
	b	.L337
.L338:
	ldr	r3, .L344
	str	r3, [fp, #-24]
	ldr	r3, .L344+4
	str	r3, [fp, #-20]
	b	.L340
.L339:
	ldr	r3, .L344+8
	str	r3, [fp, #-24]
	ldr	r3, .L344+12
	str	r3, [fp, #-20]
	b	.L340
.L337:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L341
.L340:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L340
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-32]
.L341:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L345:
	.align	2
.L344:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	bwgetc, .-bwgetc
	.align	2
	.global	bwa2d
	.type	bwa2d, %function
bwa2d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L347
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L347
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L350
.L347:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L351
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L351
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L350
.L351:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L354
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L354
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L350
.L354:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L350:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwa2d, .-bwa2d
	.align	2
	.global	bwa2i
	.type	bwa2i, %function
bwa2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L359
.L360:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L361
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L359:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	bwa2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L360
.L361:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwa2i, .-bwa2i
	.align	2
	.global	bwui2a
	.type	bwui2a, %function
bwui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L365
.L366:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L365:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L366
	b	.L378
.L369:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L370
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L370
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L368
.L370:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L373
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L375
.L373:
	mov	r3, #87
	str	r3, [fp, #-40]
.L375:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L368:
.L378:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L369
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwui2a, .-bwui2a
	.align	2
	.global	bwi2a
	.type	bwi2a, %function
bwi2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L380
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L380:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	bwui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwi2a, .-bwi2a
	.align	2
	.global	bwformat
	.type	bwformat, %function
bwformat:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	b	.L402
.L385:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L386
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	bwputc(PLT)
	b	.L384
.L386:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L389
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	blt	.L388
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L388
	b	.L390
.L389:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-40]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-40]
	b	.L388
.L390:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #40
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	bwa2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L388:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	beq	.L395
	ldr	r3, [fp, #-48]
	cmp	r3, #115
	bgt	.L398
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	beq	.L393
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L399
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L401
	ldr	r3, [fp, #-48]
	cmp	r3, #37
	beq	.L392
	b	.L384
.L399:
	ldr	r3, [fp, #-48]
	cmp	r3, #100
	beq	.L394
	b	.L384
.L398:
	ldr	r3, [fp, #-48]
	cmp	r3, #117
	beq	.L396
	ldr	r3, [fp, #-48]
	cmp	r3, #120
	beq	.L397
	b	.L384
.L393:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	bwputc(PLT)
	b	.L384
.L395:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #0
	bl	bwputw(PLT)
	b	.L384
.L396:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	bwui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	bwputw(PLT)
	b	.L384
.L394:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	bwi2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	bwputw(PLT)
	b	.L384
.L397:
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	bwui2a(PLT)
	ldr	r3, [fp, #-32]
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	sub	ip, fp, #26
	ldr	r0, [fp, #-36]
	mov	r1, r3
	mov	r3, ip
	bl	bwputw(PLT)
	b	.L384
.L392:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	bwputc(PLT)
.L384:
.L402:
	ldr	r1, [fp, #-40]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-40]
	cmp	r2, #0
	bne	.L385
.L401:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwformat, .-bwformat
	.align	2
	.global	bwprintf
	.type	bwprintf, %function
bwprintf:
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #4]
	ldr	r2, [fp, #-16]
	bl	bwformat(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bwprintf, .-bwprintf
	.bss
	.align	2
com1_buf:
	.space	1808
	.align	2
com2_buf:
	.space	1808
	.ident	"GCC: (GNU) 4.0.2"
