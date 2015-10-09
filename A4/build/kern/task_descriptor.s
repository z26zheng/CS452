	.file	"task_descriptor.c"
	.text
	.align	2
	.global	tds_init
	.type	tds_init, %function
tds_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r3, r0, #1616
	str	r3, [r0, #1672]
	ldr	r3, .L12
	mov	r2, #32
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r1, #0
	add	r4, r0, #4
	str	r2, [r0, #1680]
	str	r3, [r0, #1676]
	str	r4, [r0, #1668]
	mov	r3, r0
	mov	r2, r1
.L2:
	add	r1, r1, #1
	cmp	r1, #393216
	str	r2, [r3, #1684]
	add	r3, r3, #4
	bne	.L2
	mov	lr, r2
	add	r5, r0, #1680
	add	ip, r0, #50688
	add	r2, r4, #52
	add	r5, r5, #4
	add	ip, ip, #144
	mov	r4, lr
	mov	r6, #16
	mov	r1, lr
	mov	r7, #5
.L4:
	ldr	r3, [r0, #1676]
	str	ip, [r2, #-52]
	str	r3, [r5, r4]
	str	lr, [r2, #-36]
	add	lr, lr, #1
	cmp	lr, #32
	str	ip, [r2, #-48]
	str	r6, [r2, #-44]
	str	r1, [r2, #-40]
	str	r1, [r2, #-32]
	str	r1, [r2, #-28]
	str	r7, [r2, #-24]
	str	r2, [r2, #-20]
	str	r1, [r2, #-16]
	str	r1, [r2, #-12]
	str	r1, [r2, #-8]
	str	r1, [r2, #-4]
	add	r4, r4, #49152
	add	ip, ip, #49152
	add	r2, r2, #52
	bne	.L4
	str	r1, [r0, #1648]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L13:
	.align	2
.L12:
	.word	991579893
	.size	tds_init, .-tds_init
	.align	2
	.global	tds_create_td
	.type	tds_create_td, %function
tds_create_td:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	ip, [r0, #1668]
	mov	lr, r0
	cmp	ip, #0
	mov	r5, r1
	mov	r4, r2
	beq	.L15
	ldr	r2, [ip, #16]
	ldr	r0, [r0, #0]
	bic	r3, r2, #31
	add	r3, r3, #32
	and	r2, r2, #31
	orr	r2, r2, r3
	str	r2, [ip, #16]
	cmp	r0, #0
	mov	r1, r0
	ldr	r2, [ip, #0]
	ldrne	r1, [r0, #16]
	add	r3, r4, #2195456
	str	r1, [ip, #20]
	str	r5, [ip, #24]
	str	r3, [r2, #-52]
	str	r2, [r2, #-8]
	ldr	r3, [lr, #1680]
	ldr	r0, [ip, #32]
	mov	r1, #0
	sub	r2, r2, #52
	sub	r3, r3, #1
	str	r0, [lr, #1668]
	str	r1, [ip, #28]
	str	r3, [lr, #1680]
	str	r2, [ip, #0]
	str	r1, [ip, #32]
.L15:
	mov	r0, ip
	ldmfd	sp!, {r4, r5, pc}
	.size	tds_create_td, .-tds_create_td
	.align	2
	.global	tds_remove_td
	.type	tds_remove_td, %function
tds_remove_td:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, #208
	str	lr, [sp, #-4]!
	str	r3, [r1, #8]
	str	r2, [r1, #16]
	str	r2, [r1, #20]
	str	r2, [r1, #24]
	ldr	r3, [r0, #1680]
	ldr	ip, [r0, #1672]
	add	r3, r3, #1
	ldr	lr, [r1, #4]
	str	r3, [r0, #1680]
	mov	r3, #5
	str	r1, [ip, #32]
	str	r2, [r1, #36]
	str	r2, [r1, #32]
	str	lr, [r1, #0]
	str	r3, [r1, #28]
	str	r1, [r0, #1672]
	ldr	pc, [sp], #4
	.size	tds_remove_td, .-tds_remove_td
	.ident	"GCC: (GNU) 4.0.2"
