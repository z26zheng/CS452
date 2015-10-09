	.file	"a0.c"
	.text
	.align	2
	.global	wait
	.type	wait, %function
wait:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	wait, .-wait
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%c\000"
	.align	2
.LC1:
	.ascii	"\033[31;2H\033[K\033[31;2H prompt>: \000"
	.align	2
.LC2:
	.ascii	"\033[1D\000"
	.align	2
.LC3:
	.ascii	" \000"
	.text
	.align	2
	.global	filter_input
	.type	filter_input, %function
filter_input:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L18
.L17:
	add	sl, pc, sl
	mov	r3, r0
	strb	r3, [fp, #-24]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #113
	bne	.L7
	ldr	r3, .L18+4
	ldr	r2, [sl, r3]
	mov	r3, #1
	str	r3, [r2, #0]
.L7:
	ldr	r3, [fp, #-20]
	cmp	r3, #31
	ble	.L9
	ldr	r3, [fp, #-20]
	cmp	r3, #127
	bgt	.L9
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r0, r3
	bl	train_buf_push_back(PLT)
	ldrb	r2, [fp, #-24]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L18+8
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
.L9:
	ldr	r3, [fp, #-20]
	cmp	r3, #13
	bne	.L12
	bl	train_parse_command(PLT)
	mov	r0, #1
	ldr	r3, .L18+12
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
.L12:
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	bne	.L16
	mov	r0, #1
	ldr	r3, .L18+16
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L18+20
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L18+16
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	bl	train_buf_pop_back(PLT)
	mov	r0, #1
	bl	plerasefrontc(PLT)
.L16:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.L17+8)
	.word	quit(GOT)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	filter_input, .-filter_input
	.section	.rodata
	.align	2
.LC4:
	.ascii	"\033[5;2H SWITCHES:      RECENT SENSORS: \000"
	.align	2
.LC5:
	.ascii	"\033[6;1H -----------    -----------------\000"
	.align	2
.LC6:
	.ascii	"\033[7;2H SW 1: \000"
	.align	2
.LC7:
	.ascii	"\033[8;2H SW 2: \000"
	.align	2
.LC8:
	.ascii	"\033[9;2H SW 3: \000"
	.align	2
.LC9:
	.ascii	"\033[10;2H SW 4: \000"
	.align	2
.LC10:
	.ascii	"\033[11;2H SW 5: \000"
	.align	2
.LC11:
	.ascii	"\033[12;2H SW 6: \000"
	.align	2
.LC12:
	.ascii	"\033[13;2H SW 7: \000"
	.align	2
.LC13:
	.ascii	"\033[14;2H SW 8: \000"
	.align	2
.LC14:
	.ascii	"\033[15;2H SW 9: \000"
	.align	2
.LC15:
	.ascii	"\033[16;2H SW 10: \000"
	.align	2
.LC16:
	.ascii	"\033[17;2H SW 11: \000"
	.align	2
.LC17:
	.ascii	"\033[18;2H SW 12: \000"
	.align	2
.LC18:
	.ascii	"\033[19;2H SW 13: \000"
	.align	2
.LC19:
	.ascii	"\033[20;2H SW 14: \000"
	.align	2
.LC20:
	.ascii	"\033[21;2H SW 15: \000"
	.align	2
.LC21:
	.ascii	"\033[22;2H SW 16: \000"
	.align	2
.LC22:
	.ascii	"\033[23;2H SW 17: \000"
	.align	2
.LC23:
	.ascii	"\033[24;2H SW 18: \000"
	.align	2
.LC24:
	.ascii	"\033[25;2H SW 153: \000"
	.align	2
.LC25:
	.ascii	"\033[26;2H SW 154: \000"
	.align	2
.LC26:
	.ascii	"\033[27;2H SW 155: \000"
	.align	2
.LC27:
	.ascii	"\033[28;2H SW 156: \000"
	.align	2
.LC28:
	.ascii	"\033[31;2H prompt>: \000"
	.text
	.align	2
	.global	format_screen
	.type	format_screen, %function
format_screen:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L23+4
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+8
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+12
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+16
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+20
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+24
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+28
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+32
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+36
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+40
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+44
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+48
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+52
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+56
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+60
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+64
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+68
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+72
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+76
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+80
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+84
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+88
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+92
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+96
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	mov	r0, #1
	ldr	r3, .L23+100
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.size	format_screen, .-format_screen
	.section	.rodata
	.align	2
.LC29:
	.ascii	"coms_init failed %d\012\015\000"
	.align	2
.LC30:
	.ascii	"\033[2J\000"
	.align	2
.LC31:
	.ascii	"finished main\012\015\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L54
.L53:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, .L54+4
	ldr	r2, [sl, r3]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, .L54+8
	str	r3, [fp, #-24]
	bl	coms_init(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L26
	mov	r0, #1
	ldr	r3, .L54+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	bwprintf(PLT)
.L26:
	mov	r0, #1
	ldr	r3, .L54+16
	add	r3, sl, r3
	mov	r1, r3
	bl	plprintf(PLT)
	bl	format_screen(PLT)
	bl	train_init(PLT)
	ldr	r0, [fp, #-24]
	bl	timer_init(PLT)
	bl	sensor_init(PLT)
	b	.L52
.L28:
.L52:
	ldr	r3, .L54+4
	ldr	r3, [sl, r3]
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L29
	ldr	r0, [fp, #-24]
	bl	timer_ready(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L31
	bl	timer_update_buf(PLT)
.L31:
	mov	r0, #0
	bl	plgetc_check(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L33
	bl	sensor_get_byte(PLT)
.L33:
	mov	r0, #1
	bl	plgetc_check(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L35
	mov	r0, #1
	bl	plgetc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-19]
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r0, r3
	bl	filter_input(PLT)
.L35:
	mov	r0, #1
	bl	plputc_check(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L37
	mov	r0, #1
	bl	com_buf_size(PLT)
	mov	r3, r0
	cmp	r3, #0
	ble	.L37
	mov	r0, #1
	bl	plpopbufc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-18]
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	mov	r0, #1
	mov	r1, r3
	bl	plputbufc(PLT)
.L37:
	mov	r0, #0
	bl	plputc_check(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L40
	bl	sensor_is_ready(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L40
	bl	sensor_send_request(PLT)
.L40:
	mov	r0, #0
	bl	plputc_check(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L28
	mov	r0, #0
	bl	com_buf_size(PLT)
	mov	r3, r0
	cmp	r3, #0
	ble	.L28
	mov	r0, #0
	bl	com_check_cts(PLT)
	mov	r3, r0
	cmp	r3, #1
	bne	.L28
	mov	r0, #0
	mov	r1, #0
	bl	plpeekbufc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #128
	bne	.L47
	mov	r0, #0
	bl	plpopbufc(PLT)
	b	.L28
.L47:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #129
	bne	.L49
	bl	train_is_future(PLT)
	mov	r3, r0
	cmp	r3, #0
	ble	.L28
.L49:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #0
	mov	r1, r3
	bl	plputbufc(PLT)
	mov	r0, #0
	bl	plpopbufc(PLT)
	b	.L28
.L29:
	mov	r0, #1
	ldr	r3, .L54+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	_GLOBAL_OFFSET_TABLE_-(.L53+8)
	.word	quit(GOT)
	.word	-2139029376
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.size	main, .-main
	.bss
	.align	2
quit:
	.space	4
	.ident	"GCC: (GNU) 4.0.2"
