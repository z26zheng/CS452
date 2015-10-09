	.file	"task_descriptor.c"
	.text
	.align	2
	.global	tds_init
	.type	tds_init, %function
tds_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #6592
	ldr	r3, .L12
	add	r2, r2, #16
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r1, #128
	str	r2, [r0, r3]
	add	r3, r3, #8
	mov	r4, r0
	add	r5, r0, #6656
	add	lr, r0, #4
	str	r1, [r0, r3]
	ldr	r2, .L12+4
	ldr	r0, .L12+8
	sub	r3, r3, #4
	add	r5, r5, #20
	mov	ip, #0
	str	r0, [r4, r3]
	str	lr, [r4, r2]
	mov	r3, r5
	mov	r2, ip
.L2:
	add	ip, ip, #1
	cmp	ip, #3670016
	str	r2, [r3], #4
	bne	.L2
	mov	ip, r2
	add	r0, r5, #113664
	ldr	r6, .L12+12
	add	r2, lr, #52
	add	r0, r0, #1020
	mov	lr, ip
	mov	r1, ip
	mov	r7, #16
	mov	r8, #5
.L4:
	ldr	r3, [r4, r6]
	str	r0, [r2, #-52]
	str	r3, [r5, lr]
	str	ip, [r2, #-36]
	add	ip, ip, #1
	cmp	ip, #128
	str	r0, [r2, #-48]
	str	r7, [r2, #-44]
	str	r1, [r2, #-40]
	str	r1, [r2, #-32]
	str	r1, [r2, #-28]
	str	r8, [r2, #-24]
	str	r2, [r2, #-20]
	str	r1, [r2, #-16]
	str	r1, [r2, #-12]
	str	r1, [r2, #-8]
	str	r1, [r2, #-4]
	add	lr, lr, #114688
	add	r0, r0, #114688
	add	r2, r2, #52
	bne	.L4
	ldr	r3, .L12+16
	str	r1, [r4, r3]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L13:
	.align	2
.L12:
	.word	6664
	.word	6660
	.word	991579893
	.word	6668
	.word	6640
	.size	tds_init, .-tds_init
	.align	2
	.global	tds_create_td
	.type	tds_create_td, %function
tds_create_td:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L21
	mov	r5, r0
	ldr	r4, [r0, r3]
	mov	lr, r1
	cmp	r4, #0
	mov	r0, r2
	beq	.L15
	ldr	r2, [r4, #16]
	ldr	r1, [r5, #0]
	bic	r3, r2, #127
	add	r3, r3, #128
	and	r2, r2, #127
	orr	r2, r2, r3
	str	r2, [r4, #16]
	cmp	r1, #0
	mov	ip, r1
	ldrne	ip, [r1, #16]
	ldr	r1, [r4, #0]
	add	r3, r0, #2195456
	ldr	r0, .L21+4
	str	ip, [r4, #20]
	str	lr, [r4, #24]
	str	r3, [r1, #-52]
	str	r1, [r1, #-8]
	ldr	r3, [r5, r0]
	ldr	lr, [r4, #32]
	ldr	r2, .L21
	mov	ip, #0
	sub	r1, r1, #52
	sub	r3, r3, #1
	str	lr, [r5, r2]
	str	ip, [r4, #28]
	str	r3, [r5, r0]
	str	r1, [r4, #0]
	str	ip, [r4, #32]
.L15:
	mov	r0, r4
	ldmfd	sp!, {r4, r5, pc}
.L22:
	.align	2
.L21:
	.word	6660
	.word	6672
	.size	tds_create_td, .-tds_create_td
	.align	2
	.global	tds_remove_td
	.type	tds_remove_td, %function
tds_remove_td:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	stmfd	sp!, {r4, r5, lr}
	mov	r3, #208
	ldr	r4, .L25
	str	r3, [r1, #8]
	str	r2, [r1, #16]
	str	r2, [r1, #20]
	str	r2, [r1, #24]
	ldr	r5, .L25+4
	ldr	r3, [r0, r4]
	ldr	ip, [r0, r5]
	add	r3, r3, #1
	ldr	lr, [r1, #4]
	str	r3, [r0, r4]
	mov	r3, #5
	str	r1, [ip, #32]
	str	r2, [r1, #36]
	str	r2, [r1, #32]
	str	lr, [r1, #0]
	str	r3, [r1, #28]
	str	r1, [r0, r5]
	ldmfd	sp!, {r4, r5, pc}
.L26:
	.align	2
.L25:
	.word	6672
	.word	6664
	.size	tds_remove_td, .-tds_remove_td
	.ident	"GCC: (GNU) 4.0.2"
