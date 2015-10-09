	.file	"util.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\0337\033[1;40HIdle (cumulative):   , (recent):   \033"
	.ascii	"8\000"
	.align	2
.LC1:
	.ascii	"\0337\033[1;58H%d%% \033[1;72H%d%% \0338\000"
	.text
	.align	2
	.global	idle_percent_task
	.type	idle_percent_task, %function
idle_percent_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L6
	ldr	r1, .L6+4
.L4:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	Printf(PLT)
	ldr	r5, .L6+8
.L2:
	bl	Idle_pct_cumulative(PLT)
	mov	r4, r0
	bl	Idle_pct_recent(PLT)
	mov	r2, r4
	mov	r3, r0
	add	r1, sl, r5
	mov	r0, #1
	bl	Printf(PLT)
	mov	r0, #100
	bl	Delay(PLT)
	b	.L2
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L4+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	idle_percent_task, .-idle_percent_task
	.ident	"GCC: (GNU) 4.0.2"
