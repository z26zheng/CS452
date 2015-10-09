	.file	"rps.c"
	.text
	.align	2
	.global	initialize_clients
	.type	initialize_clients, %function
initialize_clients:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	add	r3, r3, #12
	str	r3, [r1, #8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #30
	ble	.L3
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	str	r3, [r2, #8]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initialize_clients, .-initialize_clients
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Error registering RPS server, aborting.\000"
	.align	2
.LC1:
	.ascii	"Task %d played ROCK\015\012\000"
	.align	2
.LC2:
	.ascii	"Task %d played PAPER\015\012\000"
	.align	2
.LC3:
	.ascii	"Task %d played SCISSORS\015\012\000"
	.align	2
.LC4:
	.ascii	"Task %d's opponent quit!\015\012\000"
	.align	2
.LC5:
	.ascii	"Press any key to continue: \000"
	.align	2
.LC6:
	.ascii	"\015\012\000"
	.align	2
.LC7:
	.ascii	"TIE!\015\012\000"
	.align	2
.LC8:
	.ascii	"Task %d WINS!\015\012\000"
	.align	2
.LC9:
	.ascii	"Task %d Quit!\015\012\000"
	.align	2
.LC10:
	.ascii	"Not enough players. Goodbye!\015\012\000"
	.text
	.align	2
	.global	rps_server
	.type	rps_server, %function
rps_server:
	@ args = 0, pretend = 0, frame = 472
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #472
	ldr	sl, .L82
.L81:
	add	sl, pc, sl
	mov	r0, #0
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bge	.L7
	mov	r0, #1
	ldr	r3, .L82+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	bl	Exit(PLT)
.L7:
	sub	r3, fp, #452
	mov	r0, r3
	bl	initialize_clients(PLT)
	mov	r3, #0
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-56]
	sub	r3, fp, #452
	str	r3, [fp, #-52]
	sub	r3, fp, #452
	add	r3, r3, #372
	str	r3, [fp, #-48]
	mov	r3, #8
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mvn	r3, #0
	str	r3, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-20]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-18]	@ movhi
	ldr	r0, .L82+8
	bl	start_clock(PLT)
	b	.L80
.L9:
.L80:
	sub	r3, fp, #472
	sub	r2, fp, #460
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Receive(PLT)
	ldr	r0, [fp, #-460]
	str	r0, [fp, #-480]
	ldr	r1, [fp, #-480]
	cmp	r1, #1
	beq	.L12
	ldr	r3, [fp, #-480]
	cmp	r3, #2
	beq	.L13
	ldr	r0, [fp, #-480]
	cmp	r0, #0
	beq	.L11
	b	.L10
.L11:
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L14
	mov	r3, #0
	str	r3, [fp, #-48]
.L14:
	ldr	r2, [fp, #-472]
	ldr	r3, [fp, #-56]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-56]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-56]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L16
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	b	.L19
.L16:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-56]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	b	.L19
.L12:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-472]
	cmp	r2, r3
	bne	.L20
	ldr	r3, [fp, #-456]
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-32]
	str	r1, [fp, #-484]
	ldr	r3, [fp, #-484]
	cmp	r3, #1
	beq	.L24
	ldr	r0, [fp, #-484]
	cmp	r0, #2
	beq	.L25
	ldr	r1, [fp, #-484]
	cmp	r1, #0
	beq	.L23
	b	.L26
.L23:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L26
.L24:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L26
.L25:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L26
.L20:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-472]
	cmp	r2, r3
	bne	.L27
	ldr	r3, [fp, #-456]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-488]
	ldr	r0, [fp, #-488]
	cmp	r0, #1
	beq	.L31
	ldr	r1, [fp, #-488]
	cmp	r1, #2
	beq	.L32
	ldr	r3, [fp, #-488]
	cmp	r3, #0
	beq	.L30
	b	.L29
.L30:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L29
.L31:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L29
.L32:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
.L29:
	ldrsh	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L26
	mov	r3, #4
	str	r3, [fp, #-468]
	mov	r3, #3
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L35
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #8]
	b	.L37
.L35:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-52]
.L37:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-48]
	mvn	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	strh	r3, [fp, #-20]	@ movhi
	mov	r0, #1
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r0, #1
	ldr	r3, .L82+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	b	.L26
.L27:
	mov	r3, #99
	str	r3, [fp, #-468]
	mvn	r3, #1
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-472]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
.L26:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	blt	.L19
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L19
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L41
	mov	r3, #4
	str	r3, [fp, #-468]
	mov	r3, #0
	str	r3, [fp, #-464]
	mov	r0, #1
	ldr	r3, .L82+36
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	b	.L43
.L41:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	rsb	r3, r3, r2
	add	r2, r3, #3
	ldr	r3, .L82+40
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r1, r3, r1
	str	r1, [fp, #-476]
	ldr	r3, [fp, #-476]
	mov	r3, r3, asl #1
	ldr	r1, [fp, #-476]
	add	r3, r3, r1
	rsb	r2, r3, r2
	str	r2, [fp, #-476]
	ldr	r3, [fp, #-476]
	cmp	r3, #1
	bne	.L44
	mov	r3, #4
	str	r3, [fp, #-468]
	mov	r3, #1
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+44
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	mov	r3, #2
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	b	.L43
.L44:
	mov	r3, #4
	str	r3, [fp, #-468]
	mov	r3, #2
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+44
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	mov	r3, #1
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
.L43:
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L46
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #8]
	b	.L48
.L46:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-52]
.L48:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mvn	r3, #0
	str	r3, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r0, #1
	ldr	r3, .L82+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	b	.L19
.L13:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-472]
	cmp	r2, r3
	bne	.L49
	mov	r3, #1
	strh	r3, [fp, #-20]	@ movhi
	ldr	r2, [fp, #-472]
	mov	r0, #1
	ldr	r3, .L82+48
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L51
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #8]
	b	.L53
.L51:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-52]
.L53:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-48]
	mvn	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L19
.L49:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-472]
	cmp	r2, r3
	bne	.L19
	mov	r3, #1
	strh	r3, [fp, #-18]	@ movhi
	ldr	r2, [fp, #-472]
	mov	r0, #1
	ldr	r3, .L82+48
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L56
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #8]
	b	.L58
.L56:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-52]
.L58:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-48]
	mvn	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-36]
	ldrsh	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L59
	ldrsh	r3, [fp, #-18]
	cmp	r3, #0
	beq	.L59
	mov	r3, #0
	strh	r3, [fp, #-20]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-18]	@ movhi
	b	.L62
.L59:
	mov	r3, #4
	str	r3, [fp, #-468]
	mov	r3, #3
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L82+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L63
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	str	r3, [r2, #8]
	b	.L65
.L63:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-52]
.L65:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-48]
	mvn	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	strh	r3, [fp, #-18]	@ movhi
.L62:
	mov	r0, #1
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r0, #1
	ldr	r3, .L82+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwputstr(PLT)
	b	.L19
.L10:
	mov	r3, #99
	str	r3, [fp, #-468]
	mvn	r3, #0
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-472]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
.L19:
	ldrsh	r3, [fp, #-22]
	cmp	r3, #0
	bne	.L66
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L68
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L68
	ldrsh	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L68
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L68
	mov	r3, #0
	str	r3, [fp, #-60]
.L68:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L9
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L9
	ldrsh	r3, [fp, #-18]
	cmp	r3, #0
	bne	.L9
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L77
	mov	r3, #0
	str	r3, [fp, #-60]
.L77:
	mov	r3, #3
	str	r3, [fp, #-468]
	mov	r3, #0
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #0]
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	b	.L9
.L66:
	mov	r0, #1
	ldr	r3, .L82+52
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L83:
	.align	2
.L82:
	.word	_GLOBAL_OFFSET_TABLE_-(.L81+8)
	.word	.LC0(GOTOFF)
	.word	50800
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	1431655766
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.size	rps_server, .-rps_server
	.section	.rodata
	.align	2
.LC11:
	.ascii	"Task %d is done playing\015\012\000"
	.text
	.align	2
	.global	rps_client1
	.type	rps_client1, %function
rps_client1:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	ldr	sl, .L95
.L94:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r0, #0
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #8
	str	r3, [fp, #-24]
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	b	.L85
.L86:
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	sub	r2, fp, #48
	sub	ip, fp, #56
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-56]
	cmp	r3, #3
	bne	.L87
	bl	get_timer_val(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-32]
	ldr	r3, .L95+4
	smull	r0, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-60]
	ldr	r3, [fp, #-60]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-60]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L89
	mov	r3, #2
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L91
.L89:
	ldr	r2, [fp, #-32]
	ldr	r3, .L95+8
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r1, r3, r1
	mov	r3, r1
	mov	r3, r3, asl #1
	add	r3, r3, r1
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-44]
.L91:
	sub	r3, fp, #48
	sub	ip, fp, #56
	ldr	r2, [fp, #-24]
	str	r2, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
.L87:
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L85:
	ldr	r3, [fp, #-40]
	cmp	r3, #4
	ble	.L86
	mov	r0, #1
	ldr	r3, .L95+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r3, #2
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-44]
	sub	r2, fp, #48
	sub	ip, fp, #56
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L96:
	.align	2
.L95:
	.word	_GLOBAL_OFFSET_TABLE_-(.L94+8)
	.word	1717986919
	.word	1431655766
	.word	.LC11(GOTOFF)
	.size	rps_client1, .-rps_client1
	.ident	"GCC: (GNU) 4.0.2"
