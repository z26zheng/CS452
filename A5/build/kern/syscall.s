	.file	"syscall.c"
	.text
	.align	2
	.global	Create
	.type	Create, %function
Create:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0, r1}
	swi #1
	mov r0, r0
	ldmfd sp!, {r1, r2}
	
	bx	lr
	.size	Create, .-Create
	.align	2
	.global	Send
	.type	Send, %function
Send:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0}
	ldr r0, [sp, #4]
	stmfd sp!, {r0}
	stmfd sp!, {r1, r2, r3}
	swi #5
	mov r0, r0
	add sp, sp, #20
	
	bx	lr
	.size	Send, .-Send
	.align	2
	.global	Receive
	.type	Receive, %function
Receive:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0, r1, r2}
	swi #6
	mov r0, r0
	add sp, sp, #12
	
	bx	lr
	.size	Receive, .-Receive
	.align	2
	.global	Reply
	.type	Reply, %function
Reply:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0, r1, r2}
	swi #7
	mov r0, r0
	add sp, sp, #12
	
	bx	lr
	.size	Reply, .-Reply
	.align	2
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi #2
	mov r0, r0
	
	bx	lr
	.size	MyTid, .-MyTid
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi #3
	mov r0, r0
	
	bx	lr
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	Pass
	.type	Pass, %function
Pass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi #4
	
	bx	lr
	.size	Pass, .-Pass
	.align	2
	.global	Exit
	.type	Exit, %function
Exit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi #99
	
	bx	lr
	.size	Exit, .-Exit
	.align	2
	.global	AwaitEvent
	.type	AwaitEvent, %function
AwaitEvent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0}
	swi #8
	mov r0, r0
	add sp, sp, #4
	
	bx	lr
	.size	AwaitEvent, .-AwaitEvent
	.align	2
	.global	AwaitEvent2
	.type	AwaitEvent2, %function
AwaitEvent2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0, r1, r2}
	swi #8
	mov r0, r0
	add sp, sp, #12
	
	bx	lr
	.size	AwaitEvent2, .-AwaitEvent2
	.align	2
	.global	Kill_the_system
	.type	Kill_the_system, %function
Kill_the_system:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	stmfd sp!, {r0}
	swi #98
	add sp, sp, #4
	
	bx	lr
	.size	Kill_the_system, .-Kill_the_system
	.align	2
	.global	Idle_pct_cumulative
	.type	Idle_pct_cumulative, %function
Idle_pct_cumulative:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi #9
	mov r0, r0
	
	bx	lr
	.size	Idle_pct_cumulative, .-Idle_pct_cumulative
	.align	2
	.global	Idle_pct_recent
	.type	Idle_pct_recent, %function
Idle_pct_recent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi #10
	mov r0, r0
	
	bx	lr
	.size	Idle_pct_recent, .-Idle_pct_recent
	.ident	"GCC: (GNU) 4.0.2"
