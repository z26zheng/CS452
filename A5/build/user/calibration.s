	.file	"calibration.c"
	.global	__divsi3
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"trains[%d].speeds[%d].straight_vel = %d;\015\012\000"
	.align	2
.LC1:
	.ascii	"trains[%d].speeds[%d].curved_vel = %d;\015\012\000"
	.text
	.align	2
	.global	calibrate_train_velocity
	.type	calibrate_train_velocity, %function
calibrate_train_velocity:
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L157
	sub	sp, sp, #148
	add	r2, sp, #148
	mvn	r3, #122
	strb	r3, [r2, #-1]!
.L149:
	add	sl, pc, sl
	mov	r0, #58
	mov	r1, #30
	str	r2, [sp, #12]
	bl	set_train_speed_old(PLT)
	ldr	r3, .L157+4
	ldr	ip, .L157+8
	mov	r2, #14
	str	r3, [sp, #8]
	str	ip, [sp, #4]
	mov	r7, #0
	str	r2, [sp, #136]
.L2:
	mov	r1, #33
	mov	r0, #17
	bl	set_switch_old(PLT)
	mov	r1, #33
	mov	r0, #13
	bl	set_switch_old(PLT)
	ldr	r1, [sp, #136]
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	ldr	r0, .L157+12
	bl	Delay(PLT)
	mov	r0, #0
	ldr	r1, [sp, #12]
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r4, #0
.L3:
	add	r4, r4, #1
	mov	r0, #0
	bl	Getc(PLT)
	cmp	r4, #10
	bne	.L3
	mov	r3, #0
	str	r3, [sp, #24]
	str	r3, [sp, #28]
	str	r3, [sp, #44]
	str	r3, [sp, #20]
	str	r3, [sp, #32]
	str	r3, [sp, #36]
	str	r3, [sp, #40]
	str	r3, [sp, #48]
	str	r3, [sp, #52]
	str	r3, [sp, #56]
	str	r3, [sp, #60]
	str	r3, [sp, #64]
	str	r3, [sp, #68]
	str	r3, [sp, #72]
	str	r3, [sp, #76]
.L5:
	mov	r0, #0
	ldr	r1, [sp, #12]
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r9, #0
	mov	fp, r9
.L6:
	mov	r0, #0
	bl	Getc(PLT)
	ands	r8, r0, #255
	beq	.L7
	mov	r2, r9, lsr #31
	add	r3, r9, r2
	and	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movne	r5, #1
	moveq	r5, #9
	mov	r6, #7
.L12:
	mov	r3, r8, asr r6
	tst	r3, #1
	beq	.L13
	add	r4, fp, r5
	cmp	r4, r7
	beq	.L13
	ldr	r3, .L157+16
	cmp	r4, r3
	beq	.L24
	bgt	.L31
	cmp	r4, #205
	beq	.L21
	bgt	.L32
	cmp	r4, #3
	beq	.L19
	cmp	r4, #202
	beq	.L155
.L151:
	mov	r7, r4
.L13:
	subs	r6, r6, #1
	add	r5, r5, #1
	bcs	.L12
.L7:
	add	r9, r9, #1
	cmp	r9, #10
	add	fp, fp, #100
	bne	.L6
	ldr	ip, [sp, #20]
	cmp	ip, #9
	ble	.L5
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #24]
	bl	__divsi3(PLT)
	ldr	ip, [sp, #8]
	ldr	r3, [sp, #136]
	add	r1, sl, ip
	mov	r2, #58
	str	r0, [sp, #0]
	mov	r0, #1
	bl	Printf(PLT)
	ldr	r1, [sp, #44]
	ldr	r0, [sp, #40]
	bl	__divsi3(PLT)
	ldr	r3, [sp, #136]
	ldr	ip, [sp, #4]
	sub	r2, r3, #1
	str	r0, [sp, #0]
	str	r2, [sp, #136]
	mov	r0, #1
	mov	r2, #58
	add	r1, sl, ip
	bl	Printf(PLT)
	ldr	r2, [sp, #136]
	cmp	r2, #7
	bne	.L2
	mov	r0, #58
	mov	r1, #0
	bl	set_train_speed_old(PLT)
	mov	r3, #8
	str	r3, [sp, #16]
.L66:
	mov	r1, #33
	mov	r0, #17
	bl	set_switch_old(PLT)
	mov	r1, #33
	mov	r0, #13
	bl	set_switch_old(PLT)
	ldr	r1, [sp, #16]
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	ldr	r0, .L157+12
	bl	Delay(PLT)
	mov	r0, #0
	ldr	r1, [sp, #12]
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r4, #0
.L67:
	add	r4, r4, #1
	mov	r0, #0
	bl	Getc(PLT)
	cmp	r4, #10
	bne	.L67
	mov	ip, #0
	str	ip, [sp, #80]
	str	ip, [sp, #84]
	str	ip, [sp, #100]
	str	ip, [sp, #140]
	str	ip, [sp, #88]
	str	ip, [sp, #92]
	str	ip, [sp, #96]
	str	ip, [sp, #104]
	str	ip, [sp, #108]
	str	ip, [sp, #112]
	str	ip, [sp, #116]
	str	ip, [sp, #120]
	str	ip, [sp, #124]
	str	ip, [sp, #128]
	str	ip, [sp, #132]
.L69:
	mov	r0, #0
	ldr	r1, [sp, #12]
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r9, #0
	mov	fp, r9
.L70:
	mov	r0, #0
	bl	Getc(PLT)
	ands	r8, r0, #255
	beq	.L71
	mov	r2, r9, lsr #31
	add	r3, r9, r2
	and	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movne	r5, #1
	moveq	r5, #9
	mov	r6, #7
.L76:
	mov	r3, r8, asr r6
	tst	r3, #1
	beq	.L77
	add	r4, fp, r5
	cmp	r4, r7
	beq	.L77
	ldr	r3, .L157+16
	cmp	r4, r3
	beq	.L88
	bgt	.L95
	cmp	r4, #205
	beq	.L85
	bgt	.L96
	cmp	r4, #3
	beq	.L83
	cmp	r4, #202
	beq	.L156
.L153:
	mov	r7, r4
.L77:
	subs	r6, r6, #1
	add	r5, r5, #1
	bcs	.L76
.L71:
	add	r9, r9, #1
	cmp	r9, #10
	add	fp, fp, #100
	bne	.L70
	ldr	ip, [sp, #140]
	cmp	ip, #9
	ble	.L69
	ldr	r1, [sp, #84]
	ldr	r0, [sp, #80]
	bl	__divsi3(PLT)
	ldr	r2, [sp, #16]
	ldr	ip, [sp, #8]
	add	r4, r2, #15
	add	r1, sl, ip
	mov	r2, #58
	mov	r3, r4
	str	r0, [sp, #0]
	mov	r0, #1
	bl	Printf(PLT)
	ldr	r1, [sp, #100]
	ldr	r0, [sp, #96]
	bl	__divsi3(PLT)
	ldr	r2, [sp, #16]
	ldr	ip, [sp, #4]
	add	r2, r2, #1
	str	r0, [sp, #0]
	str	r2, [sp, #16]
	mov	r3, r4
	mov	r2, #58
	mov	r0, #1
	add	r1, sl, ip
	bl	Printf(PLT)
	ldr	r2, [sp, #16]
	cmp	r2, #15
	bne	.L66
	mov	r1, #0
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	bl	Exit(PLT)
	add	sp, sp, #148
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L155:
	bl	Time(PLT)
	ldr	r2, [sp, #60]
	cmp	r2, #0
	moveq	r7, #202
	beq	.L13
	ldr	r3, [sp, #60]
	mov	r7, #202
	rsb	r1, r3, r0
	ldr	r0, .L157+20
	bl	__divsi3(PLT)
	ldr	ip, [sp, #32]
	ldr	r2, [sp, #24]
	cmp	ip, #0
	moveq	ip, r0
	add	r3, ip, r0
	add	r3, r3, r3, lsr #31
	ldr	ip, [sp, #28]
	mov	r3, r3, asr #1
	add	ip, ip, #1
	add	r2, r2, r0
	str	r3, [sp, #32]
	mov	r3, #0
	str	ip, [sp, #28]
	str	r2, [sp, #24]
	str	r3, [sp, #60]
	b	.L13
.L156:
	bl	Time(PLT)
	ldr	r3, [sp, #116]
	cmp	r3, #0
	moveq	r7, #202
	beq	.L77
	ldr	ip, [sp, #116]
	mov	r7, #202
	rsb	r1, ip, r0
	ldr	r0, .L157+20
	bl	__divsi3(PLT)
	ldr	r2, [sp, #88]
	ldr	ip, [sp, #84]
	cmp	r2, #0
	moveq	r2, r0
	add	r3, r2, r0
	add	r3, r3, r3, lsr #31
	ldr	r2, [sp, #80]
	mov	r3, r3, asr #1
	add	ip, ip, #1
	add	r2, r2, r0
	str	r3, [sp, #88]
	mov	r3, #0
	str	ip, [sp, #84]
	str	r2, [sp, #80]
	str	r3, [sp, #116]
	b	.L77
.L95:
	ldr	r3, .L157+24
	cmp	r4, r3
	beq	.L91
	bgt	.L97
	sub	r3, r3, #110
	cmp	r4, r3
	beq	.L89
	add	r3, r3, #2
	cmp	r4, r3
	bne	.L153
	bl	Time(PLT)
	ldr	r2, [sp, #128]
	cmp	r2, #0
	beq	.L153
	ldr	r3, [sp, #128]
	mov	r7, r4
	rsb	r1, r3, r0
	ldr	r0, .L157+28
	bl	__divsi3(PLT)
	ldr	ip, [sp, #92]
	ldr	r2, [sp, #96]
	cmp	ip, #0
	moveq	ip, r0
	add	r3, ip, r0
	add	r3, r3, r3, lsr #31
	ldr	ip, [sp, #100]
	mov	r3, r3, asr #1
	add	ip, ip, #1
	add	r2, r2, r0
	str	r3, [sp, #92]
	mov	r3, #0
	str	ip, [sp, #100]
	str	r2, [sp, #96]
	str	r3, [sp, #128]
	b	.L77
.L31:
	ldr	r3, .L157+24
	cmp	r4, r3
	beq	.L27
	bgt	.L33
	sub	r3, r3, #110
	cmp	r4, r3
	beq	.L25
	add	r3, r3, #2
	cmp	r4, r3
	bne	.L151
	bl	Time(PLT)
	ldr	r2, [sp, #72]
	cmp	r2, #0
	beq	.L151
	ldr	r3, [sp, #72]
	mov	r7, r4
	rsb	r1, r3, r0
	ldr	r0, .L157+28
	bl	__divsi3(PLT)
	ldr	ip, [sp, #36]
	ldr	r2, [sp, #40]
	cmp	ip, #0
	moveq	ip, r0
	add	r3, ip, r0
	add	r3, r3, r3, lsr #31
	ldr	ip, [sp, #44]
	mov	r3, r3, asr #1
	add	ip, ip, #1
	add	r2, r2, r0
	str	r3, [sp, #36]
	mov	r3, #0
	str	ip, [sp, #44]
	str	r2, [sp, #40]
	str	r3, [sp, #72]
	b	.L13
.L24:
	bl	Time(PLT)
	ldr	r3, [sp, #68]
	cmp	r3, #0
	movne	ip, #0
	movne	r7, r4
	strne	ip, [sp, #68]
	bne	.L13
	b	.L151
.L88:
	bl	Time(PLT)
	ldr	r3, [sp, #124]
	cmp	r3, #0
	movne	ip, #0
	movne	r7, r4
	strne	ip, [sp, #124]
	bne	.L77
	b	.L153
.L33:
	ldr	r3, .L157+32
	cmp	r4, r3
	beq	.L29
	add	r3, r3, #3
	cmp	r4, r3
	beq	.L30
	sub	r3, r3, #108
	cmp	r4, r3
	bne	.L151
	bl	Time(PLT)
	ldr	ip, [sp, #48]
	str	r0, [sp, #72]
	cmp	ip, #0
	movne	r2, #0
	movne	r7, r4
	strne	r2, [sp, #48]
	bne	.L13
	b	.L151
.L32:
	ldr	r3, .L157+36
	cmp	r4, r3
	beq	.L22
	add	r3, r3, #194
	cmp	r4, r3
	bne	.L151
	bl	Time(PLT)
	mov	r7, r4
	str	r0, [sp, #64]
	b	.L13
.L96:
	ldr	r3, .L157+36
	cmp	r4, r3
	beq	.L86
	add	r3, r3, #194
	cmp	r4, r3
	bne	.L153
	bl	Time(PLT)
	mov	r7, r4
	str	r0, [sp, #120]
	b	.L77
.L97:
	ldr	r3, .L157+32
	cmp	r4, r3
	beq	.L93
	add	r3, r3, #3
	cmp	r4, r3
	beq	.L94
	sub	r3, r3, #108
	cmp	r4, r3
	bne	.L153
	bl	Time(PLT)
	ldr	r2, [sp, #104]
	str	r0, [sp, #128]
	cmp	r2, #0
	movne	r3, #0
	movne	r7, r4
	strne	r3, [sp, #104]
	bne	.L77
	b	.L153
.L21:
	bl	Time(PLT)
	mov	r7, r4
	str	r0, [sp, #56]
	b	.L13
.L91:
	bl	Time(PLT)
	ldr	ip, [sp, #108]
	str	r0, [sp, #116]
	cmp	ip, #0
	movne	r2, #0
	movne	r7, r4
	strne	r2, [sp, #108]
	bne	.L77
	b	.L153
.L85:
	bl	Time(PLT)
	mov	r7, r4
	str	r0, [sp, #112]
	b	.L77
.L27:
	bl	Time(PLT)
	ldr	r3, [sp, #52]
	str	r0, [sp, #60]
	cmp	r3, #0
	movne	ip, #0
	movne	r7, r4
	strne	ip, [sp, #52]
	bne	.L13
	b	.L151
.L86:
	bl	Time(PLT)
	ldr	ip, [sp, #120]
	cmp	ip, #0
	movne	r2, #0
	movne	r7, r4
	strne	r2, [sp, #120]
	bne	.L77
	b	.L153
.L89:
	bl	Time(PLT)
	ldr	r3, [sp, #140]
	ldr	r2, [sp, #112]
	add	r3, r3, #1
	cmp	r2, #0
	str	r0, [sp, #104]
	str	r3, [sp, #140]
	beq	.L98
	rsb	r1, r2, r0
	ldr	r0, .L157+20
	bl	__divsi3(PLT)
	ldr	ip, [sp, #88]
	mov	r3, #0
	cmp	ip, #0
	moveq	ip, r0
	add	r0, ip, r0
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	str	r0, [sp, #88]
	str	r3, [sp, #112]
.L98:
	ldr	ip, [sp, #140]
	cmp	ip, #2
	ble	.L102
	ldr	r2, [sp, #88]
	cmp	r2, #0
	ble	.L104
	ldr	r3, [sp, #80]
	ldr	ip, [sp, #84]
	add	r3, r3, r2
	add	ip, ip, #1
	str	r3, [sp, #80]
	str	ip, [sp, #84]
.L104:
	ldr	r2, [sp, #92]
	cmp	r2, #0
	ble	.L102
	ldr	r3, [sp, #96]
	ldr	ip, [sp, #100]
	add	r3, r3, r2
	add	ip, ip, #1
	str	r3, [sp, #96]
	str	ip, [sp, #100]
	b	.L153
.L19:
	bl	Time(PLT)
	mov	r7, r4
	str	r0, [sp, #68]
	b	.L13
.L22:
	bl	Time(PLT)
	ldr	ip, [sp, #64]
	cmp	ip, #0
	movne	r2, #0
	movne	r7, r4
	strne	r2, [sp, #64]
	bne	.L13
	b	.L151
.L83:
	bl	Time(PLT)
	mov	r7, r4
	str	r0, [sp, #124]
	b	.L77
.L93:
	bl	Time(PLT)
	str	r0, [sp, #132]
	b	.L153
.L29:
	bl	Time(PLT)
	str	r0, [sp, #76]
	b	.L151
.L25:
	bl	Time(PLT)
	ldr	r2, [sp, #20]
	ldr	ip, [sp, #56]
	add	r2, r2, #1
	cmp	ip, #0
	str	r0, [sp, #48]
	str	r2, [sp, #20]
	beq	.L34
	rsb	r1, ip, r0
	ldr	r0, .L157+20
	bl	__divsi3(PLT)
	ldr	r3, [sp, #32]
	mov	r2, #0
	cmp	r3, #0
	moveq	r3, r0
	add	r0, r3, r0
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	str	r0, [sp, #32]
	str	r2, [sp, #56]
.L34:
	ldr	r3, [sp, #20]
	cmp	r3, #2
	ble	.L38
	ldr	ip, [sp, #32]
	cmp	ip, #0
	ble	.L40
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #28]
	add	r2, r2, ip
	add	r3, r3, #1
	str	r2, [sp, #24]
	str	r3, [sp, #28]
.L40:
	ldr	ip, [sp, #36]
	cmp	ip, #0
	ble	.L38
	ldr	r2, [sp, #40]
	ldr	r3, [sp, #44]
	add	r2, r2, ip
	add	r3, r3, #1
	str	r2, [sp, #40]
	str	r3, [sp, #44]
	b	.L151
.L94:
	bl	Time(PLT)
	ldr	ip, [sp, #132]
	str	r0, [sp, #108]
	cmp	ip, #0
	beq	.L153
	ldr	r3, [sp, #132]
	ldr	r2, [sp, #108]
	ldr	r0, .L157+28
	rsb	r1, r3, r2
	bl	__divsi3(PLT)
	ldr	ip, [sp, #92]
	ldr	r2, [sp, #96]
	cmp	ip, #0
	moveq	ip, r0
	add	r3, ip, r0
	add	r3, r3, r3, lsr #31
	ldr	ip, [sp, #100]
	mov	r3, r3, asr #1
	add	ip, ip, #1
	add	r2, r2, r0
	str	r3, [sp, #92]
	mov	r7, r4
	mov	r3, #0
	str	ip, [sp, #100]
	str	r2, [sp, #96]
	str	r3, [sp, #132]
	b	.L77
.L30:
	bl	Time(PLT)
	ldr	r3, [sp, #76]
	str	r0, [sp, #52]
	cmp	r3, #0
	beq	.L151
	ldr	r2, [sp, #76]
	ldr	ip, [sp, #52]
	ldr	r0, .L157+28
	rsb	r1, r2, ip
	bl	__divsi3(PLT)
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #44]
	cmp	r3, #0
	moveq	r3, r0
	ldr	ip, [sp, #40]
	add	r3, r3, r0
	add	r2, r2, #1
	add	r3, r3, r3, lsr #31
	str	r2, [sp, #44]
	add	ip, ip, r0
	mov	r3, r3, asr #1
	mov	r2, #0
	mov	r7, r4
	str	ip, [sp, #40]
	str	r3, [sp, #36]
	str	r2, [sp, #76]
	b	.L13
.L38:
	ldr	r7, .L157+40
	b	.L13
.L102:
	ldr	r7, .L157+40
	b	.L77
.L158:
	.align	2
.L157:
	.word	_GLOBAL_OFFSET_TABLE_-(.L149+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	1500
	.word	511
	.word	4040000
	.word	713
	.word	2820000
	.word	910
	.word	315
	.word	603
	.size	calibrate_train_velocity, .-calibrate_train_velocity
	.align	2
	.global	calibrate_stopping_distance
	.type	calibrate_stopping_distance, %function
calibrate_stopping_distance:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	sub	sp, sp, #4
	mvn	r3, #122
	add	fp, sp, #4
	strb	r3, [fp, #-1]!
	mov	r1, #33
	mov	r0, #17
	bl	set_switch_old(PLT)
	mov	r1, #33
	mov	r0, #13
	bl	set_switch_old(PLT)
	mov	r0, #0
	mov	r1, fp
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r4, #0
.L160:
	add	r4, r4, #1
	mov	r0, #0
	bl	Getc(PLT)
	cmp	r4, #10
	bne	.L160
	mov	r0, #500
	bl	Delay(PLT)
	mov	r9, #0
.L162:
	mov	r0, #0
	mov	r1, fp
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r8, #0
	mov	r7, r8
.L163:
	mov	r0, #0
	bl	Getc(PLT)
	ands	r6, r0, #255
	beq	.L164
	mov	r2, r8, lsr #31
	add	r3, r8, r2
	and	r3, r3, #1
	rsb	r3, r2, r3
	cmp	r3, #1
	movne	r4, #1
	moveq	r4, #9
	mov	r5, #7
.L169:
	mov	r3, r6, asr r5
	tst	r3, #1
	add	r2, r4, r7
	beq	.L170
	cmp	r9, r2
	beq	.L170
	cmp	r2, #205
	mov	r9, r2
	mov	r0, #58
	mov	r1, #0
	beq	.L183
.L170:
	subs	r5, r5, #1
	add	r4, r4, #1
	bcs	.L169
.L164:
	add	r8, r8, #1
	cmp	r8, #10
	add	r7, r7, #100
	bne	.L163
	b	.L162
.L183:
	mov	r9, r2
	bl	set_train_speed_old(PLT)
	b	.L170
	.size	calibrate_stopping_distance, .-calibrate_stopping_distance
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"%d\015\012\000"
	.align	2
.LC3:
	.ascii	"Train: %d, speed: %d to %d, t1: %d\015\012\000"
	.text
	.align	2
	.global	calibrate_accel_time
	.type	calibrate_accel_time, %function
calibrate_accel_time:
	@ args = 0, pretend = 0, frame = 1336
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L224
	sub	sp, sp, #1344
	mov	r1, #0
	add	r0, sp, #80
.L222:
	add	sl, pc, sl
	mov	r2, r1
	mvn	r3, #122
	sub	r0, r0, #8
	strb	r3, [sp, #1343]
	str	r0, [sp, #12]
	bl	init_trains(PLT)
	mov	r1, #33
	mov	r0, #17
	bl	set_switch_old(PLT)
	add	r1, sp, #1328
	add	r1, r1, #15
	str	r1, [sp, #16]
	mov	r0, #13
	mov	r1, #33
	bl	set_switch_old(PLT)
	mov	r0, #0
	ldr	r1, [sp, #16]
	mov	r2, #1
	bl	Putstr(PLT)
	mov	r4, #0
.L185:
	add	r4, r4, #1
	mov	r0, #0
	bl	Getc(PLT)
	cmp	r4, #10
	bne	.L185
	mov	r1, #14
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	mov	r0, #500
	bl	Delay(PLT)
	ldr	r3, [sp, #12]
	sub	r4, r4, #10
	mov	r2, #14
	str	r2, [sp, #36]
	str	r4, [sp, #48]
	str	r3, [sp, #64]
.L187:
	ldr	ip, [sp, #36]
	sub	ip, ip, #1
	cmp	ip, #7
	str	ip, [sp, #68]
	beq	.L188
	add	r3, ip, ip, asl #3
	mov	r3, r3, asl #2
	ldr	r0, [sp, #12]
	add	r3, r3, #188
	mov	r2, ip, asl #16
	mov	r2, r2, lsr #16
	add	r3, r0, r3
	str	r2, [sp, #56]
	str	r3, [sp, #60]
	str	ip, [sp, #44]
.L190:
	mov	r1, #0
	str	r1, [sp, #40]
.L191:
	mov	r0, #0
	ldr	r1, [sp, #16]
	mov	r2, #1
	bl	Putstr(PLT)
	ldr	r3, .L224+4
	mov	r6, #0
	add	r3, sl, r3
	str	r3, [sp, #8]
	mov	r5, r6
.L192:
	mov	r0, #0
	bl	Getc(PLT)
	ands	r7, r0, #255
	beq	.L193
	mov	r2, r6, lsr #31
	add	r3, r6, r2
	and	r3, r3, #1
	rsb	r3, r2, r3
	ldr	r2, [sp, #8]
	cmp	r3, #1
	movne	r9, #1
	moveq	r9, #9
	mov	fp, #7
	str	r2, [sp, #20]
.L198:
	mov	r3, r7, asr fp
	tst	r3, #1
	beq	.L199
	add	r8, r5, r9
	cmp	r8, r4
	beq	.L199
	cmp	r8, #205
	beq	.L205
	ldr	r3, .L224+8
	cmp	r8, r3
	beq	.L206
.L223:
	mov	r4, r8
.L199:
	subs	fp, fp, #1
	add	r9, r9, #1
	bcs	.L198
.L193:
	add	r6, r6, #1
	cmp	r6, #10
	add	r5, r5, #100
	bne	.L192
	ldr	r2, [sp, #40]
	cmp	r2, #4
	ble	.L191
	ldr	ip, [sp, #56]
	ldr	r0, [sp, #44]
	ldr	r1, [sp, #60]
	sub	r3, ip, #1
	sub	r0, r0, #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	sub	r1, r1, #36
	cmp	r0, #7
	str	r0, [sp, #44]
	str	r3, [sp, #56]
	str	r1, [sp, #60]
	bgt	.L190
	ldr	r2, [sp, #64]
	ldr	r3, [sp, #68]
	sub	r2, r2, #36
	str	r2, [sp, #64]
	str	r3, [sp, #36]
	b	.L187
.L206:
	bl	Time(PLT)
	ldr	ip, [sp, #48]
	rsb	r0, ip, r0
	cmp	ip, #0
	str	r0, [sp, #52]
	beq	.L223
	ldr	r0, [sp, #68]
	add	r1, r0, #1
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	ldr	r1, [sp, #60]
	ldr	r3, [sp, #52]
	ldr	r2, [r1, #8]
	mul	r3, r2, r3
	str	r3, [sp, #32]
	ldr	ip, [sp, #32]
	ldr	r3, .L224+12
	mov	r1, ip, asr #31
	smull	r0, r4, r3, ip
	rsb	r4, r1, r4, asr #11
	rsb	r0, r4, #3184
	add	r0, r0, #12
	rsb	r3, r0, r0, asl #5
	add	r0, r0, r3, asl #2
	ldr	r3, [sp, #64]
	str	r1, [sp, #28]
	ldr	r1, [r3, #700]
	add	r0, r0, r0, asl #2
	rsb	r1, r2, r1
	mov	r0, r0, asl #4
	bl	__divsi3(PLT)
	ldr	r1, [sp, #20]
	str	r0, [sp, #24]
	ldr	r2, [sp, #52]
	mov	r0, #1
	bl	Printf(PLT)
	ldr	ip, [sp, #32]
	ldr	r3, .L224+16
	mov	r0, #1
	smull	r1, r2, r3, ip
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #20]
	rsb	r2, r3, r2, asr #12
	bl	Printf(PLT)
	mov	r2, r4
	ldr	r1, [sp, #20]
	mov	r0, #1
	bl	Printf(PLT)
	ldr	ip, [sp, #32]
	ldr	r3, .L224+20
	mov	r0, #1
	smull	r1, r2, r3, ip
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #20]
	rsb	r2, r3, r2, asr #5
	bl	Printf(PLT)
	ldr	ip, [sp, #32]
	ldr	r3, .L224+24
	mov	r0, #1
	smull	r1, r2, r3, ip
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #20]
	rsb	r2, r3, r2, asr #4
	bl	Printf(PLT)
	ldr	ip, [sp, #32]
	ldr	r3, .L224+28
	mov	r0, #1
	smull	r1, r2, r3, ip
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #20]
	rsb	r2, r3, r2, asr r0
	bl	Printf(PLT)
	ldr	ip, [sp, #24]
	ldr	r1, .L224+32
	str	ip, [sp, #4]
	ldr	ip, [sp, #44]
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, #58
	ldr	r3, [sp, #36]
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r0, [sp, #40]
	mov	r1, #0
	add	r0, r0, #1
	mov	r4, r8
	str	r0, [sp, #40]
	str	r1, [sp, #48]
	b	.L199
.L205:
	bl	Time(PLT)
	ldr	r3, [sp, #56]
	str	r0, [sp, #48]
	mov	r1, r3, asl #16
	mov	r1, r1, asr #16
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	b	.L223
.L188:
	mov	r1, #0
	mov	r0, #58
	bl	set_train_speed_old(PLT)
	bl	Exit(PLT)
	add	sp, sp, #1344
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L225:
	.align	2
.L224:
	.word	_GLOBAL_OFFSET_TABLE_-(.L222+8)
	.word	.LC2(GOTOFF)
	.word	910
	.word	1759218605
	.word	351843721
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	.LC3(GOTOFF)
	.size	calibrate_accel_time, .-calibrate_accel_time
	.ident	"GCC: (GNU) 4.0.2"
