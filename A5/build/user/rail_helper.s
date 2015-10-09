	.file	"rail_helper.c"
	.text
	.align	2
	.global	safe_distance_to_branch
	.type	safe_distance_to_branch, %function
safe_distance_to_branch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #156]
	ldr	r3, .L3
	mov	r0, r1, asr #31
	smull	ip, r2, r3, r1
	rsb	r0, r0, r2, asr #6
	add	r0, r0, #150
	@ lr needed for prologue
	bx	lr
.L4:
	.align	2
.L3:
	.word	274877907
	.size	safe_distance_to_branch, .-safe_distance_to_branch
	.align	2
	.global	get_expected_train_idx
	.type	get_expected_train_idx, %function
get_expected_train_idx:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #88]
	@ lr needed for prologue
	cmp	r3, r1
	moveq	r0, #0
	bxeq	lr
	ldr	r3, [r0, #8]
	cmp	r3, #5
	moveq	ip, #0
	mvnne	ip, #0
.L11:
	mov	r2, #0
.L12:
	ldr	r3, [r0, #168]
	add	r2, r2, #1
	cmn	r3, #1
	add	r0, r0, #4
	beq	.L13
	cmp	r1, r3
	beq	.L23
	cmp	r2, #5
	bne	.L12
.L13:
	cmn	ip, #1
	mvn	r0, #0
	movne	r0, ip
	bx	lr
.L23:
	cmn	ip, #1
	mov	r0, #0
	movne	r0, ip
	bx	lr
	.size	get_expected_train_idx, .-get_expected_train_idx
	.global	__divsi3
	.align	2
	.global	get_accel_time
	.type	get_accel_time, %function
get_accel_time:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	add	r3, r0, r0, asl #3
	mov	r4, r2
	add	r2, r1, r1, asl #3
	add	r3, r4, r3, asl #2
	add	r2, r4, r2, asl #2
	cmp	r0, #15
	ldr	lr, [r3, #196]
	ldr	r3, [r2, #196]
	mov	ip, r0
	subgt	ip, r0, #15
	cmp	r1, #15
	rsb	r0, lr, r3
	subgt	r1, r1, #15
	add	r0, r0, r0, asl #2
	rsb	r3, r3, lr
	cmp	ip, r1
	mov	r0, r0, asl #1
	add	r3, r3, r3, asl #2
	bge	.L31
	ldr	r1, [r4, #140]
	bl	__divsi3(PLT)
	cmp	r0, #0
	movlt	r0, #0
	ldmfd	sp!, {r4, pc}
.L31:
	mov	r0, r3, asl #1
	ldr	r1, [r4, #144]
	bl	__divsi3(PLT)
	cmp	r0, #0
	movlt	r0, #0
	ldmfd	sp!, {r4, pc}
	.size	get_accel_time, .-get_accel_time
	.align	2
	.global	time_to_dist_constant_vel
	.type	time_to_dist_constant_vel, %function
time_to_dist_constant_vel:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	rsb	r3, r0, r0, asl #5
	add	r0, r0, r3, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	str	lr, [sp, #-4]!
	mov	r0, r0, asl #5
	bl	__divsi3(PLT)
	ldr	pc, [sp], #4
	.size	time_to_dist_constant_vel, .-time_to_dist_constant_vel
	.align	2
	.global	get_mm_past_last_landmark
	.type	get_mm_past_last_landmark, %function
get_mm_past_last_landmark:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #116]
	mov	r6, r0
	ldr	r4, [r0, #160]
	ldr	r5, [r0, #112]
	add	r3, r3, r3, asl #2
	mov	r8, r1
	ldr	r0, [r0, #148]
	ldr	r1, [r6, #152]
	mov	r2, r6
	mov	r7, r3, asl #1
	bl	get_accel_time(PLT)
	add	r5, r5, r5, asl #2
	mov	r5, r5, asl #1
	add	r4, r4, r4, asl #2
	cmp	r5, r7
	mov	r4, r4, asl #1
	add	r4, r4, r0
	movle	r5, r7
	add	r3, r8, r8, asl #2
	mov	r9, #0
	ldrgt	ip, [r6, #124]
	ldrle	ip, [r6, #120]
	ldrle	r9, [r6, #128]
	mov	r1, r3, asl #1
	cmp	r5, r4
	ldr	r0, [r6, #156]
	rsb	r3, r5, r1
	ble	.L43
	mul	r3, r0, r3
	ldr	r2, .L50
	smull	r0, r1, r2, r3
	mov	r3, r3, asr #31
	rsb	r3, r3, r1, asr #12
	add	r0, r9, r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L43:
	ldr	lr, .L50
	cmp	r4, r1
	rsb	r6, r5, r4
	rsb	r2, r5, r1
	rsb	r3, r4, r1
	rsb	r7, ip, r0
	rsb	r5, ip, r0
	mov	r8, lr
	blt	.L49
	mul	r3, r2, ip
	mul	r2, r5, r2
	smull	ip, r1, lr, r3
	smull	r4, r0, lr, r2
	mov	r3, r3, asr #31
	rsb	r3, r3, r1, asr #12
	mov	r2, r2, asr #31
	add	r3, r9, r3
	rsb	r2, r2, r0, asr #13
	add	r0, r3, r2
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L49:
	mul	r3, r0, r3
	mul	r2, r6, ip
	mul	r1, r7, r6
	smull	r4, r0, lr, r3
	smull	r4, ip, lr, r2
	smull	r4, lr, r1, lr
	mov	r3, r3, asr #31
	rsb	r3, r3, r0, asr #12
	mov	r2, r2, asr #31
	add	r3, r9, r3
	rsb	r2, r2, ip, asr #12
	mov	r1, r1, asr #31
	add	r3, r3, r2
	rsb	r1, r1, lr, asr #13
	add	r0, r3, r1
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L51:
	.align	2
.L50:
	.word	1759218605
	.size	get_mm_past_last_landmark, .-get_mm_past_last_landmark
	.align	2
	.global	get_cur_velocity
	.type	get_cur_velocity, %function
get_cur_velocity:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #160]
	mov	r5, r0
	mov	r4, r1
	add	r3, r3, r3, asl #2
	ldr	r0, [r0, #148]
	ldr	r1, [r5, #152]
	mov	r2, r5
	mov	r6, r3, asl #1
	bl	get_accel_time(PLT)
	add	r4, r4, r4, asl #2
	mov	r4, r4, asl #1
	add	r0, r6, r0
	cmp	r0, r4
	bge	.L53
	ldr	r3, [r5, #148]
	add	r3, r3, r3, asl #3
	add	r3, r5, r3, asl #2
	ldr	r0, [r3, #196]
	ldmfd	sp!, {r4, r5, r6, pc}
.L53:
	ldr	r3, [r5, #148]
	ldr	r1, [r5, #152]
	cmp	r3, #15
	subgt	r3, r3, #15
	cmp	r1, #15
	movle	r2, r1
	subgt	r2, r1, #15
	cmp	r3, r2
	bge	.L61
	ldr	r3, [r5, #140]
	rsb	r2, r6, r4
	rsb	r3, r3, #0
	mul	r4, r3, r2
.L63:
	ldr	r3, .L68
	add	r2, r1, r1, asl #3
	smull	r1, r0, r3, r4
	add	r2, r5, r2, asl #2
	mov	r3, r4, asr #31
	ldr	r1, [r2, #196]
	rsb	r3, r3, r0, asr #2
	add	r0, r3, r1
	cmp	r0, #0
	movlt	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L61:
	ldrgt	r2, [r5, #144]
	rsbgt	r3, r6, r4
	mulgt	r4, r2, r3
	movle	r4, #0
	b	.L63
.L69:
	.align	2
.L68:
	.word	1717986919
	.size	get_cur_velocity, .-get_cur_velocity
	.align	2
	.global	get_cur_stopping_distance
	.type	get_cur_stopping_distance, %function
get_cur_stopping_distance:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r2, .L72
	ldr	r3, [r0, #156]
	ldr	r1, [r0, #140]
	smull	ip, r0, r2, r3
	add	r1, r1, r1, asl #2
	mov	r3, r3, asr #31
	rsb	r3, r3, r0, asr #2
	add	r1, r1, r1, asl #2
	mul	r0, r3, r3
	mov	r1, r1, asl #3
	bl	__divsi3(PLT)
	ldr	pc, [sp], #4
.L73:
	.align	2
.L72:
	.word	1717986919
	.size	get_cur_stopping_distance, .-get_cur_stopping_distance
	.align	2
	.global	safe_distance_to_stop
	.type	safe_distance_to_stop, %function
safe_distance_to_stop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	bl	get_cur_stopping_distance(PLT)
	ldr	r3, [r4, #132]
	add	r0, r0, r3
	add	r0, r0, #150
	ldmfd	sp!, {r4, pc}
	.size	safe_distance_to_stop, .-safe_distance_to_stop
	.align	2
	.global	get_cur_stopping_time
	.type	get_cur_stopping_time, %function
get_cur_stopping_time:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	bl	get_cur_stopping_distance(PLT)
	rsb	r3, r0, r0, asl #5
	add	r0, r0, r3, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	ldr	r1, [r4, #156]
	mov	r0, r0, asl #6
	bl	__divsi3(PLT)
	ldmfd	sp!, {r4, pc}
	.size	get_cur_stopping_time, .-get_cur_stopping_time
	.align	2
	.global	get_len_train_ahead
	.type	get_len_train_ahead, %function
get_len_train_ahead:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #164]
	@ lr needed for prologue
	cmp	r3, #0
	ldrne	r0, [r0, #96]
	ldreq	r0, [r0, #100]
	bx	lr
	.size	get_len_train_ahead, .-get_len_train_ahead
	.align	2
	.global	get_delay_time_to_stop
	.type	get_delay_time_to_stop, %function
get_delay_time_to_stop:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	sub	sp, sp, #4
	mov	r6, r1
	mov	r5, r0
	ldr	r7, [r0, #156]
	bl	get_cur_stopping_distance(PLT)
	mov	r4, r0
	mov	r0, r5
	bl	get_cur_stopping_time(PLT)
	cmp	r4, r6
	mov	fp, r0
	ble	.L84
	ldr	r0, [r5, #148]
	cmp	r0, #0
	bne	.L101
.L84:
	mov	r0, #0
.L89:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L101:
	ldr	r3, [r5, #116]
	ldr	r1, [r5, #152]
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	mov	r2, r5
	ldr	r4, [r5, #160]
	str	r3, [sp, #0]
	bl	get_accel_time(PLT)
	add	r4, r4, r4, asl #2
	mov	r4, r4, asl #1
	add	r9, r4, r0
	ldr	r0, [sp, #0]
	cmp	r0, r9
	bge	.L96
	ldr	r4, [r5, #148]
	ldr	r8, [r5, #152]
	add	r3, r4, r4, asl #3
	add	r3, r5, r3, asl #2
	ldr	r0, [r3, #204]
	ldr	r5, [r3, #196]
	rsb	r2, r0, r0, asl #5
	add	r0, r0, r2, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	mov	r1, r5
	mov	r0, r0, asl #6
	bl	__divsi3(PLT)
	cmp	r4, #15
	subgt	r4, r4, #15
	cmp	r8, #15
	ldr	r3, [sp, #0]
	subgt	r8, r8, #15
	cmp	r4, r8
	mov	r1, r0
	rsb	ip, r3, r9
	bge	.L94
	rsb	r2, r5, r7
	mul	r3, r2, ip
	mul	r0, ip, r5
	add	r3, r3, r3, lsr #31
	ldr	r2, .L103
	add	r0, r0, r3, asr #1
	smull	ip, r3, r2, r0
	mov	r0, r0, asr #31
	rsb	r0, r0, r3, asr #13
	rsb	r0, r0, r6
	mul	r2, r1, r5
	rsb	r3, r0, r0, asl #5
	add	r0, r0, r3, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	rsb	r0, r2, r0, asl #6
	mov	r1, r5, asl #1
	bl	__divsi3(PLT)
	b	.L89
.L94:
	bgt	.L102
.L96:
	mul	r3, fp, r7
	rsb	r0, r6, r6, asl #5
	add	r0, r6, r0, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	rsb	r0, r3, r0, asl #6
	mov	r1, r7, asl #1
	bl	__divsi3(PLT)
	b	.L89
.L102:
	rsb	r3, r7, r5
	mul	r2, r3, ip
	add	r2, r2, r2, lsr #31
	mul	lr, r0, r5
	mov	r2, r2, asr #1
	mla	r3, ip, r7, r2
	add	r1, lr, lr, lsr #31
	ldr	r2, .L103
	add	r3, r3, r1, asr #1
	smull	r0, r1, r2, r3
	mov	r3, r3, asr #31
	rsb	r3, r3, r1, asr #13
	cmp	r6, r3
	ble	.L98
	mul	r3, fp, r7
	rsb	r0, r6, r6, asl #5
	add	r0, r6, r0, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	rsb	r0, r3, r0, asl #6
	mov	r1, r7
	bl	__divsi3(PLT)
	b	.L89
.L98:
	add	r3, r7, r5
	rsb	r0, r6, r6, asl #5
	add	r0, r6, r0, asl #2
	mul	r2, r3, ip
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	add	r0, lr, r0, asl #6
	rsb	r0, r2, r0
	mov	r1, r5, asl #1
	bl	__divsi3(PLT)
	b	.L89
.L104:
	.align	2
.L103:
	.word	351843721
	.size	get_delay_time_to_stop, .-get_delay_time_to_stop
	.align	2
	.global	init_58
	.type	init_58, %function
init_58:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #210
	str	r3, [r0, #132]
	sub	r3, r3, #185
	str	r3, [r0, #96]
	add	r3, r3, #33
	str	r3, [r0, #80]
	sub	r3, r3, #57
	mov	r2, #50
	str	r3, [r0, #164]
	add	r3, r3, #118
	str	r2, [r0, #136]
	str	r3, [r0, #140]
	add	r2, r2, #95
	ldr	r3, .L107
	str	r2, [r0, #100]
	sub	r2, r2, #139
	str	r2, [r0, #8]
	str	r3, [r0, #700]
	add	r2, r2, #84
	ldr	r3, .L107+4
	str	r2, [r0, #144]
	ldr	r2, .L107+8
	str	r3, [r0, #664]
	ldr	r3, .L107+12
	str	r2, [r0, #704]
	ldr	r2, .L107+16
	str	r3, [r0, #672]
	ldr	r3, .L107+20
	str	r2, [r0, #668]
	ldr	r2, .L107+24
	str	r3, [r0, #632]
	ldr	r3, .L107+28
	str	r2, [r0, #628]
	ldr	r2, .L107+32
	str	r3, [r0, #592]
	ldr	r3, .L107+36
	str	r2, [r0, #636]
	ldr	r2, .L107+40
	str	r3, [r0, #600]
	ldr	r3, .L107+44
	str	r2, [r0, #596]
	ldr	r2, .L107+48
	str	lr, [sp, #-4]!
	str	r3, [r0, #560]
	ldr	lr, .L107+52
	ldr	r3, .L107+56
	mov	r1, #0
	mvn	ip, #0
	str	r2, [r0, #556]
	mov	r2, #460
	str	r2, [r0, #564]
	str	ip, [r0, #108]
	str	r1, [r0, #160]
	str	ip, [r0, #84]
	str	ip, [r0, #88]
	str	ip, [r0, #92]
	str	r1, [r0, #112]
	str	r1, [r0, #128]
	str	r1, [r0, #148]
	str	r1, [r0, #152]
	str	lr, [r0, #708]
	str	r3, [r0, #520]
	sub	r3, r3, #144
	str	r3, [r0, #524]
	ldr	r3, .L107+60
	sub	r2, r2, #124
	str	r3, [r0, #484]
	mov	r3, #231
	str	r2, [r0, #528]
	str	r3, [r0, #492]
	ldr	r2, .L107+64
	ldr	r3, .L107+68
	str	r2, [r0, #488]
	str	r3, [r0, #1028]
	ldr	r2, .L107+72
	ldr	r3, .L107+76
	str	r2, [r0, #1024]
	str	r3, [r0, #1060]
	mov	r2, #176
	ldr	r3, .L107+80
	str	r2, [r0, #1032]
	ldr	r2, .L107+84
	str	r3, [r0, #1068]
	ldr	r3, .L107+88
	str	r2, [r0, #1064]
	ldr	r2, .L107+92
	str	r3, [r0, #1100]
	ldr	r3, .L107+96
	str	r2, [r0, #1096]
	mov	r2, #412
	str	r2, [r0, #1104]
	str	r3, [r0, #1132]
	ldr	r2, .L107+100
	mov	r3, #580
	str	r3, [r0, #1140]
	ldr	r3, .L107+104
	str	r2, [r0, #1136]
	ldr	r2, .L107+108
	str	r3, [r0, #1172]
	ldr	r3, .L107+112
	str	r2, [r0, #1168]
	mov	r2, #664
	str	r2, [r0, #1176]
	str	r3, [r0, #1204]
	ldr	r2, .L107+116
	mov	r3, #916
	str	r3, [r0, #1212]
	ldr	r3, .L107+120
	str	r2, [r0, #1208]
	add	r2, r2, #2288
	str	lr, [r0, #1248]
	str	r2, [r0, #1240]
	str	r3, [r0, #1244]
	ldr	pc, [sp], #4
.L108:
	.align	2
.L107:
	.word	50579
	.word	50092
	.word	50586
	.word	975
	.word	50083
	.word	48517
	.word	48798
	.word	41440
	.word	802
	.word	678
	.word	41749
	.word	34627
	.word	33814
	.word	2158
	.word	28004
	.word	22133
	.word	22370
	.word	19127
	.word	18907
	.word	24765
	.word	285
	.word	24770
	.word	31030
	.word	31219
	.word	37021
	.word	37043
	.word	44540
	.word	45551
	.word	49030
	.word	49056
	.word	51635
	.size	init_58, .-init_58
	.align	2
	.global	init_trains
	.type	init_trains, %function
init_trains:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mvn	r3, #0
	str	lr, [sp, #-4]!
	str	r2, [r0, #4]
	str	r3, [r0, #92]
	str	r3, [r0, #84]
	str	r3, [r0, #88]
	mov	lr, ip
	str	r1, [r0, #0]
	str	ip, [r0, #128]
	str	ip, [r0, #148]
	mov	r3, r0
	mov	r2, ip
.L110:
	add	lr, lr, #1
	cmp	lr, #30
	str	r2, [r3, #188]
	str	r2, [r3, #192]
	str	r2, [r3, #196]
	str	r2, [r3, #200]
	str	r2, [r3, #204]
	str	r2, [r3, #208]
	str	r2, [r3, #216]
	str	r2, [r3, #220]
	add	r3, r3, #36
	bne	.L110
	ldr	lr, [sp], #4
	b	init_58(PLT)
	.size	init_trains, .-init_trains
	.align	2
	.global	init_switches
	.type	init_switches, %function
init_switches:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	mov	r2, #0
	@ lr needed for prologue
	str	r2, [r0, #88]
	str	r3, [r0, #84]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	str	r3, [r0, #40]
	str	r3, [r0, #44]
	str	r3, [r0, #48]
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	str	r3, [r0, #60]
	str	r3, [r0, #64]
	str	r3, [r0, #68]
	str	r3, [r0, #72]
	str	r2, [r0, #76]
	str	r3, [r0, #80]
	bx	lr
	.size	init_switches, .-init_switches
	.align	2
	.global	update_velocity
	.type	update_velocity, %function
update_velocity:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r6, r2
	ldr	r4, [r0, #160]
	mov	r2, r0
	mov	r7, r0
	mov	r8, r1
	ldr	r1, [r0, #152]
	ldr	r0, [r0, #148]
	mov	r5, r3
	bl	get_accel_time(PLT)
	add	r4, r4, r4, asl #2
	mov	r4, r4, asl #1
	cmp	r5, #0
	add	r3, r6, r6, asl #2
	add	r4, r4, r0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
	cmp	r4, r3, asl #1
	ldmgefd	sp!, {r4, r5, r6, r7, r8, pc}
	rsb	r0, r5, r5, asl #5
	ldr	r3, [r7, #84]
	add	r0, r5, r0, asl #2
	add	r0, r0, r0, asl #2
	cmp	r3, #41
	rsb	r1, r6, r8
	mov	r0, r0, asl #4
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
	bl	__divsi3(PLT)
	ldr	r6, [r7, #148]
	add	r0, r0, r0, asl #2
	add	r6, r6, r6, asl #3
	add	r6, r7, r6, asl #2
	ldr	r4, [r6, #196]
	ldr	r3, .L123
	add	r4, r4, r4, asl #2
	mov	r4, r4, asl #4
	add	r4, r4, r0, asl #2
	smull	r1, r2, r3, r4
	mov	r4, r4, asr #31
	rsb	r4, r4, r2, asr #5
	str	r4, [r6, #196]
	ldr	r5, [r7, #148]
	mov	r0, r7
	add	r5, r5, r5, asl #3
	add	r5, r7, r5, asl #2
	ldr	r3, [r5, #196]
	str	r3, [r7, #156]
	bl	get_cur_stopping_distance(PLT)
	str	r0, [r5, #204]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L124:
	.align	2
.L123:
	.word	1374389535
	.size	update_velocity, .-update_velocity
	.align	2
	.global	time_to_node
	.type	time_to_node, %function
time_to_node:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r0
	mov	r5, r1
	bl	Time(PLT)
	mov	r2, r6
	add	r3, r0, r0, asl #2
	ldr	r1, [r6, #152]
	ldr	r0, [r6, #148]
	mov	r8, r3, asl #1
	ldr	r4, [r6, #160]
	bl	get_accel_time(PLT)
	add	r4, r4, r4, asl #2
	mov	r4, r4, asl #1
	add	r9, r4, r0
	mov	r1, r8
	mov	r0, r6
	bl	get_mm_past_last_landmark(PLT)
	rsb	r7, r0, r5
	rsb	r0, r7, r7, asl #5
	add	r0, r7, r0, asl #2
	add	r0, r0, r0, asl #2
	add	r3, r9, r9, asl #2
	add	r0, r0, r0, asl #2
	cmp	r8, r9
	add	ip, r3, r3, asl #2
	mov	r1, r8
	mov	r0, r0, asl #5
	ble	.L126
	ldr	r3, [r6, #148]
	add	r3, r3, r3, asl #3
	add	r3, r6, r3, asl #2
	ldr	r1, [r3, #196]
	bl	__divsi3(PLT)
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L126:
	ldr	r3, [r6, #148]
	ldr	r2, [r6, #152]
	add	r3, r3, r3, asl #3
	add	r2, r2, r2, asl #3
	add	r2, r6, r2, asl #2
	add	r3, r6, r3, asl #2
	mov	r0, ip, asl #2
	ldr	r6, [r3, #196]
	ldr	r4, [r2, #196]
	bl	__divsi3(PLT)
	add	r4, r6, r4
	add	r4, r4, r4, asl #2
	add	r4, r4, r4, asl #2
	mov	r4, r4, asl #2
	mov	r1, r0
	mov	r0, r4
	bl	__divsi3(PLT)
	mov	r4, r0
	rsb	ip, r8, r9
	rsb	r3, r4, r6
	mul	r2, r3, ip
	mul	r5, ip, r4
	ldr	r3, .L133
	add	r1, r6, r4
	smull	r8, lr, r3, r5
	smull	r8, r4, r3, r2
	mov	ip, r5, asr #31
	mov	r2, r2, asr #31
	rsb	r2, r2, r4, asr #13
	rsb	ip, ip, lr, asr #12
	add	ip, ip, r2
	rsb	r3, ip, r7
	rsb	r0, r7, r7, asl #5
	add	r0, r7, r0, asl #2
	rsb	r2, r3, r3, asl #5
	add	r0, r0, r0, asl #2
	add	r3, r3, r2, asl #2
	add	r0, r0, r0, asl #2
	add	r3, r3, r3, asl #2
	cmp	r7, ip
	mov	r0, r0, asl #6
	add	r3, r3, r3, asl #2
	blt	.L132
	mov	r0, r3, asl #5
	mov	r1, r6
	bl	__divsi3(PLT)
	add	r0, r9, r0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L132:
	bl	__divsi3(PLT)
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L134:
	.align	2
.L133:
	.word	1759218605
	.size	time_to_node, .-time_to_node
	.ident	"GCC: (GNU) 4.0.2"
