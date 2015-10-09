	.file	"nameserver.c"
	.text
	.align	2
	.global	reply_back
	.type	reply_back, %function
reply_back:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #4]
	str	r3, [r2, #4]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-24]
	bl	Reply(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	reply_back, .-reply_back
	.align	2
	.global	nameserver_main
	.type	nameserver_main, %function
nameserver_main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #52
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #8
	str	r3, [fp, #-20]
	b	.L4
.L5:
	ldr	r3, [fp, #-28]
	mvn	r2, #23
	mov	r3, r3, asl #2
	sub	r1, fp, #12
	add	r3, r3, r1
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	cmp	r3, #1
	ble	.L5
	b	.L24
.L6:
.L24:
	sub	r2, fp, #48
	sub	r3, fp, #40
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L7
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	mvn	r3, #2
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #99
	bl	reply_back(PLT)
	b	.L6
.L7:
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-60]
	ldr	r1, [fp, #-60]
	cmp	r1, #1
	beq	.L11
	ldr	r3, [fp, #-60]
	cmp	r3, #2
	beq	.L12
	b	.L10
.L11:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	blt	.L13
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	ble	.L15
.L13:
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	mvn	r3, #3
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #99
	bl	reply_back(PLT)
	b	.L6
.L15:
	ldr	r1, [fp, #-44]
	ldr	r3, [fp, #-40]
	mov	r0, r3
	mvn	r2, #23
	mov	r3, r1, asl #2
	sub	r1, fp, #12
	add	r3, r3, r1
	add	r3, r3, r2
	str	r0, [r3, #0]
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #98
	bl	reply_back(PLT)
	b	.L6
.L12:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	blt	.L17
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	ble	.L19
.L17:
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	mvn	r3, #3
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #99
	bl	reply_back(PLT)
	b	.L6
.L19:
	ldr	r3, [fp, #-44]
	mvn	r2, #23
	mov	r3, r3, asl #2
	sub	r1, fp, #12
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	mvn	r3, #4
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #99
	bl	reply_back(PLT)
	b	.L6
.L21:
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #98
	bl	reply_back(PLT)
	b	.L6
.L10:
	ldr	r3, [fp, #-40]
	mov	r2, r3
	sub	r1, fp, #56
	mvn	r3, #1
	str	r3, [sp, #0]
	mov	r0, r2
	ldr	r2, [fp, #-20]
	mov	r3, #99
	bl	reply_back(PLT)
	b	.L6
	.size	nameserver_main, .-nameserver_main
	.align	2
	.global	RegisterAs
	.type	RegisterAs, %function
RegisterAs:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	sub	r2, fp, #24
	sub	ip, fp, #32
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, #33
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L26
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L28
.L26:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-40]
.L28:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	RegisterAs, .-RegisterAs
	.align	2
	.global	WhoIs
	.type	WhoIs, %function
WhoIs:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-36]
	mov	r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	sub	r2, fp, #24
	sub	ip, fp, #32
	mov	r3, #8
	str	r3, [sp, #0]
	mov	r0, #33
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L31
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L33
.L31:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-40]
.L33:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	WhoIs, .-WhoIs
	.ident	"GCC: (GNU) 4.0.2"
