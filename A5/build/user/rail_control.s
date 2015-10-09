	.file	"rail_control.c"
	.text
	.align	2
	.global	init_rail_cmds
	.type	init_rail_cmds, %function
init_rail_cmds:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r3, #0
	@ lr needed for prologue
	str	r3, [r0, #32]
	str	r3, [r0, #80]
	str	r3, [r0, #76]
	str	r3, [r0, #72]
	str	r3, [r0, #68]
	str	r3, [r0, #64]
	str	r3, [r0, #60]
	str	r3, [r0, #56]
	str	r3, [r0, #52]
	str	r3, [r0, #48]
	str	r3, [r0, #44]
	str	r3, [r0, #40]
	str	r3, [r0, #36]
	str	r3, [r0, #12]
	str	r3, [r0, #8]
	str	r3, [r0, #4]
	str	r3, [r0, #0]
	bx	lr
	.size	init_rail_cmds, .-init_rail_cmds
	.align	2
	.global	predict_next_sensor_dynamic
	.type	predict_next_sensor_dynamic, %function
predict_next_sensor_dynamic:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #84]
	ldr	r2, [r0, #0]
	add	r3, r3, r3, asl #1
	add	r2, r2, r3, asl #4
	mov	r6, r0
	ldr	r4, [r2, #24]
	ldr	r5, [r2, #28]
	bl	get_cur_stopping_distance(PLT)
	mov	r1, #1
	mov	ip, r0
	mvn	r0, #0
.L23:
	cmp	r5, ip
	movgt	r3, #0
	andle	r3, r1, #1
	cmp	r3, #0
	beq	.L12
.L5:
	ldr	r3, [r4, #4]
	cmp	r3, #1
	ldreq	r0, [r4, #8]
	moveq	r1, r0, lsr #31
	beq	.L23
	cmp	r3, #2
	beq	.L25
	cmp	r3, #5
	beq	.L12
	ldr	r3, [r4, #28]
	ldr	r4, [r4, #24]
	add	r5, r5, r3
	cmp	r5, ip
	movgt	r3, #0
	andle	r3, r1, #1
	cmp	r3, #0
	bne	.L5
.L12:
	cmn	r0, #1
	ldmnefd	sp!, {r4, r5, r6, pc}
	ldr	r3, [r6, #8]
	cmp	r3, #4
	ldmnefd	sp!, {r4, r5, r6, pc}
	ldr	r3, [r6, #84]
	ldr	r0, [r6, #0]
	add	r3, r3, r3, asl #1
	add	r3, r0, r3, asl #4
	ldr	r2, [r3, #12]
	ldr	r1, [r6, #136]
	rsb	r2, r0, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #8
	rsb	r1, r1, ip, asl #1
	add	r3, r3, r3, asl #16
	cmp	r1, #0
	movlt	r1, #0
	add	r2, r2, r3, asl #1
	str	r1, [r6, #108]
	str	r2, [r6, #88]
	ldmfd	sp!, {r4, r5, r6, pc}
.L25:
	ldr	r2, [r4, #8]
	ldr	r3, [r6, #4]
	cmp	r2, #152
	subgt	r2, r2, #134
	ldr	r2, [r3, r2, asl #2]
	add	r2, r4, r2, asl #4
	ldr	r3, [r2, #28]
	ldr	r4, [r2, #24]
	add	r5, r5, r3
	b	.L23
	.size	predict_next_sensor_dynamic, .-predict_next_sensor_dynamic
	.align	2
	.global	predict_next_sensor_static
	.type	predict_next_sensor_static, %function
predict_next_sensor_static:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #84]
	ldr	r2, [r0, #0]
	add	r3, r3, r3, asl #1
	add	r2, r2, r3, asl #4
	ldr	r1, [r2, #24]
	ldr	ip, [r2, #28]
	@ lr needed for prologue
.L46:
	ldr	r3, [r1, #4]
	cmp	r3, #1
	bne	.L47
	ldr	r3, [r1, #8]
	cmp	r3, #0
.L28:
	blt	.L28
.L29:
	str	r3, [r0, #88]
	str	ip, [r0, #108]
	bx	lr
.L47:
	cmp	r3, #2
	beq	.L48
	cmp	r3, #5
	beq	.L35
	ldr	r3, [r1, #28]
	ldr	r1, [r1, #24]
	add	ip, ip, r3
	b	.L46
.L48:
	ldr	r2, [r1, #8]
	ldr	r3, [r0, #4]
	cmp	r2, #152
	subgt	r2, r2, #134
	ldr	r2, [r3, r2, asl #2]
	add	r2, r1, r2, asl #4
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #24]
	add	ip, ip, r3
	b	.L46
.L35:
	mvn	r3, #0
	b	.L29
	.size	predict_next_sensor_static, .-predict_next_sensor_static
	.align	2
	.global	get_shortest_path
	.type	get_shortest_path, %function
get_shortest_path:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [r1, r3, asl #2]
	@ lr needed for prologue
	subs	r1, ip, #1
	mov	r2, r3
	bxmi	lr
	ldr	r3, [sp, #0]
	add	r1, r3, r1, asl #2
	mov	r3, #0
.L52:
	add	r3, r3, #1
	str	r2, [r1], #-4
	cmp	r3, ip
	ldr	r2, [r0, r2, asl #2]
	bne	.L52
	bx	lr
	.size	get_shortest_path, .-get_shortest_path
	.align	2
	.global	print_shortest_path
	.type	print_shortest_path, %function
print_shortest_path:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, [sp, #12]
	ldr	lr, [sp, #16]
	mov	ip, r4, asl #2
	ldr	r0, [ip, r2]
	add	r5, ip, r2
	subs	r0, r0, #1
	bmi	.L57
	cmp	r4, r3
	str	r4, [lr, r0, asl #2]
	movne	ip, r4
	addne	lr, lr, r0, asl #2
	movne	r2, #0
	beq	.L57
.L59:
	cmp	r0, r2
	ldr	ip, [r1, ip, asl #2]
	add	r2, r2, #1
	beq	.L57
	cmp	r3, ip
	str	ip, [lr, #-4]
	sub	lr, lr, #4
	bne	.L59
.L57:
	ldr	ip, [r5, #0]
	cmp	ip, #0
	ldmlefd	sp!, {r4, r5, pc}
	mov	r3, #0
.L62:
	add	r3, r3, #1
	cmp	ip, r3
	ldmeqfd	sp!, {r4, r5, pc}
	add	r3, r3, #1
	cmp	ip, r3
	bne	.L62
	ldmfd	sp!, {r4, r5, pc}
	.size	print_shortest_path, .-print_shortest_path
	.align	2
	.global	init_node
	.type	init_node, %function
init_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmia	r0, {r1, r2}	@ phole stm
	bx	lr
	.size	init_node, .-init_node
	.align	2
	.global	swap_node
	.type	swap_node, %function
swap_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [r0, #4]
	ldr	lr, [r0, #0]
	ldr	r3, [r1, #0]
	ldr	r2, [r1, #4]
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	str	lr, [r1, #0]
	str	ip, [r1, #4]
	ldr	pc, [sp], #4
	.size	swap_node, .-swap_node
	.align	2
	.global	heap_empty
	.type	heap_empty, %function
heap_empty:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #0]
	@ lr needed for prologue
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
	.size	heap_empty, .-heap_empty
	.align	2
	.global	print_min_heap
	.type	print_min_heap, %function
print_min_heap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #0]
	@ lr needed for prologue
	cmp	r0, #0
	bxle	lr
	mov	r3, #0
.L75:
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L75
	bx	lr
	.size	print_min_heap, .-print_min_heap
	.align	2
	.global	heap_find
	.type	heap_find, %function
heap_find:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #0]
	ldr	r0, [r3, r1, asl #2]
	@ lr needed for prologue
	cmp	r0, r2
	movge	r0, #0
	movlt	r0, #1
	bx	lr
	.size	heap_find, .-heap_find
	.align	2
	.global	predict_next_fallback_sensors_static
	.type	predict_next_fallback_sensors_static, %function
predict_next_fallback_sensors_static:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	ldr	r3, [r0, #84]
	ldr	r2, [r0, #0]
	add	r3, r3, r3, asl #1
	mov	r7, r0
	add	r0, r2, r3, asl #4
	ldr	r1, [r0, #12]
	ldr	r2, [r7, #88]
	ldr	r3, [r1, #8]
	sub	sp, sp, #72
	cmp	r2, r3
	str	r2, [sp, #0]
	ldreq	r1, [r0, #24]
	beq	.L119
.L81:
	mov	r3, r7
	mov	r2, #0
	mvn	r1, #0
.L90:
	add	r2, r2, #1
	cmp	r2, #5
	str	r1, [r3, #168]
	add	r3, r3, #4
	bne	.L90
	mov	r3, #10
	mov	r4, #0
	add	ip, sp, #72
	str	r3, [sp, #56]
	str	r3, [sp, #44]
	add	r3, sp, #4
	str	r4, [sp, #48]
	str	r4, [sp, #52]
	str	r3, [ip, #-4]!
	ldr	r5, [r0, #24]
	add	r6, sp, #44
	add	r9, sp, #64
	mov	r0, #4
	mov	r1, r6
	mov	r2, r9
	str	ip, [sp, #60]
	str	r5, [sp, #64]
	bl	push_front(PLT)
	mov	fp, r4
	mov	r8, r4
.L120:
	mov	r0, r6
	bl	empty(PLT)
	cmp	r0, #0
	bne	.L122
.L93:
	mov	r0, #4
	mov	r1, r6
	bl	pop_back(PLT)
	ldr	r4, [r0, #0]
	ldr	r5, [r4, #4]
	cmp	r5, #1
	beq	.L123
	cmp	r5, #2
	beq	.L124
	cmp	r5, #5
	beq	.L120
	ldr	r3, [r4, #24]
	mov	r1, r6
	mov	r2, r9
	mov	r0, #4
	str	r3, [sp, #64]
	bl	push_front(PLT)
	mov	r0, r6
	bl	empty(PLT)
	cmp	r0, #0
	beq	.L93
.L122:
	add	sp, sp, #72
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L126:
	ldr	r3, [r1, #8]
	ldr	r2, [r7, #4]
	cmp	r3, #152
	subgt	r3, r3, #134
	ldr	r3, [r2, r3, asl #2]
	add	r3, r1, r3, asl #4
	ldr	r1, [r3, #24]
.L119:
	ldr	r3, [r1, #4]
	cmp	r3, #1
	beq	.L125
.L84:
	cmp	r3, #2
	ldrne	r1, [r1, #24]
	beq	.L126
	ldr	r3, [r1, #4]
	cmp	r3, #1
	bne	.L84
.L125:
	ldr	r0, [r1, #12]
	b	.L81
.L123:
	ldr	r3, [sp, #0]
	ldr	r2, [r4, #8]
	cmp	r3, r2
	addne	r3, r7, r8, asl #2
	strne	r2, [r3, #168]
	addne	r8, r8, #1
	bne	.L120
	ldr	r3, [r4, #24]
	mov	r0, #4
	mov	r1, r6
	mov	r2, r9
	str	r3, [sp, #64]
	bl	push_front(PLT)
	mov	fp, r5
	b	.L120
.L124:
	cmp	fp, #0
	beq	.L100
	ldr	r2, [r4, #8]
	ldr	r3, [r7, #4]
	cmp	r2, #152
	subgt	r2, r2, #134
	ldr	r0, [r3, r2, asl #2]
	mov	r1, r6
	add	r0, r4, r0, asl #4
	ldr	r3, [r0, #24]
	mov	r2, r9
	mov	r0, #4
	str	r3, [sp, #64]
	bl	push_front(PLT)
	b	.L120
.L100:
	ldr	r3, [r4, #24]
	mov	r1, r6
	mov	r2, r9
	mov	r0, #4
	str	r3, [sp, #64]
	bl	push_front(PLT)
	ldr	r3, [r4, #40]
	mov	r1, r6
	mov	r2, r9
	mov	r0, #4
	str	r3, [sp, #64]
	bl	push_front(PLT)
	b	.L120
	.size	predict_next_fallback_sensors_static, .-predict_next_fallback_sensors_static
	.align	2
	.global	make_min_heap
	.type	make_min_heap, %function
make_min_heap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r9, r0
	mov	r7, r1
	mov	r3, r7, asl #1
	ldr	lr, [r9, #0]
	add	r2, r3, #1
	cmp	r2, lr
	add	ip, r3, #2
	bge	.L130
.L140:
	ldr	r3, [r9, #12]
	mov	r5, r2
	add	r0, r3, r7, asl #3
	add	r3, r3, r2, asl #3
	ldr	r1, [r3, #4]
	ldr	r2, [r0, #4]
	cmp	r1, r2
	bge	.L130
.L133:
	cmp	ip, lr
	mov	r8, r7, asl #3
	bge	.L134
	ldr	r3, [r9, #12]
	add	r0, r3, r5, asl #3
	add	r3, r3, ip, asl #3
	ldr	r1, [r3, #4]
	ldr	r2, [r0, #4]
	cmp	r1, r2
	movlt	r5, ip
.L134:
	cmp	r5, r7
	mov	r6, r5, asl #3
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	ldr	r3, [r9, #12]
	ldr	r0, [r9, #8]
	ldr	r2, [r3, r8]
	add	lr, r3, r6
	str	r5, [r0, r2, asl #2]
	ldr	r1, [r3, r6]
	add	r4, r3, r8
	str	r7, [r0, r1, asl #2]
	ldr	ip, [r3, r8]
	ldr	r2, [r3, r6]
	ldr	r1, [lr, #4]
	ldr	r0, [r4, #4]
	str	r2, [r3, r8]
	str	r1, [r4, #4]
	str	ip, [r3, r6]
	mov	r7, r5
	str	r0, [lr, #4]
	mov	r3, r7, asl #1
	ldr	lr, [r9, #0]
	add	r2, r3, #1
	cmp	r2, lr
	add	ip, r3, #2
	blt	.L140
.L130:
	mov	r5, r7
	b	.L133
	.size	make_min_heap, .-make_min_heap
	.align	2
	.global	extract_min
	.type	extract_min, %function
extract_min:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #0]
	mov	r7, r0
	cmp	r3, #0
	beq	.L142
	sub	r5, r3, #1
	ldr	r3, [r0, #12]
	mov	r1, r5, asl #3
	ldr	ip, [r3, r1]
	ldr	lr, [r0, #8]
	mov	r8, #0
	str	r8, [lr, ip, asl #2]
	ldr	r2, [r3, #0]
	add	r6, r3, r1
	str	r5, [lr, r2, asl #2]
	ldmia	r3, {r4, lr}	@ phole ldm
	ldr	r2, [r3, r1]
	ldr	ip, [r6, #4]
	stmia	r3, {r2, ip}	@ phole stm
	str	r4, [r3, r1]
	str	lr, [r6, #4]
	ldr	r3, [r0, #0]
	sub	r3, r3, #1
	cmp	r3, r8
	str	r3, [r0, #0]
	movgt	r1, r8
	blgt	make_min_heap(PLT)
.L144:
	ldr	r3, [r6, #4]
	cmn	r3, #-2147483646
	bls	.L147
	ldr	r0, [r7, #0]
	cmp	r0, #0
	movgt	r1, r8
	bgt	.L149
.L150:
.L153:
	b	.L153
.L149:
	add	r1, r1, #1
	cmp	r0, r1
	bne	.L149
	b	.L150
.L142:
	mov	r6, r3
.L147:
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.size	extract_min, .-extract_min
	.align	2
	.global	decrease_dist
	.type	decrease_dist, %function
decrease_dist:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	ldr	fp, [r0, #8]
	ldr	r5, [r0, #12]
	ldr	r9, [fp, r1, asl #2]
	mov	r0, r2
	mov	r7, r9, asl #3
	sub	r3, r9, #1
	add	r3, r3, r3, lsr #31
	add	r2, r5, r7
	cmp	r9, #0
	str	r0, [r2, #4]
	mov	r6, r3, asr #1
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
	mov	r8, r6, asl #3
	add	r1, r5, r8
	ldr	r3, [r1, #4]
	cmp	r0, r3
	ldmgefd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L162:
	ldr	r3, [r1, #0]
	add	r0, r7, r5
	str	r9, [fp, r3, asl #2]
	ldr	r3, [r7, r5]
	add	ip, r8, r5
	str	r6, [fp, r3, asl #2]
	sub	r3, r6, #1
	ldr	r1, [r8, r5]
	ldr	r4, [r7, r5]
	add	r3, r3, r3, lsr #31
	ldr	r2, [ip, #4]
	ldr	lr, [r0, #4]
	mov	r3, r3, asr #1
	str	r1, [r7, r5]
	cmp	r6, #0
	mov	r7, r6, asl #3
	str	r4, [r8, r5]
	mov	r8, r3, asl #3
	str	r2, [r0, #4]
	mov	r9, r6
	add	r2, r5, r7
	str	lr, [ip, #4]
	add	r1, r5, r8
	mov	r6, r3
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
	ldr	r2, [r2, #4]
	ldr	r3, [r1, #4]
	cmp	r3, r2
	bgt	.L162
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
	.size	decrease_dist, .-decrease_dist
	.align	2
	.global	init_min_heap
	.type	init_min_heap, %function
init_min_heap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	lr, r3
	mov	r3, #144
	mov	r5, r1
	mov	r4, r2
	str	r3, [r0, #4]
	str	r3, [r0, #0]
	str	r2, [r0, #8]
	str	lr, [r0, #12]
	mov	ip, #0
	mvn	r1, #-2147483648
.L166:
	mov	r3, ip, asl #3
	add	r2, lr, r3
	str	ip, [r4, ip, asl #2]
	str	ip, [lr, r3]
	str	r1, [r2, #4]
	ldr	r3, [r0, #4]
	add	ip, ip, #1
	cmp	ip, r3
	blt	.L166
	mov	r1, r5
	mov	r2, #0
	ldmfd	sp!, {r4, r5, lr}
	b	decrease_dist(PLT)
	.size	init_min_heap, .-init_min_heap
	.align	2
	.global	dijkstra
	.type	dijkstra, %function
dijkstra:
	@ args = 4, pretend = 0, frame = 1780
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	sub	sp, sp, #1776
	sub	sp, sp, #4
	add	r9, sp, #1728
	str	r3, [sp, #1760]
	ldr	r8, [sp, #1808]
	add	r9, r9, #12
	add	r3, sp, #4
	str	r0, [sp, #1772]
	str	r2, [sp, #1728]
	mov	r0, r9
	sub	r3, r3, #4
	add	r2, sp, #1152
	mov	r4, r1
	str	r8, [sp, #1736]
	bl	init_min_heap(PLT)
	mov	r1, #0
	mvn	lr, #-2147483648
	mvn	r0, #0
	mov	ip, r1
.L171:
	ldr	r3, [sp, #1760]
	str	lr, [r1, r3]
	ldr	r2, [sp, #1728]
	str	r0, [r1, r2]
	ldr	r3, [sp, #1736]
	str	ip, [r1, r3]
	add	r1, r1, #4
	cmp	r1, #576
	bne	.L171
	ldr	r3, [sp, #1760]
	str	ip, [r3, r4, asl #2]
	ldr	ip, [sp, #1740]
.L227:
	cmp	ip, #0
	beq	.L228
.L174:
	mov	r0, r9
	bl	extract_min(PLT)
	ldr	r0, [r0, #0]
	ldr	lr, [sp, #1772]
	add	r2, r0, r0, asl #1
	add	r2, lr, r2, asl #4
	ldr	r3, [r2, #4]
	str	r0, [sp, #1764]
	sub	r3, r3, #1
	str	r2, [sp, #1776]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L209
	.p2align 2
.L180:
	b	.L177
	b	.L176
	b	.L177
	b	.L177
	b	.L179
.L177:
	ldr	r2, [r2, #24]
	ldr	r0, [sp, #1764]
	rsb	r2, lr, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #8
	add	r3, r3, r3, asl #16
	add	r5, r2, r3, asl #1
	ldr	r6, [sp, #1760]
	ldr	r1, [sp, #1776]
	str	r5, [sp, #1768]
	ldr	r2, [r6, r0, asl #2]
	ldr	r3, [r1, #28]
	ldr	r8, [sp, #1736]
	add	r4, r2, r3
	str	r4, [sp, #1756]
	ldr	r3, [r8, r0, asl #2]
	ldr	r7, [sp, #1748]
	add	r3, r3, #1
	str	r3, [sp, #1732]
	ldr	r2, [r7, r5, asl #2]
	ldr	ip, [sp, #1740]
	cmp	r2, ip
	bge	.L199
	ldr	r3, [r6, r5, asl #2]
	cmp	r3, r4
	strgt	r4, [r6, r5, asl #2]
	bgt	.L223
.L199:
	ldr	r2, [r1, #12]
	rsb	r2, lr, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #8
	add	r3, r3, r3, asl #16
	add	lr, r2, r3, asl #1
	str	lr, [sp, #1768]
	ldr	r3, [r6, r0, asl #2]
	add	r1, r3, #999424
	add	r1, r1, #576
	str	r1, [sp, #1756]
	ldr	r3, [r8, r0, asl #2]
	add	r3, r3, #1
	str	r3, [sp, #1732]
	ldr	r2, [r7, lr, asl #2]
	cmp	r2, ip
	bge	.L227
	ldr	r3, [r6, lr, asl #2]
	cmp	r3, r1
	strgt	r1, [r6, lr, asl #2]
	ble	.L227
.L218:
	ldr	r1, [sp, #1764]
	ldr	r2, [sp, #1768]
	ldr	r3, [sp, #1728]
	mov	r0, r9
	str	r1, [r3, r2, asl #2]
	ldr	ip, [sp, #1732]
	ldr	r2, [sp, #1768]
	ldr	r3, [sp, #1736]
	str	ip, [r3, r2, asl #2]
	ldr	r1, [sp, #1768]
	ldr	r2, [sp, #1756]
	bl	decrease_dist(PLT)
	ldr	ip, [sp, #1740]
	cmp	ip, #0
	bne	.L174
.L228:
	add	sp, sp, #756
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L209:
	ldr	ip, [sp, #1740]
	b	.L227
.L176:
	ldr	r2, [r2, #24]
	ldr	r0, [sp, #1764]
	rsb	r2, lr, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #8
	add	r3, r3, r3, asl #16
	add	r5, r2, r3, asl #1
	ldr	r6, [sp, #1760]
	ldr	r1, [sp, #1776]
	str	r5, [sp, #1768]
	ldr	r2, [r6, r0, asl #2]
	ldr	r3, [r1, #28]
	ldr	r8, [sp, #1736]
	add	r4, r2, r3
	str	r4, [sp, #1756]
	ldr	r3, [r8, r0, asl #2]
	ldr	r7, [sp, #1748]
	add	r3, r3, #1
	str	r3, [sp, #1732]
	ldr	r2, [r7, r5, asl #2]
	ldr	ip, [sp, #1740]
	cmp	r2, ip
	bge	.L196
	ldr	r3, [r6, r5, asl #2]
	cmp	r3, r4
	bgt	.L229
.L196:
	ldr	r2, [r1, #40]
	rsb	r2, lr, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #8
	add	r3, r3, r3, asl #16
	add	r4, r2, r3, asl #1
	str	r4, [sp, #1768]
	ldr	r2, [r6, r0, asl #2]
	ldr	r3, [r1, #44]
	add	r5, r2, r3
	str	r5, [sp, #1756]
	ldr	r3, [r8, r0, asl #2]
	add	r3, r3, #1
	str	r3, [sp, #1732]
	ldr	r2, [r7, r4, asl #2]
	cmp	r2, ip
	bge	.L199
	ldr	r3, [r6, r4, asl #2]
	cmp	r3, r5
	ble	.L199
	str	r5, [r6, r4, asl #2]
.L223:
	ldr	r1, [sp, #1764]
	ldr	r2, [sp, #1768]
	ldr	r3, [sp, #1728]
	mov	r0, r9
	str	r1, [r3, r2, asl #2]
	ldr	ip, [sp, #1732]
	ldr	r2, [sp, #1768]
	ldr	r3, [sp, #1736]
	str	ip, [r3, r2, asl #2]
	ldr	r1, [sp, #1768]
	ldr	r2, [sp, #1756]
	bl	decrease_dist(PLT)
	ldr	r6, [sp, #1760]
	ldr	r8, [sp, #1736]
	ldr	lr, [sp, #1772]
	ldr	r0, [sp, #1764]
	ldr	r1, [sp, #1776]
	ldr	r7, [sp, #1748]
	ldr	ip, [sp, #1740]
	b	.L199
.L179:
	ldr	r2, [r2, #12]
	ldr	r1, [sp, #1764]
	rsb	r2, lr, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	add	r3, r3, r3, asl #8
	add	r3, r3, r3, asl #16
	add	lr, r2, r3, asl #1
	ldr	r4, [sp, #1760]
	str	lr, [sp, #1768]
	ldr	r3, [r4, r1, asl #2]
	ldr	r2, [sp, #1736]
	add	r0, r3, #999424
	add	r0, r0, #576
	str	r0, [sp, #1756]
	ldr	r3, [r2, r1, asl #2]
	ldr	r2, [sp, #1748]
	add	r3, r3, #1
	str	r3, [sp, #1732]
	ldr	r3, [r2, lr, asl #2]
	ldr	ip, [sp, #1740]
	cmp	r3, ip
	bge	.L227
	ldr	r3, [r4, lr, asl #2]
	cmp	r3, r0
	ble	.L227
	str	r0, [r4, lr, asl #2]
	b	.L218
.L229:
	str	r4, [r6, r5, asl #2]
	ldr	r1, [sp, #1764]
	ldr	r2, [sp, #1768]
	ldr	r3, [sp, #1728]
	mov	r0, r9
	str	r1, [r3, r2, asl #2]
	ldr	ip, [sp, #1732]
	ldr	r2, [sp, #1768]
	ldr	r3, [sp, #1736]
	str	ip, [r3, r2, asl #2]
	ldr	r1, [sp, #1768]
	ldr	r2, [sp, #1756]
	bl	decrease_dist(PLT)
	ldr	r6, [sp, #1760]
	ldr	r8, [sp, #1736]
	ldr	lr, [sp, #1772]
	ldr	r0, [sp, #1764]
	ldr	r1, [sp, #1776]
	ldr	r7, [sp, #1748]
	ldr	ip, [sp, #1740]
	b	.L196
	.size	dijkstra, .-dijkstra
	.global	__divsi3
	.align	2
	.global	get_next_command
	.type	get_next_command, %function
get_next_command:
	@ args = 0, pretend = 0, frame = 1784
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1792
	ldr	ip, [r0, #156]
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #80]
	str	ip, [fp, #-1792]
	ldr	r9, [r0, #84]
	ldr	r6, [r0, #92]
	str	r2, [fp, #-1800]
	str	r1, [fp, #-1812]
	str	r3, [fp, #-1796]
	mov	r8, r0
	bl	get_cur_stopping_distance(PLT)
	str	r0, [fp, #-1788]
	mov	r0, r8
	bl	safe_distance_to_branch(PLT)
	sub	r5, fp, #1760
	sub	r5, r5, #4
	sub	lr, fp, #36
	sub	r4, fp, #612
	str	r0, [fp, #-1784]
	sub	r3, fp, #1184
	str	r5, [sp, #0]
	add	r7, lr, r6, asl #2
	ldr	r0, [fp, #-1800]
	mov	r1, r9
	mov	r2, r4
	sub	r3, r3, #4
	bl	dijkstra(PLT)
	ldr	r3, [r7, #-1728]
	str	sp, [fp, #-1804]
	mov	r3, r3, asl #2
	add	r3, r3, #4
	rsb	sp, r3, sp
	add	r0, sp, #8
	str	r0, [fp, #-1816]
	mov	r1, r5
	str	r0, [sp, #0]
	mov	r2, r9
	mov	r0, r4
	mov	r3, r6
	bl	get_shortest_path(PLT)
	ldr	r7, [r7, #-1728]
	mov	r2, r5
	str	r7, [fp, #-1776]
	str	r6, [sp, #0]
	ldr	r1, [fp, #-1816]
	mov	r3, r9
	str	r1, [sp, #4]
	ldr	r0, [fp, #-1800]
	mov	r1, r4
	bl	print_shortest_path(PLT)
	ldr	r2, [fp, #-1776]
	cmp	r2, #0
	ble	.L231
	mov	r4, #0
	sub	r3, r2, #1
	mvn	ip, #0
	str	r3, [fp, #-1768]
	mov	r7, r9
	str	ip, [fp, #-1780]
	str	r4, [fp, #-1772]
.L233:
	ldr	lr, [fp, #-1816]
	ldr	r0, [fp, #-1800]
	ldr	r5, [lr, r4, asl #2]
	ldr	r1, [fp, #-1780]
	add	r3, r5, r5, asl #1
	add	r6, r0, r3, asl #4
	ldr	ip, [r6, #4]
	ldr	r2, [fp, #-1768]
	cmp	ip, #1
	cmneq	r1, #1
	moveq	r7, r5
	streq	r7, [fp, #-1780]
	cmp	r4, r2
	beq	.L277
.L236:
	subs	r3, r4, #1
	bmi	.L244
	ldr	r0, [fp, #-1816]
	ldr	r1, [fp, #-1800]
	ldr	r3, [r0, r3, asl #2]
	ldr	r2, [r6, #12]
	add	r3, r3, r3, asl #1
	add	r3, r1, r3, asl #4
	cmp	r2, r3
	beq	.L278
.L244:
	cmp	ip, #2
	beq	.L258
.L276:
	add	r4, r4, #1
.L252:
	ldr	r1, [fp, #-1776]
	cmp	r1, r4
	bgt	.L233
.L231:
	ldr	sp, [fp, #-1804]
	sub	sp, fp, #36
	ldmfd	sp, {r4, r5, r6, r7, r8, r9, fp, sp, pc}
.L278:
	ldr	lr, [fp, #-1812]
	ldr	r3, [lr, #4]
	cmp	r3, #1
	beq	.L244
	rsb	r2, r1, r2
	mov	r2, r2, asr #4
	add	r3, r2, r2, asl #2
	add	r3, r3, r3, asl #4
	sub	r0, fp, #36
	add	r3, r3, r3, asl #8
	sub	lr, fp, #36
	add	r3, r3, r3, asl #16
	add	r1, r0, r5, asl #2
	add	r0, lr, r7, asl #2
	add	r2, r2, r3, asl #1
	ldr	r1, [r1, #-1152]
	ldr	r3, [r0, #-1152]
	cmp	r9, r2
	rsb	r3, r3, r1
	beq	.L279
	cmp	ip, #2
	bne	.L276
	cmp	r7, r9
	beq	.L253
	ldr	lr, [fp, #-1780]
	ldr	r0, [fp, #-1788]
	cmp	r7, lr
	movne	ip, #0
	moveq	ip, #1
	cmp	r0, r3
	movle	ip, #0
	cmp	ip, #0
	beq	.L258
.L253:
	ldr	r2, [fp, #-1788]
	rsb	r3, r2, r1
	cmp	r3, #0
	movle	r0, #0
	ble	.L257
	rsb	r0, r3, r3, asl #5
	add	r0, r3, r0, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #4
	ldr	r1, [fp, #-1792]
	bl	__divsi3(PLT)
.L257:
	ldr	r3, [fp, #-1812]
	str	r0, [r3, #8]
.L258:
	ldr	ip, [fp, #-1776]
	add	r4, r4, #1
	cmp	ip, r4
	ble	.L231
	sub	r0, fp, #36
	sub	lr, fp, #36
	add	r1, r0, r7, asl #2
	add	r2, lr, r5, asl #2
	ldr	r3, [r1, #-1152]
	ldr	r0, [r2, #-1152]
	ldr	r1, [fp, #-1784]
	rsb	r0, r3, r0
	cmp	r1, r0
	cmple	r7, r9
	bne	.L280
.L261:
	ldr	ip, [fp, #-1816]
	ldr	lr, [fp, #-1800]
	ldr	r3, [ip, r4, asl #2]
	ldr	r1, [r6, #8]
	add	r3, r3, r3, asl #1
	ldr	r2, [r6, #24]
	add	r3, lr, r3, asl #4
	ldr	r0, [fp, #-1772]
	subs	r2, r2, r3
	movne	r2, #1
	cmp	r1, #18
	subgt	r1, r1, #134
	cmp	r0, #0
	beq	.L281
	ldr	lr, [fp, #-1772]
	cmp	lr, #1
	beq	.L282
	ldr	r3, [fp, #-1772]
	cmp	r3, #2
	beq	.L283
	ldr	r0, [fp, #-1772]
	cmp	r0, #3
	bne	.L267
	ldr	ip, [fp, #-1812]
	mov	lr, #0
	ldr	r3, [ip, #32]
	str	r1, [ip, #72]
	add	r3, r3, #1
	str	r3, [ip, #32]
	str	r2, [ip, #76]
	str	lr, [ip, #80]
	b	.L267
.L277:
	ldr	r3, [r8, #148]
	cmp	r3, #0
	beq	.L236
	sub	r0, fp, #36
	sub	lr, fp, #36
	add	r1, r0, r7, asl #2
	add	r3, lr, r5, asl #2
	ldr	r2, [r1, #-1152]
	ldr	r0, [r3, #-1152]
	ldr	r1, [r8, #104]
	rsb	r2, r2, r0
	cmp	r7, r9
	str	r1, [fp, #-1820]
	add	r2, r2, r1
	beq	.L239
	ldr	lr, [fp, #-1780]
	ldr	r1, [fp, #-1788]
	cmp	r7, lr
	movne	r3, #0
	moveq	r3, #1
	cmp	r1, r2
	movle	r3, #0
	cmp	r3, #0
	beq	.L236
.L239:
	ldr	r2, [fp, #-1820]
	ldr	lr, [fp, #-1788]
	add	r3, r0, r2
	rsb	r3, lr, r3
	ldr	r1, [fp, #-1812]
	ldr	r2, [fp, #-1796]
	mov	r0, #0
	cmp	r3, #0
	str	r3, [fp, #-1808]
	str	r2, [r1, #0]
	str	r0, [r1, #4]
	ble	.L243
	mov	r0, r8
	bl	get_len_train_ahead(PLT)
	ldr	r3, [fp, #-1808]
	ldr	r1, [fp, #-1792]
	rsb	r0, r0, r3
	rsb	r3, r0, r0, asl #5
	add	r0, r0, r3, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #4
	bl	__divsi3(PLT)
	ldr	ip, [r6, #4]
.L243:
	ldr	lr, [fp, #-1812]
	str	r0, [lr, #8]
	b	.L236
.L280:
	ldr	r2, [fp, #-1780]
	cmp	r7, r2
	movne	r3, #0
	moveq	r3, #1
	cmp	r1, r0
	movle	r3, #0
	cmp	r3, #0
	beq	.L252
	b	.L261
.L281:
	ldr	ip, [fp, #-1812]
	ldr	r3, [ip, #32]
	str	r1, [ip, #36]
	add	r3, r3, #1
	str	r3, [ip, #32]
	str	r2, [ip, #40]
	str	r0, [ip, #44]
.L267:
	ldr	r0, [fp, #-1772]
	add	r0, r0, #1
	str	r0, [fp, #-1772]
	b	.L252
.L279:
	ldr	r0, [fp, #-1812]
	ldr	r1, [fp, #-1796]
	mov	r3, #1
	mov	r2, #0
	stmia	r0, {r1, r3}	@ phole stm
	str	r2, [r0, #8]
	b	.L244
.L282:
	ldr	r0, [fp, #-1812]
	ldr	r3, [r0, #32]
	str	r1, [r0, #48]
	add	r3, r3, #1
	mov	r1, #0
	str	r3, [r0, #32]
	str	r2, [r0, #52]
	str	r1, [r0, #56]
	b	.L267
.L283:
	ldr	ip, [fp, #-1812]
	mov	lr, #0
	ldr	r3, [ip, #32]
	str	r1, [ip, #60]
	add	r3, r3, #1
	str	r3, [ip, #32]
	str	r2, [ip, #64]
	str	lr, [ip, #68]
	b	.L267
	.size	get_next_command, .-get_next_command
	.ident	"GCC: (GNU) 4.0.2"
