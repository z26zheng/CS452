	.file	"ring_buf.c"
	.global	__modsi3
	.text
	.align	2
	.global	push_front
	.type	push_front, %function
push_front:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, [r1, #12]
	mov	r4, r1
	cmp	r5, #0
	mvn	r6, #100
	beq	.L4
	ldr	r6, [r1, #4]
	cmp	r0, #4
	mov	r3, r6
	beq	.L14
	cmp	r0, #1
	bne	.L8
	ldr	r3, [r1, #16]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	ldr	r2, [r3, #0]
	strb	r1, [r2, r6]
	ldr	r5, [r4, #12]
	ldr	r3, [r4, #4]
.L7:
	add	r0, r3, #1
	ldr	r1, [r4, #0]
	bl	__modsi3(PLT)
	sub	r3, r5, #1
	str	r3, [r4, #12]
	str	r0, [r4, #4]
.L4:
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L14:
	ldr	r3, [r1, #16]
	ldr	r1, [r2, #0]
	ldr	r2, [r3, #0]
	str	r1, [r2, r6, asl #2]
	ldr	r5, [r4, #12]
	ldr	r3, [r4, #4]
	b	.L7
.L8:
	cmp	r0, #8
	mvnne	r6, #99
	bne	.L4
	b	.L7
	.size	push_front, .-push_front
	.align	2
	.global	pop_back
	.type	pop_back, %function
pop_back:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r6, [r1, #12]
	ldr	r1, [r1, #0]
	cmp	r6, r1
	beq	.L16
	cmp	r0, #4
	beq	.L26
	cmp	r0, #1
	bne	.L21
	ldr	r2, [r4, #16]
	ldr	r0, [r4, #8]
	ldr	r3, [r2, #0]
	add	r5, r3, r0
.L20:
	add	r0, r0, #1
	bl	__modsi3(PLT)
	add	r3, r6, #1
	str	r0, [r4, #8]
	mov	r0, r5
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, pc}
.L26:
	ldr	r2, [r4, #16]
	ldr	r0, [r4, #8]
	ldr	r3, [r2, #0]
	add	r5, r3, r0, asl #2
	b	.L20
.L16:
	mov	r5, #0
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, pc}
.L21:
	cmp	r0, #8
	bne	.L16
	ldr	r3, [r4, #16]
	ldr	r0, [r4, #8]
	ldr	r5, [r3, #0]
	b	.L20
	.size	pop_back, .-pop_back
	.align	2
	.global	pop_front
	.type	pop_front, %function
pop_front:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r1, #0]
	ldr	r6, [r1, #12]
	mov	r4, r1
	cmp	r6, r3
	mov	r1, r3
	mov	r5, r0
	beq	.L28
	ldr	r0, [r4, #4]
	add	r0, r3, r0
	sub	r0, r0, #1
	bl	__modsi3(PLT)
	cmp	r5, #4
	str	r0, [r4, #4]
	beq	.L38
	cmp	r5, #1
	bne	.L33
	ldr	r3, [r4, #16]
	ldr	r2, [r3, #0]
	add	r0, r2, r0
.L32:
	add	r3, r6, #1
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, pc}
.L38:
	ldr	r3, [r4, #16]
	ldr	r2, [r3, #0]
	add	r3, r6, #1
	add	r0, r2, r0, asl #2
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, pc}
.L28:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L33:
	cmp	r5, #8
	bne	.L28
	ldr	r3, [r4, #16]
	ldr	r0, [r3, #0]
	b	.L32
	.size	pop_front, .-pop_front
	.align	2
	.global	count
	.type	count, %function
count:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	ldr	r0, [r0, #0]
	@ lr needed for prologue
	rsb	r0, r3, r0
	bx	lr
	.size	count, .-count
	.align	2
	.global	empty
	.type	empty, %function
empty:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #0]
	ldr	r0, [r0, #12]
	@ lr needed for prologue
	cmp	r0, r3
	movne	r0, #0
	moveq	r0, #1
	bx	lr
	.size	empty, .-empty
	.align	2
	.global	top_front
	.type	top_front, %function
top_front:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r1, #12]
	ldr	r3, [r1, #0]
	@ lr needed for prologue
	cmp	r2, r3
	beq	.L44
	cmp	r0, #4
	beq	.L53
	cmp	r0, #1
	bne	.L49
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #4]
	ldr	r2, [r3, #0]
	add	r0, r2, r1
	bx	lr
.L53:
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #4]
	ldr	r2, [r3, #0]
	add	r0, r2, r1, asl #2
	bx	lr
.L44:
	mov	r0, #0
	bx	lr
.L49:
	cmp	r0, #8
	bne	.L44
	ldr	r3, [r1, #16]
	ldr	r0, [r3, #0]
	bx	lr
	.size	top_front, .-top_front
	.align	2
	.global	top_back
	.type	top_back, %function
top_back:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r1, #12]
	ldr	r3, [r1, #0]
	@ lr needed for prologue
	cmp	r2, r3
	beq	.L55
	cmp	r0, #4
	beq	.L64
	cmp	r0, #1
	bne	.L60
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #8]
	ldr	r2, [r3, #0]
	add	r0, r2, r1
	bx	lr
.L64:
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #8]
	ldr	r2, [r3, #0]
	add	r0, r2, r1, asl #2
	bx	lr
.L55:
	mov	r0, #0
	bx	lr
.L60:
	cmp	r0, #8
	bne	.L55
	ldr	r3, [r1, #16]
	ldr	r0, [r3, #0]
	bx	lr
	.size	top_back, .-top_back
	.ident	"GCC: (GNU) 4.0.2"
