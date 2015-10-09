	.file	"nameserver.c"
	.text
	.align	2
	.global	reply_back
	.type	reply_back, %function
reply_back:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [sp, #4]
	mov	lr, r1
	stmia	r1, {r3, ip}	@ phole stm
	ldr	lr, [sp], #4
	b	Reply(PLT)
	.size	reply_back, .-reply_back
	.align	2
	.global	nameserver_main
	.type	nameserver_main, %function
nameserver_main:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r3, #0
	sub	sp, sp, #48
	add	r1, sp, #4
	mov	r2, r3
.L4:
	str	r2, [r3, r1]
	add	r3, r3, #4
	cmp	r3, #24
	bne	.L4
	add	r6, sp, #36
	add	r7, sp, #44
	add	r5, sp, #28
.L28:
	mov	r0, r7
	mov	r1, r6
	mov	r2, #8
	bl	Receive(PLT)
	cmp	r0, #7
	ble	.L30
.L7:
	ldr	r3, [sp, #36]
	cmp	r3, #1
	beq	.L10
	cmp	r3, #2
	beq	.L31
	mvn	ip, #1
	ldr	r0, [sp, #44]
	mov	r1, r5
	mov	r2, #8
	mov	r3, #99
	str	ip, [sp, #0]
	bl	reply_back(PLT)
	mov	r0, r7
	mov	r1, r6
	mov	r2, #8
	bl	Receive(PLT)
	cmp	r0, #7
	bgt	.L7
.L30:
	mvn	ip, #2
	ldr	r0, [sp, #44]
	mov	r1, r5
	mov	r2, #8
	mov	r3, #99
	str	ip, [sp, #0]
	bl	reply_back(PLT)
	b	.L28
.L10:
	ldr	r3, [sp, #40]
	cmp	r3, #5
	bhi	.L27
	ldr	ip, [sp, #44]
	add	r2, sp, #48
	add	lr, r2, r3, asl #2
	str	ip, [lr, #-44]
	mov	r4, #0
	mov	r0, ip
	mov	r1, r5
	mov	r2, #8
	mov	r3, #98
	str	r4, [sp, #0]
	bl	reply_back(PLT)
	b	.L28
.L27:
	mvn	ip, #3
	ldr	r0, [sp, #44]
	mov	r1, r5
	mov	r2, #8
	mov	r3, #99
	str	ip, [sp, #0]
	bl	reply_back(PLT)
	b	.L28
.L31:
	ldr	r3, [sp, #40]
	cmp	r3, #5
	bhi	.L27
	add	r2, sp, #48
	add	r3, r2, r3, asl #2
	ldr	ip, [r3, #-44]
	cmp	ip, #0
	bne	.L16
	sub	ip, ip, #5
	ldr	r0, [sp, #44]
	mov	r1, r5
	mov	r2, #8
	mov	r3, #99
	str	ip, [sp, #0]
	bl	reply_back(PLT)
	b	.L28
.L16:
	mov	r1, r5
	ldr	r0, [sp, #44]
	mov	r2, #8
	mov	r3, #98
	str	ip, [sp, #0]
	bl	reply_back(PLT)
	b	.L28
	.size	nameserver_main, .-nameserver_main
	.align	2
	.global	RegisterAs
	.type	RegisterAs, %function
RegisterAs:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #8
	sub	sp, sp, #20
	str	r0, [sp, #16]
	mov	ip, #1
	mov	r2, r4
	add	r1, sp, #12
	add	r3, sp, #4
	mov	r0, #33
	str	ip, [sp, #12]
	str	r4, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	mvn	r0, #0
	ldrge	r0, [sp, #8]
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
	.size	RegisterAs, .-RegisterAs
	.align	2
	.global	WhoIs
	.type	WhoIs, %function
WhoIs:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #8
	sub	sp, sp, #20
	str	r0, [sp, #16]
	mov	ip, #2
	mov	r2, r4
	add	r1, sp, #12
	add	r3, sp, #4
	mov	r0, #33
	str	ip, [sp, #12]
	str	r4, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	mvn	r0, #0
	ldrge	r0, [sp, #8]
	add	sp, sp, #20
	ldmfd	sp!, {r4, pc}
	.size	WhoIs, .-WhoIs
	.ident	"GCC: (GNU) 4.0.2"
