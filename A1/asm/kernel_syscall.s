	.file	"kernel_syscall.c"
	.text
	.align	2
	.global	handle_create
	.type	handle_create, %function
handle_create:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #0]
	msr cpsr_c, #0xdf
	mov r1, r3
	add r2, r1, #44
	ldmfd r2, {r0, r1}
	msr cpsr_c, #0xd3
	
	str	r0, [fp, #-24]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r3, #16
	bls	.L2
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mvn	r3, #0
	str	r3, [r2, #12]
	b	.L4
.L2:
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	tds_create_td(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mvn	r3, #1
	str	r3, [r2, #12]
	b	.L4
.L5:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	str	r3, [r2, #12]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	add_to_priority(PLT)
.L4:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_create, .-handle_create
	.align	2
	.global	handle_pass
	.type	handle_pass, %function
handle_pass:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-16]
	mov	r1, r3
	bl	add_to_priority(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
	.size	handle_pass, .-handle_pass
	.align	2
	.global	handle_kill
	.type	handle_kill, %function
handle_kill:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #0]
	mov	r3, #4
	str	r3, [r2, #28]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	handle_kill, .-handle_kill
	.align	2
	.global	handle_my_tid
	.type	handle_my_tid, %function
handle_my_tid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_my_tid, .-handle_my_tid
	.align	2
	.global	handle_my_parent_tid
	.type	handle_my_parent_tid, %function
handle_my_parent_tid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	add_to_priority(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	handle_my_parent_tid, .-handle_my_parent_tid
	.ident	"GCC: (GNU) 4.0.2"
