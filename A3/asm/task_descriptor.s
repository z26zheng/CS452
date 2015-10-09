	.file	"task_descriptor.c"
	.global	__divsi3
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	str	r0, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #40
	str	r3, [fp, #-36]
	mov	r0, #393216
	ldr	r1, [fp, #-36]
	bl	__divsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-44]
	add	r2, r3, #4
	ldr	r3, [fp, #-44]
	str	r2, [r3, #1668]
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	add	r3, r3, #1600
	add	r3, r3, #12
	ldr	r2, [fp, #-44]
	str	r3, [r2, #1672]
	ldr	r2, [fp, #-44]
	mov	r3, #32
	str	r3, [r2, #1680]
	ldr	r2, [fp, #-44]
	ldr	r3, .L12+4
	str	r3, [r2, #1676]
	b	.L2
.L3:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-44]
	ldr	r1, .L12+8
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	__divsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	mov	r0, #1
	ldr	r3, .L12+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L2:
	ldr	r2, [fp, #-40]
	ldr	r3, .L12+16
	cmp	r2, r3
	ble	.L3
	mov	r0, #1
	ldr	r3, .L12+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L7
.L8:
	ldr	r3, [fp, #-44]
	add	r1, r3, #4
	ldr	r2, [fp, #-40]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-44]
	add	r1, r3, #1680
	add	r1, r1, #4
	ldr	r2, [fp, #-40]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #14
	add	r3, r1, r3
	add	r3, r3, #48896
	add	r3, r3, #252
	ldr	r2, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	sub	r3, r3, #48896
	sub	r3, r3, #252
	ldr	r2, [fp, #-44]
	ldr	r2, [r2, #1676]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #16
	str	r3, [r2, #8]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #16]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #24]
	ldr	r2, [fp, #-20]
	mov	r3, #5
	str	r3, [r2, #28]
	ldr	r3, [fp, #-44]
	add	r1, r3, #4
	ldr	r2, [fp, #-40]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	add	r2, r3, #52
	ldr	r3, [fp, #-20]
	str	r2, [r3, #32]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #44]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L7:
	ldr	r3, [fp, #-40]
	cmp	r3, #31
	ble	.L8
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #1648]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	991579893
	.word	1684
	.word	.LC0(GOTOFF)
	.word	393215
	.word	.LC1(GOTOFF)
	.size	tds_init, .-tds_init
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Assert failed (%s:%d):\011%s\012\015\012\015\000"
	.align	2
.LC3:
	.ascii	"task_descriptor.c\000"
	.text
	.align	2
	.global	tds_create_td
	.type	tds_create_td, %function
tds_create_td:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1668]
	cmp	r3, #0
	bne	.L15
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1680]
	cmp	r3, #0
	beq	.L17
	mov	r0, #1
	ldr	r3, .L25+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r3, .L25+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #64
	bl	bwprintf(PLT)
.L17:
	mov	r2, #0
	str	r2, [fp, #-40]
	b	.L19
.L15:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1668]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	and	r2, r3, #31
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	mov	r3, r3, lsr #5
	add	r3, r3, #1
	mov	r3, r3, asl #5
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-36]
	b	.L22
.L20:
	mov	r3, #0
	str	r3, [fp, #-36]
.L22:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #24]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #28]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #1668]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #32]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	sub	r2, r3, #52
	ldr	r3, [fp, #-32]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	sub	r2, r3, #8
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	sub	r2, r3, #52
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1680]
	sub	r2, r3, #1
	ldr	r3, [fp, #-24]
	str	r2, [r3, #1680]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-40]
.L19:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	tds_create_td, .-tds_create_td
	.align	2
	.global	tds_remove_td
	.type	tds_remove_td, %function
tds_remove_td:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #208
	str	r3, [r2, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #16]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #24]
	ldr	r2, [fp, #-20]
	mov	r3, #5
	str	r3, [r2, #28]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1672]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #32]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #32]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #1672]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1680]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1680]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	tds_remove_td, .-tds_remove_td
	.ident	"GCC: (GNU) 4.0.2"
