	.file	"task_descriptor.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\033[s\033[50D%d%%\033[u\033[44m \000"
	.align	2
.LC1:
	.ascii	"\033[40m\012\015\000"
	.text
	.align	2
	.global	tds_init
	.type	tds_init, %function
tds_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	add	r3, r0, #1616
	ldr	sl, .L17
	mov	r2, #32
	mov	r5, #0
	str	r3, [r0, #1672]
	ldr	r7, .L17+4
	ldr	r3, .L17+8
.L14:
	add	sl, pc, sl
	add	r9, r0, #4
	str	r2, [r0, #1680]
	mov	r8, r0
	mov	r4, r0
	mov	r2, r5
	mov	r6, #100
	str	r3, [r0, #1676]
	str	r9, [r0, #1668]
	b	.L2
.L5:
	add	r5, r5, #1
	cmp	r5, #393216
	add	r4, r4, #4
	beq	.L16
.L2:
	ldr	r3, .L17+12
	mov	r0, #1
	cmp	r2, r3
	mov	r3, #0
	mov	ip, r6, asr #31
	add	r1, sl, r7
	add	r2, r2, r0
	str	r3, [r4, #1684]
	bne	.L5
	ldr	r3, .L17+16
	add	r5, r5, #1
	smull	lr, r2, r3, r6
	rsb	r2, ip, r2, asr #4
	bl	bwprintf(PLT)
	cmp	r5, #393216
	add	r6, r6, #100
	mov	r2, #1
	add	r4, r4, #4
	bne	.L2
.L16:
	ldr	r1, .L17+20
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	add	r4, r8, #1680
	mov	ip, #0
	add	r0, r8, #50688
	add	r2, r9, #52
	add	r4, r4, #4
	add	r0, r0, #144
	mov	lr, ip
	mov	r5, #16
	mov	r1, ip
	mov	r6, #5
.L7:
	ldr	r3, [r8, #1676]
	str	r0, [r2, #-52]
	str	r3, [r4, lr]
	str	ip, [r2, #-36]
	add	ip, ip, #1
	cmp	ip, #32
	str	r0, [r2, #-48]
	str	r5, [r2, #-44]
	str	r1, [r2, #-40]
	str	r1, [r2, #-32]
	str	r1, [r2, #-28]
	str	r6, [r2, #-24]
	str	r2, [r2, #-20]
	str	r1, [r2, #-16]
	str	r1, [r2, #-12]
	str	r1, [r2, #-8]
	str	r1, [r2, #-4]
	add	lr, lr, #49152
	add	r0, r0, #49152
	add	r2, r2, #52
	bne	.L7
	str	r1, [r8, #1648]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L14+8)
	.word	.LC0(GOTOFF)
	.word	991579893
	.word	9830
	.word	1717986919
	.word	.LC1(GOTOFF)
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
	beq	.L20
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
.L20:
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
