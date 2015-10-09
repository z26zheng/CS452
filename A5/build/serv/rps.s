	.file	"rps.c"
	.text
	.align	2
	.global	initialize_clients
	.type	initialize_clients, %function
initialize_clients:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	@ lr needed for prologue
	add	r3, r0, #12
	mov	r2, r1
.L2:
	add	r2, r2, #1
	cmp	r2, #127
	str	r1, [r3, #-12]
	stmdb	r3, {r1, r3}	@ phole stm
	add	r3, r3, #12
	bne	.L2
	str	r1, [r0, #1532]
	str	r1, [r0, #1524]
	str	r1, [r0, #1528]
	bx	lr
	.size	initialize_clients, .-initialize_clients
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	.text
	.align	2
	.global	rps_server
	.type	rps_server, %function
rps_server:
	@ args = 0, pretend = 0, frame = 1616
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L86
	sub	sp, sp, #1616
.L73:
	add	sl, pc, sl
	mov	r0, #0
	bl	RegisterAs(PLT)
	cmp	r0, #0
	blt	.L76
.L9:
	add	r4, sp, #64
	sub	r4, r4, #4
	mov	r0, r4
	bl	initialize_clients(PLT)
	ldr	r0, .L86+4
	bl	start_clock(PLT)
	ldr	r1, .L86+8
	ldr	r2, .L86+12
	ldr	r3, .L86+16
	mov	r0, #0
	str	r0, [sp, #36]
	str	r0, [sp, #44]
	str	r1, [sp, #32]
	ldr	r0, .L86+20
	ldr	r1, .L86+24
	str	r2, [sp, #28]
	str	r3, [sp, #24]
	ldr	r2, .L86+28
	ldr	r3, .L86+32
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r0, .L86+36
	ldr	r1, .L86+40
	add	r2, sp, #1600
	add	r3, sp, #1600
	mov	r5, #0
	mvn	r6, #0
	add	r2, r2, #12
	add	r3, r3, #4
	add	r9, sp, #1584
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	mov	r8, r4
	str	r2, [sp, #52]
	str	r3, [sp, #56]
	add	r7, sp, #1584
	str	r5, [sp, #40]
	mov	fp, r6
	str	r5, [sp, #48]
	add	r9, r9, #12
.L75:
	ldr	r0, [sp, #52]
	ldr	r1, [sp, #56]
	mov	r2, #8
	bl	Receive(PLT)
	ldr	r0, [sp, #1604]
	cmp	r0, #1
	beq	.L15
.L77:
	cmp	r0, #2
	beq	.L16
	cmp	r0, #0
	bne	.L13
	ldr	r2, [r8, #8]
	ldr	r3, [sp, #1612]
	cmp	r2, #0
	moveq	r7, #0
	cmp	r5, #0
	streq	r8, [sp, #36]
	ldrne	r1, [sp, #36]
	ldreq	r5, [sp, #36]
	str	r0, [r8, #4]
	str	r3, [r8, #0]
	str	r0, [r8, #8]
	strne	r8, [r1, #4]
	strne	r8, [sp, #36]
	moveq	r8, r2
	movne	r8, r2
.L21:
	ldr	r1, [sp, #40]
	rsbs	r3, r1, #1
	movcc	r3, #0
	cmp	r5, #0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L58
.L82:
	ldr	r2, [sp, #48]
	cmp	r2, #0
	bne	.L58
	ldr	r4, [r5, #4]
	str	r2, [r5, #4]
	cmp	r4, #0
	streq	r5, [sp, #40]
	streq	r4, [sp, #36]
	strne	r5, [sp, #40]
.L63:
	ldr	r0, [sp, #44]
	rsbs	r3, r0, #1
	movcc	r3, #0
	cmp	r4, #0
	moveq	r3, #0
	cmp	r3, #0
	moveq	r5, r4
	beq	.L75
	mov	r3, #3
	mov	r2, #0
	str	r3, [sp, #1596]
	ldr	r3, [sp, #40]
	str	r2, [sp, #1600]
	ldr	r5, [r4, #4]
	ldr	r0, [r3, #0]
	str	r2, [r4, #4]
	mov	r1, r9
	add	r2, r2, #8
	bl	Reply(PLT)
	mov	r1, r9
	mov	r2, #8
	ldr	r0, [r4, #0]
	bl	Reply(PLT)
	ldr	r0, [sp, #36]
	cmp	r5, #0
	moveq	r0, #0
	str	r0, [sp, #36]
	ldr	r1, [sp, #56]
	ldr	r0, [sp, #52]
	mov	r2, #8
	str	r4, [sp, #44]
	bl	Receive(PLT)
	ldr	r0, [sp, #1604]
	cmp	r0, #1
	bne	.L77
.L15:
	ldr	r2, [sp, #40]
	ldr	r3, [r2, #0]
	ldr	r2, [sp, #1612]
	cmp	r3, r2
	beq	.L78
	ldr	r1, [sp, #44]
	ldr	r3, [r1, #0]
	cmp	r2, r3
	bne	.L28
	ldr	r6, [sp, #1608]
	cmp	r6, #1
	beq	.L32
	cmp	r6, #2
	beq	.L33
	cmp	r6, #0
	ldreq	r3, [sp, #32]
	addeq	r1, sl, r3
	bleq	bwprintf(PLT)
.L30:
	ldr	r0, [sp, #48]
	cmp	r0, #0
	bne	.L79
.L24:
	mvn	r3, fp
	bics	r3, r3, r6
	bpl	.L21
	cmp	fp, r6
	beq	.L80
	rsb	r3, r6, fp
	ldr	r1, .L86+44
	add	r3, r3, #3
	smull	r0, r2, r1, r3
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, asl #1
	rsb	r0, r2, r3
	cmp	r0, #1
	beq	.L81
	mov	r3, #4
	mov	r2, #2
	str	r3, [sp, #1596]
	str	r2, [sp, #1600]
	ldr	r3, [sp, #44]
	ldr	r2, [sp, #4]
	mov	r0, #1
	add	r1, sl, r2
	ldr	r2, [r3, #0]
	bl	bwprintf(PLT)
	ldr	r3, [sp, #40]
	mov	r1, r9
	mov	r2, #8
	ldr	r0, [r3, #0]
	bl	Reply(PLT)
	ldr	r1, [sp, #44]
	mov	r3, #1
	str	r3, [sp, #1600]
	ldr	r0, [r1, #0]
	mov	r2, #8
	mov	r1, r9
	bl	Reply(PLT)
.L41:
	ldr	r2, [sp, #40]
	ldr	r0, [sp, #44]
	cmp	r7, #0
	mov	r3, #0
	ldrne	r1, [sp, #40]
	moveq	r8, r2
	str	r3, [r2, #0]
	str	r0, [r2, #8]
	ldr	r2, [sp, #16]
	strne	r1, [r7, #8]
	str	r3, [r0, #0]
	add	r1, sl, r2
	mov	r0, #1
	bl	bwputstr(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	ldr	r3, [sp, #12]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwputstr(PLT)
	mov	r0, #0
	str	r0, [sp, #40]
	ldr	r1, [sp, #40]
	mvn	r6, #0
	rsbs	r3, r1, #1
	movcc	r3, #0
	cmp	r5, #0
	moveq	r3, #0
	cmp	r3, #0
	ldr	r7, [sp, #44]
	mov	fp, r6
	str	r0, [sp, #44]
	bne	.L82
.L58:
	mov	r4, r5
	b	.L63
.L13:
	mov	r3, #99
	mvn	ip, #0
	ldr	r0, [sp, #1612]
	mov	r1, r9
	mov	r2, #8
	str	r3, [sp, #1596]
	str	ip, [sp, #1600]
	bl	Reply(PLT)
	b	.L21
.L16:
	ldr	r1, [sp, #40]
	ldr	r2, [sp, #1612]
	ldr	r3, [r1, #0]
	cmp	r3, r2
	beq	.L83
	ldr	r0, [sp, #44]
	ldr	r3, [r0, #0]
	cmp	r2, r3
	bne	.L21
	ldr	r3, [sp, #0]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	cmp	r7, #0
	ldr	r0, [sp, #44]
	ldrne	r1, [sp, #44]
	ldr	r2, [sp, #48]
	strne	r1, [r7, #8]
	mov	r3, #0
	moveq	r8, r0
	cmp	r2, #0
	str	r3, [r0, #0]
	ldrne	r7, [sp, #44]
	beq	.L84
.L57:
	ldr	r2, [sp, #16]
	mov	r0, #1
	add	r1, sl, r2
	bl	bwputstr(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	ldr	r3, [sp, #12]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwputstr(PLT)
	mvn	r6, #0
	mov	r0, #0
	str	r0, [sp, #44]
	str	r0, [sp, #48]
	b	.L21
.L28:
	mov	r3, #99
	mvn	ip, #1
	mov	r0, r2
	mov	r1, r9
	mov	r2, #8
	str	r3, [sp, #1596]
	str	ip, [sp, #1600]
	bl	Reply(PLT)
	b	.L24
.L78:
	ldr	fp, [sp, #1608]
	cmp	fp, #1
	beq	.L26
	cmp	fp, #2
	beq	.L27
	cmp	fp, #0
	bne	.L24
	ldr	r3, [sp, #32]
	add	r1, sl, r3
	bl	bwprintf(PLT)
	b	.L24
.L81:
	mov	r3, #4
	str	r3, [sp, #1596]
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #40]
	str	r0, [sp, #1600]
	add	r1, sl, r2
	ldr	r2, [r3, #0]
	bl	bwprintf(PLT)
	ldr	r2, [sp, #40]
	mov	r1, r9
	ldr	r0, [r2, #0]
	mov	r2, #8
	bl	Reply(PLT)
	mov	r3, #2
	str	r3, [sp, #1600]
.L74:
	ldr	r3, [sp, #44]
	mov	r1, r9
	ldr	r0, [r3, #0]
	mov	r2, #8
	bl	Reply(PLT)
	b	.L41
.L83:
	ldr	r3, [sp, #0]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	ldr	r0, [sp, #40]
	mov	r3, #0
	cmp	r7, #0
	str	r3, [r0, #0]
	beq	.L85
	ldr	r2, [sp, #40]
	mvn	fp, #0
	str	r2, [r7, #8]
	str	r3, [sp, #40]
	mov	r7, r2
	mov	r3, #1
	str	r3, [sp, #48]
	b	.L21
.L79:
	mov	r3, #4
	mov	r2, #3
	str	r3, [sp, #1596]
	str	r2, [sp, #1600]
	ldr	r3, [sp, #44]
	ldr	r2, [sp, #20]
	mov	r0, #1
	add	r1, sl, r2
	ldr	r2, [r3, #0]
	bl	bwprintf(PLT)
	ldr	r1, [sp, #44]
	mov	r2, #8
	ldr	r0, [r1, #0]
	mov	r1, r9
	bl	Reply(PLT)
	ldr	r2, [sp, #44]
	cmp	r7, #0
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r0, [sp, #16]
	ldrne	r3, [sp, #44]
	add	r1, sl, r0
	strne	r3, [r7, #8]
	mov	r0, #1
	moveq	r8, r2
	bl	bwputstr(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	ldr	r2, [sp, #12]
	mov	r0, #1
	add	r1, sl, r2
	bl	bwputstr(PLT)
	ldr	r7, [sp, #44]
	mov	r3, #0
	mvn	r6, #0
	str	r3, [sp, #44]
	str	r3, [sp, #48]
	b	.L24
.L32:
	ldr	r3, [sp, #28]
	mov	r0, r6
	add	r1, sl, r3
	bl	bwprintf(PLT)
	b	.L30
.L26:
	ldr	r3, [sp, #28]
	mov	r0, fp
	add	r1, sl, r3
	bl	bwprintf(PLT)
	b	.L24
.L80:
	ldr	r0, [sp, #8]
	mov	r3, #4
	add	r1, sl, r0
	mov	r2, #0
	mov	r0, #1
	str	r2, [sp, #1600]
	str	r3, [sp, #1596]
	bl	bwprintf(PLT)
	ldr	r2, [sp, #40]
	mov	r1, r9
	ldr	r0, [r2, #0]
	mov	r2, #8
	bl	Reply(PLT)
	b	.L74
.L33:
	ldr	r3, [sp, #24]
	add	r1, sl, r3
	bl	bwprintf(PLT)
	b	.L30
.L27:
	ldr	r3, [sp, #24]
	add	r1, sl, r3
	bl	bwprintf(PLT)
	b	.L24
.L84:
	mov	r3, #4
	str	r3, [sp, #1596]
	mov	r2, #3
	ldr	r3, [sp, #40]
	str	r2, [sp, #1600]
	ldr	r2, [r3, #0]
	ldr	r3, [sp, #20]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	ldr	r1, [sp, #40]
	mov	r2, #8
	ldr	r0, [r1, #0]
	mov	r1, r9
	bl	Reply(PLT)
	ldr	r3, [sp, #40]
	ldr	r0, [sp, #48]
	ldr	r2, [sp, #44]
	mov	r7, r3
	mvn	fp, #0
	str	r3, [r2, #8]
	str	r0, [r3, #0]
	str	r0, [sp, #40]
	b	.L57
.L85:
	mov	r1, #1
	mov	r8, r0
	mov	r7, r0
	mvn	fp, #0
	str	r3, [sp, #40]
	str	r1, [sp, #48]
	b	.L21
.L76:
	ldr	r1, .L86+48
	mov	r0, #1
	add	r1, sl, r1
	bl	bwputstr(PLT)
	bl	Exit(PLT)
	b	.L9
.L87:
	.align	2
.L86:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	50800
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	1431655766
	.word	.LC0(GOTOFF)
	.size	rps_server, .-rps_server
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"Task %d is done playing\015\012\000"
	.text
	.align	2
	.global	rps_client1
	.type	rps_client1, %function
rps_client1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L102
	sub	sp, sp, #20
.L99:
	add	sl, pc, sl
	mov	r0, #0
	bl	WhoIs(PLT)
	mov	r6, r0
	bl	MyTid(PLT)
	add	r7, sp, #12
	mov	r9, r0
	add	r8, sp, #4
	mov	r5, #5
	mov	r4, #8
.L89:
	mov	ip, #0
	mov	r3, r8
	mov	r1, r7
	mov	r2, r4
	mov	r0, r6
	str	ip, [sp, #16]
	str	ip, [sp, #12]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #4]
	cmp	r3, #3
	beq	.L100
.L90:
	subs	r5, r5, #1
	bne	.L89
	ldr	r1, .L102+4
	mov	r2, r9
	add	r1, sl, r1
	mov	r4, #8
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	ip, #2
	mov	r1, r7
	mov	r2, r4
	mov	r3, r8
	mov	r0, r6
	str	ip, [sp, #12]
	str	r5, [sp, #16]
	str	r4, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L100:
	bl	get_timer_val(PLT)
	ldr	r2, .L102+8
	smull	r1, r3, r2, r0
	mov	r1, r0, asr #31
	rsb	r3, r1, r3, asr #2
	add	r3, r3, r3, asl #2
	sub	r2, r0, r3, asl #1
	cmp	r2, #0
	moveq	r3, #2
	streq	r3, [sp, #12]
	streq	r2, [sp, #16]
	bne	.L101
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r8
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L90
.L101:
	ldr	r3, .L102+12
	str	r4, [sp, #0]
	smull	ip, r2, r3, r0
	rsb	r2, r1, r2
	add	r2, r2, r2, asl #1
	rsb	r2, r2, r0
	mov	r3, #1
	str	r3, [sp, #12]
	str	r2, [sp, #16]
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r8
	bl	Send(PLT)
	b	.L90
.L103:
	.align	2
.L102:
	.word	_GLOBAL_OFFSET_TABLE_-(.L99+8)
	.word	.LC10(GOTOFF)
	.word	1717986919
	.word	1431655766
	.size	rps_client1, .-rps_client1
	.ident	"GCC: (GNU) 4.0.2"
