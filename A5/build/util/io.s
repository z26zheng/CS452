	.file	"io.c"
	.text
	.align	2
	.global	enable_uart
	.type	enable_uart, %function
enable_uart:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	@ lr needed for prologue
	ldr	r2, .L9
	beq	.L6
	cmp	r0, #1
	mvn	r0, #0
	bxne	lr
	ldr	r2, .L9+4
.L6:
	ldr	r3, [r2, #0]
	mov	r0, #0
	orr	r3, r3, #1
	str	r3, [r2, #0]
	bx	lr
.L10:
	.align	2
.L9:
	.word	-2138308588
	.word	-2138243052
	.size	enable_uart, .-enable_uart
	.align	2
	.global	enable_two_stop_bits
	.type	enable_two_stop_bits, %function
enable_two_stop_bits:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	@ lr needed for prologue
	ldr	r2, .L18
	beq	.L16
	cmp	r0, #1
	mvn	r0, #0
	bxne	lr
	ldr	r2, .L18+4
.L16:
	ldr	r3, [r2, #0]
	mov	r0, #0
	orr	r3, r3, #104
	str	r3, [r2, #0]
	bx	lr
.L19:
	.align	2
.L18:
	.word	-2138308600
	.word	-2138243064
	.size	enable_two_stop_bits, .-enable_two_stop_bits
	.align	2
	.global	setfifo
	.type	setfifo, %function
setfifo:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	@ lr needed for prologue
	ldr	ip, .L30
	beq	.L25
	cmp	r0, #1
	add	ip, ip, #65536
	mvn	r0, #0
	bxne	lr
.L25:
	ldr	r3, [ip, #0]
	cmp	r1, #0
	orr	r2, r3, #16
	mov	r0, #0
	biceq	r2, r3, #16
	str	r2, [ip, #0]
	bx	lr
.L31:
	.align	2
.L30:
	.word	-2138308600
	.size	setfifo, .-setfifo
	.align	2
	.global	setspeed
	.type	setspeed, %function
setspeed:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	str	lr, [sp, #-4]!
	ldreq	ip, .L42
	ldreq	lr, .L42+4
	beq	.L36
	cmp	r0, #1
	beq	.L41
.L33:
	mvn	r0, #0
	ldr	pc, [sp], #4
.L41:
	ldr	lr, .L42+8
	ldr	ip, .L42+12
.L36:
	cmp	r1, #2400
	beq	.L37
	ldr	r3, .L42+16
	cmp	r1, r3
	bne	.L33
	mov	r2, #0
	mov	r3, #3
	mov	r0, r2
	str	r2, [lr, #0]
	str	r3, [ip, #0]
	ldr	pc, [sp], #4
.L37:
	mov	r2, #0
	mov	r3, #191
	mov	r0, r2
	str	r2, [lr, #0]
	str	r3, [ip, #0]
	ldr	pc, [sp], #4
.L43:
	.align	2
.L42:
	.word	-2138308592
	.word	-2138308596
	.word	-2138243060
	.word	-2138243056
	.word	115200
	.size	setspeed, .-setspeed
	.align	2
	.global	wait_cycles
	.type	wait_cycles, %function
wait_cycles:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	@ lr needed for prologue
	bxle	lr
	mov	r3, #0
.L47:
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L47
	bx	lr
	.size	wait_cycles, .-wait_cycles
	.align	2
	.global	com1_out_notifier
	.type	com1_out_notifier, %function
com1_out_notifier:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #20
	bl	MyParentTid(PLT)
	ldr	r8, .L53
	mov	r2, #0
	mov	r3, #3
	mov	r4, r0
	str	r3, [sp, #4]
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	add	r7, sp, #4
	add	r6, sp, #19
	mov	r5, #1
.L51:
	mov	r0, #1
	bl	AwaitEvent(PLT)
	mov	r3, r6
	mov	r0, r4
	mov	r1, r7
	mov	r2, #12
	str	r5, [sp, #0]
	bl	Send(PLT)
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	str	r3, [r8, #0]
	b	.L51
.L54:
	.align	2
.L53:
	.word	-2138308608
	.size	com1_out_notifier, .-com1_out_notifier
	.align	2
	.global	com2_out_notifier
	.type	com2_out_notifier, %function
com2_out_notifier:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	bl	MyParentTid(PLT)
	mov	r2, #0
	mov	r3, #3
	mov	r5, r0
	str	r3, [sp, #16]
	str	r2, [sp, #24]
	str	r2, [sp, #20]
	add	r7, sp, #16
	add	r6, sp, #4
	mov	r4, #12
.L69:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	mov	r0, r5
	mov	r1, r7
	mov	r2, r4
	mov	r3, r6
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #12]
	cmp	r0, #0
	ble	.L69
	ldr	r1, [sp, #8]
	ldr	ip, .L70
	mov	r2, #0
.L58:
	ldrb	r3, [r1, r2]	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r0, r2
	str	r3, [ip, #0]
	bne	.L58
	b	.L69
.L71:
	.align	2
.L70:
	.word	-2138243072
	.size	com2_out_notifier, .-com2_out_notifier
	.align	2
	.global	com1_in_notifier
	.type	com1_in_notifier, %function
com1_in_notifier:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	bl	MyParentTid(PLT)
	mov	r3, #0
	mov	r4, r0
	str	r3, [sp, #4]
	add	r7, sp, #18
	add	r6, sp, #4
	add	r5, sp, #19
.L73:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	mov	ip, #1
	strb	r0, [sp, #18]
	mov	lr, #0
	mov	r0, r4
	mov	r1, r6
	mov	r2, #12
	mov	r3, r5
	str	ip, [sp, #12]
	str	lr, [sp, #0]
	str	r7, [sp, #8]
	bl	Send(PLT)
	b	.L73
	.size	com1_in_notifier, .-com1_in_notifier
	.align	2
	.global	com2_in_notifier
	.type	com2_in_notifier, %function
com2_in_notifier:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #36
	bl	MyParentTid(PLT)
	add	r8, sp, #4
	mov	r3, #0
	mov	r4, r0
	str	r3, [sp, #20]
	str	r8, [sp, #24]
	mov	r7, r3
	add	r6, sp, #20
	add	r5, sp, #35
.L76:
	mov	r1, r8
	mov	r2, #16
	mov	r0, #4
	bl	AwaitEvent2(PLT)
	mov	r1, r6
	str	r0, [sp, #28]
	mov	r2, #12
	mov	r0, r4
	mov	r3, r5
	str	r7, [sp, #0]
	bl	Send(PLT)
	b	.L76
	.size	com2_in_notifier, .-com2_in_notifier
	.align	2
	.global	com1_out_server
	.type	com1_out_server, %function
com1_out_server:
	@ args = 0, pretend = 0, frame = 2076
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L100
	sub	sp, sp, #2064
.L96:
	add	sl, pc, sl
	sub	sp, sp, #12
	mov	r0, #2
	bl	RegisterAs(PLT)
	cmn	r0, #1
	beq	.L98
.L79:
	mov	r0, #0
	bl	enable_uart(PLT)
	ldr	r3, .L100+4
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	add	r1, sp, #2064
	mov	r7, #0
	add	r9, sp, #2048
	add	r8, sp, #2064
	add	r1, r1, #11
	str	r0, [sp, #0]
	add	r9, r9, #8
	mov	r5, r7
	mov	r6, r7
	add	r8, r8, #4
	str	r1, [sp, #4]
.L97:
	mov	r0, r8
	mov	r1, r9
	mov	r2, #12
	bl	Receive(PLT)
	ldr	r3, [sp, #2056]
	cmp	r3, #3
	moveq	r7, #1
	beq	.L82
	cmp	r3, #5
	beq	.L99
.L82:
	cmp	r5, r6
	moveq	r3, #0
	andne	r3, r7, #1
	cmp	r3, #0
	beq	.L97
	add	r3, r6, #1
	mov	ip, r3, asr #31
	add	r1, sp, #2064
	mov	ip, ip, lsr #21
	add	r1, r1, #12
	add	r2, r1, r6
	add	r3, r3, ip
	ldrb	lr, [r2, #-2068]	@ zero_extendqisi2
	mov	r3, r3, asl #21
	mov	r3, r3, lsr #21
	ldmia	sp, {r0, r1}	@ phole ldm
	mov	r2, #1
	strb	lr, [sp, #2075]
	rsb	r6, ip, r3
	bl	Reply(PLT)
	mov	r7, #0
	b	.L97
.L99:
	ldr	lr, [sp, #2064]
	ldr	r4, [sp, #2060]
	cmp	lr, #0
	ble	.L85
	mov	ip, #0
.L87:
	add	r3, r5, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #21
	add	r3, r3, r1
	add	fp, sp, #2064
	ldrb	r0, [r4, ip]	@ zero_extendqisi2
	mov	r3, r3, asl #21
	add	ip, ip, #1
	add	fp, fp, #12
	add	r2, fp, r5
	mov	r3, r3, lsr #21
	cmp	ip, lr
	strb	r0, [r2, #-2068]
	rsb	r5, r1, r3
	bne	.L87
.L85:
	ldr	r0, [sp, #2068]
	ldr	r1, [sp, #4]
	mov	r2, #0
	bl	Reply(PLT)
	b	.L82
.L98:
	bl	Exit(PLT)
	b	.L79
.L101:
	.align	2
.L100:
	.word	_GLOBAL_OFFSET_TABLE_-(.L96+8)
	.word	com1_out_notifier(GOT)
	.size	com1_out_server, .-com1_out_server
	.align	2
	.global	com2_out_server
	.type	com2_out_server, %function
com2_out_server:
	@ args = 0, pretend = 0, frame = 2100
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L128
	sub	sp, sp, #2096
.L125:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r0, #4
	bl	RegisterAs(PLT)
	cmn	r0, #1
	bleq	Exit(PLT)
.L103:
	ldr	r3, .L128+4
	add	r2, sp, #2080
	ldr	r1, [sl, r3]
	add	r2, r2, #4
	mov	r3, #4
	mov	r0, #2
	str	r3, [sp, #2060]
	str	r2, [sp, #2064]
	bl	Create(PLT)
	mov	r3, #97
	str	r0, [sp, #0]
	strb	r3, [sp, #2099]
	add	r0, sp, #2096
	add	r3, sp, #2048
	mov	r7, #0
	add	r8, sp, #2064
	add	r9, sp, #2080
	add	r0, r0, #3
	add	r3, r3, #12
	add	r8, r8, #8
	mov	r5, r7
	mov	r4, r7
	add	r9, r9, #12
	stmib	sp, {r0, r3}	@ phole stm
.L126:
	mov	r0, r9
	mov	r1, r8
	mov	r2, #12
	bl	Receive(PLT)
	ldr	r3, [sp, #2072]
	cmp	r3, #3
	moveq	r7, #1
	beq	.L106
	cmp	r3, #5
	beq	.L127
.L106:
	subs	r3, r5, r4
	movne	r3, #1
	tst	r3, r7
	beq	.L126
	cmp	r3, #0
	moveq	ip, r3
	beq	.L114
	mov	ip, #0
.L113:
	add	r3, r4, #1
	mov	r1, r3, asr #31
	add	r0, sp, #2096
	mov	r1, r1, lsr #21
	add	r0, r0, #4
	add	r2, r0, r4
	add	r3, r3, r1
	ldrb	r0, [r2, #-2088]	@ zero_extendqisi2
	mov	r3, r3, asl #21
	ldr	r2, [sp, #2064]
	mov	r3, r3, lsr #21
	strb	r0, [r2, ip]
	rsb	r4, r1, r3
	add	ip, ip, #1
	subs	r3, r5, r4
	movne	r3, #1
	cmp	ip, #7
	movgt	r3, #0
	cmp	r3, #0
	bne	.L113
.L114:
	ldr	r0, [sp, #0]
	ldr	r1, [sp, #8]
	mov	r2, #12
	str	ip, [sp, #2068]
	bl	Reply(PLT)
	mov	r7, #0
	b	.L126
.L127:
	ldr	lr, [sp, #2080]
	cmp	lr, #0
	ldrgt	r6, [sp, #2076]
	movgt	ip, #0
	ble	.L110
.L109:
	add	r3, r5, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #21
	add	r3, r3, r1
	add	fp, sp, #2096
	ldrb	r0, [r6, ip]	@ zero_extendqisi2
	mov	r3, r3, asl #21
	add	ip, ip, #1
	add	fp, fp, #4
	add	r2, fp, r5
	mov	r3, r3, lsr #21
	cmp	lr, ip
	strb	r0, [r2, #-2088]
	rsb	r5, r1, r3
	bne	.L109
.L110:
	ldr	r0, [sp, #2092]
	ldr	r1, [sp, #4]
	mov	r2, #0
	bl	Reply(PLT)
	b	.L106
.L129:
	.align	2
.L128:
	.word	_GLOBAL_OFFSET_TABLE_-(.L125+8)
	.word	com2_out_notifier(GOT)
	.size	com2_out_server, .-com2_out_server
	.align	2
	.global	com1_in_server
	.type	com1_in_server, %function
com1_in_server:
	@ args = 0, pretend = 0, frame = 2068
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L149
	sub	sp, sp, #2064
.L144:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r0, #3
	bl	RegisterAs(PLT)
	cmn	r0, #1
	beq	.L146
.L131:
	ldr	r3, .L149+4
	mov	r0, #1
	ldr	r1, [sl, r3]
	mov	r3, #97
	strb	r3, [sp, #2067]
	bl	Create(PLT)
	mov	r5, #0
	add	r9, sp, #2048
	add	r8, sp, #2064
	add	fp, sp, #2048
	mov	r7, r5
	mov	r6, r5
	add	r9, r9, #12
	add	r8, r8, #3
.L145:
	mov	r1, fp
	mov	r2, #12
	mov	r0, r9
	bl	Receive(PLT)
	ldr	r3, [sp, #2048]
	mov	r1, r8
	subs	r2, r3, #0
	beq	.L135
.L148:
	cmp	r3, #2
	beq	.L147
.L134:
	add	r2, sp, #2064
	add	r3, r5, #1
	add	r2, r2, #4
	add	r4, r2, r5
	mov	r2, r3, asr #31
	mov	lr, r2, lsr #21
	add	r3, r3, lr
	mov	ip, r3, asl #21
	cmp	r7, r5
	cmpne	r6, #0
	mov	ip, ip, lsr #21
	mov	r0, r6
	mov	r1, r8
	mov	r2, #1
	beq	.L145
	ldrb	r3, [r4, #-2068]	@ zero_extendqisi2
	rsb	r5, lr, ip
	strb	r3, [sp, #2067]
	bl	Reply(PLT)
	mov	r1, fp
	mov	r2, #12
	mov	r0, r9
	bl	Receive(PLT)
	ldr	r3, [sp, #2048]
	mov	r6, #0
	subs	r2, r3, #0
	mov	r1, r8
	bne	.L148
.L135:
	ldr	r0, [sp, #2060]
	bl	Reply(PLT)
	add	r3, r7, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #21
	ldr	r2, [sp, #2052]
	add	r3, r3, r1
	mov	r3, r3, asl #21
	add	ip, sp, #2064
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	mov	r3, r3, lsr #21
	add	ip, ip, #4
	add	r2, ip, r7
	rsb	r7, r1, r3
	strb	r0, [r2, #-2068]
	b	.L134
.L147:
	ldr	r6, [sp, #2060]
	b	.L134
.L146:
	bl	Exit(PLT)
	b	.L131
.L150:
	.align	2
.L149:
	.word	_GLOBAL_OFFSET_TABLE_-(.L144+8)
	.word	com1_in_notifier(GOT)
	.size	com1_in_server, .-com1_in_server
	.align	2
	.global	com2_in_server
	.type	com2_in_server, %function
com2_in_server:
	@ args = 0, pretend = 0, frame = 2072
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L172
	sub	sp, sp, #2064
.L168:
	add	sl, pc, sl
	sub	sp, sp, #8
	mov	r0, #5
	bl	RegisterAs(PLT)
	cmn	r0, #1
	bleq	Exit(PLT)
.L152:
	ldr	r3, .L172+4
	mov	r0, #1
	ldr	r1, [sl, r3]
	mov	r3, #97
	strb	r3, [sp, #2071]
	bl	Create(PLT)
	add	r1, sp, #2064
	mov	r7, #0
	add	fp, sp, #2048
	add	r1, r1, #7
	add	fp, fp, #4
	mov	r6, r7
	mov	r8, r7
	add	r9, sp, #2064
	str	r1, [sp, #0]
.L169:
	mov	r0, r9
	mov	r1, fp
	mov	r2, #12
	bl	Receive(PLT)
	ldr	r4, [sp, #2052]
	cmp	r4, #0
	beq	.L156
.L171:
	cmp	r4, #2
	beq	.L170
.L155:
	cmp	r6, r7
	cmpne	r8, #0
	beq	.L169
	add	r3, r7, #1
	mov	ip, r3, asr #31
	add	r1, sp, #2064
	mov	ip, ip, lsr #21
	add	r1, r1, #8
	add	r2, r1, r7
	add	r3, r3, ip
	ldrb	lr, [r2, #-2068]	@ zero_extendqisi2
	mov	r3, r3, asl #21
	mov	r3, r3, lsr #21
	mov	r0, r8
	ldr	r1, [sp, #0]
	mov	r2, #1
	strb	lr, [sp, #2071]
	rsb	r7, ip, r3
	bl	Reply(PLT)
	mov	r0, r9
	mov	r1, fp
	mov	r2, #12
	bl	Receive(PLT)
	ldr	r4, [sp, #2052]
	mov	r8, #0
	cmp	r4, #0
	bne	.L171
.L156:
	ldr	r0, [sp, #2064]
	ldr	r1, [sp, #0]
	mov	r2, r4
	bl	Reply(PLT)
	ldr	r5, [sp, #2060]
	cmp	r5, #0
	ble	.L155
	ldr	lr, [sp, #2056]
	mov	ip, r4
.L159:
	add	r3, r6, #1
	mov	r1, r3, asr #31
	mov	r1, r1, lsr #21
	add	r3, r3, r1
	add	r4, sp, #2064
	ldrb	r0, [lr, ip]	@ zero_extendqisi2
	mov	r3, r3, asl #21
	add	ip, ip, #1
	add	r4, r4, #8
	add	r2, r4, r6
	mov	r3, r3, lsr #21
	cmp	r5, ip
	strb	r0, [r2, #-2068]
	rsb	r6, r1, r3
	bne	.L159
	b	.L155
.L170:
	ldr	r8, [sp, #2064]
	b	.L155
.L173:
	.align	2
.L172:
	.word	_GLOBAL_OFFSET_TABLE_-(.L168+8)
	.word	com2_in_notifier(GOT)
	.size	com2_in_server, .-com2_in_server
	.align	2
	.global	Putstr
	.type	Putstr, %function
Putstr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #5
	sub	sp, sp, #20
	subs	r4, r0, #0
	str	r1, [sp, #8]
	str	r2, [sp, #12]
	add	r3, sp, #19
	mov	r0, #135
	add	r1, sp, #4
	mov	r2, #12
	str	ip, [sp, #4]
	beq	.L177
	cmp	r4, #1
	sub	ip, ip, #6
	mov	r4, #0
	sub	r0, r0, #4
	beq	.L177
.L178:
	mov	r0, ip
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
.L177:
	str	r4, [sp, #0]
	bl	Send(PLT)
	mov	ip, r4
	b	.L178
	.size	Putstr, .-Putstr
	.align	2
	.global	Putc
	.type	Putc, %function
Putc:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #4
	strb	r1, [sp, #0]
	mov	r2, #1
	mov	r1, sp
	bl	Putstr(PLT)
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	Putc, .-Putc
	.align	2
	.global	Getc
	.type	Getc, %function
Getc:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	subs	lr, r0, #0
	sub	sp, sp, #20
	add	r1, sp, #4
	mov	r2, #12
	add	r3, sp, #19
	mov	r0, #137
	beq	.L184
	cmp	lr, #1
	mov	r4, #0
	mvn	ip, #0
	sub	r0, r0, #4
	beq	.L185
.L186:
	mov	r0, ip
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
.L184:
	mov	ip, #2
	str	ip, [sp, #4]
	sub	ip, ip, #1
	str	ip, [sp, #0]
	str	lr, [sp, #12]
	str	lr, [sp, #8]
	bl	Send(PLT)
	ldrb	ip, [sp, #19]	@ zero_extendqisi2
	b	.L186
.L185:
	mov	ip, #2
	str	ip, [sp, #4]
	str	r4, [sp, #12]
	str	lr, [sp, #0]
	str	r4, [sp, #8]
	bl	Send(PLT)
	ldrb	ip, [sp, #19]	@ zero_extendqisi2
	b	.L186
	.size	Getc, .-Getc
	.align	2
	.global	pputc
	.type	pputc, %function
pputc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r2, #0]
	and	r0, r0, #255
	cmp	r3, #127
	strleb	r0, [r3, r1]
	ldrle	r3, [r2, #0]
	mvn	ip, #0
	movle	ip, #0
	addle	r3, r3, #1
	mov	r0, ip
	@ lr needed for prologue
	strle	r3, [r2, #0]
	bx	lr
	.size	pputc, .-pputc
	.align	2
	.global	pc2x
	.type	pc2x, %function
pc2x:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	and	r0, r0, #255
	cmp	r0, #9
	add	r3, r0, #48
	add	r0, r0, #87
	and	r3, r3, #255
	andhi	r3, r0, #255
	mov	r0, r3
	@ lr needed for prologue
	bx	lr
	.size	pc2x, .-pc2x
	.align	2
	.global	pputx
	.type	pputx, %function
pputx:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r5, r0
	and	r0, r0, #255
	mov	r0, r0, lsr #4
	mov	r6, r1
	mov	r7, r2
	bl	pc2x(PLT)
	mov	r4, r0
	and	r0, r5, #15
	bl	pc2x(PLT)
	mov	r1, r6
	mov	r5, r0
	mov	r2, r7
	mov	r0, r4
	bl	pputc(PLT)
	mov	r0, r5
	mov	r1, r6
	mov	r2, r7
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	pputc(PLT)
	.size	pputx, .-pputx
	.align	2
	.global	pputr
	.type	pputr, %function
pputr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #4
	add	r7, sp, #4
	str	r1, [r7, #-4]!
	mov	r5, r2
	mov	r6, r3
	mov	r4, #3
.L201:
	ldrb	r0, [r7, r4]	@ zero_extendqisi2
	mov	r1, r5
	sub	r4, r4, #1
	mov	r2, r6
	bl	pputx(PLT)
	cmn	r4, #1
	bne	.L201
	mov	r1, r5
	mov	r2, r6
	mov	r0, #32
	bl	pputc(PLT)
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
	.size	pputr, .-pputr
	.align	2
	.global	pputw
	.type	pputw, %function
pputw:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mov	r6, r3
	cmp	r0, #0
	and	r5, r2, #255
	ldr	r9, [sp, #28]
	ldr	r8, [sp, #32]
	add	r7, r3, #1
	bne	.L226
.L207:
	cmp	r1, #0
	sub	r4, r1, #1
	ble	.L213
.L220:
	sub	r4, r4, #1
	mov	r0, r5
	mov	r1, r9
	mov	r2, r8
	bl	pputc(PLT)
	add	r3, r4, #1
	cmp	r3, #0
	bgt	.L220
	ldrb	r0, [r6, #0]	@ zero_extendqisi2
.L213:
	and	r0, r0, #255
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	mov	r4, r7
.L218:
	mov	r1, r9
	mov	r2, r8
	bl	pputc(PLT)
	ldrb	r0, [r4], #1	@ zero_extendqisi2
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	mov	r1, r9
	mov	r2, r8
	bl	pputc(PLT)
	ldrb	r0, [r4], #1	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L218
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L226:
	cmp	r1, #0
	movgt	ip, r1
	movgt	r2, #0
	ble	.L207
.L210:
	ldrb	r3, [r2, r7]	@ zero_extendqisi2
	sub	ip, ip, #1
	cmp	r3, #0
	add	r2, r2, #1
	beq	.L211
	cmp	r1, r2
	bne	.L210
.L211:
	mov	r1, ip
	b	.L207
	.size	pputw, .-pputw
	.align	2
	.global	pa2d
	.type	pa2d, %function
pa2d:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	and	r0, r0, #255
	sub	r2, r0, #48
	and	r3, r2, #255
	cmp	r3, #9
	@ lr needed for prologue
	sub	r1, r0, #97
	bls	.L230
	cmp	r1, #5
	sub	r3, r0, #65
	sub	r2, r0, #87
	bhi	.L236
.L230:
	mov	r0, r2
	bx	lr
.L236:
	cmp	r3, #5
	mvn	r2, #0
	subls	r2, r0, #55
	b	.L230
	.size	pa2d, .-pa2d
	.align	2
	.global	pa2i
	.type	pa2i, %function
pa2i:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r8, r1
	ldr	r1, [r1, #0]
	mov	r7, r2
	mov	r9, r3
	and	r4, r0, #255
	mov	r6, #0
	b	.L238
.L239:
	cmp	r0, r7
	add	r1, r5, #1
	bgt	.L240
	mla	r6, r7, r6, r0
	ldrb	r4, [r1, #-1]	@ zero_extendqisi2
.L238:
	mov	r0, r4
	mov	r5, r1
	bl	pa2d(PLT)
	cmp	r0, #0
	bge	.L239
.L240:
	mov	r0, r4
	str	r5, [r8, #0]
	str	r6, [r9, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	.size	pa2i, .-pa2i
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	pui2a
	.type	pui2a, %function
pui2a:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, r1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	mov	r7, r1
	mov	r9, r2
	movcc	r6, #1
	movcc	r8, #0
	bcc	.L265
	mov	r6, #1
.L247:
	mul	r6, r7, r6
	mov	r0, r5
	mov	r1, r6
	bl	__udivsi3(PLT)
	cmp	r7, r0
	bls	.L247
	cmp	r6, #0
	movne	r8, #0
	bne	.L265
.L249:
	mov	r3, #0
	strb	r3, [r9, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L251:
	cmp	r4, #9
	movgt	r3, #87
	movle	r3, #48
	add	r3, r3, r4
	cmp	r6, #0
	strb	r3, [r9], #1
	add	r8, r8, #1
	beq	.L249
.L265:
	mov	r1, r6
	mov	r0, r5
	bl	__udivsi3(PLT)
	mov	r1, r6
	mov	r4, r0
	mov	r0, r5
	bl	__umodsi3(PLT)
	mov	r1, r7
	mov	r5, r0
	mov	r0, r6
	bl	__udivsi3(PLT)
	cmp	r4, #0
	cmple	r8, #0
	mov	r6, r0
	bne	.L251
	cmp	r0, #0
	bne	.L265
	cmp	r4, #9
	movgt	r3, #87
	movle	r3, #48
	add	r3, r3, r4
	cmp	r6, #0
	strb	r3, [r9], #1
	add	r8, r8, #1
	bne	.L265
	b	.L249
	.size	pui2a, .-pui2a
	.align	2
	.global	pi2a
	.type	pi2a, %function
pi2a:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	mov	r2, r1
	movlt	r3, #45
	mov	r1, #10
	strltb	r3, [r2], #1
	rsblt	r0, r0, #0
	@ lr needed for prologue
	b	pui2a(PLT)
	.size	pi2a, .-pi2a
	.align	2
	.global	pformat
	.type	pformat, %function
pformat:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	sub	sp, sp, #32
	str	r3, [sp, #8]
	ldr	r5, [sp, #64]
	mov	r3, #0
	mov	r7, r0
	mov	fp, r1
	mov	r6, r2
	add	r8, sp, #24
	add	r9, sp, #12
	str	r3, [sp, #24]
.L297:
	ldr	r2, [sp, #8]
	mov	r3, r2
	ldrb	r0, [r3], #1	@ zero_extendqisi2
	cmp	r0, #0
	str	r3, [sp, #8]
	beq	.L298
.L272:
	cmp	r0, #37
	bne	.L280
	mov	r4, #0
	str	r4, [sp, #28]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	add	r3, r2, #2
	cmp	r0, #48
	str	r3, [sp, #8]
	beq	.L276
	bcc	.L278
	cmp	r0, #57
	addls	r1, sp, #8
	movls	r2, #10
	addls	r3, sp, #28
	blls	pa2i(PLT)
.L278:
	cmp	r0, #115
	beq	.L283
	bhi	.L286
	cmp	r0, #99
	beq	.L281
	bhi	.L287
	cmp	r0, #0
	bne	.L299
.L289:
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L299:
	cmp	r0, #37
	bne	.L297
.L280:
	add	r2, sp, #24
	mov	r1, r6
	bl	pputc(PLT)
	ldr	r2, [sp, #8]
	mov	r3, r2
	ldrb	r0, [r3], #1	@ zero_extendqisi2
	cmp	r0, #0
	str	r3, [sp, #8]
	bne	.L272
.L298:
	ldr	r3, [sp, #24]
	str	r3, [fp, #0]
	b	.L289
.L286:
	cmp	r0, #117
	beq	.L284
	cmp	r0, #120
	bne	.L297
	ldr	r0, [r5, #0]
	mov	r1, #16
	b	.L296
.L283:
	ldr	r3, [r5, #0]
	ldr	r1, [sp, #28]
	mov	r0, r7
	mov	r2, #0
.L295:
	stmia	sp, {r6, r8}	@ phole stm
	bl	pputw(PLT)
	add	r3, r5, #4
	mov	r5, r3
	b	.L297
.L276:
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	add	r3, r2, #3
	mov	r4, #1
	str	r3, [sp, #8]
	b	.L278
.L287:
	cmp	r0, #100
	bne	.L297
	ldr	r0, [r5, #0]
	mov	r1, r9
	bl	pi2a(PLT)
	ldr	r1, [sp, #28]
	mov	r2, r4
	mov	r0, r7
	mov	r3, r9
	b	.L295
.L281:
	ldrb	r0, [r5, #0]	@ zero_extendqisi2
	mov	r1, r6
	add	r2, sp, #24
	bl	pputc(PLT)
	add	r3, r5, #4
	mov	r5, r3
	b	.L297
.L284:
	ldr	r0, [r5, #0]
	mov	r1, #10
.L296:
	mov	r2, r9
	bl	pui2a(PLT)
	ldr	r1, [sp, #28]
	mov	r2, r4
	mov	r0, r7
	mov	r3, r9
	b	.L295
	.size	pformat, .-pformat
	.align	2
	.global	Printf
	.type	Printf, %function
Printf:
	@ args = 4, pretend = 12, frame = 132
	@ frame_needed = 0, uses_anonymous_args = 1
	stmfd	sp!, {r1, r2, r3}
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #136
	add	r1, sp, #136
	add	r5, sp, #4
	mov	r3, #0
	str	r3, [r1, #-4]!
	mov	r2, r5
	mov	r4, r0
	add	ip, sp, #152
	ldr	r3, [sp, #148]
	str	ip, [sp, #0]
	bl	pformat(PLT)
	mov	r0, r4
	mov	r1, r5
	ldr	r2, [sp, #132]
	bl	Putstr(PLT)
	add	sp, sp, #136
	ldmfd	sp!, {r4, r5, lr}
	add	sp, sp, #12
	bx	lr
	.size	Printf, .-Printf
	.ident	"GCC: (GNU) 4.0.2"
