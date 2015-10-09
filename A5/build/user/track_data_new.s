	.file	"track_data_new.c"
	.text
	.align	2
	.type	memset, %function
memset:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	@ lr needed for prologue
	bxeq	lr
	and	r1, r1, #255
	mov	r3, #0
.L4:
	strb	r1, [r0, r3]
	add	r3, r3, #1
	cmp	r2, r3
	bne	.L4
	bx	lr
	.size	memset, .-memset
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"A1\000"
	.align	2
.LC1:
	.ascii	"A2\000"
	.align	2
.LC2:
	.ascii	"A3\000"
	.align	2
.LC3:
	.ascii	"A4\000"
	.align	2
.LC4:
	.ascii	"A5\000"
	.align	2
.LC5:
	.ascii	"A6\000"
	.align	2
.LC6:
	.ascii	"A7\000"
	.align	2
.LC7:
	.ascii	"A8\000"
	.align	2
.LC8:
	.ascii	"A9\000"
	.align	2
.LC9:
	.ascii	"A10\000"
	.align	2
.LC10:
	.ascii	"A11\000"
	.align	2
.LC11:
	.ascii	"A12\000"
	.align	2
.LC12:
	.ascii	"A13\000"
	.align	2
.LC13:
	.ascii	"A14\000"
	.align	2
.LC14:
	.ascii	"A15\000"
	.align	2
.LC15:
	.ascii	"A16\000"
	.align	2
.LC16:
	.ascii	"B1\000"
	.align	2
.LC17:
	.ascii	"B2\000"
	.align	2
.LC18:
	.ascii	"B3\000"
	.align	2
.LC19:
	.ascii	"B4\000"
	.align	2
.LC20:
	.ascii	"B5\000"
	.align	2
.LC21:
	.ascii	"B6\000"
	.align	2
.LC22:
	.ascii	"B7\000"
	.align	2
.LC23:
	.ascii	"B8\000"
	.align	2
.LC24:
	.ascii	"B9\000"
	.align	2
.LC25:
	.ascii	"B10\000"
	.align	2
.LC26:
	.ascii	"B11\000"
	.align	2
.LC27:
	.ascii	"B12\000"
	.align	2
.LC28:
	.ascii	"B13\000"
	.align	2
.LC29:
	.ascii	"B14\000"
	.align	2
.LC30:
	.ascii	"B15\000"
	.align	2
.LC31:
	.ascii	"B16\000"
	.align	2
.LC32:
	.ascii	"C1\000"
	.align	2
.LC33:
	.ascii	"C2\000"
	.align	2
.LC34:
	.ascii	"C3\000"
	.align	2
.LC35:
	.ascii	"C4\000"
	.align	2
.LC36:
	.ascii	"C5\000"
	.align	2
.LC37:
	.ascii	"C6\000"
	.align	2
.LC38:
	.ascii	"C7\000"
	.align	2
.LC39:
	.ascii	"C8\000"
	.align	2
.LC40:
	.ascii	"C9\000"
	.align	2
.LC41:
	.ascii	"C10\000"
	.align	2
.LC42:
	.ascii	"C11\000"
	.align	2
.LC43:
	.ascii	"C12\000"
	.align	2
.LC44:
	.ascii	"C13\000"
	.align	2
.LC45:
	.ascii	"C14\000"
	.align	2
.LC46:
	.ascii	"C15\000"
	.align	2
.LC47:
	.ascii	"C16\000"
	.align	2
.LC48:
	.ascii	"D1\000"
	.align	2
.LC49:
	.ascii	"D2\000"
	.align	2
.LC50:
	.ascii	"D3\000"
	.align	2
.LC51:
	.ascii	"D4\000"
	.align	2
.LC52:
	.ascii	"D5\000"
	.align	2
.LC53:
	.ascii	"D6\000"
	.align	2
.LC54:
	.ascii	"D7\000"
	.align	2
.LC55:
	.ascii	"D8\000"
	.align	2
.LC56:
	.ascii	"D9\000"
	.align	2
.LC57:
	.ascii	"D10\000"
	.align	2
.LC58:
	.ascii	"D11\000"
	.align	2
.LC59:
	.ascii	"D12\000"
	.align	2
.LC60:
	.ascii	"D13\000"
	.align	2
.LC61:
	.ascii	"D14\000"
	.align	2
.LC62:
	.ascii	"D15\000"
	.align	2
.LC63:
	.ascii	"D16\000"
	.align	2
.LC64:
	.ascii	"E1\000"
	.align	2
.LC65:
	.ascii	"E2\000"
	.align	2
.LC66:
	.ascii	"E3\000"
	.align	2
.LC67:
	.ascii	"E4\000"
	.align	2
.LC68:
	.ascii	"E5\000"
	.align	2
.LC69:
	.ascii	"E6\000"
	.align	2
.LC70:
	.ascii	"E7\000"
	.align	2
.LC71:
	.ascii	"E8\000"
	.align	2
.LC72:
	.ascii	"E9\000"
	.align	2
.LC73:
	.ascii	"E10\000"
	.align	2
.LC74:
	.ascii	"E11\000"
	.align	2
.LC75:
	.ascii	"E12\000"
	.align	2
.LC76:
	.ascii	"E13\000"
	.align	2
.LC77:
	.ascii	"E14\000"
	.align	2
.LC78:
	.ascii	"E15\000"
	.align	2
.LC79:
	.ascii	"E16\000"
	.align	2
.LC80:
	.ascii	"BR1\000"
	.align	2
.LC81:
	.ascii	"MR1\000"
	.align	2
.LC82:
	.ascii	"BR2\000"
	.align	2
.LC83:
	.ascii	"MR2\000"
	.align	2
.LC84:
	.ascii	"BR3\000"
	.align	2
.LC85:
	.ascii	"MR3\000"
	.align	2
.LC86:
	.ascii	"BR4\000"
	.align	2
.LC87:
	.ascii	"MR4\000"
	.align	2
.LC88:
	.ascii	"BR5\000"
	.align	2
.LC89:
	.ascii	"MR5\000"
	.align	2
.LC90:
	.ascii	"BR6\000"
	.align	2
.LC91:
	.ascii	"MR6\000"
	.align	2
.LC92:
	.ascii	"BR7\000"
	.align	2
.LC93:
	.ascii	"MR7\000"
	.align	2
.LC94:
	.ascii	"BR8\000"
	.align	2
.LC95:
	.ascii	"MR8\000"
	.align	2
.LC96:
	.ascii	"BR9\000"
	.align	2
.LC97:
	.ascii	"MR9\000"
	.align	2
.LC98:
	.ascii	"BR10\000"
	.align	2
.LC99:
	.ascii	"MR10\000"
	.align	2
.LC100:
	.ascii	"BR11\000"
	.align	2
.LC101:
	.ascii	"MR11\000"
	.align	2
.LC102:
	.ascii	"BR12\000"
	.align	2
.LC103:
	.ascii	"MR12\000"
	.align	2
.LC104:
	.ascii	"BR13\000"
	.align	2
.LC105:
	.ascii	"MR13\000"
	.align	2
.LC106:
	.ascii	"BR14\000"
	.align	2
.LC107:
	.ascii	"MR14\000"
	.align	2
.LC108:
	.ascii	"BR15\000"
	.align	2
.LC109:
	.ascii	"MR15\000"
	.align	2
.LC110:
	.ascii	"BR16\000"
	.align	2
.LC111:
	.ascii	"MR16\000"
	.align	2
.LC112:
	.ascii	"BR17\000"
	.align	2
.LC113:
	.ascii	"MR17\000"
	.align	2
.LC114:
	.ascii	"BR18\000"
	.align	2
.LC115:
	.ascii	"MR18\000"
	.align	2
.LC116:
	.ascii	"BR153\000"
	.align	2
.LC117:
	.ascii	"MR153\000"
	.align	2
.LC118:
	.ascii	"BR154\000"
	.align	2
.LC119:
	.ascii	"MR154\000"
	.align	2
.LC120:
	.ascii	"BR155\000"
	.align	2
.LC121:
	.ascii	"MR155\000"
	.align	2
.LC122:
	.ascii	"BR156\000"
	.align	2
.LC123:
	.ascii	"MR156\000"
	.align	2
.LC124:
	.ascii	"EN1\000"
	.align	2
.LC125:
	.ascii	"EX1\000"
	.align	2
.LC126:
	.ascii	"EN2\000"
	.align	2
.LC127:
	.ascii	"EX2\000"
	.align	2
.LC128:
	.ascii	"EN3\000"
	.align	2
.LC129:
	.ascii	"EX3\000"
	.align	2
.LC130:
	.ascii	"EN4\000"
	.align	2
.LC131:
	.ascii	"EX4\000"
	.align	2
.LC132:
	.ascii	"EN5\000"
	.align	2
.LC133:
	.ascii	"EX5\000"
	.align	2
.LC134:
	.ascii	"EN6\000"
	.align	2
.LC135:
	.ascii	"EX6\000"
	.align	2
.LC136:
	.ascii	"EN7\000"
	.align	2
.LC137:
	.ascii	"EX7\000"
	.align	2
.LC138:
	.ascii	"EN8\000"
	.align	2
.LC139:
	.ascii	"EX8\000"
	.align	2
.LC140:
	.ascii	"EN9\000"
	.align	2
.LC141:
	.ascii	"EX9\000"
	.align	2
.LC142:
	.ascii	"EN10\000"
	.align	2
.LC143:
	.ascii	"EX10\000"
	.text
	.align	2
	.global	init_tracka
	.type	init_tracka, %function
init_tracka:
	@ args = 0, pretend = 0, frame = 1112
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L11
	sub	sp, sp, #1104
	sub	sp, sp, #8
	mov	r4, r0
.L10:
	add	sl, pc, sl
	mov	r1, #0
	mov	r2, #6912
	bl	memset(PLT)
	add	r2, r4, #5056
	str	r2, [sp, #524]
	add	r2, r4, #5248
	str	r2, [sp, #684]
	ldr	r2, [sp, #524]
	add	r3, r4, #4096
	str	r3, [sp, #632]
	add	r2, r2, #32
	add	r3, r4, #5632
	str	r3, [sp, #772]
	str	r2, [sp, #524]
	ldr	r3, [sp, #632]
	ldr	r2, [sp, #684]
	add	r3, r3, #32
	add	r2, r2, #32
	str	r3, [sp, #632]
	str	r2, [sp, #684]
	ldr	r3, [sp, #772]
	add	r2, r4, #5184
	str	r2, [sp, #796]
	add	r2, r4, #5760
	add	r3, r3, #32
	str	r2, [sp, #940]
	add	r2, r4, #5376
	str	r3, [sp, #772]
	str	r2, [sp, #1044]
	add	r3, r4, #5568
	add	r2, r4, #5120
	str	r3, [sp, #800]
	str	r2, [sp, #520]
	add	r3, r4, #4608
	add	r2, r4, #6208
	str	r3, [sp, #984]
	str	r2, [sp, #644]
	add	r3, r4, #4864
	add	r2, r4, #5312
	str	r3, [sp, #492]
	str	r2, [sp, #692]
	add	r3, r4, #6592
	add	r2, r4, #4352
	str	r3, [sp, #616]
	str	r2, [sp, #848]
	add	r3, r4, #6400
	add	r2, r4, #4672
	str	r2, [sp, #960]
	str	r3, [sp, #660]
	ldr	r2, [sp, #492]
	add	r3, r4, #6784
	str	r3, [sp, #756]
	add	r3, r4, #5440
	str	r3, [sp, #864]
	add	r2, r2, #32
	add	r3, r4, #5824
	str	r3, [sp, #1064]
	str	r2, [sp, #492]
	ldr	r3, [sp, #864]
	ldr	r2, [sp, #960]
	add	r3, r3, #32
	add	r2, r2, #32
	str	r3, [sp, #864]
	str	r2, [sp, #960]
	ldr	r3, [sp, #1064]
	ldr	r2, [sp, #520]
	add	r3, r3, #32
	str	r3, [sp, #1064]
	ldr	r3, [sp, #692]
	add	r2, r2, #16
	str	r2, [sp, #520]
	add	r3, r3, #16
	ldr	r2, [sp, #848]
	str	r3, [sp, #692]
	ldr	r3, [sp, #616]
	add	r2, r2, #16
	str	r2, [sp, #848]
	add	r3, r3, #32
	ldr	r2, [sp, #644]
	str	r3, [sp, #616]
	ldr	r3, [sp, #660]
	add	r2, r2, #32
	str	r2, [sp, #644]
	add	r3, r3, #32
	ldr	r2, [sp, #756]
	str	r3, [sp, #660]
	add	r3, r4, #4992
	add	r2, r2, #32
	str	r3, [sp, #728]
	add	r3, r4, #4416
	str	r2, [sp, #756]
	str	r3, [sp, #1032]
	add	r2, r4, #4224
	add	r3, r4, #6336
	str	r2, [sp, #828]
	str	r3, [sp, #504]
	add	r2, r4, #4480
	add	r3, r4, #6720
	add	r2, r2, #32
	str	r3, [sp, #748]
	ldr	r3, [sp, #632]
	str	r2, [sp, #1020]
	add	r2, r4, #6528
	str	r2, [sp, #740]
	add	r3, r3, #16
	add	r2, r4, #6144
	str	r2, [sp, #820]
	str	r3, [sp, #636]
	ldr	r2, [sp, #684]
	ldr	r3, [sp, #772]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #688]
	str	r3, [sp, #776]
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #796]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #804]
	str	r3, [sp, #852]
	ldr	r2, [sp, #524]
	ldr	r3, [sp, #940]
	add	r2, r2, #16
	str	r2, [sp, #892]
	add	r3, r3, #16
	ldr	r2, [sp, #984]
	str	r3, [sp, #944]
	ldr	r3, [sp, #1044]
	add	r2, r2, #16
	str	r2, [sp, #988]
	add	r3, r3, #16
	add	r2, r4, #4928
	str	r2, [sp, #500]
	str	r3, [sp, #1048]
	add	r2, r4, #6656
	add	r3, r4, #6336
	str	r3, [sp, #508]
	str	r2, [sp, #620]
	add	r3, r4, #4160
	add	r2, r4, #6272
	str	r3, [sp, #640]
	str	r2, [sp, #648]
	add	r3, r4, #6464
	add	r2, r4, #4992
	str	r3, [sp, #664]
	str	r2, [sp, #736]
	add	r3, r4, #6528
	add	r2, r4, #6720
	str	r3, [sp, #744]
	str	r2, [sp, #752]
	add	r3, r4, #6848
	add	r2, r4, #5696
	str	r2, [sp, #780]
	str	r3, [sp, #760]
	add	r2, r4, #5568
	add	r3, r4, #5184
	str	r2, [sp, #808]
	str	r3, [sp, #792]
	add	r2, r4, #4224
	add	r3, r4, #6144
	str	r3, [sp, #824]
	str	r2, [sp, #836]
	add	r3, r4, #5504
	add	r2, r4, #5760
	str	r3, [sp, #872]
	str	r2, [sp, #948]
	add	r3, r4, #4736
	add	r2, r4, #4608
	str	r3, [sp, #968]
	str	r2, [sp, #992]
	ldr	r3, [sp, #500]
	ldr	r2, [sp, #640]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #500]
	str	r2, [sp, #640]
	ldr	r3, [sp, #780]
	ldr	r2, [sp, #808]
	add	r3, r3, #16
	add	r2, r2, #48
	str	r3, [sp, #780]
	str	r2, [sp, #808]
	ldr	r3, [sp, #836]
	ldr	r2, [sp, #872]
	add	r3, r3, #48
	str	r3, [sp, #836]
	ldr	r3, [sp, #948]
	add	r2, r2, #16
	add	r3, r3, #48
	str	r2, [sp, #872]
	str	r3, [sp, #948]
	ldr	r2, [sp, #968]
	ldr	r3, [sp, #992]
	add	r2, r2, #16
	add	r3, r3, #48
	str	r2, [sp, #968]
	str	r3, [sp, #992]
	ldr	r2, [sp, #736]
	ldr	r3, [sp, #792]
	add	r2, r2, #48
	add	r3, r3, #48
	str	r2, [sp, #736]
	str	r3, [sp, #792]
	ldr	r2, [sp, #508]
	ldr	r3, [sp, #620]
	add	r2, r2, #48
	add	r3, r3, #16
	str	r2, [sp, #508]
	str	r3, [sp, #620]
	ldr	r2, [sp, #648]
	ldr	r3, [sp, #664]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #648]
	str	r3, [sp, #664]
	ldr	r2, [sp, #744]
	ldr	r3, [sp, #752]
	add	r2, r2, #48
	add	r3, r3, #48
	str	r2, [sp, #744]
	str	r3, [sp, #752]
	ldr	r2, [sp, #760]
	ldr	r3, [sp, #824]
	add	r2, r2, #16
	add	r3, r3, #48
	str	r2, [sp, #760]
	str	r3, [sp, #824]
	ldr	r2, [sp, #688]
	ldr	r3, [sp, #852]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #428]
	str	r3, [sp, #360]
	ldr	r2, [sp, #1048]
	add	r3, r4, #4800
	add	r2, r2, #16
	str	r2, [sp, #292]
	str	r3, [sp, #908]
	add	r2, r4, #3984
	add	r3, r4, #3888
	str	r2, [sp, #580]
	str	r3, [sp, #604]
	add	r2, r4, #4080
	add	r3, r4, #3216
	str	r2, [sp, #548]
	str	r3, [sp, #956]
	add	r2, r4, #3312
	add	r3, r4, #4544
	str	r2, [sp, #980]
	add	r3, r3, #16
	add	r2, r4, #48
	str	r3, [sp, #1028]
	str	r2, [sp, #488]
	add	r3, r4, #96
	add	r2, r4, #192
	str	r3, [sp, #512]
	str	r2, [sp, #536]
	add	r3, r4, #336
	add	r2, r4, #432
	str	r3, [sp, #564]
	str	r2, [sp, #588]
	add	r3, r4, #480
	add	r2, r4, #528
	str	r3, [sp, #608]
	str	r2, [sp, #612]
	add	r3, r4, #576
	add	r2, r4, #624
	str	r3, [sp, #624]
	str	r2, [sp, #628]
	add	r3, r4, #672
	add	r2, r4, #720
	str	r3, [sp, #652]
	str	r2, [sp, #656]
	add	r3, r4, #816
	add	r2, r4, #912
	str	r3, [sp, #672]
	str	r2, [sp, #700]
	add	r3, r4, #4416
	add	r2, r4, #5376
	add	r3, r3, #48
	add	r2, r2, #48
	str	r3, [sp, #1040]
	str	r2, [sp, #1052]
	add	r3, r4, #144
	add	r2, r4, #240
	str	r3, [sp, #516]
	str	r2, [sp, #540]
	add	r3, r4, #288
	add	r2, r4, #384
	str	r3, [sp, #560]
	str	r2, [sp, #584]
	add	r3, r4, #768
	add	r2, r4, #864
	str	r3, [sp, #668]
	str	r2, [sp, #696]
	add	r3, r4, #960
	add	r2, r4, #1008
	str	r3, [sp, #712]
	str	r2, [sp, #716]
	add	r3, r4, #1488
	add	r2, r4, #1200
	str	r3, [sp, #532]
	str	r2, [sp, #556]
	add	r3, r4, #1296
	add	r2, r4, #1104
	str	r3, [sp, #572]
	str	r2, [sp, #596]
	add	r3, r4, #2928
	add	r2, r4, #1584
	str	r3, [sp, #680]
	str	r2, [sp, #708]
	add	r3, r4, #2400
	add	r2, r4, #1344
	str	r3, [sp, #724]
	str	r2, [sp, #764]
	add	r3, r4, #3024
	add	r2, r4, #1632
	str	r3, [sp, #788]
	str	r2, [sp, #812]
	add	r3, r4, #1680
	add	r2, r4, #1728
	str	r3, [sp, #816]
	str	r2, [sp, #840]
	add	r3, r4, #1776
	add	r2, r4, #1824
	str	r3, [sp, #844]
	str	r2, [sp, #856]
	add	r3, r4, #1872
	add	r2, r4, #1920
	str	r3, [sp, #860]
	str	r2, [sp, #876]
	add	r3, r4, #1968
	add	r2, r4, #2016
	str	r3, [sp, #880]
	str	r2, [sp, #884]
	add	r3, r4, #2064
	add	r2, r4, #2112
	str	r3, [sp, #888]
	str	r2, [sp, #896]
	add	r3, r4, #2160
	add	r2, r4, #2256
	str	r3, [sp, #900]
	str	r2, [sp, #916]
	add	r3, r4, #2832
	add	r2, r4, #2304
	str	r3, [sp, #924]
	str	r2, [sp, #932]
	add	r3, r4, #2352
	add	r2, r4, #2496
	str	r3, [sp, #936]
	str	r2, [sp, #972]
	add	r3, r4, #2544
	add	r2, r4, #2592
	str	r3, [sp, #976]
	str	r2, [sp, #996]
	add	r3, r4, #2640
	add	r2, r4, #1440
	str	r3, [sp, #1000]
	str	r2, [sp, #528]
	add	r3, r4, #1152
	add	r2, r4, #1248
	str	r3, [sp, #552]
	str	r2, [sp, #568]
	add	r3, r4, #1056
	add	r2, r4, #2880
	str	r3, [sp, #592]
	str	r2, [sp, #676]
	add	r3, r4, #1536
	add	r2, r4, #2448
	str	r3, [sp, #704]
	str	r2, [sp, #720]
	add	r2, r4, #2976
	str	r2, [sp, #784]
	add	r2, r4, #2784
	str	r2, [sp, #920]
	add	r2, r4, #2736
	add	r3, r4, #1392
	str	r2, [sp, #1008]
	ldr	r2, [sp, #492]
	str	r3, [sp, #768]
	add	r3, r4, #2208
	str	r3, [sp, #912]
	add	r2, r2, #16
	add	r3, r4, #2688
	str	r3, [sp, #1004]
	str	r2, [sp, #496]
	add	r3, r4, #3600
	ldr	r2, [sp, #728]
	str	r3, [sp, #1016]
	add	r3, r4, #4048
	str	r3, [sp, #544]
	add	r2, r2, #16
	ldr	r3, [sp, #828]
	str	r2, [sp, #732]
	add	r6, r4, #4288
	ldr	r2, [sp, #864]
	add	r6, r6, #32
	add	r3, r3, #16
	str	r3, [sp, #832]
	add	r2, r2, #16
	add	r3, r6, #16
	str	r2, [sp, #868]
	str	r3, [sp, #928]
	ldr	r2, [sp, #960]
	ldr	r3, [sp, #1020]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #964]
	str	r3, [sp, #1024]
	ldr	r2, [sp, #1032]
	ldr	r3, [sp, #1064]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #1036]
	str	r3, [sp, #1068]
	ldr	r2, [sp, #504]
	ldr	r3, [sp, #520]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #484]
	str	r3, [sp, #480]
	add	r2, r4, #1456
	add	r3, r4, #1168
	str	r2, [sp, #476]
	str	r3, [sp, #472]
	add	r2, r4, #1264
	add	r3, r4, #3968
	str	r2, [sp, #468]
	str	r3, [sp, #464]
	add	r2, r4, #1072
	add	r3, r4, #3856
	str	r2, [sp, #460]
	str	r3, [sp, #600]
	ldr	r3, [sp, #616]
	add	r2, r4, #3872
	add	r3, r3, #16
	str	r3, [sp, #452]
	ldr	r3, [sp, #644]
	str	r2, [sp, #456]
	add	r3, r3, #16
	str	r3, [sp, #444]
	add	r3, r4, #2896
	ldr	r2, [sp, #636]
	str	r3, [sp, #436]
	add	r3, r4, #2464
	str	r3, [sp, #424]
	ldr	r3, [sp, #740]
	add	r2, r2, #16
	str	r2, [sp, #448]
	add	r3, r3, #16
	ldr	r2, [sp, #660]
	str	r3, [sp, #416]
	ldr	r3, [sp, #748]
	add	r2, r2, #16
	str	r2, [sp, #440]
	add	r3, r3, #16
	add	r2, r4, #1552
	str	r2, [sp, #432]
	str	r3, [sp, #408]
	add	r2, r4, #400
	ldr	r3, [sp, #756]
	str	r2, [sp, #420]
	add	r2, r4, #256
	str	r2, [sp, #412]
	add	r3, r3, #16
	add	r2, r4, #304
	str	r2, [sp, #404]
	str	r3, [sp, #400]
	ldr	r2, [sp, #776]
	add	r3, r4, #2992
	str	r3, [sp, #392]
	add	r3, r4, #5248
	add	r2, r2, #16
	str	r3, [sp, #384]
	ldr	r3, [sp, #804]
	str	r2, [sp, #396]
	add	r2, r4, #160
	str	r2, [sp, #388]
	add	r3, r3, #16
	add	r2, r4, #880
	str	r2, [sp, #380]
	str	r3, [sp, #376]
	ldr	r2, [sp, #820]
	ldr	r3, [sp, #848]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #372]
	str	r3, [sp, #368]
	ldr	r3, [sp, #692]
	add	r2, r4, #4096
	add	r3, r3, #16
	str	r3, [sp, #356]
	ldr	r3, [sp, #892]
	str	r2, [sp, #364]
	add	r3, r3, #16
	str	r3, [sp, #348]
	add	r3, r4, #4864
	str	r3, [sp, #340]
	ldr	r3, [sp, #944]
	add	r2, r4, #5056
	str	r2, [sp, #352]
	add	r3, r3, #16
	add	r2, r4, #3424
	str	r2, [sp, #344]
	str	r3, [sp, #332]
	add	r2, r4, #2800
	add	r3, r4, #976
	str	r2, [sp, #336]
	str	r3, [sp, #324]
	add	r2, r4, #3184
	ldr	r3, [sp, #988]
	str	r2, [sp, #328]
	add	r2, r4, #3280
	str	r2, [sp, #320]
	add	r3, r3, #16
	add	r2, r4, #3376
	str	r3, [sp, #316]
	str	r2, [sp, #312]
	add	r3, r4, #3568
	add	r2, r4, #2224
	str	r3, [sp, #308]
	str	r2, [sp, #304]
	add	r3, r4, #784
	add	r2, r4, #1408
	str	r3, [sp, #300]
	str	r2, [sp, #296]
	add	r3, r4, #5888
	ldr	r2, .L11+4
	str	r3, [sp, #1072]
	mov	r3, #0
	str	r3, [r4, #8]
	add	r3, sl, r2
	ldr	r2, .L11+8
	str	r3, [r4, #0]
	add	r3, sl, r2
	ldr	r2, .L11+12
	str	r3, [r4, #48]
	add	r3, sl, r2
	ldr	r2, .L11+16
	str	r3, [r4, #96]
	add	r3, sl, r2
	ldr	r2, .L11+20
	str	r3, [r4, #144]
	add	r3, sl, r2
	ldr	r2, [sp, #1072]
	str	r3, [r4, #192]
	add	r2, r2, #16
	ldr	r3, [sp, #488]
	str	r2, [sp, #1072]
	ldr	r2, [sp, #500]
	str	r3, [r4, #12]
	str	r4, [r4, #20]
	mov	r3, #231
	str	r2, [r4, #24]
	ldr	r2, [sp, #488]
	mov	r1, #1
	str	r3, [r4, #28]
	mov	r3, #504
	str	r4, [r2, #12]
	str	r1, [r2, #8]
	str	r3, [r2, #28]
	ldr	r2, [sp, #512]
	mov	r3, #2
	str	r3, [r2, #8]
	ldr	r3, [sp, #488]
	ldr	r2, [sp, #508]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #496]
	ldr	r2, [sp, #488]
	str	r3, [r4, #16]
	ldr	r3, [sp, #484]
	str	r1, [r4, #4]
	str	r3, [r2, #16]
	ldr	r3, [sp, #480]
	ldr	r2, [sp, #512]
	mov	r0, #239
	str	r3, [r2, #16]
	ldr	r2, [sp, #516]
	ldr	r3, [sp, #476]
	add	r8, r4, #4032
	str	r3, [r2, #16]
	ldr	r3, [sp, #512]
	add	lr, r4, #3360
	str	r2, [r3, #12]
	ldr	r2, [sp, #488]
	str	r3, [r3, #20]
	str	r1, [r2, #4]
	ldr	r2, [sp, #524]
	add	fp, r4, #3408
	str	r2, [r3, #24]
	mov	r2, #43
	str	r2, [r3, #28]
	ldr	r2, [sp, #516]
	mov	r3, #3
	str	r3, [r2, #8]
	ldr	r3, [sp, #512]
	mov	r9, r4
	str	r1, [r3, #4]
	str	r3, [r2, #12]
	ldr	r3, [sp, #532]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, .L11+152
	str	r1, [r2, #4]
	str	r3, [r2, #28]
	ldr	r2, [sp, #536]
	mov	r3, #4
	stmib	r2, {r1, r3}	@ phole stm
	ldr	r2, .L11+24
	add	r5, r4, #3456
	add	r3, sl, r2
	ldr	r2, .L11+28
	str	r3, [r4, #240]
	add	r3, sl, r2
	ldr	r2, .L11+32
	str	r3, [r4, #288]
	add	r3, sl, r2
	ldr	r2, .L11+36
	str	r3, [r4, #336]
	add	r3, sl, r2
	str	r3, [r4, #384]
	ldr	r2, [sp, #540]
	ldr	r3, [sp, #536]
	add	ip, r4, #3648
	str	r2, [r3, #12]
	mov	r2, #231
	str	r2, [r3, #28]
	ldr	r2, [sp, #540]
	mov	r3, #5
	str	r3, [r2, #8]
	ldr	r3, [sp, #536]
	ldr	r2, [sp, #548]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #540]
	ldr	r2, .L11+40
	str	r2, [r3, #28]
	ldr	r2, [sp, #560]
	mov	r3, #6
	str	r3, [r2, #8]
	ldr	r3, [sp, #540]
	ldr	r2, [sp, #536]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #556]
	str	r2, [r3, #24]
	ldr	r2, [sp, #544]
	ldr	r3, [sp, #536]
	str	r2, [r3, #16]
	ldr	r2, [sp, #472]
	ldr	r3, [sp, #540]
	str	r2, [r3, #16]
	ldr	r2, [sp, #468]
	ldr	r3, [sp, #560]
	str	r2, [r3, #16]
	ldr	r2, [sp, #464]
	ldr	r3, [sp, #564]
	str	r2, [r3, #16]
	ldr	r3, [sp, #540]
	ldr	r2, [sp, #560]
	str	r1, [r3, #4]
	ldr	r3, [sp, #564]
	str	r3, [r2, #12]
	ldr	r3, .L11+44
	str	r3, [r2, #28]
	ldr	r2, [sp, #564]
	mov	r3, #7
	str	r3, [r2, #8]
	ldr	r3, [sp, #560]
	ldr	r2, [sp, #572]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	ldr	r3, [sp, #564]
	mov	r2, #229
	str	r2, [r3, #28]
	ldr	r2, [sp, #584]
	str	r1, [r3, #4]
	mov	r3, #8
	str	r3, [r2, #8]
	ldr	r3, [sp, #564]
	ldr	r2, [sp, #560]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #580]
	str	r2, [r3, #24]
	ldr	r3, [sp, #584]
	str	r1, [r3, #4]
	ldr	r2, [sp, #588]
	str	r2, [r3, #12]
	ldr	r2, [sp, #460]
	str	r2, [r3, #16]
	ldr	r3, .L11+48
	add	r2, sl, r3
	str	r2, [r4, #432]
	ldr	r3, [sp, #588]
	ldr	r2, [sp, #456]
	str	r2, [r3, #16]
	ldr	r3, .L11+52
	add	r2, sl, r3
	str	r2, [r4, #480]
	ldr	r3, [sp, #608]
	ldr	r2, [sp, #600]
	str	r2, [r3, #16]
	ldr	r3, .L11+56
	add	r2, sl, r3
	str	r2, [r4, #528]
	ldr	r3, [sp, #612]
	ldr	r2, [sp, #452]
	str	r2, [r3, #16]
	ldr	r3, .L11+60
	add	r2, sl, r3
	str	r2, [r4, #576]
	ldr	r3, [sp, #624]
	ldr	r2, [sp, #448]
	str	r2, [r3, #16]
	ldr	r3, [sp, #584]
	ldr	r2, [sp, #596]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, .L11+64
	str	r2, [r3, #28]
	ldr	r2, [sp, #588]
	mov	r3, #9
	str	r3, [r2, #8]
	add	r3, r3, #220
	str	r3, [r2, #28]
	ldr	r2, [sp, #608]
	sub	r3, r3, #219
	str	r3, [r2, #8]
	ldr	r3, [sp, #608]
	ldr	r2, .L11+68
	str	r2, [r3, #28]
	ldr	r2, [sp, #612]
	mov	r3, #11
	str	r3, [r2, #8]
	ldr	r3, [sp, #588]
	ldr	r2, [sp, #584]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #604]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	ldr	r3, [sp, #608]
	ldr	r2, [sp, #612]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #604]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	ldr	r2, [sp, #612]
	str	r3, [r2, #12]
	ldr	r3, [sp, #620]
	str	r1, [r2, #4]
	str	r3, [r2, #24]
	mov	r3, #43
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	ldr	r2, [sp, #624]
	sub	r3, r3, #31
	str	r3, [r2, #8]
	ldr	r3, [sp, #628]
	str	r1, [r2, #4]
	str	r3, [r2, #12]
	mov	r3, #236
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	ldr	r3, [sp, #444]
	ldr	r2, [sp, #628]
	str	r3, [r2, #16]
	mov	r3, #13
	str	r3, [r2, #8]
	ldr	r2, .L11+72
	ldr	r3, [sp, #628]
	str	r2, [r3, #28]
	ldr	r2, [sp, #652]
	ldr	r3, [sp, #440]
	str	r3, [r2, #16]
	mov	r3, #14
	str	r3, [r2, #8]
	ldr	r3, [sp, #652]
	mov	r2, #144
	str	r2, [r3, #28]
	ldr	r2, [sp, #656]
	ldr	r3, [sp, #636]
	str	r3, [r2, #16]
	mov	r3, #15
	str	r3, [r2, #8]
	ldr	r3, [sp, #656]
	ldr	r2, .L11+76
	str	r2, [r3, #28]
	ldr	r3, .L11+80
	add	r2, sl, r3
	ldr	r3, .L11+84
	str	r2, [r4, #624]
	add	r2, sl, r3
	ldr	r3, .L11+88
	str	r2, [r4, #672]
	add	r2, sl, r3
	ldr	r3, .L11+92
	str	r2, [r4, #720]
	add	r2, sl, r3
	str	r2, [r4, #768]
	ldr	r2, [sp, #668]
	mov	r3, #16
	str	r3, [r2, #8]
	ldr	r3, [sp, #436]
	str	r3, [r2, #16]
	ldr	r3, [sp, #640]
	ldr	r2, [sp, #624]
	str	r3, [r2, #24]
	ldr	r2, [sp, #628]
	ldr	r3, [sp, #624]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #648]
	str	r3, [r2, #24]
	ldr	r2, [sp, #652]
	ldr	r3, [sp, #656]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #664]
	str	r3, [r2, #24]
	ldr	r2, [sp, #628]
	ldr	r3, [sp, #656]
	str	r1, [r2, #4]
	ldr	r2, [sp, #652]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	str	r1, [r2, #4]
	ldr	r2, [sp, #640]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	ldr	r3, [sp, #668]
	ldr	r2, [sp, #672]
	str	r1, [r3, #4]
	str	r2, [r3, #12]
	ldr	r2, [sp, #680]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #964]
	ldr	r2, [sp, #668]
	add	r7, r3, #16
	mov	r3, #404
	str	r3, [r2, #28]
	ldr	r2, [sp, #672]
	mov	r3, #17
	str	r3, [r2, #8]
	ldr	r2, .L11+96
	add	r3, sl, r2
	ldr	r2, .L11+100
	str	r3, [r4, #816]
	add	r3, sl, r2
	ldr	r2, .L11+104
	str	r3, [r4, #864]
	add	r3, sl, r2
	ldr	r2, .L11+108
	str	r3, [r4, #912]
	add	r3, sl, r2
	ldr	r2, .L11+112
	str	r3, [r4, #960]
	add	r3, sl, r2
	str	r3, [r4, #1008]
	ldr	r2, [sp, #668]
	ldr	r3, [sp, #672]
	str	r2, [r3, #12]
	ldr	r2, [sp, #692]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #231
	str	r2, [r3, #28]
	ldr	r2, [sp, #696]
	mov	r3, #18
	str	r3, [r2, #8]
	ldr	r3, [sp, #700]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #708]
	str	r3, [r2, #24]
	mov	r3, #201
	str	r3, [r2, #28]
	ldr	r2, [sp, #700]
	sub	r3, r3, #182
	str	r3, [r2, #8]
	ldr	r3, [sp, #672]
	ldr	r2, [sp, #688]
	str	r1, [r3, #4]
	str	r2, [r3, #16]
	ldr	r2, [sp, #432]
	ldr	r3, [sp, #696]
	str	r2, [r3, #16]
	ldr	r2, [sp, #428]
	ldr	r3, [sp, #700]
	str	r2, [r3, #16]
	ldr	r2, [sp, #424]
	ldr	r3, [sp, #712]
	str	r2, [r3, #16]
	ldr	r3, [sp, #700]
	ldr	r2, [sp, #696]
	str	r0, [r3, #28]
	str	r2, [r3, #12]
	str	r1, [r2, #4]
	ldr	r2, [sp, #692]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #712]
	mov	r3, #20
	str	r3, [r2, #8]
	ldr	r3, [sp, #700]
	str	r1, [r3, #4]
	ldr	r3, [sp, #716]
	str	r1, [r2, #4]
	str	r3, [r2, #12]
	ldr	r3, [sp, #724]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #404
	str	r3, [r2, #28]
	ldr	r2, [sp, #716]
	mov	r3, #21
	stmib	r2, {r1, r3}	@ phole stm
	ldr	r2, .L11+116
	add	r3, sl, r2
	str	r3, [r4, #1056]
	ldr	r3, .L11+64
	mov	r2, #22
	str	r3, [r4, #1084]
	ldr	r3, .L11+120
	str	r2, [r4, #1064]
	add	r2, sl, r3
	str	r2, [r4, #1104]
	ldr	r2, .L11+124
	mov	r3, #23
	str	r3, [r4, #1112]
	add	r3, sl, r2
	mov	r2, #24
	str	r3, [r4, #1152]
	str	r2, [r4, #1160]
	ldr	r3, .L11+128
	ldr	r2, .L11+40
	str	r2, [r4, #1180]
	add	r2, sl, r3
	mov	r3, #25
	str	r2, [r4, #1200]
	str	r3, [r4, #1208]
	ldr	r2, [sp, #712]
	ldr	r3, [sp, #716]
	str	r2, [r3, #12]
	ldr	r2, [sp, #732]
	str	r2, [r3, #16]
	ldr	r2, [sp, #420]
	ldr	r3, [sp, #592]
	str	r2, [r3, #16]
	ldr	r2, [sp, #416]
	ldr	r3, [sp, #596]
	str	r2, [r3, #16]
	ldr	r2, [sp, #412]
	ldr	r3, [sp, #552]
	str	r2, [r3, #16]
	ldr	r2, [sp, #736]
	ldr	r3, [sp, #716]
	str	r2, [r4, #1032]
	ldr	r2, [sp, #596]
	str	r3, [r4, #1028]
	str	r2, [r4, #1068]
	mov	r3, #231
	ldr	r2, [sp, #588]
	str	r3, [r4, #1036]
	ldr	r3, [sp, #592]
	str	r2, [r4, #1080]
	ldr	r2, [sp, #744]
	str	r3, [r4, #1076]
	str	r3, [r4, #1116]
	ldr	r3, [sp, #596]
	str	r2, [r4, #1128]
	ldr	r2, [sp, #556]
	str	r3, [r4, #1124]
	mov	r3, #43
	str	r3, [r4, #1132]
	str	r2, [r4, #1164]
	ldr	r3, [sp, #552]
	ldr	r2, [sp, #536]
	str	r3, [r4, #1172]
	str	r2, [r4, #1176]
	str	r3, [r4, #1212]
	ldr	r2, [sp, #408]
	ldr	r3, [sp, #556]
	str	r1, [r4, #1060]
	str	r2, [r3, #16]
	ldr	r3, .L11+132
	str	r1, [r4, #1108]
	add	r2, sl, r3
	str	r2, [r4, #1248]
	ldr	r3, [sp, #568]
	ldr	r2, [sp, #404]
	str	r1, [r4, #1156]
	str	r1, [r4, #1204]
	str	r2, [r3, #16]
	mov	r3, #26
	ldr	r2, [sp, #400]
	str	r3, [r4, #1256]
	ldr	r3, [sp, #572]
	str	r1, [r4, #1252]
	str	r2, [r3, #16]
	ldr	r3, .L11+44
	ldr	r2, [sp, #764]
	str	r3, [r4, #1276]
	ldr	r3, [sp, #396]
	str	r1, [r4, #1300]
	str	r3, [r2, #16]
	ldr	r3, .L11+136
	add	r2, sl, r3
	str	r2, [r4, #1296]
	ldr	r2, .L11+140
	mov	r3, #27
	b	.L12
.L13:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	642
	.word	470
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	289
	.word	518
	.word	325
	.word	417
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	437
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	514
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	433
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	326
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	333
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	309
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	.LC66(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	875
	.word	.LC73(GOTOFF)
	.word	.LC74(GOTOFF)
	.word	369
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	.LC82(GOTOFF)
.L12:
	str	r3, [r4, #1304]
	add	r3, sl, r2
	str	r3, [r4, #1344]
	ldr	r3, .L11+144
	mov	r2, #28
	str	r2, [r4, #1352]
	add	r2, sl, r3
	mov	r3, #29
	str	r2, [r4, #1392]
	str	r3, [r4, #1400]
	ldr	r2, [sp, #768]
	ldr	r3, [sp, #392]
	str	r3, [r2, #16]
	ldr	r2, [sp, #556]
	ldr	r3, [sp, #752]
	str	r2, [r4, #1220]
	str	r3, [r4, #1224]
	mov	r2, #50
	ldr	r3, [sp, #572]
	str	r2, [r4, #1228]
	ldr	r2, [sp, #568]
	str	r3, [r4, #1260]
	ldr	r3, [sp, #564]
	str	r2, [r4, #1268]
	str	r2, [r4, #1308]
	ldr	r2, [sp, #572]
	str	r3, [r4, #1272]
	ldr	r3, [sp, #760]
	str	r2, [r4, #1316]
	mov	r2, #50
	str	r3, [r4, #1320]
	ldr	r3, [sp, #768]
	str	r2, [r4, #1324]
	ldr	r2, [sp, #764]
	str	r3, [r4, #1356]
	str	r2, [r4, #1364]
	ldr	r3, [sp, #780]
	str	r2, [r4, #1404]
	ldr	r2, [sp, #768]
	str	r3, [r4, #1368]
	str	r2, [r4, #1412]
	ldr	r3, [sp, #528]
	ldr	r2, [sp, #388]
	str	r1, [r4, #1348]
	str	r2, [r3, #16]
	ldr	r3, .L11+148
	str	r0, [r4, #1372]
	add	r2, sl, r3
	str	r2, [r4, #1440]
	ldr	r3, [sp, #532]
	ldr	r2, [sp, #384]
	str	r1, [r4, #1396]
	str	r2, [r3, #16]
	mov	r3, #30
	ldr	r2, [sp, #380]
	str	r3, [r4, #1448]
	ldr	r3, [sp, #704]
	str	r2, [r3, #16]
	ldr	r3, .L11+152
	str	r3, [r4, #1468]
	ldr	r3, .L11+156
	add	r2, sl, r3
	str	r2, [r4, #1488]
	ldr	r2, .L11+160
	mov	r3, #31
	str	r3, [r4, #1496]
	add	r3, sl, r2
	str	r3, [r4, #1536]
	ldr	r3, .L11+164
	mov	r2, #32
	str	r2, [r4, #1544]
	add	r2, sl, r3
	mov	r3, #33
	str	r2, [r4, #1584]
	str	r3, [r4, #1592]
	ldr	r2, [sp, #708]
	ldr	r3, [sp, #376]
	str	r3, [r2, #16]
	ldr	r2, [sp, #788]
	mov	r3, #201
	str	r2, [r4, #1416]
	ldr	r2, [sp, #532]
	str	r3, [r4, #1420]
	str	r2, [r4, #1452]
	ldr	r2, [sp, #512]
	ldr	r3, [sp, #528]
	str	r2, [r4, #1464]
	ldr	r2, [sp, #796]
	str	r3, [r4, #1460]
	str	r3, [r4, #1500]
	ldr	r3, [sp, #532]
	str	r2, [r4, #1512]
	ldr	r2, [sp, #708]
	str	r3, [r4, #1508]
	mov	r3, #50
	str	r3, [r4, #1516]
	str	r2, [r4, #1548]
	ldr	r3, [sp, #704]
	ldr	r2, [sp, #700]
	str	r3, [r4, #1556]
	str	r2, [r4, #1560]
	mov	r3, #201
	ldr	r2, [sp, #704]
	str	r3, [r4, #1564]
	ldr	r3, [sp, #708]
	str	r2, [r4, #1596]
	ldr	r2, [sp, #808]
	str	r3, [r4, #1604]
	mov	r3, #246
	str	r2, [r4, #1608]
	str	r3, [r4, #1612]
	ldr	r2, [sp, #812]
	ldr	r3, [sp, #372]
	str	r1, [r4, #1444]
	str	r1, [r4, #1492]
	str	r1, [r4, #1540]
	str	r1, [r4, #1588]
	str	r3, [r2, #16]
	ldr	r3, .L11+168
	str	r1, [r4, #1636]
	add	r2, sl, r3
	mov	r3, #34
	str	r2, [r4, #1632]
	str	r3, [r4, #1640]
	ldr	r2, .L11+172
	ldr	r3, .L11+176
	str	r2, [r4, #1660]
	add	r2, sl, r3
	str	r2, [r4, #1680]
	ldr	r2, .L11+180
	mov	r3, #35
	str	r3, [r4, #1688]
	add	r3, sl, r2
	str	r3, [r4, #1728]
	ldr	r3, .L11+184
	mov	r2, #36
	str	r2, [r4, #1736]
	add	r2, sl, r3
	mov	r3, #37
	str	r2, [r4, #1776]
	str	r3, [r4, #1784]
	ldr	r2, .L11+188
	ldr	r3, .L11+192
	str	r2, [r4, #1804]
	add	r2, sl, r3
	str	r2, [r4, #1824]
	ldr	r3, [sp, #832]
	ldr	r2, [sp, #816]
	str	r1, [r4, #1684]
	str	r3, [r2, #16]
	ldr	r3, [sp, #368]
	ldr	r2, [sp, #840]
	str	r0, [r4, #1708]
	str	r3, [r2, #16]
	ldr	r3, [sp, #812]
	ldr	r2, [sp, #816]
	str	r3, [r4, #1652]
	str	r2, [r4, #1644]
	str	r3, [r4, #1692]
	ldr	r2, [sp, #824]
	ldr	r3, [sp, #816]
	str	r2, [r4, #1656]
	str	r3, [r4, #1700]
	ldr	r2, [sp, #836]
	ldr	r3, [sp, #844]
	str	r2, [r4, #1704]
	str	r1, [r4, #1732]
	str	r3, [r4, #1740]
	ldr	r2, [sp, #840]
	mov	r3, #61
	str	r2, [r4, #1748]
	str	r3, [r4, #1756]
	str	r2, [r4, #1788]
	ldr	r3, [sp, #852]
	ldr	r2, [sp, #844]
	str	r1, [r4, #1780]
	str	r3, [r2, #16]
	str	r2, [r4, #1796]
	ldr	r2, [sp, #792]
	mov	r3, #38
	str	r2, [r4, #1800]
	ldr	r2, .L11+196
	str	r3, [r4, #1832]
	add	r3, sl, r2
	str	r3, [r4, #1872]
	ldr	r3, .L11+200
	mov	r2, #39
	str	r2, [r4, #1880]
	add	r2, sl, r3
	mov	r3, #40
	str	r2, [r4, #1920]
	str	r3, [r4, #1928]
	ldr	r2, .L11+204
	ldr	r3, .L11+208
	str	r2, [r4, #1948]
	add	r2, sl, r3
	mov	r3, #41
	str	r3, [r4, #1976]
	add	r3, r3, #87
	str	r3, [r4, #1996]
	ldr	r3, .L11+212
	str	r2, [r4, #1968]
	add	r2, sl, r3
	mov	r3, #42
	str	r2, [r4, #2016]
	str	r3, [r4, #2024]
	ldr	r2, [sp, #856]
	ldr	r3, [sp, #868]
	str	r1, [r4, #1828]
	str	r3, [r2, #16]
	ldr	r3, [sp, #364]
	ldr	r2, [sp, #860]
	str	r6, [r4, #1752]
	str	r3, [r2, #16]
	ldr	r3, [sp, #360]
	ldr	r2, [sp, #876]
	str	r3, [r2, #16]
	ldr	r3, [sp, #356]
	ldr	r2, [sp, #880]
	str	r3, [r2, #16]
	ldr	r2, [sp, #860]
	ldr	r3, [sp, #856]
	str	r2, [r4, #1836]
	ldr	r2, [sp, #872]
	str	r3, [r4, #1844]
	str	r2, [r4, #1848]
	mov	r3, #231
	ldr	r2, [sp, #856]
	str	r3, [r4, #1852]
	ldr	r3, [sp, #860]
	str	r2, [r4, #1884]
	mov	r2, #128
	str	r3, [r4, #1892]
	str	r2, [r4, #1900]
	ldr	r3, [sp, #880]
	ldr	r2, [sp, #876]
	str	r3, [r4, #1932]
	str	r2, [r4, #1940]
	ldr	r3, [sp, #792]
	str	r2, [r4, #1980]
	ldr	r2, [sp, #880]
	str	r3, [r4, #1944]
	str	r2, [r4, #1988]
	ldr	r3, [sp, #684]
	ldr	r2, [sp, #888]
	str	r3, [r4, #1992]
	str	r2, [r4, #2028]
	ldr	r3, [sp, #884]
	ldr	r2, [sp, #352]
	str	r1, [r4, #1876]
	str	r2, [r3, #16]
	mov	r3, #120
	str	r1, [r4, #1924]
	str	r1, [r4, #1972]
	str	r1, [r4, #2020]
	str	r8, [r4, #1896]
	str	r3, [r4, #2044]
	ldr	r2, [sp, #348]
	ldr	r3, [sp, #888]
	str	r1, [r4, #2068]
	str	r2, [r3, #16]
	ldr	r3, .L11+216
	add	r2, sl, r3
	str	r2, [r4, #2064]
	ldr	r3, [sp, #896]
	ldr	r2, [sp, #344]
	str	r2, [r3, #16]
	ldr	r3, .L11+220
	ldr	r2, [sp, #340]
	str	r3, [r4, #2092]
	ldr	r3, [sp, #900]
	str	r2, [r3, #16]
	ldr	r3, .L11+224
	add	r2, sl, r3
	mov	r3, #44
	str	r2, [r4, #2112]
	str	r3, [r4, #2120]
	ldr	r2, .L11+344
	ldr	r3, .L11+228
	str	r2, [r4, #2140]
	add	r2, sl, r3
	mov	r3, #45
	str	r3, [r4, #2168]
	sub	r3, r3, #2
	str	r3, [r4, #2188]
	ldr	r3, .L11+232
	str	r2, [r4, #2160]
	add	r2, sl, r3
	mov	r3, #46
	str	r2, [r4, #2208]
	str	r3, [r4, #2216]
	ldr	r2, [sp, #912]
	ldr	r3, [sp, #336]
	str	r3, [r2, #16]
	ldr	r3, [sp, #728]
	ldr	r2, [sp, #884]
	str	r3, [r4, #2040]
	ldr	r3, [sp, #884]
	str	r2, [r4, #2036]
	mov	r2, #43
	str	r2, [r4, #2072]
	str	r3, [r4, #2076]
	ldr	r2, [sp, #888]
	ldr	r3, [sp, #520]
	str	r2, [r4, #2084]
	str	r3, [r4, #2088]
	ldr	r2, [sp, #900]
	ldr	r3, [sp, #896]
	str	r2, [r4, #2124]
	str	r3, [r4, #2132]
	str	r3, [r4, #2172]
	str	r2, [r4, #2180]
	ldr	r3, [sp, #916]
	ldr	r2, [sp, #908]
	str	r3, [r4, #2220]
	str	r2, [r4, #2184]
	ldr	r3, .L11+236
	ldr	r2, [sp, #912]
	str	r1, [r4, #2116]
	str	r2, [r4, #2228]
	add	r2, sl, r3
	str	r2, [r4, #2256]
	ldr	r2, .L11+240
	mov	r3, #47
	str	r3, [r4, #2264]
	add	r3, sl, r2
	str	r3, [r4, #2304]
	ldr	r3, .L11+244
	mov	r2, #48
	str	r2, [r4, #2312]
	add	r2, sl, r3
	str	r2, [r4, #2352]
	ldr	r2, .L11+248
	mov	r3, #49
	str	r3, [r4, #2360]
	add	r3, sl, r2
	str	r3, [r4, #2400]
	mov	r3, #50
	ldr	r2, [sp, #916]
	str	r3, [r4, #2408]
	ldr	r3, [sp, #928]
	str	lr, [r4, #2136]
	str	r3, [r2, #16]
	ldr	r3, [sp, #332]
	ldr	r2, [sp, #932]
	str	r1, [r4, #2164]
	str	r3, [r2, #16]
	ldr	r3, [sp, #328]
	ldr	r2, [sp, #936]
	str	r1, [r4, #2212]
	str	r3, [r2, #16]
	ldr	r2, [sp, #924]
	mov	r3, #404
	str	r2, [r4, #2232]
	str	r3, [r4, #2236]
	ldr	r3, [sp, #916]
	ldr	r2, [sp, #912]
	str	r3, [r4, #2276]
	ldr	r3, [sp, #936]
	str	r2, [r4, #2268]
	str	r3, [r4, #2316]
	ldr	r2, [sp, #848]
	ldr	r3, [sp, #948]
	str	r2, [r4, #2280]
	str	r3, [r4, #2328]
	ldr	r2, [sp, #932]
	ldr	r3, [sp, #932]
	str	r2, [r4, #2324]
	str	r3, [r4, #2364]
	mov	r2, #246
	ldr	r3, [sp, #956]
	str	r2, [r4, #2332]
	ldr	r2, [sp, #936]
	str	r3, [r4, #2376]
	ldr	r3, [sp, #720]
	str	r2, [r4, #2372]
	mov	r2, #201
	str	r2, [r4, #2380]
	str	r3, [r4, #2412]
	ldr	r2, [sp, #724]
	ldr	r3, [sp, #964]
	str	r2, [r4, #2420]
	str	r3, [r2, #16]
	ldr	r2, [sp, #968]
	str	r1, [r4, #2260]
	str	r0, [r4, #2284]
	str	r1, [r4, #2308]
	str	r1, [r4, #2356]
	str	r1, [r4, #2404]
	str	r2, [r4, #2424]
	ldr	r2, [sp, #324]
	ldr	r3, [sp, #720]
	str	r0, [r4, #2428]
	str	r2, [r3, #16]
	ldr	r3, .L11+252
	str	r1, [r4, #2452]
	add	r2, sl, r3
	str	r2, [r4, #2448]
	ldr	r3, [sp, #972]
	ldr	r2, [sp, #320]
	str	r1, [r4, #2500]
	str	r2, [r3, #16]
	mov	r3, #51
	ldr	r2, [sp, #316]
	str	r3, [r4, #2456]
	ldr	r3, [sp, #976]
	str	r2, [r3, #16]
	ldr	r3, .L11+256
	add	r2, sl, r3
	mov	r3, #52
	str	r3, [r4, #2504]
	ldr	r3, .L11+260
	str	r2, [r4, #2496]
	mov	r2, #376
	str	r2, [r4, #2524]
	add	r2, sl, r3
	str	r2, [r4, #2544]
	ldr	r2, .L11+264
	mov	r3, #53
	str	r3, [r4, #2552]
	add	r3, sl, r2
	mov	r2, #54
	str	r3, [r4, #2592]
	str	r2, [r4, #2600]
	ldr	r3, [sp, #996]
	ldr	r2, [sp, #988]
	str	r2, [r3, #16]
	ldr	r3, .L11+268
	ldr	r2, .L11+272
	str	r3, [r4, #2620]
	add	r3, sl, r2
	str	r3, [r4, #2640]
	ldr	r3, [sp, #724]
	ldr	r2, [sp, #720]
	str	r3, [r4, #2460]
	ldr	r3, [sp, #716]
	str	r2, [r4, #2468]
	str	r3, [r4, #2472]
	ldr	r3, [sp, #976]
	mov	r2, #404
	str	r2, [r4, #2476]
	str	r3, [r4, #2508]
	ldr	r2, [sp, #972]
	ldr	r3, [sp, #980]
	str	r2, [r4, #2516]
	str	r2, [r4, #2556]
	ldr	r2, [sp, #976]
	str	r3, [r4, #2520]
	str	r2, [r4, #2564]
	ldr	r3, [sp, #992]
	ldr	r2, [sp, #1000]
	str	r3, [r4, #2568]
	str	r2, [r4, #2604]
	ldr	r3, [sp, #996]
	ldr	r2, [sp, #992]
	str	r3, [r4, #2612]
	str	r2, [r4, #2616]
	ldr	r3, [sp, #1000]
	ldr	r2, [sp, #312]
	str	r1, [r4, #2548]
	str	r2, [r3, #16]
	mov	r3, #55
	ldr	r2, [sp, #308]
	str	r3, [r4, #2648]
	ldr	r3, [sp, #1004]
	str	r0, [r4, #2572]
	str	r2, [r3, #16]
	ldr	r3, .L11+276
	str	r1, [r4, #2596]
	add	r2, sl, r3
	str	r2, [r4, #2688]
	ldr	r2, .L11+280
	mov	r3, #56
	str	r3, [r4, #2696]
	add	r3, sl, r2
	str	r3, [r4, #2736]
	ldr	r3, .L11+284
	mov	r2, #57
	str	r2, [r4, #2744]
	add	r2, sl, r3
	str	r2, [r4, #2784]
	ldr	r2, .L11+288
	mov	r3, #58
	str	r3, [r4, #2792]
	add	r3, sl, r2
	mov	r2, #59
	str	r1, [r4, #2644]
	str	r3, [r4, #2832]
	str	r2, [r4, #2840]
	ldr	r2, [sp, #1024]
	ldr	r3, [sp, #1008]
	str	fp, [r4, #2664]
	str	r2, [r3, #16]
	ldr	r2, [sp, #304]
	ldr	r3, [sp, #920]
	str	r1, [r4, #2692]
	str	r2, [r3, #16]
	ldr	r3, [sp, #996]
	ldr	r2, [sp, #1000]
	str	r3, [r4, #2652]
	mov	r3, #384
	str	r2, [r4, #2660]
	str	r3, [r4, #2668]
	ldr	r2, [sp, #1004]
	ldr	r3, [sp, #1008]
	str	r2, [r4, #2708]
	str	r3, [r4, #2700]
	ldr	r2, .L11+356
	ldr	r3, [sp, #1016]
	str	r2, [r4, #2716]
	str	r3, [r4, #2712]
	ldr	r2, [sp, #1004]
	ldr	r3, [sp, #1008]
	str	r2, [r4, #2748]
	str	r3, [r4, #2756]
	ldr	r2, [sp, #1028]
	mov	r3, #316
	str	r3, [r4, #2764]
	ldr	r3, [sp, #924]
	str	r2, [r4, #2760]
	ldr	r2, [sp, #920]
	str	r3, [r4, #2796]
	ldr	r3, [sp, #916]
	str	r2, [r4, #2804]
	mov	r2, #404
	str	r1, [r4, #2740]
	str	r1, [r4, #2788]
	str	r3, [r4, #2808]
	str	r2, [r4, #2812]
	ldr	r3, .L11+292
	ldr	r2, [sp, #920]
	str	r1, [r4, #2836]
	str	r2, [r4, #2844]
	add	r2, sl, r3
	mov	r3, #60
	str	r3, [r4, #2888]
	add	r3, r3, #344
	str	r3, [r4, #2908]
	ldr	r3, .L11+296
	str	r2, [r4, #2880]
	add	r2, sl, r3
	ldr	r3, .L11+300
	str	r2, [r4, #2928]
	add	r2, sl, r3
	str	r2, [r4, #2976]
	ldr	r2, .L11+304
	mov	r3, #62
	str	r3, [r4, #2984]
	add	r3, sl, r2
	mov	r2, #63
	str	r3, [r4, #3024]
	str	r2, [r4, #3032]
	ldr	r3, [sp, #1036]
	ldr	r2, [sp, #924]
	str	r1, [r4, #2884]
	str	r3, [r2, #16]
	ldr	r3, [sp, #300]
	ldr	r2, [sp, #676]
	str	r3, [r2, #16]
	ldr	r2, [sp, #924]
	ldr	r3, [sp, #680]
	str	r2, [r4, #2852]
	ldr	r2, [sp, #1048]
	str	r2, [r3, #16]
	ldr	r2, [sp, #296]
	ldr	r3, [sp, #784]
	str	r2, [r3, #16]
	ldr	r2, [sp, #292]
	ldr	r3, [sp, #788]
	str	r2, [r3, #16]
	mov	r2, #231
	ldr	r3, [sp, #1040]
	str	r2, [r4, #2860]
	ldr	r2, [sp, #680]
	str	r3, [r4, #2856]
	str	r2, [r4, #2892]
	ldr	r3, [sp, #676]
	ldr	r2, [sp, #672]
	str	r3, [r4, #2900]
	ldr	r3, [sp, #676]
	str	r2, [r4, #2904]
	str	r3, [r4, #2940]
	mov	r2, #61
	ldr	r3, [sp, #1052]
	str	r2, [r4, #2936]
	ldr	r2, [sp, #680]
	str	r3, [r4, #2952]
	ldr	r3, [sp, #784]
	str	r2, [r4, #2948]
	ldr	r2, [sp, #788]
	str	r3, [r4, #2996]
	mov	r3, #201
	str	r2, [r4, #2988]
	str	r3, [r4, #3004]
	ldr	r2, [sp, #764]
	ldr	r3, [sp, #784]
	str	r2, [r4, #3000]
	str	r3, [r4, #3036]
	ldr	r2, [sp, #788]
	ldr	r3, .L11+308
	str	r2, [r4, #3044]
	add	r2, sl, r3
	mov	r3, r4
	str	r2, [r3, #3168]!
	str	r3, [sp, #952]
	add	r3, r4, #3120
	add	r2, r4, #3072
	str	r3, [sp, #1060]
	ldr	r3, [sp, #1068]
	str	r2, [sp, #1056]
	add	r2, r4, #3744
	str	r2, [sp, #1080]
	add	r2, r3, #16
	ldr	r3, [sp, #936]
	str	r0, [r4, #2956]
	add	r0, r3, #16
	mov	r3, #64
	str	r1, [r4, #2932]
	str	r1, [r4, #2980]
	str	r1, [r4, #3028]
	str	r3, [r4, #3080]
	ldr	r3, [sp, #1056]
	add	r1, r4, #3808
	str	r2, [r3, #16]
	mov	r3, #65
	str	r3, [r4, #3128]
	ldr	r2, [sp, #1060]
	ldr	r3, .L11+312
	str	r1, [r2, #16]
	add	r2, sl, r3
	ldr	r3, .L11+316
	str	r2, [r4, #3072]
	add	r2, sl, r3
	ldr	r3, [sp, #952]
	str	r2, [r4, #3120]
	str	r0, [r3, #16]
	ldr	r3, .L11+320
	add	r2, sl, r3
	ldr	r3, [sp, #956]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1060]
	str	r7, [r3, #16]
	str	r2, [r4, #3084]
	ldr	r3, [sp, #1056]
	ldr	r2, [sp, #1052]
	str	r3, [r4, #3132]
	str	r2, [r4, #3048]
	str	r3, [r4, #3092]
	ldr	r2, [sp, #1060]
	ldr	r3, [sp, #1072]
	str	r2, [r4, #3140]
	str	r3, [r4, #3096]
	mov	r2, #246
	ldr	r3, [sp, #1080]
	str	r2, [r4, #3052]
	sub	r2, r2, #45
	str	r3, [r4, #3144]
	str	r2, [r4, #3148]
	mov	r3, #239
	ldr	r2, [sp, #952]
	str	r3, [r4, #3100]
	sub	r3, r3, #173
	str	r3, [r2, #8]
	ldr	r3, [sp, #956]
	str	r3, [r2, #12]
	mov	r2, #1
	str	r2, [r4, #3076]
	str	r2, [r4, #3124]
	ldr	r3, [sp, #952]
	ldr	r2, [sp, #932]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #1
	str	r2, [r3, #4]
	add	r2, r2, #200
	str	r2, [r3, #28]
	ldr	r2, [sp, #956]
	mov	r3, #67
	str	r3, [r2, #8]
	sub	r3, r3, #66
	str	r3, [r2, #4]
	ldr	r3, [sp, #952]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #968]
	str	r3, [r2, #24]
	mov	r3, #239
	str	r3, [r2, #28]
	ldr	r3, .L11+324
	add	r2, sl, r3
	str	r2, [r9, #3264]!
	add	r3, r4, #3552
	ldr	r2, [sp, #1024]
	str	r3, [sp, #1012]
	add	r3, r4, #3696
	add	r2, r2, #16
	str	r3, [sp, #1088]
	ldr	r3, [sp, #972]
	str	r2, [sp, #284]
	add	r2, r4, #3504
	str	r2, [sp, #1084]
	add	r2, r3, #16
	ldr	r3, [sp, #968]
	str	r2, [r9, #16]
	add	r1, r3, #16
	ldr	r3, [sp, #1000]
	add	r0, r3, #16
	ldr	r3, [sp, #896]
	add	r3, r3, #16
	str	r3, [sp, #288]
	add	r3, r4, #3712
	str	r3, [sp, #280]
	add	r3, r4, #2704
	str	r3, [sp, #276]
	add	r3, r4, #4480
	str	r3, [sp, #272]
	mov	r3, #68
	str	r3, [r9, #8]
	ldr	r3, .L11+328
	add	r2, sl, r3
	ldr	r3, [sp, #980]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r3, .L11+332
	str	r0, [lr, #16]
	add	r2, sl, r3
	ldr	r3, .L11+336
	str	r2, [lr, #0]
	add	r2, sl, r3
	str	r2, [fp, #0]
	ldr	r3, .L11+340
	ldr	r2, [sp, #288]
	str	r9, [r9, #20]
	str	r2, [fp, #16]
	add	r2, sl, r3
	str	r2, [r4, #3456]
	ldr	r3, [sp, #980]
	ldr	r2, [sp, #976]
	str	r3, [r9, #12]
	str	r2, [r9, #24]
	mov	r3, #376
	ldr	r2, [sp, #980]
	str	r3, [r9, #28]
	mov	r3, #69
	str	r3, [r2, #8]
	ldr	r3, [sp, #960]
	str	r9, [r2, #12]
	str	r3, [r2, #24]
	mov	r3, #50
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	add	r3, r3, #20
	mov	r2, #384
	str	r3, [lr, #8]
	str	r2, [lr, #28]
	ldr	r3, .L11+344
	mov	r2, #71
	str	r2, [fp, #8]
	ldr	r2, [sp, #980]
	str	r3, [fp, #28]
	mov	r3, #1
	str	r3, [r9, #4]
	str	r3, [r2, #4]
	ldr	r3, [sp, #996]
	mov	r2, #1
	str	r3, [lr, #24]
	ldr	r3, [sp, #908]
	str	fp, [lr, #12]
	add	r3, r3, #16
	str	lr, [lr, #20]
	str	r2, [lr, #4]
	str	lr, [fp, #12]
	str	r3, [sp, #1092]
	str	r2, [fp, #4]
	ldr	r2, [sp, #900]
	mov	r3, #1
	str	r2, [fp, #24]
	ldr	r2, [sp, #284]
	str	r3, [r4, #3460]
	add	r3, r3, #71
	str	r2, [r5, #16]
	str	r3, [r4, #3464]
	ldr	r2, [sp, #280]
	ldr	r3, [sp, #1084]
	str	fp, [fp, #20]
	str	r2, [r3, #16]
	ldr	r3, .L11+348
	str	r5, [r4, #3476]
	add	r2, sl, r3
	str	r2, [r4, #3504]
	ldr	r3, [sp, #1012]
	ldr	r2, [sp, #276]
	mov	r0, r4
	str	r2, [r3, #16]
	ldr	r2, .L11+352
	mov	r3, #73
	str	r3, [r4, #3512]
	add	r3, sl, r2
	str	r3, [r4, #3552]
	ldr	r3, [sp, #1008]
	mov	r2, #74
	str	r2, [r4, #3560]
	str	r3, [r4, #3576]
	ldr	r2, .L11+356
	ldr	r3, .L11+360
	str	r2, [r4, #3580]
	add	r2, sl, r3
	mov	r3, #75
	str	r2, [r4, #3600]
	str	r3, [r4, #3608]
	ldr	r2, [sp, #272]
	ldr	r3, [sp, #1016]
	add	r1, r4, #3520
	str	r2, [r3, #16]
	str	r3, [r4, #3620]
	ldr	r3, .L11+364
	mov	lr, #2
	add	r2, sl, r3
	mov	r3, #76
	str	r3, [r4, #3656]
	ldr	r3, [sp, #1084]
	str	r2, [r4, #3648]
	ldr	r2, [sp, #1028]
	str	r3, [r4, #3468]
	mov	r3, #239
	str	r2, [r4, #3480]
	str	r3, [r4, #3484]
	ldr	r3, [sp, #1084]
	mov	r2, #1
	str	r3, [r4, #3524]
	mov	r3, #1
	str	r3, [r4, #3556]
	ldr	r3, [sp, #1012]
	str	r2, [r4, #3508]
	str	r3, [r4, #3572]
	mov	r2, #376
	str	r3, [r4, #3612]
	ldr	r3, [sp, #1032]
	str	r2, [r4, #3532]
	ldr	r2, [sp, #1016]
	str	r3, [r4, #3624]
	mov	r3, #1
	str	r2, [r4, #3564]
	str	r3, [r4, #3652]
	mov	r2, #1
	ldr	r3, [sp, #732]
	str	r2, [r4, #3604]
	add	r2, r2, #49
	add	fp, r3, #16
	str	r2, [r4, #3628]
	ldr	r3, .L11+368
	ldr	r2, [sp, #1088]
	str	r5, [r4, #3516]
	str	r2, [r4, #3660]
	add	r2, sl, r3
	add	r3, r4, #6016
	add	r3, r3, #32
	str	r3, [sp, #1104]
	add	r3, r4, #4800
	str	r2, [r0, #3840]!
	str	r3, [sp, #904]
	add	r2, r4, #5952
	add	r3, r4, #3136
	str	r2, [sp, #1096]
	str	r3, [sp, #268]
	add	r2, r4, #3792
	ldr	r3, [sp, #608]
	str	r2, [sp, #1076]
	add	r2, r4, #5440
	str	r2, [ip, #16]
	add	r3, r3, #16
	ldr	r2, [sp, #1088]
	str	r3, [sp, #264]
	mov	r3, #77
	str	r1, [r2, #16]
	str	r3, [r4, #3704]
	str	ip, [r4, #3528]
	str	ip, [r4, #3708]
	ldr	r3, [sp, #1080]
	mov	r2, #376
	str	fp, [r3, #16]
	mov	r3, #78
	str	r3, [r4, #3752]
	ldr	r3, [sp, #1080]
	str	r2, [r4, #3724]
	mov	r2, #79
	str	r2, [r4, #3800]
	str	r3, [r4, #3804]
	ldr	r2, [sp, #1076]
	ldr	r3, [sp, #268]
	str	r5, [r4, #3720]
	str	r3, [r2, #16]
	ldr	r3, .L11+372
	mov	r2, #201
	str	r2, [r4, #3820]
	add	r2, sl, r3
	ldr	r3, .L11+376
	str	r2, [r4, #3696]
	add	r2, sl, r3
	ldr	r3, .L11+380
	str	r2, [r4, #3744]
	add	r2, sl, r3
	ldr	r3, [sp, #264]
	str	r2, [r4, #3792]
	ldr	r2, [sp, #904]
	str	r3, [r0, #16]
	ldr	r3, [sp, #1044]
	add	r2, r2, #48
	str	r2, [sp, #904]
	str	r3, [r4, #3672]
	mov	r2, #43
	mov	r3, #1
	str	r2, [r4, #3676]
	str	r3, [r4, #3700]
	ldr	r2, [sp, #1088]
	str	r3, [r4, #3748]
	ldr	r3, [sp, #1076]
	str	r2, [r4, #3716]
	str	r3, [r4, #3756]
	ldr	r2, [sp, #1080]
	ldr	r3, [sp, #736]
	str	r2, [r4, #3764]
	str	r3, [r4, #3768]
	mov	r2, #246
	mov	r3, #1
	str	ip, [r4, #3668]
	str	r2, [r4, #3772]
	str	r3, [r4, #3796]
	ldr	r2, [sp, #1076]
	ldr	r3, [sp, #1056]
	str	r2, [r4, #3812]
	str	r3, [r4, #3816]
	mov	r2, #1
	ldr	r3, [sp, #604]
	str	r2, [r0, #8]
	ldr	r2, [sp, #588]
	str	r3, [r0, #12]
	ldr	r3, .L11+384
	add	r2, r2, #16
	str	r2, [r0, #32]
	add	r2, sl, r3
	ldr	r3, [sp, #604]
	mov	r1, r4
	str	r2, [r3, #0]
	add	r2, r3, #16
	ldr	r3, .L11+388
	str	r2, [sp, #260]
	add	r2, sl, r3
	ldr	r3, [sp, #564]
	str	r2, [r1, #3936]!
	add	r3, r3, #16
	str	r3, [sp, #256]
	ldr	r2, [sp, #544]
	ldr	r3, [sp, #536]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #252]
	str	r3, [sp, #248]
	ldr	r2, [sp, #580]
	ldr	r3, [sp, #496]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #244]
	str	r3, [sp, #232]
	ldr	r2, [sp, #1036]
	ldr	r3, [sp, #916]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #224]
	str	r3, [sp, #216]
	ldr	r2, [sp, #868]
	ldr	r3, [sp, #924]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #212]
	str	lr, [r0, #4]
	str	r0, [r0, #20]
	str	r3, [sp, #204]
	ldr	r2, [sp, #832]
	ldr	r3, [sp, #996]
	add	r2, r2, #16
	str	r2, [sp, #200]
	ldr	r2, [sp, #976]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #180]
	str	r2, [sp, #176]
	ldr	r3, [sp, #1028]
	ldr	r2, [sp, #724]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #172]
	str	r2, [sp, #168]
	ldr	r3, [sp, #956]
	ldr	r2, [sp, #980]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #164]
	str	r2, [sp, #160]
	ldr	r3, [sp, #900]
	ldr	r2, [sp, #640]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #152]
	str	r2, [sp, #144]
	ldr	r3, [sp, #716]
	ldr	r2, [sp, #1092]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #140]
	str	r2, [sp, #128]
	ldr	r3, [sp, #888]
	ldr	r2, [sp, #512]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #124]
	str	r2, [sp, #120]
	ldr	r3, [sp, #844]
	ldr	r2, [sp, #532]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #116]
	str	r2, [sp, #108]
	ldr	r3, [sp, #672]
	ldr	r2, [sp, #700]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #104]
	str	r2, [sp, #100]
	ldr	r3, [sp, #880]
	ldr	r2, [sp, #680]
	add	r3, r3, #16
	str	r3, [sp, #96]
	ldr	r3, [sp, #788]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #92]
	str	r3, [sp, #88]
	ldr	r2, [sp, #856]
	ldr	r3, [sp, #928]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #80]
	str	r3, [sp, #76]
	ldr	r2, [sp, #836]
	ldr	r3, [sp, #708]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #72]
	str	r3, [sp, #64]
	ldr	r2, [sp, #764]
	ldr	r3, [sp, #932]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #56]
	str	r3, [sp, #44]
	ldr	r2, [sp, #1056]
	ldr	r3, [sp, #780]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #36]
	str	r3, [sp, #32]
	ldr	r2, [sp, #812]
	ldr	r3, [sp, #628]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #28]
	str	r3, [sp, #24]
	ldr	r2, [sp, #488]
	ldr	r3, [sp, #652]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #20]
	str	r3, [sp, #16]
	ldr	r2, [sp, #596]
	ldr	r3, [sp, #612]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r3, [sp, #572]
	ldr	r2, [sp, #556]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #0]
	add	r3, r4, #6080
	str	r2, [sp, #4]
	add	r3, r3, #16
	add	r2, r4, #5952
	add	r2, r2, #48
	str	r3, [sp, #1108]
	ldr	r3, [sp, #860]
	str	r2, [sp, #1100]
	add	r2, r4, #3952
	str	r2, [sp, #576]
	add	r7, r3, #16
	ldr	r2, [sp, #656]
	ldr	r3, [sp, #624]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #240]
	str	r3, [sp, #236]
	ldr	r2, [sp, #816]
	ldr	r3, [sp, #872]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #228]
	str	r3, [sp, #220]
	ldr	r2, [sp, #840]
	add	r3, r4, #3616
	str	r3, [sp, #196]
	add	r3, r4, #3472
	add	r2, r2, #16
	str	r3, [sp, #188]
	ldr	r3, [sp, #500]
	str	r2, [sp, #208]
	add	r2, r4, #2752
	str	r2, [sp, #192]
	add	r3, r3, #16
	ldr	r2, [sp, #992]
	str	r3, [sp, #156]
	add	r3, r4, #3760
	add	r2, r2, #16
	str	r3, [sp, #136]
	ldr	r3, [sp, #876]
	str	r2, [sp, #184]
	add	r2, r4, #16
	str	r2, [sp, #148]
	add	r3, r3, #16
	ldr	r2, [sp, #884]
	str	r3, [sp, #112]
	ldr	r3, [sp, #1096]
	add	r2, r2, #16
	str	r2, [sp, #132]
	add	r3, r3, #16
	add	r2, r4, #3664
	str	r2, [sp, #84]
	str	r3, [sp, #68]
	ldr	r3, [sp, #1072]
	ldr	r2, [sp, #808]
	add	r3, r3, #16
	str	r3, [sp, #52]
	ldr	r3, [sp, #948]
	add	r2, r2, #16
	str	r2, [sp, #60]
	add	r3, r3, #16
	ldr	r2, [sp, #1104]
	str	r3, [sp, #40]
	ldr	r3, .L14
	add	r2, r2, #16
	str	r3, [r0, #28]
	str	r2, [sp, #48]
	ldr	r3, .L14+4
	ldr	r2, [sp, #584]
	str	r0, [r0, #36]
	str	r2, [r0, #40]
	add	r2, sl, r3
	ldr	r3, [sp, #580]
	mov	fp, #4
	str	r2, [r3, #0]
	ldr	r3, [sp, #576]
	ldr	r2, [sp, #604]
	str	r3, [r2, #16]
	ldr	r2, [sp, #260]
	ldr	r3, [sp, #256]
	str	r2, [r1, #16]
	str	r3, [r1, #32]
	ldr	r2, [sp, #580]
	ldr	r3, [sp, #252]
	str	r3, [r2, #16]
	ldr	r2, [sp, #612]
	mov	r3, #229
	str	r2, [r0, #24]
	ldr	r2, [sp, #604]
	str	r3, [r0, #44]
	sub	r3, r3, #228
	str	r3, [r2, #8]
	ldr	r3, [sp, #580]
	str	r0, [r2, #12]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	str	r0, [r1, #24]
	ldr	r2, [sp, #560]
	ldr	r3, [sp, #604]
	str	r2, [r1, #40]
	mov	r2, #188
	str	r2, [r3, #28]
	ldr	r2, [sp, #580]
	mov	r3, #229
	str	r3, [r1, #44]
	ldr	r3, [sp, #604]
	str	r2, [r1, #12]
	mov	r2, #3
	str	r2, [r3, #4]
	mov	r3, #188
	str	r3, [r1, #28]
	ldr	r3, [sp, #580]
	str	lr, [r1, #4]
	str	r2, [r3, #4]
	ldr	r2, [sp, #548]
	str	r1, [r1, #20]
	str	r2, [r3, #24]
	mov	r2, #185
	str	r1, [r1, #36]
	str	lr, [r1, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #28]
	str	lr, [r3, #8]
	str	r3, [r3, #20]
	ldr	r3, [sp, #540]
	str	r1, [r8, #40]
	str	r3, [r8, #24]
	ldr	r3, .L14+8
	add	r2, sl, r3
	ldr	r3, [sp, #244]
	str	r2, [r8, #0]
	str	r3, [r8, #32]
	ldr	r2, [sp, #248]
	ldr	r3, .L14+12
	str	r2, [r8, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #548]
	str	r2, [r3, #0]
	str	r7, [r3, #16]
	ldr	r3, .L14+16
	add	r2, sl, r3
	ldr	r3, [sp, #632]
	str	r2, [r3, #0]
	ldr	r2, [sp, #240]
	str	r8, [r8, #20]
	str	r2, [r3, #16]
	ldr	r2, [sp, #236]
	str	r8, [r8, #36]
	str	r2, [r3, #32]
	ldr	r3, .L14+20
	str	lr, [r8, #4]
	add	r2, sl, r3
	ldr	r3, [sp, #640]
	str	r2, [r3, #0]
	ldr	r2, [sp, #548]
	mov	r3, #3
	str	r2, [r8, #12]
	mov	r2, #231
	str	r3, [r8, #8]
	str	r2, [r8, #28]
	ldr	r3, [sp, #548]
	sub	r2, r2, #46
	str	r2, [r8, #44]
	sub	r2, r2, #57
	str	r2, [r3, #28]
	sub	r2, r2, #125
	str	r8, [r3, #12]
	str	r2, [r3, #8]
	ldr	r2, [sp, #632]
	ldr	r3, .L14+24
	str	r3, [r2, #28]
	ldr	r3, [sp, #632]
	mov	r2, #236
	str	r2, [r3, #44]
	ldr	r2, [sp, #548]
	ldr	r3, [sp, #856]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r2, [sp, #632]
	ldr	r3, [sp, #548]
	str	fp, [r2, #8]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r3, [sp, #632]
	ldr	r2, [sp, #640]
	str	r2, [r3, #12]
	str	lr, [r3, #4]
	ldr	r2, [sp, #652]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #628]
	str	r3, [r3, #36]
	str	r2, [r3, #40]
	ldr	r3, [sp, #640]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r2, [sp, #232]
	str	r2, [r3, #16]
	ldr	r3, .L14+28
	add	r2, sl, r3
	ldr	r3, [sp, #828]
	str	r2, [r3, #0]
	ldr	r2, [sp, #228]
	str	r2, [r3, #16]
	ldr	r2, [sp, #224]
	str	r2, [r3, #32]
	ldr	r3, .L14+32
	add	r2, sl, r3
	ldr	r3, [sp, #836]
	str	r2, [r3, #0]
	ldr	r2, [sp, #220]
	str	r2, [r3, #16]
	ldr	r3, .L14+36
	add	r2, sl, r3
	ldr	r3, [sp, #216]
	str	r2, [r6, #0]
	str	r3, [r6, #16]
	ldr	r2, [sp, #640]
	ldr	r3, [sp, #632]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #500]
	str	fp, [r2, #8]
	str	r3, [r2, #24]
	mov	r3, #185
	str	r3, [r2, #28]
	ldr	r2, [sp, #828]
	ldr	r3, [sp, #836]
	str	r3, [r2, #12]
	ldr	r3, [sp, #812]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1040]
	str	r2, [r2, #36]
	str	r3, [r2, #40]
	mov	r3, #5
	str	r3, [r2, #8]
	add	r3, r3, #234
	str	r3, [r2, #28]
	add	r3, r3, #132
	str	r3, [r2, #44]
	ldr	r3, [sp, #836]
	str	lr, [r2, #4]
	str	r2, [r3, #12]
	ldr	r2, [sp, #864]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #912]
	ldr	r2, [sp, #836]
	str	r3, [r6, #24]
	mov	r3, #3
	str	r3, [r2, #4]
	add	r3, r3, lr
	str	r3, [r2, #8]
	add	r3, r3, #150
	str	r3, [r2, #28]
	ldr	r3, [sp, #848]
	mov	r2, #6
	str	r3, [r6, #12]
	ldr	r3, [sp, #212]
	str	r2, [r6, #8]
	str	r3, [r6, #32]
	ldr	r3, .L14+40
	add	r2, r2, #233
	str	r2, [r6, #28]
	add	r2, sl, r3
	ldr	r3, [sp, #848]
	str	lr, [r6, #4]
	str	r2, [r3, #0]
	ldr	r2, [sp, #208]
	str	r6, [r6, #20]
	str	r2, [r3, #16]
	ldr	r3, .L14+44
	add	r2, sl, r3
	ldr	r3, [sp, #1032]
	str	r2, [r3, #0]
	ldr	r3, .L14+48
	str	r6, [r6, #36]
	add	r2, sl, r3
	ldr	r3, .L14+52
	str	r2, [r4, r3]
	ldr	r3, .L14+56
	add	r2, sl, r3
	ldr	r3, .L14+60
	str	r2, [r4, r3]
	ldr	r2, [sp, #1032]
	ldr	r3, [sp, #204]
	str	r3, [r2, #16]
	ldr	r3, [sp, #200]
	str	r3, [r2, #32]
	ldr	r3, [sp, #196]
	ldr	r2, [sp, #1040]
	str	r3, [r2, #16]
	ldr	r2, [sp, #872]
	ldr	r3, [sp, #848]
	str	r2, [r6, #40]
	ldr	r2, .L14+64
	str	r6, [r3, #12]
	str	r2, [r6, #44]
	mov	r2, #6
	str	r2, [r3, #8]
	add	r2, r2, #55
	str	r2, [r3, #28]
	ldr	r2, [sp, #844]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1032]
	ldr	r2, [sp, #920]
	str	r2, [r3, #24]
	ldr	r2, [sp, #1040]
	str	r2, [r3, #12]
	ldr	r3, [sp, #848]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r3, [sp, #1032]
	add	r2, r2, fp
	str	r2, [r3, #8]
	add	r2, r2, #224
	str	r2, [r3, #28]
	ldr	r2, [sp, #836]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r2, [r3, #40]
	ldr	r2, [sp, #1040]
	str	r3, [r2, #12]
	ldr	r3, [sp, #1012]
	str	r3, [r2, #24]
	ldr	r2, [sp, #1032]
	ldr	r3, .L14+64
	str	r3, [r2, #44]
	ldr	r2, [sp, #1040]
	sub	r3, r3, #364
	str	r3, [r2, #8]
	add	r3, r3, #43
	str	r3, [r2, #28]
	ldr	r2, [sp, #1032]
	ldr	r3, [sp, #1040]
	str	lr, [r2, #4]
	mov	r2, #3
	str	r2, [r3, #4]
	str	r3, [r3, #20]
	ldr	r3, [sp, #1020]
	str	lr, [r3, #4]
	ldr	r3, .L14+68
	add	r2, sl, r3
	ldr	r3, .L14+72
	str	r2, [r4, r3]
	ldr	r2, [sp, #1020]
	mov	r3, #316
	str	r3, [r2, #28]
	ldr	r3, [sp, #1004]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1084]
	str	r3, [r2, #40]
	ldr	r3, [sp, #192]
	str	r3, [r2, #16]
	ldr	r3, [sp, #188]
	str	r3, [r2, #32]
	ldr	r3, .L14+76
	add	r2, sl, r3
	ldr	r3, [sp, #984]
	str	r2, [r3, #0]
	ldr	r3, [sp, #184]
	ldr	r2, [sp, #1028]
	str	r3, [r2, #16]
	ldr	r3, .L14+80
	add	r2, sl, r3
	ldr	r3, [sp, #992]
	str	r2, [r3, #0]
	ldr	r2, [sp, #984]
	ldr	r3, [sp, #180]
	str	r3, [r2, #16]
	ldr	r3, [sp, #176]
	str	r3, [r2, #32]
	ldr	r2, [sp, #1020]
	ldr	r3, [sp, #1028]
	str	r3, [r2, #12]
	mov	r3, #8
	str	r3, [r2, #8]
	add	r3, r3, #231
	str	r3, [r2, #44]
	ldr	r2, [sp, #1028]
	sub	r3, r3, #231
	str	r3, [r2, #8]
	ldr	r2, [sp, #1020]
	ldr	r3, [sp, #1028]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	mov	r2, #155
	str	r2, [r3, #28]
	ldr	r2, [sp, #984]
	ldr	r3, .L14+84
	str	r3, [r2, #28]
	ldr	r3, [sp, #1028]
	ldr	r2, [sp, #1020]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #984]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1000]
	str	r3, [r2, #24]
	ldr	r3, [sp, #972]
	str	r3, [r2, #40]
	ldr	r2, [sp, #1028]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r2, [sp, #984]
	add	r3, r3, #6
	str	r3, [r2, #8]
	add	r3, r3, #230
	str	lr, [r2, #4]
	str	r3, [r2, #44]
	ldr	r2, [sp, #992]
	sub	r3, r3, #230
	str	r3, [r2, #8]
	ldr	r3, [sp, #984]
	str	r2, [r3, #12]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r3, [sp, #984]
	str	r3, [r2, #12]
	ldr	r3, [sp, #1020]
	str	r3, [r2, #24]
	mov	r3, #155
	str	r3, [r2, #28]
	ldr	r3, [sp, #172]
	str	r3, [r2, #16]
	ldr	r2, [sp, #960]
	ldr	r3, [sp, #720]
	str	r3, [r2, #24]
	ldr	r3, [sp, #952]
	str	r3, [r2, #40]
	ldr	r3, [sp, #168]
	str	r3, [r2, #16]
	ldr	r3, [sp, #164]
	str	r3, [r2, #32]
	ldr	r3, .L14+88
	add	r2, sl, r3
	ldr	r3, [sp, #960]
	str	r2, [r3, #0]
	ldr	r3, [sp, #160]
	ldr	r2, [sp, #968]
	str	r3, [r2, #16]
	ldr	r3, .L14+92
	add	r2, sl, r3
	ldr	r3, [sp, #968]
	str	r2, [r3, #0]
	ldr	r3, [sp, #156]
	ldr	r2, [sp, #908]
	str	r3, [r2, #16]
	ldr	r3, .L14+96
	add	r2, sl, r3
	ldr	r3, [sp, #908]
	str	r2, [r3, #0]
	ldr	r2, [sp, #892]
	str	r2, [r3, #32]
	ldr	r3, [sp, #992]
	ldr	r2, [sp, #960]
	str	r3, [r3, #20]
	mov	r3, #10
	str	r3, [r2, #8]
	ldr	r3, [sp, #968]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	str	r9, [r3, #24]
	mov	r3, #239
	str	r3, [r2, #28]
	ldr	r3, [sp, #968]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	mov	r3, #239
	str	r3, [r2, #44]
	ldr	r2, [sp, #968]
	sub	r3, r3, #229
	str	r3, [r2, #8]
	add	r3, r3, #40
	str	r3, [r2, #28]
	ldr	r2, [sp, #960]
	ldr	r3, [sp, #968]
	str	lr, [r2, #4]
	mov	r2, #3
	str	r2, [r3, #4]
	str	r3, [r3, #20]
	ldr	r3, [sp, #908]
	add	r2, r2, #8
	str	r2, [r3, #8]
	ldr	r2, [sp, #904]
	str	lr, [r3, #4]
	str	r2, [r3, #12]
	ldr	r2, [sp, #492]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #188
	str	r2, [r3, #28]
	str	r3, [r3, #36]
	ldr	r3, .L14+100
	add	r2, sl, r3
	ldr	r3, [sp, #904]
	str	r2, [r3, #0]
	ldr	r2, [sp, #152]
	str	r2, [r3, #16]
	ldr	r3, .L14+104
	add	r2, sl, r3
	ldr	r3, [sp, #492]
	str	r2, [r3, #0]
	ldr	r2, [sp, #148]
	str	r2, [r3, #16]
	ldr	r2, [sp, #144]
	str	r2, [r3, #32]
	ldr	r3, .L14+108
	add	r2, sl, r3
	ldr	r3, [sp, #500]
	str	r2, [r3, #0]
	ldr	r3, .L14+112
	add	r2, sl, r3
	ldr	r3, [sp, #728]
	str	r2, [r3, #0]
	ldr	r2, [sp, #908]
	ldr	r3, .L14+116
	str	r3, [r2, #44]
	ldr	r2, [sp, #904]
	sub	r3, r3, #484
	str	r3, [r2, #8]
	ldr	r3, [sp, #520]
	ldr	r2, [sp, #908]
	str	r3, [r2, #40]
	ldr	r2, [sp, #904]
	ldr	r3, [sp, #896]
	str	r3, [r2, #24]
	ldr	r3, [sp, #908]
	str	r3, [r2, #12]
	ldr	r3, [sp, #632]
	ldr	r2, [sp, #492]
	str	r3, [r2, #40]
	ldr	r2, [sp, #904]
	mov	r3, #43
	str	r3, [r2, #28]
	ldr	r2, [sp, #492]
	add	r3, r3, #142
	str	r3, [r2, #44]
	ldr	r2, [sp, #904]
	sub	r3, r3, #182
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	r2, [sp, #492]
	add	r3, r3, #9
	str	r3, [r2, #8]
	ldr	r3, [sp, #500]
	str	r3, [r2, #12]
	mov	r3, #231
	str	r3, [r2, #28]
	ldr	r2, [sp, #500]
	sub	r3, r3, #43
	str	r3, [r2, #28]
	sub	r3, r3, #176
	str	r3, [r2, #8]
	ldr	r2, [sp, #492]
	ldr	r3, [sp, #488]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, [sp, #500]
	str	r2, [r2, #36]
	str	lr, [r2, #4]
	str	r2, [r3, #12]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r2, [sp, #1092]
	str	r3, [r3, #20]
	str	r2, [r3, #16]
	ldr	r2, [sp, #904]
	str	r2, [r3, #24]
	ldr	r3, [sp, #728]
	mov	r2, #13
	str	r2, [r3, #8]
	ldr	r2, [sp, #736]
	str	lr, [r3, #4]
	str	r2, [r3, #12]
	ldr	r2, [sp, #712]
	str	r2, [r3, #24]
	ldr	r2, [sp, #1076]
	str	r2, [r3, #40]
	ldr	r2, [sp, #140]
	str	r2, [r3, #16]
	ldr	r2, [sp, #136]
	str	r2, [r3, #32]
	ldr	r3, .L14+120
	add	r2, sl, r3
	ldr	r3, [sp, #736]
	str	r2, [r3, #0]
	ldr	r2, [sp, #132]
	str	r2, [r3, #16]
	ldr	r3, .L14+124
	add	r2, sl, r3
	ldr	r3, [sp, #524]
	str	r2, [r3, #0]
	ldr	r2, [sp, #128]
	str	r2, [r3, #16]
	ldr	r2, [sp, #124]
	str	r2, [r3, #32]
	ldr	r3, .L14+128
	add	r2, sl, r3
	ldr	r3, [sp, #520]
	str	r2, [r3, #0]
	ldr	r2, [sp, #120]
	str	r2, [r3, #16]
	ldr	r3, [sp, #728]
	mov	r2, #231
	str	r2, [r3, #28]
	ldr	r2, [sp, #736]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	mov	r2, #246
	str	r2, [r3, #44]
	ldr	r2, [sp, #736]
	mov	r3, #120
	str	r3, [r2, #28]
	sub	r3, r3, #107
	str	r3, [r2, #8]
	ldr	r2, [sp, #524]
	ldr	r3, .L14+116
	str	r3, [r2, #28]
	sub	r3, r3, #162
	str	r3, [r2, #44]
	ldr	r2, [sp, #736]
	ldr	r3, [sp, #888]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r2, [sp, #524]
	ldr	r3, [sp, #904]
	str	r3, [r2, #24]
	ldr	r3, [sp, #884]
	str	r3, [r2, #40]
	ldr	r2, [sp, #736]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r2, [sp, #524]
	add	r3, r3, #11
	str	r3, [r2, #8]
	ldr	r2, [sp, #520]
	str	r3, [r2, #8]
	ldr	r3, [sp, #524]
	str	r2, [r3, #12]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	lr, [r3, #4]
	str	r3, [r2, #12]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r3, [sp, #516]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	mov	r3, #43
	str	r3, [r2, #28]
	ldr	r2, [sp, #796]
	ldr	r3, [sp, #840]
	str	r3, [r2, #24]
	ldr	r3, .L14+132
	str	r3, [r2, #28]
	ldr	r3, [sp, #796]
	ldr	r2, .L14+136
	str	r2, [r3, #44]
	ldr	r2, [sp, #116]
	str	r2, [r3, #16]
	ldr	r2, [sp, #112]
	str	r2, [r3, #32]
	ldr	r3, .L14+140
	add	r2, sl, r3
	ldr	r3, [sp, #796]
	str	r2, [r3, #0]
	ldr	r3, [sp, #108]
	ldr	r2, [sp, #792]
	str	r3, [r2, #16]
	ldr	r3, .L14+144
	add	r2, sl, r3
	ldr	r3, [sp, #792]
	str	r2, [r3, #0]
	ldr	r3, [sp, #104]
	ldr	r2, [sp, #684]
	str	r3, [r2, #16]
	ldr	r3, .L14+148
	add	r2, sl, r3
	ldr	r3, [sp, #684]
	str	r2, [r3, #0]
	ldr	r2, [sp, #100]
	str	r2, [r3, #32]
	ldr	r3, [sp, #796]
	ldr	r2, [sp, #792]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #880]
	str	r3, [r3, #36]
	str	r2, [r3, #40]
	ldr	r2, [sp, #792]
	str	r3, [r2, #12]
	ldr	r3, [sp, #528]
	str	r3, [r2, #24]
	ldr	r2, [sp, #684]
	ldr	r3, [sp, #668]
	str	r3, [r2, #24]
	ldr	r3, [sp, #696]
	str	r3, [r2, #40]
	ldr	r2, [sp, #796]
	mov	r3, #15
	str	r3, [r2, #8]
	ldr	r2, [sp, #792]
	str	r3, [r2, #8]
	add	r3, r3, #35
	str	r3, [r2, #28]
	ldr	r2, [sp, #684]
	add	r3, r3, #181
	str	r3, [r2, #28]
	ldr	r2, [sp, #792]
	ldr	r3, [sp, #796]
	str	r2, [r2, #20]
	ldr	r2, [sp, #684]
	str	lr, [r3, #4]
	mov	r3, #16
	str	r3, [r2, #8]
	ldr	r2, [sp, #792]
	sub	r3, r3, #13
	str	r3, [r2, #4]
	ldr	r2, [sp, #684]
	ldr	r3, [sp, #692]
	str	lr, [r2, #4]
	str	r3, [r2, #12]
	mov	r3, #239
	str	r3, [r2, #44]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	ldr	r2, [sp, #692]
	sub	r3, r3, #111
	str	r3, [r2, #28]
	ldr	r3, [sp, #684]
	str	r3, [r2, #12]
	mov	r3, #16
	str	r3, [r2, #8]
	ldr	r3, [sp, #876]
	str	r3, [r2, #24]
	ldr	r3, [sp, #96]
	str	r3, [r2, #16]
	ldr	r3, .L14+152
	add	r2, sl, r3
	ldr	r3, [sp, #692]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1044]
	ldr	r3, [sp, #676]
	str	r3, [r2, #24]
	mov	r3, #239
	str	r3, [r2, #28]
	ldr	r3, [sp, #784]
	str	r3, [r2, #40]
	mov	r3, #246
	str	r3, [r2, #44]
	ldr	r3, .L14+156
	add	r2, sl, r3
	ldr	r3, [sp, #1044]
	str	r2, [r3, #0]
	ldr	r3, .L14+160
	add	r2, sl, r3
	ldr	r3, .L14+164
	str	r2, [r4, r3]
	ldr	r2, [sp, #1044]
	ldr	r3, [sp, #92]
	str	r3, [r2, #16]
	ldr	r3, [sp, #88]
	str	r3, [r2, #32]
	ldr	r3, .L14+168
	add	r2, sl, r3
	ldr	r3, [sp, #864]
	str	r2, [r3, #0]
	ldr	r3, [sp, #84]
	ldr	r2, [sp, #1052]
	str	r3, [r2, #16]
	ldr	r3, [sp, #80]
	ldr	r2, [sp, #864]
	str	r3, [r2, #16]
	ldr	r2, [sp, #692]
	mov	r3, #3
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	r3, [sp, #1052]
	ldr	r2, [sp, #1044]
	str	r3, [r2, #12]
	ldr	r2, [sp, #1088]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1044]
	mov	r2, #17
	str	r2, [r3, #8]
	ldr	r3, [sp, #1052]
	str	r2, [r3, #8]
	add	r2, r2, #26
	str	r2, [r3, #28]
	ldr	r3, [sp, #1044]
	ldr	r2, [sp, #1052]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	lr, [r3, #4]
	str	r3, [r2, #12]
	mov	r3, #3
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	r2, [sp, #864]
	add	r3, r3, #15
	str	r3, [r2, #8]
	ldr	r3, [sp, #872]
	str	lr, [r2, #4]
	str	r3, [r2, #12]
	ldr	r3, [sp, #860]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, [sp, #848]
	str	r3, [r2, #40]
	mov	r3, #231
	str	r3, [r2, #28]
	add	r3, r3, #140
	str	r3, [r2, #44]
	ldr	r3, [sp, #828]
	ldr	r2, [sp, #872]
	str	r3, [r2, #24]
	ldr	r3, [sp, #76]
	ldr	r2, [sp, #864]
	str	r3, [r2, #32]
	ldr	r2, [sp, #872]
	mov	r3, #18
	str	r3, [r2, #8]
	add	r3, r3, #137
	str	r3, [r2, #28]
	ldr	r3, [sp, #72]
	str	r3, [r2, #16]
	ldr	r3, .L14+172
	add	r2, sl, r3
	ldr	r3, [sp, #872]
	str	r2, [r3, #0]
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #800]
	str	r3, [r2, #16]
	ldr	r3, .L14+176
	add	r2, sl, r3
	ldr	r3, [sp, #800]
	str	r2, [r3, #0]
	ldr	r2, [sp, #64]
	str	r2, [r3, #32]
	ldr	r3, .L14+180
	add	r2, sl, r3
	ldr	r3, [sp, #808]
	str	r2, [r3, #0]
	ldr	r2, [sp, #776]
	str	r2, [r3, #16]
	ldr	r3, [sp, #864]
	ldr	r2, [sp, #872]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	ldr	r2, [sp, #704]
	ldr	r3, [sp, #800]
	str	r2, [r3, #40]
	ldr	r3, [sp, #872]
	mov	r2, #3
	str	r2, [r3, #4]
	str	r3, [r3, #20]
	ldr	r2, [sp, #808]
	ldr	r3, [sp, #800]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1100]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #153
	str	r2, [r3, #8]
	add	r2, r2, #100
	str	r2, [r3, #28]
	sub	r2, r2, #7
	str	lr, [r3, #4]
	str	r2, [r3, #44]
	str	r3, [r3, #36]
	ldr	r3, [sp, #808]
	sub	r2, r2, #93
	str	r2, [r3, #8]
	sub	r2, r2, #150
	str	r2, [r3, #4]
	ldr	r2, [sp, #800]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #780]
	str	r2, [r3, #24]
	mov	r2, #0
	str	r2, [r3, #28]
	ldr	r3, [sp, #772]
	ldr	r2, [sp, #800]
	str	r2, [r3, #24]
	ldr	r2, [sp, #768]
	str	r2, [r3, #40]
	ldr	r3, .L14+184
	add	r2, sl, r3
	ldr	r3, [sp, #772]
	str	r2, [r3, #0]
	ldr	r2, [sp, #60]
	str	r2, [r3, #16]
	ldr	r2, [sp, #56]
	str	r2, [r3, #32]
	ldr	r3, .L14+188
	add	r2, sl, r3
	ldr	r3, [sp, #780]
	str	r2, [r3, #0]
	ldr	r2, [sp, #52]
	str	r2, [r3, #16]
	ldr	r3, .L14+192
	add	r2, sl, r3
	ldr	r3, [sp, #940]
	str	r2, [r3, #0]
	ldr	r2, [sp, #48]
	str	r2, [r3, #16]
	ldr	r2, [sp, #44]
	str	r2, [r3, #32]
	ldr	r3, .L14+196
	add	r2, sl, r3
	ldr	r3, [sp, #948]
	str	r2, [r3, #0]
	ldr	r2, [sp, #772]
	ldr	r3, [sp, #780]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	mov	r3, #154
	str	r3, [r2, #8]
	sub	r3, r3, #154
	str	r3, [r2, #28]
	add	r3, r3, #239
	str	r3, [r2, #44]
	str	r2, [r2, #36]
	ldr	r2, [sp, #780]
	sub	r3, r3, #85
	str	r3, [r2, #8]
	ldr	r3, [sp, #772]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #1064]
	str	r3, [r2, #24]
	ldr	r3, [sp, #936]
	ldr	r2, [sp, #940]
	str	r3, [r2, #40]
	ldr	r2, [sp, #780]
	mov	r3, #0
	str	r3, [r2, #28]
	ldr	r2, [sp, #940]
	add	r3, r3, #246
	str	r3, [r2, #44]
	ldr	r2, [sp, #772]
	ldr	r3, [sp, #940]
	str	lr, [r2, #4]
	mov	r2, #155
	str	r2, [r3, #8]
	ldr	r3, [sp, #780]
	sub	r2, r2, #152
	str	r2, [r3, #4]
	ldr	r3, [sp, #940]
	ldr	r2, [sp, #948]
	str	lr, [r3, #4]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1108]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, .L14+200
	str	r3, [r3, #36]
	str	r2, [r3, #28]
	ldr	r3, [sp, #948]
	mov	r2, #3
	str	r2, [r3, #4]
	add	r2, r2, #152
	str	r2, [r3, #8]
	ldr	r2, [sp, #1068]
	str	r2, [r3, #16]
	ldr	r3, .L14+204
	add	r2, sl, r3
	ldr	r3, [sp, #1064]
	str	r2, [r3, #0]
	ldr	r2, [sp, #40]
	str	lr, [r3, #4]
	str	r2, [r3, #16]
	ldr	r2, [sp, #36]
	str	r2, [r3, #32]
	ldr	r3, .L14+208
	add	r2, sl, r3
	ldr	r3, [sp, #1072]
	str	r2, [r3, #0]
	mov	r2, #3
	str	r2, [r3, #4]
	ldr	r2, [sp, #32]
	str	r2, [r3, #16]
	ldr	r3, .L14+212
	add	r2, sl, r3
	ldr	r3, [sp, #1096]
	str	r2, [r3, #0]
	ldr	r2, [sp, #804]
	str	r2, [r3, #16]
	ldr	r3, [sp, #948]
	ldr	r2, [sp, #940]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	ldr	r2, [sp, #1072]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1064]
	ldr	r2, [sp, #940]
	str	r2, [r3, #24]
	ldr	r2, [sp, #1060]
	str	r2, [r3, #40]
	ldr	r3, [sp, #948]
	mov	r2, #0
	str	r2, [r3, #28]
	ldr	r3, [sp, #1064]
	add	r2, r2, #239
	str	r2, [r3, #44]
	ldr	r2, [sp, #1072]
	str	r2, [r3, #12]
	ldr	r3, [sp, #772]
	str	r3, [r2, #24]
	ldr	r2, [sp, #1064]
	ldr	r3, [sp, #1072]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	ldr	r3, [sp, #808]
	ldr	r2, [sp, #1096]
	str	r3, [r2, #24]
	ldr	r2, [sp, #1064]
	mov	r3, #156
	str	r3, [r2, #8]
	sub	r3, r3, #156
	str	r3, [r2, #28]
	ldr	r2, [sp, #1072]
	str	r3, [r2, #28]
	add	r3, r3, #156
	str	r3, [r2, #8]
	ldr	r2, [sp, #1096]
	add	r3, r3, #97
	str	r3, [r2, #28]
	ldr	r2, [sp, #1072]
	ldr	r3, [sp, #1096]
	str	r2, [r2, #20]
	ldr	r2, [sp, #1100]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	str	fp, [r3, #4]
	ldr	r3, .L14+216
	add	r2, sl, r3
	ldr	r3, .L14+220
	str	r2, [r4, r3]
	ldr	r3, [sp, #1096]
	ldr	r2, [sp, #1100]
	str	r3, [r2, #12]
	ldr	r3, .L14+224
	add	r2, sl, r3
	ldr	r3, .L14+228
	str	r2, [r4, r3]
	ldr	r3, .L14+232
	add	r2, sl, r3
	ldr	r3, .L14+236
	str	r2, [r4, r3]
	ldr	r3, [sp, #948]
	ldr	r2, [sp, #1104]
	str	r3, [r2, #24]
	ldr	r3, .L14+240
	add	r2, sl, r3
	ldr	r3, [sp, #820]
	str	r2, [r3, #0]
	ldr	r3, [sp, #944]
	ldr	r2, [sp, #1104]
	str	r3, [r2, #16]
	ldr	r3, .L14+244
	add	r2, sl, r3
	ldr	r3, [sp, #824]
	str	r2, [r3, #0]
	ldr	r2, [sp, #1104]
	ldr	r3, .L14+200
	str	r3, [r2, #28]
	ldr	r3, .L14+248
	add	r2, sl, r3
	ldr	r3, [sp, #644]
	str	r2, [r3, #0]
	ldr	r2, [sp, #820]
	ldr	r3, [sp, #28]
	str	r3, [r2, #16]
	ldr	r3, .L14+252
	str	r3, [r2, #28]
	ldr	r2, .L14+256
	add	r3, sl, r2
	b	.L15
.L16:
	.align	2
.L14:
	.word	518
	.word	.LC83(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	417
	.word	.LC88(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.word	4464
	.word	.LC94(GOTOFF)
	.word	4512
	.word	371
	.word	.LC95(GOTOFF)
	.word	4560
	.word	.LC96(GOTOFF)
	.word	.LC97(GOTOFF)
	.word	309
	.word	.LC98(GOTOFF)
	.word	.LC99(GOTOFF)
	.word	.LC100(GOTOFF)
	.word	.LC101(GOTOFF)
	.word	.LC102(GOTOFF)
	.word	.LC103(GOTOFF)
	.word	.LC104(GOTOFF)
	.word	495
	.word	.LC105(GOTOFF)
	.word	.LC106(GOTOFF)
	.word	.LC107(GOTOFF)
	.word	433
	.word	326
	.word	.LC108(GOTOFF)
	.word	.LC109(GOTOFF)
	.word	.LC110(GOTOFF)
	.word	.LC111(GOTOFF)
	.word	.LC112(GOTOFF)
	.word	.LC113(GOTOFF)
	.word	5424
	.word	.LC114(GOTOFF)
	.word	.LC115(GOTOFF)
	.word	.LC116(GOTOFF)
	.word	.LC117(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC119(GOTOFF)
	.word	.LC120(GOTOFF)
	.word	.LC121(GOTOFF)
	.word	282
	.word	.LC122(GOTOFF)
	.word	.LC123(GOTOFF)
	.word	.LC124(GOTOFF)
	.word	.LC125(GOTOFF)
	.word	6000
	.word	.LC126(GOTOFF)
	.word	6048
	.word	.LC127(GOTOFF)
	.word	6096
	.word	.LC128(GOTOFF)
	.word	.LC129(GOTOFF)
	.word	.LC130(GOTOFF)
	.word	514
	.word	.LC131(GOTOFF)
	.word	325
	.word	.LC132(GOTOFF)
	.word	.LC133(GOTOFF)
	.word	.LC134(GOTOFF)
	.word	.LC135(GOTOFF)
	.word	.LC136(GOTOFF)
	.word	.LC137(GOTOFF)
	.word	.LC138(GOTOFF)
	.word	.LC139(GOTOFF)
	.word	.LC140(GOTOFF)
	.word	.LC141(GOTOFF)
	.word	.LC142(GOTOFF)
	.word	.LC143(GOTOFF)
.L15:
	ldr	r2, [sp, #648]
	str	r3, [r2, #0]
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #644]
	str	r2, [r3, #16]
	ldr	r2, [sp, #644]
	ldr	r3, .L14+260
	str	r3, [r2, #28]
	ldr	r2, .L14+264
	add	r3, sl, r2
	ldr	r2, [sp, #504]
	str	r3, [r2, #0]
	ldr	r3, [sp, #1104]
	ldr	r2, [sp, #1108]
	str	r3, [r3, #20]
	str	r2, [r3, #12]
	str	r3, [r2, #12]
	ldr	r2, [sp, #816]
	ldr	r3, [sp, #820]
	str	r2, [r3, #24]
	ldr	r3, [sp, #1100]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r2, [sp, #824]
	ldr	r3, [sp, #820]
	str	r2, [r3, #12]
	ldr	r3, [sp, #1104]
	ldr	r2, [sp, #820]
	str	fp, [r3, #4]
	ldr	r3, [sp, #824]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	ldr	r3, [sp, #624]
	ldr	r2, [sp, #644]
	str	r3, [r2, #24]
	ldr	r2, [sp, #1108]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r3, [sp, #648]
	ldr	r2, [sp, #644]
	str	r3, [r2, #12]
	ldr	r2, [sp, #820]
	ldr	r3, [sp, #644]
	str	fp, [r2, #4]
	ldr	r2, [sp, #648]
	str	r3, [r3, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #824]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r3, [sp, #644]
	str	fp, [r3, #4]
	ldr	r3, [sp, #648]
	str	r2, [r3, #4]
	ldr	r2, [sp, #504]
	ldr	r3, .L14+268
	str	fp, [r2, #4]
	str	r4, [r2, #24]
	add	r2, sl, r3
	ldr	r3, [sp, #508]
	str	r2, [r3, #0]
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #504]
	str	r3, [r2, #16]
	ldr	r3, .L14+272
	add	r2, sl, r3
	ldr	r3, [sp, #660]
	str	r2, [r3, #0]
	ldr	r2, [sp, #504]
	mov	r3, #504
	str	r3, [r2, #28]
	ldr	r2, .L14+276
	add	r3, sl, r2
	ldr	r2, [sp, #664]
	str	r3, [r2, #0]
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #660]
	str	r2, [r3, #16]
	ldr	r3, .L14+280
	add	r2, sl, r3
	ldr	r3, [sp, #740]
	str	r2, [r3, #0]
	ldr	r2, [sp, #660]
	mov	r3, #144
	str	r3, [r2, #28]
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #740]
	str	r2, [r3, #16]
	ldr	r3, .L14+284
	add	r2, sl, r3
	ldr	r3, [sp, #744]
	str	r2, [r3, #0]
	ldr	r3, [sp, #8]
	ldr	r2, [sp, #616]
	str	r3, [r2, #16]
	ldr	r3, .L14+288
	add	r2, sl, r3
	ldr	r3, [sp, #616]
	str	r2, [r3, #0]
	ldr	r2, [sp, #504]
	ldr	r3, [sp, #508]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	str	r2, [r3, #12]
	ldr	r2, [sp, #660]
	ldr	r3, [sp, #656]
	str	r2, [r2, #20]
	str	r3, [r2, #24]
	ldr	r3, [sp, #664]
	str	r3, [r2, #12]
	str	r2, [r3, #12]
	ldr	r3, [sp, #592]
	ldr	r2, [sp, #740]
	str	r3, [r2, #24]
	ldr	r2, [sp, #508]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r3, [sp, #744]
	ldr	r2, [sp, #740]
	str	r3, [r2, #12]
	ldr	r2, [sp, #660]
	ldr	r3, [sp, #740]
	str	fp, [r2, #4]
	ldr	r2, [sp, #744]
	str	r3, [r3, #20]
	str	r3, [r2, #12]
	ldr	r3, [sp, #664]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r3, [sp, #740]
	add	r2, r2, #38
	str	r2, [r3, #28]
	str	fp, [r3, #4]
	ldr	r2, [sp, #620]
	ldr	r3, [sp, #616]
	str	r2, [r3, #12]
	ldr	r3, [sp, #744]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r3, [sp, #616]
	ldr	r2, [sp, #608]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	ldr	r2, [sp, #620]
	str	fp, [r3, #4]
	str	r3, [r2, #12]
	ldr	r3, .L14+292
	add	r2, sl, r3
	ldr	r3, [sp, #620]
	str	r2, [r3, #0]
	ldr	r3, [sp, #552]
	ldr	r2, [sp, #748]
	str	r3, [r2, #24]
	ldr	r3, .L14+296
	add	r2, sl, r3
	ldr	r3, [sp, #748]
	str	r2, [r3, #0]
	ldr	r2, [sp, #616]
	mov	r3, #43
	str	r3, [r2, #28]
	ldr	r3, .L14+300
	add	r2, sl, r3
	ldr	r3, [sp, #752]
	str	r2, [r3, #0]
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #748]
	str	r3, [r2, #16]
	ldr	r3, .L14+304
	add	r2, sl, r3
	ldr	r3, [sp, #756]
	str	r2, [r3, #0]
	ldr	r2, [sp, #0]
	str	r2, [r3, #16]
	ldr	r3, .L14+308
	add	r2, sl, r3
	ldr	r3, [sp, #760]
	str	r2, [r3, #0]
	ldr	r3, [sp, #752]
	ldr	r2, [sp, #748]
	str	r3, [r2, #12]
	ldr	r2, [sp, #620]
	mov	r3, #5
	str	r3, [r2, #4]
	ldr	r2, [sp, #748]
	ldr	r3, [sp, #752]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	ldr	r3, [sp, #568]
	ldr	r2, [sp, #756]
	str	r3, [r2, #24]
	ldr	r2, [sp, #748]
	mov	r3, #50
	str	fp, [r2, #4]
	str	r3, [r2, #28]
	ldr	r2, [sp, #756]
	str	r3, [r2, #28]
	ldr	r3, [sp, #752]
	mov	r2, #5
	str	r2, [r3, #4]
	ldr	r3, [sp, #756]
	str	fp, [r3, #4]
	ldr	r3, [sp, #760]
	str	r2, [r3, #4]
	ldr	r2, [sp, #756]
	str	r3, [r2, #12]
	str	r2, [r2, #20]
	str	r2, [r3, #12]
	add	sp, sp, #88
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.size	init_tracka, .-init_tracka
	.align	2
	.global	init_trackb
	.type	init_trackb, %function
init_trackb:
	@ args = 0, pretend = 0, frame = 1080
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L20
	sub	sp, sp, #1072
	sub	sp, sp, #8
	mov	r4, r0
.L19:
	add	sl, pc, sl
	mov	r1, #0
	mov	r2, #6912
	bl	memset(PLT)
	add	r2, r4, #5056
	str	r2, [sp, #504]
	add	r3, r4, #4096
	str	r3, [sp, #612]
	add	ip, r4, #5248
	ldr	r3, [sp, #504]
	str	ip, [sp, #648]
	add	r2, r4, #5632
	ldr	ip, [sp, #612]
	str	r2, [sp, #736]
	add	r3, r3, #32
	ldr	r2, [sp, #648]
	str	r3, [sp, #504]
	add	ip, ip, #32
	ldr	r3, [sp, #736]
	str	ip, [sp, #612]
	add	ip, r4, #5184
	add	r2, r2, #32
	add	r3, r3, #32
	str	ip, [sp, #760]
	add	ip, r4, #4608
	str	r2, [sp, #648]
	str	r3, [sp, #736]
	add	r2, r4, #5568
	add	r3, r4, #5760
	str	ip, [sp, #948]
	add	ip, r4, #5120
	str	r2, [sp, #764]
	str	r3, [sp, #904]
	add	r2, r4, #5376
	add	r3, r4, #4864
	str	ip, [sp, #500]
	add	ip, r4, #6400
	str	r3, [sp, #472]
	str	r2, [sp, #1008]
	add	r3, r4, #5312
	add	r2, r4, #6208
	str	ip, [sp, #704]
	add	ip, r4, #5440
	str	ip, [sp, #828]
	str	r2, [sp, #624]
	ldr	ip, [sp, #472]
	str	r3, [sp, #656]
	add	r2, r4, #6592
	add	r3, r4, #4352
	str	r2, [sp, #720]
	str	r3, [sp, #812]
	add	r2, r4, #4672
	add	r3, r4, #5824
	str	r2, [sp, #920]
	str	r3, [sp, #1028]
	add	ip, ip, #32
	ldr	r2, [sp, #828]
	ldr	r3, [sp, #920]
	str	ip, [sp, #472]
	ldr	ip, [sp, #1028]
	add	r2, r2, #32
	add	r3, r3, #32
	add	ip, ip, #32
	str	r2, [sp, #828]
	str	r3, [sp, #920]
	str	ip, [sp, #1028]
	ldr	r3, [sp, #656]
	ldr	ip, [sp, #812]
	ldr	r2, [sp, #500]
	add	r3, r3, #16
	add	ip, ip, #16
	add	r2, r2, #16
	str	r3, [sp, #656]
	str	ip, [sp, #812]
	ldr	r3, [sp, #704]
	ldr	ip, [sp, #720]
	str	r2, [sp, #500]
	ldr	r2, [sp, #624]
	add	r3, r3, #32
	add	ip, ip, #32
	add	r2, r2, #32
	str	r3, [sp, #704]
	str	ip, [sp, #720]
	add	r3, r4, #4224
	add	ip, r4, #4416
	str	r2, [sp, #624]
	str	r3, [sp, #792]
	add	r2, r4, #4992
	str	ip, [sp, #996]
	add	r3, r4, #6336
	add	ip, r4, #6528
	str	r2, [sp, #692]
	str	r3, [sp, #484]
	str	ip, [sp, #712]
	ldr	r3, [sp, #612]
	ldr	ip, [sp, #648]
	add	r2, r4, #4480
	add	r2, r2, #32
	str	r2, [sp, #984]
	add	r3, r3, #16
	add	r2, r4, #6144
	add	ip, ip, #16
	str	r2, [sp, #784]
	str	r3, [sp, #616]
	str	ip, [sp, #652]
	ldr	r2, [sp, #736]
	ldr	r3, [sp, #764]
	ldr	ip, [sp, #760]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #740]
	str	r3, [sp, #768]
	str	ip, [sp, #816]
	ldr	r2, [sp, #504]
	ldr	r3, [sp, #904]
	ldr	ip, [sp, #948]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #856]
	str	r3, [sp, #908]
	str	ip, [sp, #952]
	ldr	r2, [sp, #1008]
	add	r3, r4, #4928
	add	r2, r2, #16
	str	r3, [sp, #480]
	str	r2, [sp, #1012]
	add	r3, r4, #6272
	add	r2, r4, #4160
	str	r2, [sp, #620]
	str	r3, [sp, #628]
	add	r2, r4, #6464
	add	r3, r4, #6528
	add	ip, r4, #6336
	str	r2, [sp, #708]
	str	r3, [sp, #716]
	add	r2, r4, #5696
	add	r3, r4, #5184
	str	r2, [sp, #744]
	str	ip, [sp, #488]
	str	r3, [sp, #756]
	add	ip, r4, #4992
	add	r2, r4, #6144
	add	r3, r4, #4224
	str	r3, [sp, #800]
	str	ip, [sp, #700]
	str	r2, [sp, #788]
	add	ip, r4, #6656
	add	r2, r4, #5760
	add	r3, r4, #4736
	str	r2, [sp, #912]
	str	r3, [sp, #928]
	ldr	r2, [sp, #480]
	ldr	r3, [sp, #620]
	str	ip, [sp, #724]
	add	ip, r4, #5568
	str	ip, [sp, #772]
	add	ip, r4, #5504
	str	ip, [sp, #836]
	add	r2, r2, #16
	add	ip, r4, #4608
	add	r3, r3, #16
	str	ip, [sp, #956]
	str	r2, [sp, #480]
	ldr	ip, [sp, #744]
	ldr	r2, [sp, #772]
	str	r3, [sp, #620]
	ldr	r3, [sp, #800]
	add	ip, ip, #16
	add	r2, r2, #48
	add	r3, r3, #48
	str	ip, [sp, #744]
	str	r2, [sp, #772]
	ldr	ip, [sp, #836]
	ldr	r2, [sp, #912]
	str	r3, [sp, #800]
	ldr	r3, [sp, #928]
	add	ip, ip, #16
	add	r2, r2, #48
	add	r3, r3, #16
	str	ip, [sp, #836]
	str	r2, [sp, #912]
	str	r3, [sp, #928]
	ldr	ip, [sp, #956]
	ldr	r2, [sp, #700]
	ldr	r3, [sp, #756]
	add	ip, ip, #48
	str	ip, [sp, #956]
	ldr	ip, [sp, #488]
	add	r2, r2, #48
	add	r3, r3, #48
	str	r2, [sp, #700]
	str	r3, [sp, #756]
	ldr	r2, [sp, #628]
	ldr	r3, [sp, #708]
	add	ip, ip, #48
	str	ip, [sp, #488]
	ldr	ip, [sp, #716]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #628]
	str	r3, [sp, #708]
	ldr	r2, [sp, #724]
	ldr	r3, [sp, #788]
	add	ip, ip, #48
	str	ip, [sp, #716]
	ldr	ip, [sp, #652]
	add	r2, r2, #16
	add	r3, r3, #48
	str	r2, [sp, #724]
	str	r3, [sp, #788]
	add	ip, ip, #16
	ldr	r2, [sp, #816]
	ldr	r3, [sp, #1012]
	str	ip, [sp, #412]
	add	ip, r4, #4800
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #872]
	add	ip, r4, #4080
	str	r2, [sp, #344]
	str	r3, [sp, #276]
	add	r2, r4, #3984
	add	r3, r4, #3888
	str	ip, [sp, #528]
	add	ip, r4, #4544
	str	r2, [sp, #560]
	str	r3, [sp, #584]
	add	r2, r4, #3216
	add	r3, r4, #3312
	add	ip, ip, #16
	str	r2, [sp, #916]
	str	r3, [sp, #944]
	str	ip, [sp, #992]
	add	r2, r4, #48
	add	r3, r4, #96
	add	ip, r4, #192
	str	r2, [sp, #468]
	str	r3, [sp, #492]
	add	r2, r4, #336
	str	ip, [sp, #516]
	add	ip, r4, #480
	str	r2, [sp, #544]
	str	ip, [sp, #588]
	add	r2, r4, #720
	add	ip, r4, #624
	add	r3, r4, #432
	str	r2, [sp, #600]
	str	ip, [sp, #608]
	add	r2, r4, #816
	add	ip, r4, #4416
	str	r3, [sp, #568]
	str	r2, [sp, #636]
	add	r3, r4, #576
	add	ip, ip, #48
	add	r2, r4, #5376
	str	r3, [sp, #604]
	str	ip, [sp, #1004]
	add	r3, r4, #912
	add	r2, r2, #48
	add	ip, r4, #240
	str	r3, [sp, #664]
	str	r2, [sp, #1016]
	add	r3, r4, #144
	str	ip, [sp, #520]
	add	r2, r4, #288
	add	ip, r4, #528
	str	r3, [sp, #496]
	str	r2, [sp, #540]
	add	r3, r4, #384
	str	ip, [sp, #592]
	add	r2, r4, #672
	add	ip, r4, #864
	str	r3, [sp, #564]
	str	r2, [sp, #596]
	add	r3, r4, #768
	str	ip, [sp, #660]
	add	r2, r4, #960
	add	ip, r4, #1488
	str	r3, [sp, #632]
	str	r2, [sp, #676]
	add	r3, r4, #1008
	str	ip, [sp, #512]
	add	r2, r4, #1200
	add	ip, r4, #1104
	str	r3, [sp, #680]
	str	r2, [sp, #536]
	add	r3, r4, #1296
	str	ip, [sp, #576]
	add	r2, r4, #2928
	add	ip, r4, #2400
	str	r3, [sp, #552]
	str	r2, [sp, #644]
	add	r3, r4, #1584
	str	ip, [sp, #688]
	add	r2, r4, #1344
	add	ip, r4, #1632
	str	r3, [sp, #672]
	str	r2, [sp, #728]
	add	r3, r4, #3024
	str	ip, [sp, #776]
	add	r2, r4, #1680
	add	ip, r4, #1776
	str	r3, [sp, #752]
	str	r2, [sp, #780]
	add	r3, r4, #1728
	str	ip, [sp, #808]
	add	r2, r4, #1824
	add	ip, r4, #1920
	str	r3, [sp, #804]
	str	r2, [sp, #820]
	str	ip, [sp, #840]
	add	r2, r4, #1968
	add	ip, r4, #2064
	add	r3, r4, #1872
	str	r2, [sp, #844]
	str	ip, [sp, #852]
	add	r2, r4, #2112
	add	ip, r4, #2256
	str	r3, [sp, #824]
	str	r2, [sp, #860]
	add	r3, r4, #2016
	str	ip, [sp, #880]
	add	r2, r4, #2832
	add	ip, r4, #2352
	str	r3, [sp, #848]
	str	r2, [sp, #888]
	add	r3, r4, #2160
	str	ip, [sp, #900]
	add	r2, r4, #2496
	add	ip, r4, #2592
	str	r3, [sp, #864]
	str	r2, [sp, #932]
	add	r3, r4, #2304
	str	ip, [sp, #960]
	add	r2, r4, #2640
	add	ip, r4, #1440
	str	r3, [sp, #896]
	str	r2, [sp, #964]
	add	r3, r4, #2544
	str	ip, [sp, #508]
	add	r2, r4, #1152
	add	ip, r4, #1056
	str	r3, [sp, #936]
	str	r2, [sp, #532]
	add	r3, r4, #2688
	str	ip, [sp, #572]
	add	r2, r4, #2880
	add	ip, r4, #2448
	str	r3, [sp, #968]
	str	r2, [sp, #640]
	add	r3, r4, #1248
	str	ip, [sp, #684]
	add	r2, r4, #1392
	add	ip, r4, #2208
	str	r3, [sp, #548]
	str	r2, [sp, #732]
	add	r3, r4, #1536
	str	ip, [sp, #876]
	add	r2, r4, #2784
	add	ip, r4, #3600
	str	r3, [sp, #668]
	str	r2, [sp, #884]
	add	r3, r4, #2976
	str	ip, [sp, #980]
	ldr	r2, [sp, #472]
	ldr	ip, [sp, #692]
	str	r3, [sp, #748]
	add	r3, r4, #2736
	str	r3, [sp, #972]
	add	r2, r2, #16
	add	r3, r4, #4048
	add	ip, ip, #16
	str	r2, [sp, #476]
	str	r3, [sp, #524]
	str	ip, [sp, #696]
	ldr	r2, [sp, #792]
	add	r8, r4, #4288
	add	r2, r2, #16
	str	r2, [sp, #796]
	ldr	r2, [sp, #920]
	add	r8, r8, #32
	add	ip, r8, #16
	add	r2, r2, #16
	ldr	r3, [sp, #828]
	str	ip, [sp, #892]
	str	r2, [sp, #924]
	ldr	ip, [sp, #996]
	ldr	r2, [sp, #1028]
	add	r3, r3, #16
	add	ip, ip, #16
	add	r2, r2, #16
	str	r3, [sp, #832]
	str	ip, [sp, #1000]
	ldr	r3, [sp, #984]
	str	r2, [sp, #1032]
	ldr	ip, [sp, #500]
	add	r2, r4, #1456
	str	r2, [sp, #460]
	add	r2, r4, #3968
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #448]
	add	r2, r4, #3872
	str	r3, [sp, #988]
	str	ip, [sp, #464]
	ldr	r3, [sp, #484]
	add	ip, r4, #1264
	str	r2, [sp, #440]
	ldr	r2, [sp, #624]
	str	ip, [sp, #452]
	add	ip, r4, #3856
	add	r0, r3, #16
	str	ip, [sp, #580]
	add	r3, r4, #1168
	ldr	ip, [sp, #616]
	add	r2, r2, #16
	str	r3, [sp, #456]
	str	r2, [sp, #428]
	add	r3, r4, #1072
	add	r2, r4, #1552
	str	r3, [sp, #444]
	add	ip, ip, #16
	add	r3, r4, #688
	str	r2, [sp, #416]
	ldr	r2, [sp, #704]
	str	r3, [sp, #436]
	str	ip, [sp, #432]
	add	r3, r4, #544
	add	ip, r4, #2896
	str	r3, [sp, #424]
	str	ip, [sp, #420]
	add	r3, r4, #2464
	add	ip, r4, #400
	add	r2, r2, #16
	str	r3, [sp, #408]
	str	ip, [sp, #404]
	str	r2, [sp, #400]
	ldr	ip, [sp, #712]
	add	r3, r4, #256
	add	ip, ip, #16
	str	ip, [sp, #392]
	ldr	ip, [sp, #740]
	str	r3, [sp, #396]
	add	ip, ip, #16
	ldr	r3, [sp, #720]
	add	r2, r4, #304
	str	ip, [sp, #380]
	add	ip, r4, #5248
	str	r2, [sp, #388]
	add	r3, r3, #16
	add	r2, r4, #2992
	str	ip, [sp, #368]
	ldr	ip, [sp, #784]
	str	r3, [sp, #384]
	str	r2, [sp, #376]
	add	r3, r4, #160
	add	r2, r4, #880
	str	r3, [sp, #372]
	str	r2, [sp, #364]
	ldr	r3, [sp, #768]
	add	ip, ip, #16
	ldr	r2, [sp, #812]
	str	ip, [sp, #356]
	ldr	ip, [sp, #656]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #360]
	str	r2, [sp, #352]
	add	r3, r4, #4096
	add	ip, ip, #16
	add	r2, r4, #5056
	str	r3, [sp, #348]
	str	ip, [sp, #340]
	str	r2, [sp, #336]
	ldr	r3, [sp, #856]
	add	ip, r4, #3424
	add	r2, r4, #4864
	str	ip, [sp, #328]
	str	r2, [sp, #324]
	ldr	ip, [sp, #908]
	add	r2, r4, #3184
	add	r3, r3, #16
	str	r2, [sp, #312]
	ldr	r2, [sp, #952]
	str	r3, [sp, #332]
	add	ip, ip, #16
	add	r3, r4, #2800
	str	r3, [sp, #320]
	str	ip, [sp, #316]
	add	r3, r4, #976
	add	ip, r4, #3280
	add	r2, r2, #16
	str	r3, [sp, #308]
	str	ip, [sp, #304]
	str	r2, [sp, #300]
	add	r2, r4, #2224
	add	r3, r4, #3376
	str	r2, [sp, #288]
	add	r2, r4, #5888
	str	r2, [sp, #1036]
	str	r3, [sp, #296]
	ldr	r2, .L20+4
	add	r3, r4, #784
	str	r3, [sp, #284]
	mov	r3, #0
	str	r3, [r4, #8]
	add	r3, sl, r2
	ldr	r2, .L20+8
	str	r3, [r4, #0]
	add	r3, sl, r2
	ldr	r2, .L20+12
	str	r3, [r4, #48]
	add	r3, sl, r2
	ldr	r2, .L20+16
	str	r3, [r4, #96]
	add	r3, sl, r2
	ldr	r2, .L20+20
	str	r3, [r4, #144]
	add	r3, sl, r2
	str	r3, [r4, #192]
	ldr	r3, [sp, #1036]
	add	ip, r4, #3568
	str	ip, [sp, #292]
	add	r3, r3, #16
	add	ip, r4, #1408
	ldr	r2, [sp, #480]
	str	ip, [sp, #280]
	str	r3, [sp, #1036]
	ldr	ip, [sp, #468]
	mov	r3, #231
	mov	r1, #1
	str	r3, [r4, #28]
	mov	r3, #504
	str	ip, [r4, #12]
	str	r2, [r4, #24]
	str	r1, [ip, #8]
	str	r4, [r4, #20]
	str	r3, [ip, #28]
	str	r4, [ip, #12]
	ldr	ip, [sp, #492]
	mov	r3, #2
	ldr	r2, [sp, #468]
	str	r3, [ip, #8]
	ldr	r3, [sp, #488]
	ldr	ip, [sp, #476]
	str	r3, [r2, #24]
	str	ip, [r4, #16]
	str	r2, [r2, #20]
	str	r0, [r2, #16]
	ldr	r3, [sp, #464]
	ldr	r2, [sp, #492]
	str	r1, [r4, #4]
	str	r3, [r2, #16]
	ldr	r3, [sp, #492]
	ldr	ip, [sp, #496]
	ldr	r2, [sp, #460]
	str	ip, [r3, #12]
	str	r2, [ip, #16]
	ldr	ip, [sp, #468]
	ldr	r2, [sp, #504]
	str	r1, [ip, #4]
	str	r2, [r3, #24]
	mov	ip, #43
	ldr	r2, [sp, #496]
	str	ip, [r3, #28]
	str	r3, [r3, #20]
	mov	r3, #3
	str	r3, [r2, #8]
	ldr	r3, [sp, #492]
	ldr	ip, [sp, #512]
	str	r1, [r3, #4]
	str	r3, [r2, #12]
	ldr	r3, .L20+152
	str	r1, [r2, #4]
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	str	ip, [r2, #24]
	ldr	ip, [sp, #516]
	ldr	r2, .L20+24
	mov	r3, #4
	str	r3, [ip, #8]
	add	r3, sl, r2
	ldr	r2, .L20+28
	str	r3, [r4, #240]
	add	r3, sl, r2
	ldr	r2, .L20+32
	str	r3, [r4, #288]
	add	r3, sl, r2
	ldr	r2, .L20+36
	str	r3, [r4, #336]
	add	r3, sl, r2
	str	r3, [r4, #384]
	ldr	r2, [sp, #520]
	mov	r3, #231
	str	r3, [ip, #28]
	sub	r3, r3, #226
	str	r2, [ip, #12]
	str	r3, [r2, #8]
	ldr	r2, [sp, #528]
	str	r1, [ip, #4]
	str	ip, [ip, #20]
	str	r2, [ip, #24]
	ldr	r3, [sp, #520]
	ldr	ip, .L20+40
	ldr	r2, [sp, #540]
	str	ip, [r3, #28]
	mov	r3, #6
	str	r3, [r2, #8]
	ldr	ip, [sp, #516]
	ldr	r3, [sp, #520]
	ldr	r2, [sp, #536]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	ldr	r3, [sp, #524]
	ldr	r2, [sp, #456]
	str	r3, [ip, #16]
	ldr	ip, [sp, #520]
	ldr	r3, [sp, #540]
	str	r2, [ip, #16]
	ldr	ip, [sp, #452]
	ldr	r2, [sp, #544]
	str	ip, [r3, #16]
	ldr	r3, [sp, #448]
	ldr	ip, [sp, #520]
	str	r3, [r2, #16]
	str	r1, [ip, #4]
	ldr	r3, [sp, #540]
	ldr	ip, .L20+44
	str	r2, [r3, #12]
	str	ip, [r3, #28]
	mov	r3, #7
	str	r3, [r2, #8]
	ldr	r2, [sp, #540]
	ldr	r3, [sp, #552]
	ldr	ip, [sp, #544]
	str	r1, [r2, #4]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	mov	r2, #229
	str	r1, [ip, #4]
	str	r2, [ip, #28]
	ldr	ip, [sp, #564]
	mov	r3, #8
	ldr	r2, [sp, #544]
	str	r3, [ip, #8]
	ldr	r3, [sp, #540]
	ldr	ip, [sp, #560]
	str	r3, [r2, #12]
	str	r2, [r2, #20]
	str	ip, [r2, #24]
	ldr	r3, [sp, #568]
	ldr	r2, [sp, #564]
	ldr	ip, [sp, #444]
	str	r3, [r2, #12]
	ldr	r3, .L20+48
	str	ip, [r2, #16]
	str	r1, [r2, #4]
	add	r2, sl, r3
	str	r2, [r4, #432]
	ldr	r3, [sp, #440]
	ldr	r2, [sp, #568]
	ldr	ip, [sp, #588]
	str	r3, [r2, #16]
	ldr	r3, .L20+52
	add	r9, r4, #4032
	add	r2, sl, r3
	str	r2, [r4, #480]
	ldr	r3, .L20+56
	ldr	r2, [sp, #580]
	add	lr, r4, #3360
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	ip, [sp, #436]
	ldr	r3, [sp, #592]
	str	r2, [r4, #528]
	str	ip, [r3, #16]
	ldr	r3, .L20+60
	ldr	ip, [sp, #564]
	add	r2, sl, r3
	str	r2, [r4, #576]
	ldr	r3, [sp, #432]
	ldr	r2, [sp, #604]
	str	ip, [ip, #20]
	str	r3, [r2, #16]
	ldr	r2, [sp, #576]
	ldr	r3, .L20+64
	str	r2, [ip, #24]
	str	r3, [ip, #28]
	ldr	ip, [sp, #568]
	ldr	r2, [sp, #564]
	sub	r3, r3, #280
	str	r3, [ip, #8]
	ldr	r3, [sp, #584]
	str	r2, [ip, #12]
	mov	r2, #229
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	str	ip, [ip, #20]
	ldr	ip, [sp, #588]
	mov	r3, #10
	str	r3, [ip, #8]
	ldr	r2, [sp, #592]
	ldr	r3, [sp, #568]
	str	r2, [ip, #12]
	str	r1, [r3, #4]
	ldr	r2, [sp, #584]
	ldr	r3, .L20+360
	str	r2, [ip, #24]
	str	r3, [ip, #28]
	ldr	r2, [sp, #588]
	str	ip, [ip, #20]
	ldr	ip, [sp, #592]
	mov	r3, #11
	str	r1, [r2, #4]
	str	r3, [ip, #8]
	str	r2, [ip, #12]
	ldr	r3, [sp, #600]
	ldr	r2, .L20+68
	str	r1, [ip, #4]
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	str	ip, [ip, #20]
	ldr	ip, [sp, #604]
	ldr	r2, [sp, #608]
	mov	r3, #12
	str	r3, [ip, #8]
	add	r3, r3, #224
	str	r1, [ip, #4]
	str	r2, [ip, #12]
	str	r3, [ip, #28]
	ldr	r3, [sp, #428]
	str	ip, [ip, #20]
	str	r3, [r2, #16]
	mov	r3, #13
	str	r3, [r2, #8]
	ldr	ip, [sp, #608]
	ldr	r2, .L20+72
	ldr	r3, [sp, #424]
	str	r2, [ip, #28]
	ldr	r2, [sp, #596]
	ldr	ip, .L20+68
	str	r3, [r2, #16]
	mov	r3, #14
	str	r3, [r2, #8]
	str	ip, [r2, #28]
	ldr	r3, [sp, #616]
	ldr	r2, [sp, #600]
	ldr	ip, [sp, #600]
	str	r3, [r2, #16]
	mov	r3, #15
	str	r3, [r2, #8]
	ldr	r2, .L20+76
	ldr	r3, .L20+80
	str	r2, [ip, #28]
	add	r2, sl, r3
	ldr	r3, .L20+84
	str	r2, [r4, #624]
	add	r2, sl, r3
	ldr	r3, .L20+88
	str	r2, [r4, #672]
	add	r2, sl, r3
	ldr	r3, .L20+92
	str	r2, [r4, #720]
	add	r2, sl, r3
	str	r2, [r4, #768]
	ldr	r2, [sp, #632]
	mov	r3, #16
	str	r3, [r2, #8]
	ldr	r3, [sp, #420]
	ldr	ip, [sp, #604]
	str	r3, [r2, #16]
	ldr	r3, [sp, #608]
	ldr	r2, [sp, #620]
	str	r3, [r3, #20]
	str	r2, [ip, #24]
	str	ip, [r3, #12]
	ldr	ip, [sp, #628]
	add	fp, r4, #3408
	str	ip, [r3, #24]
	ldr	r3, [sp, #600]
	ldr	r2, [sp, #596]
	ldr	ip, [sp, #588]
	str	r3, [r2, #12]
	str	ip, [r2, #24]
	str	r2, [r2, #20]
	ldr	r2, [sp, #608]
	ldr	ip, [sp, #596]
	str	r1, [r2, #4]
	ldr	r2, [sp, #620]
	str	r1, [ip, #4]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r1, [r3, #4]
	str	r3, [r3, #20]
	ldr	ip, [sp, #636]
	ldr	r3, [sp, #632]
	ldr	r2, [sp, #644]
	str	ip, [r3, #12]
	ldr	ip, [sp, #632]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	mov	r2, #404
	ldr	r3, [sp, #924]
	str	r2, [ip, #28]
	ldr	ip, [sp, #636]
	ldr	r2, .L20+96
	add	r7, r3, #16
	mov	r3, #17
	str	r3, [ip, #8]
	add	r3, sl, r2
	ldr	r2, .L20+100
	str	r3, [r4, #816]
	add	r3, sl, r2
	ldr	r2, .L20+104
	str	r3, [r4, #864]
	add	r3, sl, r2
	ldr	r2, .L20+108
	str	r3, [r4, #912]
	add	r3, sl, r2
	ldr	r2, .L20+112
	str	r3, [r4, #960]
	add	r3, sl, r2
	ldr	r2, [sp, #632]
	str	r3, [r4, #1008]
	str	r2, [ip, #12]
	ldr	r3, [sp, #656]
	mov	r2, #231
	str	ip, [ip, #20]
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	ldr	ip, [sp, #660]
	ldr	r2, [sp, #664]
	mov	r3, #18
	str	r3, [ip, #8]
	ldr	r3, [sp, #672]
	str	r2, [ip, #12]
	mov	r2, #201
	str	ip, [ip, #20]
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	ldr	ip, [sp, #664]
	mov	r3, #19
	ldr	r2, [sp, #636]
	str	r3, [ip, #8]
	ldr	r3, [sp, #652]
	str	r1, [r2, #4]
	str	r3, [r2, #16]
	ldr	ip, [sp, #660]
	ldr	r2, [sp, #416]
	ldr	r3, [sp, #664]
	str	r2, [ip, #16]
	ldr	ip, [sp, #412]
	ldr	r2, [sp, #676]
	str	ip, [r3, #16]
	ldr	r3, [sp, #408]
	ldr	ip, [sp, #664]
	str	r3, [r2, #16]
	ldr	r2, [sp, #660]
	ldr	r3, [sp, #656]
	str	r2, [ip, #12]
	str	r1, [r2, #4]
	mov	r2, #239
	str	ip, [ip, #20]
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	ldr	ip, [sp, #676]
	ldr	r2, [sp, #664]
	mov	r3, #20
	str	r3, [ip, #8]
	ldr	r3, [sp, #680]
	str	r1, [r2, #4]
	ldr	r2, [sp, #688]
	str	r3, [ip, #12]
	mov	r3, #404
	str	r3, [ip, #28]
	str	r1, [ip, #4]
	str	r2, [ip, #24]
	str	ip, [ip, #20]
	ldr	r2, .L20+116
	ldr	ip, [sp, #680]
	mov	r3, #21
	str	r3, [ip, #8]
	add	r3, sl, r2
	mov	r2, #22
	str	r3, [r4, #1056]
	str	r2, [r4, #1064]
	ldr	r3, .L20+120
	ldr	r2, .L20+64
	str	r1, [ip, #4]
	str	r2, [r4, #1084]
	add	r2, sl, r3
	str	r2, [r4, #1104]
	ldr	r2, .L20+124
	mov	r3, #23
	str	r3, [r4, #1112]
	add	r3, sl, r2
	str	r3, [r4, #1152]
	ldr	r3, .L20+40
	mov	r2, #24
	str	r3, [r4, #1180]
	ldr	r3, .L20+128
	str	r2, [r4, #1160]
	add	r2, sl, r3
	mov	r3, #25
	str	r2, [r4, #1200]
	str	r3, [r4, #1208]
	ldr	r2, [sp, #676]
	ldr	r3, [sp, #696]
	str	r2, [ip, #12]
	str	r3, [ip, #16]
	ldr	r2, [sp, #404]
	ldr	ip, [sp, #572]
	ldr	r3, [sp, #576]
	str	r2, [ip, #16]
	ldr	ip, [sp, #400]
	mov	r6, r4
	str	ip, [r3, #16]
	ldr	ip, [sp, #680]
	ldr	r3, [sp, #396]
	str	ip, [r4, #1028]
	ldr	ip, [sp, #576]
	ldr	r2, [sp, #532]
	str	ip, [r4, #1068]
	str	ip, [r4, #1124]
	ldr	ip, [sp, #708]
	str	r3, [r2, #16]
	ldr	r2, [sp, #700]
	mov	r3, #231
	str	r3, [r4, #1036]
	str	ip, [r4, #1128]
	ldr	r3, [sp, #568]
	ldr	ip, [sp, #532]
	str	r2, [r4, #1032]
	ldr	r2, [sp, #572]
	str	r3, [r4, #1080]
	str	ip, [r4, #1172]
	ldr	r3, [sp, #536]
	str	ip, [r4, #1212]
	ldr	ip, [sp, #392]
	str	r2, [r4, #1076]
	str	r2, [r4, #1116]
	mov	r2, #43
	str	ip, [r3, #16]
	str	r2, [r4, #1132]
	str	r3, [r4, #1164]
	ldr	r2, [sp, #516]
	ldr	r3, .L20+132
	str	r2, [r4, #1176]
	add	r2, sl, r3
	str	r2, [r4, #1248]
	ldr	r3, [sp, #388]
	ldr	r2, [sp, #548]
	str	r1, [r4, #1060]
	str	r1, [r4, #1108]
	str	r1, [r4, #1156]
	str	r1, [r4, #1204]
	str	r3, [r2, #16]
	ldr	r2, [sp, #384]
	ldr	ip, [sp, #552]
	mov	r3, #26
	str	r3, [r4, #1256]
	add	r3, r3, #444
	str	r2, [ip, #16]
	str	r3, [r4, #1276]
	ldr	r2, [sp, #380]
	ldr	ip, [sp, #728]
	ldr	r3, .L20+136
	str	r2, [ip, #16]
	add	r2, sl, r3
	str	r2, [r4, #1296]
	ldr	r2, .L20+140
	mov	r3, #27
	str	r3, [r4, #1304]
	add	r3, sl, r2
	str	r3, [r4, #1344]
	ldr	r3, .L20+144
	mov	r2, #28
	str	r2, [r4, #1352]
	add	r2, sl, r3
	mov	r3, #29
	ldr	ip, [sp, #376]
	str	r2, [r4, #1392]
	str	r3, [r4, #1400]
	ldr	r2, [sp, #536]
	ldr	r3, [sp, #732]
	str	r2, [r4, #1220]
	str	ip, [r3, #16]
	ldr	r2, [sp, #552]
	ldr	r3, [sp, #716]
	mov	ip, #50
	str	r3, [r4, #1224]
	str	ip, [r4, #1228]
	ldr	r3, [sp, #548]
	ldr	ip, [sp, #544]
	str	r2, [r4, #1260]
	str	r2, [r4, #1316]
	ldr	r2, [sp, #724]
	str	r1, [r4, #1252]
	str	r3, [r4, #1268]
	str	ip, [r4, #1272]
	str	r1, [r4, #1300]
	str	r3, [r4, #1308]
	str	r2, [r4, #1320]
	mov	r3, #50
	ldr	ip, [sp, #732]
	str	r3, [r4, #1324]
	ldr	r3, [sp, #744]
	str	ip, [r4, #1356]
	mov	ip, #239
	ldr	r2, [sp, #728]
	str	r3, [r4, #1368]
	str	ip, [r4, #1372]
	ldr	r3, [sp, #508]
	ldr	ip, [sp, #372]
	str	r2, [r4, #1364]
	b	.L21
.L22:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	642
	.word	470
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	289
	.word	814
	.word	325
	.word	275
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	437
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	514
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	433
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	326
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	333
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	309
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	.LC66(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC74(GOTOFF)
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	282
	.word	.LC80(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	.LC82(GOTOFF)
.L21:
	str	ip, [r3, #16]
	str	r2, [r4, #1404]
	ldr	r3, .L20+148
	ldr	r2, [sp, #732]
	ldr	ip, [sp, #668]
	str	r2, [r4, #1412]
	add	r2, sl, r3
	str	r2, [r4, #1440]
	ldr	r3, [sp, #368]
	ldr	r2, [sp, #512]
	str	r1, [r4, #1348]
	str	r3, [r2, #16]
	mov	r3, #30
	str	r3, [r4, #1448]
	ldr	r3, .L20+152
	ldr	r2, [sp, #364]
	str	r3, [r4, #1468]
	ldr	r3, .L20+156
	str	r2, [ip, #16]
	add	r2, sl, r3
	str	r2, [r4, #1488]
	ldr	r2, .L20+160
	mov	r3, #31
	str	r3, [r4, #1496]
	add	r3, sl, r2
	str	r3, [r4, #1536]
	ldr	r3, .L20+164
	mov	r2, #32
	str	r2, [r4, #1544]
	add	r2, sl, r3
	str	r2, [r4, #1584]
	ldr	ip, [sp, #672]
	ldr	r2, [sp, #360]
	mov	r3, #33
	str	r1, [r4, #1396]
	str	r3, [r4, #1592]
	str	r2, [ip, #16]
	ldr	r3, [sp, #752]
	ldr	r2, [sp, #512]
	str	r3, [r4, #1416]
	ldr	r3, [sp, #508]
	str	r2, [r4, #1452]
	str	r2, [r4, #1508]
	ldr	r2, [sp, #760]
	mov	ip, #201
	str	r3, [r4, #1460]
	str	r3, [r4, #1500]
	mov	r3, #50
	str	ip, [r4, #1420]
	str	r2, [r4, #1512]
	ldr	ip, [sp, #492]
	ldr	r2, [sp, #668]
	str	r3, [r4, #1516]
	ldr	r3, [sp, #664]
	str	ip, [r4, #1464]
	str	r2, [r4, #1556]
	ldr	ip, [sp, #672]
	str	r3, [r4, #1560]
	str	r2, [r4, #1596]
	ldr	r3, [sp, #772]
	ldr	r2, [sp, #672]
	str	ip, [r4, #1548]
	str	r2, [r4, #1604]
	mov	ip, #201
	str	r3, [r4, #1608]
	ldr	r2, [sp, #776]
	ldr	r3, [sp, #356]
	str	ip, [r4, #1564]
	add	ip, ip, #45
	str	r1, [r4, #1444]
	str	r1, [r4, #1492]
	str	r1, [r4, #1540]
	str	r1, [r4, #1588]
	str	ip, [r4, #1612]
	str	r3, [r2, #16]
	ldr	r3, .L20+168
	ldr	ip, [sp, #780]
	add	r2, sl, r3
	mov	r3, #34
	str	r2, [r4, #1632]
	str	r3, [r4, #1640]
	ldr	r2, .L20+172
	ldr	r3, .L20+176
	str	r2, [r4, #1660]
	add	r2, sl, r3
	str	r2, [r4, #1680]
	ldr	r2, .L20+180
	mov	r3, #35
	str	r3, [r4, #1688]
	add	r3, sl, r2
	str	r3, [r4, #1728]
	ldr	r3, .L20+184
	mov	r2, #36
	str	r2, [r4, #1736]
	add	r2, sl, r3
	mov	r3, #37
	str	r2, [r4, #1776]
	str	r3, [r4, #1784]
	ldr	r2, .L20+188
	ldr	r3, .L20+192
	str	r2, [r4, #1804]
	add	r2, sl, r3
	str	r2, [r4, #1824]
	ldr	r2, [sp, #796]
	ldr	r3, [sp, #804]
	str	r2, [ip, #16]
	ldr	r2, [sp, #780]
	ldr	ip, [sp, #352]
	str	r2, [r4, #1644]
	str	ip, [r3, #16]
	str	r2, [r4, #1700]
	ldr	ip, [sp, #788]
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #776]
	str	ip, [r4, #1656]
	str	r2, [r4, #1704]
	ldr	ip, [sp, #808]
	ldr	r2, [sp, #804]
	str	r3, [r4, #1652]
	str	r3, [r4, #1692]
	mov	r3, #239
	str	r1, [r4, #1636]
	str	r1, [r4, #1684]
	str	r3, [r4, #1708]
	str	r1, [r4, #1732]
	str	ip, [r4, #1740]
	sub	r3, r3, #178
	str	r2, [r4, #1748]
	str	r2, [r4, #1788]
	ldr	r2, [sp, #816]
	str	r3, [r4, #1756]
	ldr	r3, [sp, #756]
	str	r2, [ip, #16]
	ldr	r2, .L20+196
	str	r3, [r4, #1800]
	mov	r3, #38
	str	r3, [r4, #1832]
	add	r3, sl, r2
	str	r3, [r4, #1872]
	ldr	r3, .L20+200
	mov	r2, #39
	str	r2, [r4, #1880]
	add	r2, sl, r3
	mov	r3, #40
	str	r2, [r4, #1920]
	str	r3, [r4, #1928]
	ldr	r2, .L20+204
	ldr	r3, .L20+208
	str	r2, [r4, #1948]
	add	r2, sl, r3
	mov	r3, #41
	str	r3, [r4, #1976]
	ldr	r3, .L20+212
	str	r2, [r4, #1968]
	add	r2, sl, r3
	mov	r3, #42
	str	r2, [r4, #2016]
	str	r3, [r4, #2024]
	ldr	r2, [sp, #820]
	ldr	r3, [sp, #832]
	str	ip, [r4, #1796]
	mov	ip, #128
	str	r3, [r2, #16]
	str	ip, [r4, #1996]
	ldr	r2, [sp, #348]
	ldr	ip, [sp, #824]
	ldr	r3, [sp, #840]
	str	r2, [ip, #16]
	ldr	ip, [sp, #344]
	ldr	r2, [sp, #844]
	str	ip, [r3, #16]
	ldr	r3, [sp, #340]
	ldr	ip, [sp, #824]
	str	r3, [r2, #16]
	str	r1, [r4, #1780]
	str	r1, [r4, #1828]
	str	r8, [r4, #1752]
	str	ip, [r4, #1836]
	ldr	r3, [sp, #836]
	mov	ip, #231
	str	ip, [r4, #1852]
	ldr	ip, [sp, #844]
	ldr	r2, [sp, #820]
	str	r3, [r4, #1848]
	mov	r3, #128
	str	r3, [r4, #1900]
	str	ip, [r4, #1932]
	ldr	r3, [sp, #756]
	str	ip, [r4, #1988]
	ldr	ip, [sp, #648]
	str	r2, [r4, #1844]
	str	r2, [r4, #1884]
	ldr	r2, [sp, #824]
	str	r3, [r4, #1944]
	str	ip, [r4, #1992]
	ldr	r3, [sp, #848]
	ldr	ip, [sp, #336]
	str	r2, [r4, #1892]
	ldr	r2, [sp, #840]
	str	ip, [r3, #16]
	mov	r3, #120
	str	r2, [r4, #1940]
	str	r2, [r4, #1980]
	str	r3, [r4, #2044]
	ldr	r2, [sp, #852]
	ldr	r3, [sp, #332]
	str	r2, [r4, #2028]
	str	r3, [r2, #16]
	ldr	r3, .L20+216
	ldr	ip, [sp, #860]
	add	r2, sl, r3
	str	r2, [r4, #2064]
	ldr	r2, [sp, #328]
	str	r1, [r4, #1876]
	str	r1, [r4, #1924]
	str	r1, [r4, #1972]
	str	r1, [r4, #2020]
	str	r9, [r4, #1896]
	str	r2, [ip, #16]
	ldr	r2, [sp, #324]
	ldr	ip, [sp, #864]
	mov	r3, #43
	str	r2, [ip, #16]
	str	r3, [r4, #2072]
	ldr	r2, .L20+220
	ldr	r3, .L20+224
	ldr	ip, [sp, #320]
	str	r3, [r4, #2092]
	add	r3, sl, r2
	mov	r2, #44
	str	r2, [r4, #2120]
	ldr	r2, .L20+228
	str	r3, [r4, #2112]
	mov	r3, #780
	str	r3, [r4, #2140]
	add	r3, sl, r2
	str	r3, [r4, #2160]
	ldr	r3, .L20+232
	mov	r2, #45
	str	r2, [r4, #2168]
	add	r2, sl, r3
	mov	r3, #46
	str	r3, [r4, #2216]
	ldr	r3, [sp, #876]
	str	r2, [r4, #2208]
	str	ip, [r3, #16]
	ldr	r2, [sp, #848]
	ldr	r3, [sp, #692]
	ldr	ip, [sp, #852]
	str	r2, [r4, #2036]
	str	r3, [r4, #2040]
	str	r2, [r4, #2076]
	ldr	r3, [sp, #864]
	ldr	r2, [sp, #500]
	str	ip, [r4, #2084]
	ldr	ip, [sp, #860]
	str	r1, [r4, #2068]
	str	r2, [r4, #2088]
	str	r1, [r4, #2116]
	str	r3, [r4, #2124]
	str	ip, [r4, #2132]
	str	lr, [r4, #2136]
	str	r1, [r4, #2164]
	str	ip, [r4, #2172]
	str	r3, [r4, #2180]
	ldr	r2, [sp, #872]
	mov	r3, #50
	str	r2, [r4, #2184]
	str	r3, [r4, #2188]
	ldr	r2, [sp, #876]
	ldr	r3, .L20+236
	str	r2, [r4, #2228]
	add	r2, sl, r3
	str	r2, [r4, #2256]
	ldr	r2, .L20+240
	mov	r3, #47
	str	r3, [r4, #2264]
	add	r3, sl, r2
	str	r3, [r4, #2304]
	ldr	r3, .L20+244
	mov	r2, #48
	str	r2, [r4, #2312]
	add	r2, sl, r3
	str	r2, [r4, #2352]
	ldr	r2, .L20+248
	mov	r3, #49
	ldr	ip, [sp, #880]
	str	r3, [r4, #2360]
	add	r3, sl, r2
	ldr	r2, [sp, #892]
	str	r3, [r4, #2400]
	mov	r3, #50
	str	r2, [ip, #16]
	str	ip, [r4, #2220]
	str	r3, [r4, #2408]
	ldr	ip, [sp, #316]
	ldr	r3, [sp, #896]
	ldr	r2, [sp, #900]
	str	ip, [r3, #16]
	ldr	r3, [sp, #312]
	ldr	ip, [sp, #888]
	str	r3, [r2, #16]
	mov	r2, #404
	ldr	r3, [sp, #876]
	str	ip, [r4, #2232]
	str	r2, [r4, #2236]
	ldr	ip, [sp, #880]
	ldr	r2, [sp, #812]
	str	r1, [r4, #2212]
	str	r1, [r4, #2260]
	str	r3, [r4, #2268]
	str	ip, [r4, #2276]
	mov	r3, #239
	str	r2, [r4, #2280]
	ldr	r2, [sp, #896]
	ldr	ip, [sp, #900]
	str	r3, [r4, #2284]
	ldr	r3, [sp, #912]
	str	r2, [r4, #2324]
	str	r2, [r4, #2364]
	ldr	r2, [sp, #900]
	str	ip, [r4, #2316]
	str	r3, [r4, #2328]
	mov	ip, #246
	ldr	r3, [sp, #916]
	str	ip, [r4, #2332]
	str	r2, [r4, #2372]
	sub	ip, ip, #45
	ldr	r2, [sp, #684]
	str	r3, [r4, #2376]
	str	ip, [r4, #2380]
	ldr	r3, [sp, #688]
	ldr	ip, [sp, #924]
	str	r2, [r4, #2412]
	ldr	r2, [sp, #928]
	str	ip, [r3, #16]
	str	r3, [r4, #2420]
	mov	r3, #239
	ldr	ip, [sp, #684]
	str	r2, [r4, #2424]
	str	r3, [r4, #2428]
	ldr	r2, [sp, #308]
	ldr	r3, .L20+252
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	ip, [sp, #304]
	ldr	r3, [sp, #932]
	str	r1, [r4, #2308]
	str	ip, [r3, #16]
	mov	r3, #51
	str	r1, [r4, #2356]
	str	r1, [r4, #2404]
	str	r2, [r4, #2448]
	str	r3, [r4, #2456]
	ldr	r3, [sp, #300]
	ldr	r2, [sp, #936]
	mov	ip, #229
	str	r3, [r2, #16]
	ldr	r3, .L20+256
	str	ip, [r4, #2572]
	add	r2, sl, r3
	str	r2, [r4, #2496]
	ldr	r2, .L20+260
	mov	r3, #52
	str	r3, [r4, #2504]
	add	r3, sl, r2
	str	r3, [r4, #2544]
	ldr	r3, .L20+264
	mov	r2, #53
	str	r2, [r4, #2552]
	add	r2, sl, r3
	mov	r3, #54
	str	r2, [r4, #2592]
	str	r3, [r4, #2600]
	ldr	r2, [sp, #960]
	ldr	r3, [sp, #952]
	ldr	ip, [sp, #688]
	str	r3, [r2, #16]
	ldr	r3, .L20+268
	ldr	r2, .L20+272
	str	r3, [r4, #2620]
	add	r3, sl, r2
	str	r3, [r4, #2640]
	ldr	r2, [sp, #684]
	ldr	r3, [sp, #680]
	str	r2, [r4, #2468]
	str	r3, [r4, #2472]
	ldr	r2, [sp, #936]
	ldr	r3, [sp, #932]
	str	ip, [r4, #2460]
	mov	ip, #404
	str	ip, [r4, #2476]
	str	r2, [r4, #2508]
	ldr	ip, [sp, #944]
	str	r3, [r4, #2516]
	ldr	r2, .L20+360
	str	r3, [r4, #2556]
	ldr	r3, [sp, #936]
	str	r1, [r4, #2452]
	str	r1, [r4, #2500]
	str	ip, [r4, #2520]
	str	r2, [r4, #2524]
	str	r1, [r4, #2548]
	str	r3, [r4, #2564]
	ldr	ip, [sp, #956]
	ldr	r3, [sp, #960]
	ldr	r2, [sp, #964]
	str	ip, [r4, #2568]
	str	ip, [r4, #2616]
	ldr	ip, [sp, #296]
	str	r3, [r4, #2612]
	mov	r3, #55
	str	ip, [r2, #16]
	str	r2, [r4, #2604]
	str	r3, [r4, #2648]
	ldr	r2, [sp, #968]
	ldr	r3, [sp, #292]
	ldr	ip, [sp, #972]
	str	r3, [r2, #16]
	ldr	r2, .L20+276
	mov	r3, #376
	str	r3, [r4, #2668]
	add	r3, sl, r2
	str	r3, [r4, #2688]
	ldr	r3, .L20+280
	mov	r2, #56
	str	r2, [r4, #2696]
	add	r2, sl, r3
	str	r2, [r4, #2736]
	ldr	r2, .L20+284
	mov	r3, #57
	str	r3, [r4, #2744]
	add	r3, sl, r2
	str	r3, [r4, #2784]
	ldr	r3, .L20+288
	mov	r2, #58
	str	r2, [r4, #2792]
	add	r2, sl, r3
	str	r2, [r4, #2832]
	ldr	r2, [sp, #988]
	mov	r3, #59
	str	r2, [ip, #16]
	str	r3, [r4, #2840]
	ldr	ip, [sp, #288]
	ldr	r3, [sp, #884]
	ldr	r2, [sp, #960]
	str	ip, [r3, #16]
	ldr	r3, [sp, #964]
	str	r1, [r4, #2596]
	str	r1, [r4, #2644]
	str	r2, [r4, #2652]
	str	r3, [r4, #2660]
	ldr	r2, [sp, #972]
	ldr	r3, [sp, #968]
	str	r2, [r4, #2700]
	ldr	r2, .L20+360
	str	r3, [r4, #2708]
	ldr	r3, [sp, #992]
	str	r2, [r4, #2716]
	ldr	r2, [sp, #972]
	str	r3, [r4, #2760]
	ldr	r3, [sp, #888]
	str	r2, [r4, #2756]
	ldr	r2, [sp, #880]
	str	r3, [r4, #2796]
	mov	r3, #404
	str	r2, [r4, #2808]
	str	r3, [r4, #2812]
	ldr	r2, [sp, #884]
	ldr	r3, .L20+292
	str	r2, [r4, #2844]
	add	r2, sl, r3
	mov	r3, #60
	str	r3, [r4, #2888]
	add	r3, r3, #344
	ldr	ip, [sp, #980]
	str	r3, [r4, #2908]
	ldr	r3, .L20+296
	str	ip, [r4, #2712]
	str	r2, [r4, #2880]
	ldr	ip, [sp, #968]
	add	r2, sl, r3
	ldr	r3, .L20+300
	str	ip, [r4, #2748]
	str	r2, [r4, #2928]
	mov	ip, #316
	add	r2, sl, r3
	str	ip, [r4, #2764]
	str	r2, [r4, #2976]
	ldr	ip, [sp, #884]
	ldr	r2, .L20+304
	mov	r3, #62
	str	fp, [r4, #2664]
	str	r1, [r4, #2692]
	str	r1, [r4, #2740]
	str	r1, [r4, #2788]
	str	ip, [r4, #2804]
	str	r1, [r4, #2836]
	str	r3, [r4, #2984]
	add	r3, sl, r2
	mov	r2, #63
	ldr	ip, [sp, #888]
	str	r2, [r4, #3032]
	ldr	r2, [sp, #1000]
	str	r3, [r4, #3024]
	str	r2, [ip, #16]
	ldr	r3, [sp, #640]
	ldr	ip, [sp, #284]
	ldr	r2, [sp, #888]
	str	ip, [r3, #16]
	ldr	ip, [sp, #1012]
	ldr	r3, [sp, #644]
	str	r2, [r4, #2852]
	str	ip, [r3, #16]
	ldr	r2, [sp, #748]
	ldr	r3, [sp, #280]
	ldr	ip, [sp, #752]
	str	r3, [r2, #16]
	ldr	r2, [sp, #276]
	ldr	r3, [sp, #1004]
	str	r2, [ip, #16]
	str	r3, [r4, #2856]
	ldr	r2, [sp, #636]
	ldr	r3, [sp, #644]
	mov	ip, #231
	str	ip, [r4, #2860]
	ldr	ip, [sp, #640]
	str	r3, [r4, #2892]
	str	r2, [r4, #2904]
	ldr	r3, [sp, #644]
	ldr	r2, [sp, #640]
	str	ip, [r4, #2900]
	mov	ip, #61
	str	r1, [r4, #2884]
	str	r1, [r4, #2932]
	str	ip, [r4, #2936]
	str	r2, [r4, #2940]
	str	r3, [r4, #2948]
	ldr	r3, [sp, #728]
	mov	r2, #239
	str	r3, [r4, #3000]
	ldr	r3, [sp, #748]
	str	r2, [r4, #2956]
	str	r3, [r4, #3036]
	ldr	r2, [sp, #748]
	ldr	r3, .L20+308
	str	r2, [r4, #2996]
	add	r2, sl, r3
	add	r3, r4, #3120
	str	r3, [sp, #1024]
	ldr	r3, [sp, #1032]
	str	r2, [r6, #3168]!
	add	r2, r4, #3072
	ldr	ip, [sp, #1016]
	str	r2, [sp, #1020]
	add	r2, r3, #16
	mov	r3, #64
	str	r3, [r4, #3080]
	ldr	r3, [sp, #1020]
	str	ip, [r4, #2952]
	ldr	ip, [sp, #752]
	str	r2, [r3, #16]
	mov	r3, #65
	str	ip, [r4, #2988]
	str	r3, [r4, #3128]
	mov	ip, #201
	ldr	r3, .L20+312
	str	ip, [r4, #3004]
	ldr	ip, [sp, #752]
	add	r2, sl, r3
	ldr	r3, .L20+316
	str	ip, [r4, #3044]
	add	ip, r4, #3744
	str	r2, [r4, #3072]
	str	ip, [sp, #1044]
	add	r2, sl, r3
	ldr	ip, [sp, #900]
	ldr	r3, .L20+320
	add	r0, ip, #16
	str	r2, [r4, #3120]
	ldr	ip, [sp, #1024]
	add	r2, sl, r3
	ldr	r3, [sp, #916]
	str	r1, [r4, #2980]
	str	r1, [r4, #3028]
	add	r1, r4, #3808
	str	r1, [ip, #16]
	str	r2, [r3, #0]
	str	r0, [r6, #16]
	str	r7, [r3, #16]
	str	ip, [r4, #3084]
	ldr	r2, [sp, #1016]
	ldr	ip, [sp, #1020]
	ldr	r3, [sp, #1036]
	str	ip, [r4, #3132]
	str	r2, [r4, #3048]
	str	ip, [r4, #3092]
	ldr	r2, [sp, #1044]
	ldr	ip, [sp, #1024]
	str	r3, [r4, #3096]
	mov	r3, #246
	str	ip, [r4, #3140]
	str	r2, [r4, #3144]
	str	r3, [r4, #3052]
	mov	ip, #239
	mov	r2, #201
	sub	r3, r3, #180
	str	ip, [r4, #3100]
	str	r2, [r4, #3148]
	str	r3, [r6, #8]
	ldr	r3, [sp, #916]
	sub	ip, ip, #238
	str	r3, [r6, #12]
	str	ip, [r4, #3076]
	str	ip, [r4, #3124]
	mov	r3, #201
	str	ip, [r6, #4]
	ldr	ip, [sp, #916]
	str	r3, [r6, #28]
	sub	r3, r3, #134
	ldr	r2, [sp, #896]
	str	r3, [ip, #8]
	ldr	r3, [sp, #928]
	str	r2, [r6, #24]
	str	r3, [ip, #24]
	mov	r2, #1
	ldr	r3, .L20+324
	str	r2, [ip, #4]
	add	r2, r2, #238
	str	r2, [ip, #28]
	add	r2, sl, r3
	mov	r3, r4
	str	r6, [r6, #20]
	str	r6, [ip, #12]
	str	ip, [ip, #20]
	str	r2, [r3, #3264]!
	ldr	ip, [sp, #988]
	str	r3, [sp, #940]
	add	ip, ip, #16
	str	ip, [sp, #268]
	add	ip, r4, #3504
	str	ip, [sp, #1052]
	ldr	ip, [sp, #928]
	add	r3, r4, #3456
	add	r1, ip, #16
	ldr	ip, [sp, #860]
	add	r2, r4, #3552
	str	r3, [sp, #1048]
	ldr	r3, [sp, #932]
	str	r2, [sp, #976]
	add	ip, ip, #16
	add	r2, r4, #3696
	str	ip, [sp, #272]
	str	r2, [sp, #1056]
	ldr	ip, [sp, #968]
	add	r2, r3, #16
	ldr	r3, [sp, #964]
	add	ip, ip, #16
	add	r0, r3, #16
	add	r3, r4, #3712
	str	r3, [sp, #264]
	str	ip, [sp, #260]
	add	r3, r4, #4480
	ldr	ip, [sp, #940]
	str	r3, [sp, #256]
	mov	r3, #68
	str	r3, [ip, #8]
	ldr	r3, .L20+328
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #944]
	ldr	ip, [sp, #272]
	str	r2, [r3, #0]
	str	r1, [r3, #16]
	ldr	r3, .L20+332
	str	r0, [lr, #16]
	add	r2, sl, r3
	ldr	r3, .L20+336
	str	r2, [lr, #0]
	add	r2, sl, r3
	ldr	r3, .L20+340
	str	r2, [fp, #0]
	add	r2, sl, r3
	str	r2, [r4, #3456]
	ldr	r3, [sp, #944]
	ldr	r2, [sp, #940]
	str	ip, [fp, #16]
	ldr	ip, [sp, #936]
	str	r3, [r2, #12]
	ldr	r3, .L20+360
	str	r2, [r2, #20]
	str	ip, [r2, #24]
	ldr	ip, [sp, #944]
	str	r3, [r2, #28]
	sub	r3, r3, #213
	str	r2, [ip, #12]
	str	r3, [ip, #8]
	ldr	r2, [sp, #920]
	sub	r3, r3, #19
	str	r3, [ip, #28]
	add	r3, r3, #20
	str	r2, [ip, #24]
	str	r3, [lr, #8]
	mov	r2, #376
	mov	r3, #780
	str	ip, [ip, #20]
	str	r2, [lr, #28]
	ldr	ip, [sp, #940]
	str	r3, [fp, #28]
	mov	r2, #71
	ldr	r3, [sp, #944]
	str	r2, [fp, #8]
	sub	r2, r2, #70
	str	r2, [ip, #4]
	str	r2, [r3, #4]
	str	r2, [lr, #4]
	ldr	r2, [sp, #872]
	ldr	ip, [sp, #960]
	mov	r3, #1
	add	r2, r2, #16
	str	r3, [fp, #4]
	str	r2, [sp, #1060]
	str	r3, [r4, #3460]
	ldr	r2, [sp, #1048]
	ldr	r3, [sp, #268]
	str	ip, [lr, #24]
	ldr	ip, [sp, #864]
	str	r3, [r2, #16]
	mov	r3, #72
	str	fp, [lr, #12]
	str	r3, [r4, #3464]
	str	ip, [fp, #24]
	ldr	r2, [sp, #264]
	ldr	ip, [sp, #1052]
	ldr	r3, .L20+344
	str	lr, [lr, #20]
	str	lr, [fp, #12]
	str	fp, [fp, #20]
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	ip, [sp, #260]
	ldr	r3, [sp, #976]
	str	r2, [r4, #3504]
	ldr	r2, .L20+348
	str	ip, [r3, #16]
	mov	r3, #73
	str	r3, [r4, #3512]
	add	r3, sl, r2
	mov	r2, #74
	str	r3, [r4, #3552]
	str	r2, [r4, #3560]
	ldr	r3, .L20+352
	ldr	r2, [sp, #972]
	ldr	ip, [sp, #256]
	str	r2, [r4, #3576]
	add	r2, sl, r3
	mov	r3, #75
	str	r3, [r4, #3608]
	ldr	r3, [sp, #980]
	str	r2, [r4, #3600]
	str	ip, [r3, #16]
	str	r3, [r4, #3620]
	ldr	r3, .L20+356
	ldr	ip, [sp, #992]
	add	r2, sl, r3
	str	r2, [r4, #3648]
	ldr	r2, [sp, #1052]
	mov	r3, #76
	str	r3, [r4, #3656]
	str	r2, [r4, #3468]
	ldr	r3, [sp, #1048]
	mov	r2, #239
	str	r2, [r4, #3484]
	ldr	r2, [sp, #1052]
	str	r3, [r4, #3476]
	str	ip, [r4, #3480]
	mov	r3, #1
	ldr	ip, [sp, #1048]
	str	r3, [r4, #3508]
	str	r2, [r4, #3524]
	ldr	r3, .L20+360
	ldr	r2, [sp, #980]
	add	r7, r4, #3648
	str	ip, [r4, #3516]
	mov	ip, #1
	str	r3, [r4, #3532]
	str	ip, [r4, #3556]
	str	r7, [r4, #3528]
	str	r2, [r4, #3564]
	ldr	r3, [sp, #976]
	mov	r2, #1
	str	r3, [r4, #3572]
	str	r3, [r4, #3612]
	ldr	r3, [sp, #996]
	ldr	ip, .L20+360
	str	r3, [r4, #3624]
	ldr	r3, [sp, #696]
	str	r2, [r4, #3604]
	add	fp, r3, #16
	str	r2, [r4, #3652]
	ldr	r3, .L20+364
	ldr	r2, [sp, #1056]
	str	ip, [r4, #3580]
	str	r2, [r4, #3660]
	sub	ip, ip, #239
	add	r2, sl, r3
	mov	r0, r4
	add	r3, r4, #6016
	str	r2, [r0, #3840]!
	str	ip, [r4, #3628]
	add	r2, r4, #5952
	ldr	ip, [sp, #588]
	add	r3, r3, #32
	str	r2, [sp, #1064]
	str	r3, [sp, #1072]
	add	r2, r4, #4800
	add	r3, r4, #3136
	str	r3, [sp, #252]
	add	r5, ip, #16
	str	r2, [sp, #868]
	add	ip, r4, #3792
	add	r2, r4, #5440
	mov	r3, #77
	str	r2, [r7, #16]
	str	ip, [sp, #1040]
	ldr	r2, [sp, #1044]
	ldr	ip, [sp, #1056]
	str	r3, [r4, #3704]
	ldr	r3, [sp, #1048]
	add	r1, r4, #3520
	str	r1, [ip, #16]
	str	r3, [r4, #3720]
	str	fp, [r2, #16]
	mov	r3, #78
	mov	r2, #79
	ldr	ip, [sp, #1044]
	str	r3, [r4, #3752]
	str	r2, [r4, #3800]
	ldr	r3, [sp, #252]
	ldr	r2, [sp, #1040]
	str	ip, [r4, #3804]
	str	r7, [r4, #3708]
	str	r3, [r2, #16]
	ldr	r3, .L20+368
	mov	ip, #201
	add	r2, sl, r3
	ldr	r3, .L20+372
	str	r2, [r4, #3696]
	add	r2, sl, r3
	ldr	r3, .L20+376
	str	r2, [r4, #3744]
	add	r2, sl, r3
	str	r2, [r4, #3792]
	ldr	r3, [sp, #1008]
	ldr	r2, [sp, #868]
	str	ip, [r4, #3820]
	str	r3, [r4, #3672]
	add	r2, r2, #48
	ldr	r3, [sp, #1056]
	sub	ip, ip, #158
	str	ip, [r4, #3676]
	str	r2, [sp, #868]
	add	ip, ip, #239
	mov	r2, #1
	str	r2, [r4, #3700]
	str	r3, [r4, #3716]
	str	ip, [r4, #3724]
	str	r2, [r4, #3748]
	ldr	r3, [sp, #1044]
	ldr	r2, [sp, #1040]
	ldr	ip, [sp, #700]
	str	r2, [r4, #3756]
	str	r3, [r4, #3764]
	str	ip, [r4, #3768]
	mov	r3, #1
	ldr	ip, [sp, #1040]
	mov	r2, #246
	str	r2, [r4, #3772]
	str	r3, [r4, #3796]
	ldr	r2, [sp, #1020]
	str	r3, [r0, #8]
	ldr	r3, [sp, #584]
	str	ip, [r4, #3812]
	ldr	ip, [sp, #568]
	str	r2, [r4, #3816]
	str	r7, [r4, #3668]
	str	r3, [r0, #12]
	ldr	r3, .L20+380
	mov	lr, #2
	add	ip, ip, #16
	add	r2, sl, r3
	str	r5, [r0, #16]
	str	lr, [r0, #4]
	str	ip, [r0, #32]
	ldr	r3, [sp, #584]
	mov	r1, r4
	str	r2, [r3, #0]
	add	ip, r3, #16
	ldr	r3, .L20+384
	str	ip, [sp, #248]
	add	r2, sl, r3
	str	r2, [r1, #3936]!
	ldr	r3, [sp, #524]
	ldr	r2, [sp, #544]
	ldr	ip, [sp, #516]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #244]
	str	r3, [sp, #240]
	str	ip, [sp, #236]
	ldr	r2, [sp, #560]
	ldr	r3, [sp, #600]
	ldr	ip, [sp, #476]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #232]
	str	r3, [sp, #228]
	str	ip, [sp, #224]
	ldr	r2, [sp, #1000]
	ldr	r3, [sp, #880]
	ldr	ip, [sp, #832]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #216]
	str	r3, [sp, #208]
	str	ip, [sp, #204]
	ldr	r2, [sp, #888]
	ldr	r3, [sp, #796]
	ldr	ip, [sp, #960]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #196]
	str	r3, [sp, #192]
	str	ip, [sp, #172]
	ldr	r2, [sp, #936]
	ldr	r3, [sp, #992]
	ldr	ip, [sp, #688]
	add	r2, r2, #16
	add	r3, r3, #16
	add	ip, ip, #16
	str	r2, [sp, #168]
	str	r3, [sp, #164]
	str	r0, [r0, #20]
	str	ip, [sp, #160]
	ldr	r2, [sp, #916]
	ldr	r3, [sp, #944]
	add	r2, r2, #16
	add	r3, r3, #16
	str	r2, [sp, #156]
	str	r3, [sp, #152]
	ldr	ip, [sp, #864]
	ldr	r2, [sp, #620]
	ldr	r3, [sp, #680]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #144]
	str	r2, [sp, #136]
	str	r3, [sp, #132]
	ldr	ip, [sp, #1060]
	ldr	r2, [sp, #852]
	ldr	r3, [sp, #492]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #120]
	str	r2, [sp, #116]
	str	r3, [sp, #112]
	ldr	ip, [sp, #808]
	ldr	r2, [sp, #512]
	ldr	r3, [sp, #636]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #108]
	str	r2, [sp, #100]
	str	r3, [sp, #96]
	ldr	ip, [sp, #664]
	ldr	r2, [sp, #844]
	ldr	r3, [sp, #644]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #92]
	str	r2, [sp, #88]
	str	r3, [sp, #84]
	ldr	ip, [sp, #752]
	ldr	r2, [sp, #820]
	ldr	r3, [sp, #892]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #80]
	str	r2, [sp, #72]
	str	r3, [sp, #68]
	ldr	ip, [sp, #800]
	ldr	r2, [sp, #672]
	ldr	r3, [sp, #728]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #64]
	str	r2, [sp, #56]
	str	r3, [sp, #48]
	ldr	ip, [sp, #896]
	ldr	r2, [sp, #1020]
	ldr	r3, [sp, #744]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #36]
	str	r2, [sp, #28]
	str	r3, [sp, #24]
	ldr	ip, [sp, #776]
	ldr	r2, [sp, #608]
	ldr	r3, [sp, #468]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	str	ip, [sp, #20]
	str	r2, [sp, #16]
	str	r3, [sp, #12]
	ldr	ip, [sp, #576]
	ldr	r2, [sp, #536]
	ldr	r3, [sp, #552]
	add	ip, ip, #16
	add	r2, r2, #16
	add	r3, r3, #16
	stmib	sp, {r2, ip}	@ phole stm
	str	r3, [sp, #0]
	add	ip, r4, #5952
	add	r3, r4, #3952
	add	r2, r4, #6080
	add	ip, ip, #48
	add	r2, r2, #16
	str	r3, [sp, #556]
	ldr	r3, [sp, #780]
	str	ip, [sp, #1068]
	str	r2, [sp, #1076]
	ldr	ip, [sp, #824]
	ldr	r2, [sp, #604]
	add	r3, r3, #16
	add	fp, ip, #16
	str	r3, [sp, #220]
	add	ip, r2, #16
	ldr	r3, [sp, #804]
	ldr	r2, [sp, #836]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r2, [sp, #212]
	str	r3, [sp, #200]
	add	r3, r4, #2752
	add	r2, r4, #3616
	str	r3, [sp, #184]
	ldr	r3, [sp, #956]
	str	r2, [sp, #188]
	add	r2, r4, #3472
	str	r2, [sp, #180]
	add	r3, r3, #16
	ldr	r2, [sp, #480]
	str	r3, [sp, #176]
	add	r3, r4, #16
	add	r2, r2, #16
	str	r3, [sp, #140]
	ldr	r3, [sp, #848]
	str	r2, [sp, #148]
	add	r2, r4, #3760
	str	r2, [sp, #128]
	add	r3, r3, #16
	ldr	r2, [sp, #840]
	str	r3, [sp, #124]
	add	r3, r4, #3664
	add	r2, r2, #16
	str	r3, [sp, #76]
	ldr	r3, [sp, #772]
	str	r2, [sp, #104]
	ldr	r2, [sp, #1064]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #52]
	ldr	r3, [sp, #1072]
	str	r2, [sp, #60]
	ldr	r2, [sp, #1036]
	add	r3, r3, #16
	add	r2, r2, #16
	str	r3, [sp, #40]
	ldr	r3, [sp, #592]
	str	r2, [sp, #44]
	ldr	r2, [sp, #912]
	str	r3, [r0, #24]
	ldr	r3, .L23
	add	r2, r2, #16
	str	r2, [sp, #32]
	str	r3, [r0, #28]
	ldr	r2, [sp, #564]
	ldr	r3, .L23+4
	str	r2, [r0, #40]
	add	r2, sl, r3
	ldr	r3, [sp, #560]
	str	r2, [r3, #0]
	ldr	r3, [sp, #556]
	ldr	r2, [sp, #584]
	str	r3, [r2, #16]
	ldr	r2, [sp, #248]
	ldr	r3, [sp, #244]
	str	r2, [r1, #16]
	str	r3, [r1, #32]
	ldr	r2, [sp, #560]
	ldr	r3, [sp, #240]
	str	r0, [r0, #36]
	str	r3, [r2, #16]
	ldr	r3, [sp, #584]
	mov	r2, #229
	str	r2, [r0, #44]
	sub	r2, r2, #228
	str	r2, [r3, #8]
	ldr	r2, [sp, #560]
	str	r0, [r3, #12]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	ldr	r3, [sp, #540]
	ldr	r2, [sp, #584]
	str	r3, [r1, #40]
	mov	r3, #188
	str	r3, [r2, #28]
	ldr	r2, [sp, #560]
	ldr	r3, [sp, #584]
	str	r2, [r1, #12]
	mov	r2, #3
	str	r2, [r3, #4]
	mov	r3, #188
	str	r3, [r1, #28]
	add	r2, r2, #226
	ldr	r3, [sp, #560]
	str	r2, [r1, #44]
	sub	r2, r2, #226
	str	lr, [r1, #4]
	str	lr, [r1, #8]
	stmib	r3, {r2, lr}	@ phole stm
	str	r0, [r1, #24]
	str	r1, [r1, #20]
	str	r1, [r1, #36]
	str	r1, [r3, #12]
	ldr	r2, [sp, #528]
	str	r3, [r3, #20]
	str	r2, [r3, #24]
	mov	r2, #185
	str	r2, [r3, #28]
	ldr	r3, [sp, #520]
	str	r1, [r9, #40]
	str	r3, [r9, #24]
	ldr	r3, .L23+8
	str	r9, [r9, #20]
	add	r2, sl, r3
	ldr	r3, [sp, #232]
	str	r2, [r9, #0]
	str	r3, [r9, #32]
	ldr	r2, [sp, #236]
	ldr	r3, .L23+12
	str	r2, [r9, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #528]
	str	r9, [r9, #36]
	str	r2, [r3, #0]
	str	fp, [r3, #16]
	ldr	r3, .L23+16
	add	r2, sl, r3
	ldr	r3, [sp, #612]
	str	r2, [r3, #0]
	ldr	r2, [sp, #228]
	str	ip, [r3, #32]
	str	r2, [r3, #16]
	ldr	r3, .L23+20
	ldr	ip, [sp, #528]
	add	r2, sl, r3
	ldr	r3, [sp, #620]
	str	ip, [r9, #12]
	str	r2, [r3, #0]
	mov	r2, #3
	str	r2, [r9, #8]
	mov	r3, #231
	ldr	r2, [sp, #528]
	str	r9, [ip, #12]
	mov	ip, #185
	str	r3, [r9, #28]
	str	ip, [r9, #44]
	sub	r3, r3, #103
	sub	ip, ip, #182
	str	r3, [r2, #28]
	str	ip, [r2, #8]
	ldr	r2, [sp, #612]
	add	r3, r3, #147
	str	r3, [r2, #28]
	ldr	r3, [sp, #612]
	mov	r2, #236
	ldr	ip, [sp, #528]
	str	r2, [r3, #44]
	ldr	r2, [sp, #820]
	str	ip, [ip, #20]
	str	r2, [ip, #24]
	ldr	ip, [sp, #596]
	mov	r2, #4
	str	ip, [r3, #24]
	str	r2, [r3, #8]
	ldr	r3, [sp, #528]
	mov	ip, #3
	ldr	r2, [sp, #612]
	str	lr, [r9, #4]
	str	ip, [r3, #4]
	ldr	ip, [sp, #608]
	ldr	r3, [sp, #620]
	str	ip, [r2, #40]
	ldr	ip, [sp, #224]
	str	r3, [r2, #12]
	str	lr, [r2, #4]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	mov	r2, #3
	str	ip, [r3, #16]
	str	r2, [r3, #4]
	ldr	r3, .L23+24
	ldr	ip, [sp, #220]
	add	r2, sl, r3
	ldr	r3, [sp, #792]
	str	r2, [r3, #0]
	ldr	r2, [sp, #216]
	str	ip, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L23+28
	ldr	ip, [sp, #212]
	add	r2, sl, r3
	ldr	r3, [sp, #800]
	str	r2, [r3, #0]
	str	ip, [r3, #16]
	ldr	r3, .L23+32
	add	r2, sl, r3
	str	r2, [r8, #0]
	ldr	r2, [sp, #208]
	ldr	r3, [sp, #620]
	ldr	ip, [sp, #612]
	str	r2, [r8, #16]
	ldr	r2, [sp, #480]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	mov	ip, #4
	mov	r2, #185
	str	ip, [r3, #8]
	str	r2, [r3, #28]
	str	r3, [r3, #20]
	ldr	ip, [sp, #800]
	ldr	r3, [sp, #792]
	ldr	r2, [sp, #776]
	str	ip, [r3, #12]
	ldr	ip, [sp, #1004]
	str	r2, [r3, #24]
	str	ip, [r3, #40]
	mov	r2, #5
	mov	ip, #239
	str	r2, [r3, #8]
	str	ip, [r3, #28]
	ldr	r2, .L23+36
	ldr	ip, [sp, #800]
	str	r2, [r3, #44]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	lr, [r3, #4]
	str	r3, [ip, #12]
	ldr	r2, [sp, #828]
	ldr	r3, [sp, #876]
	str	r2, [ip, #24]
	str	r3, [r8, #24]
	mov	r2, #3
	mov	r3, #5
	stmib	ip, {r2, r3}	@ phole stm
	add	r2, r2, #152
	add	r3, r3, #1
	str	r2, [ip, #28]
	str	ip, [ip, #20]
	str	lr, [r8, #4]
	str	r3, [r8, #8]
	ldr	r3, [sp, #204]
	ldr	ip, [sp, #812]
	str	r3, [r8, #32]
	ldr	r3, .L23+40
	add	r2, r2, #84
	str	r2, [r8, #28]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, .L23+44
	ldr	r2, [sp, #200]
	str	ip, [r8, #12]
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #996]
	ldr	ip, .L23+48
	str	r2, [r3, #0]
	ldr	r3, .L23+52
	str	r8, [r8, #20]
	add	r2, sl, r3
	ldr	r3, .L23+56
	str	r2, [r4, ip]
	add	r2, sl, r3
	ldr	r3, .L23+60
	ldr	ip, [sp, #996]
	str	r2, [r4, r3]
	ldr	r2, [sp, #196]
	ldr	r3, [sp, #192]
	str	r2, [ip, #16]
	str	r3, [ip, #32]
	ldr	r2, [sp, #188]
	ldr	ip, [sp, #1004]
	ldr	r3, [sp, #836]
	str	r2, [ip, #16]
	ldr	ip, [sp, #812]
	ldr	r2, .L23+36
	str	r3, [r8, #40]
	mov	r3, #6
	str	r2, [r8, #44]
	str	r3, [ip, #8]
	ldr	r3, [sp, #808]
	mov	r2, #61
	str	r8, [r8, #36]
	str	r2, [ip, #28]
	str	r3, [ip, #24]
	str	r8, [ip, #12]
	str	ip, [ip, #20]
	ldr	r2, [sp, #884]
	ldr	ip, [sp, #996]
	str	r2, [ip, #24]
	ldr	r3, [sp, #1004]
	mov	r2, #3
	str	r3, [ip, #12]
	ldr	ip, [sp, #812]
	ldr	r3, [sp, #996]
	str	r2, [ip, #4]
	mov	ip, #7
	add	r2, r2, #228
	str	ip, [r3, #8]
	str	r2, [r3, #28]
	ldr	ip, [sp, #800]
	ldr	r2, [sp, #1004]
	str	ip, [r3, #40]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	r3, [r2, #12]
	ldr	r3, [sp, #976]
	ldr	ip, [sp, #996]
	str	r3, [r2, #24]
	ldr	r2, .L23+36
	ldr	r3, [sp, #1004]
	str	r2, [ip, #44]
	mov	ip, #7
	sub	r2, r2, #328
	str	ip, [r3, #8]
	str	r2, [r3, #28]
	ldr	r3, [sp, #996]
	ldr	ip, [sp, #1004]
	str	lr, [r3, #4]
	ldr	r3, [sp, #984]
	sub	r2, r2, #40
	str	r2, [ip, #4]
	str	lr, [r3, #4]
	ldr	r3, .L23+64
	str	ip, [ip, #20]
	ldr	ip, .L23+68
	add	r2, sl, r3
	str	r2, [r4, ip]
	ldr	r2, [sp, #984]
	mov	r3, #316
	str	r3, [r2, #28]
	ldr	ip, [sp, #968]
	ldr	r3, [sp, #1052]
	str	ip, [r2, #24]
	str	r3, [r2, #40]
	ldr	r3, [sp, #180]
	ldr	ip, [sp, #184]
	str	r3, [r2, #32]
	ldr	r3, .L23+72
	str	ip, [r2, #16]
	ldr	ip, [sp, #948]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, [sp, #176]
	ldr	r2, [sp, #992]
	ldr	ip, [sp, #956]
	str	r3, [r2, #16]
	ldr	r3, .L23+76
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, [sp, #172]
	ldr	r2, [sp, #948]
	ldr	ip, [sp, #168]
	str	r3, [r2, #16]
	str	ip, [r2, #32]
	ldr	r3, [sp, #992]
	ldr	r2, [sp, #984]
	mov	ip, #8
	str	r3, [r2, #12]
	mov	r3, #239
	str	ip, [r2, #8]
	str	r3, [r2, #44]
	ldr	r2, [sp, #992]
	ldr	r3, [sp, #984]
	str	ip, [r2, #8]
	add	ip, ip, #147
	str	ip, [r2, #28]
	str	r3, [r3, #20]
	ldr	r2, [sp, #948]
	str	r3, [r3, #36]
	ldr	r3, .L23+80
	ldr	ip, [sp, #992]
	str	r3, [r2, #28]
	sub	r3, r3, #80
	str	r3, [r2, #44]
	ldr	r2, [sp, #984]
	str	r2, [ip, #12]
	str	ip, [ip, #20]
	ldr	r3, [sp, #948]
	ldr	r2, [sp, #932]
	str	r3, [ip, #24]
	ldr	ip, [sp, #964]
	str	r2, [r3, #40]
	str	ip, [r3, #24]
	ldr	r3, [sp, #992]
	mov	ip, #3
	ldr	r2, [sp, #948]
	str	ip, [r3, #4]
	ldr	ip, [sp, #956]
	mov	r3, #9
	str	ip, [r2, #12]
	str	r3, [r2, #8]
	str	lr, [r2, #4]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	mov	r2, #3
	str	r2, [ip, #4]
	ldr	r2, [sp, #984]
	str	r3, [ip, #8]
	ldr	r3, [sp, #948]
	str	r2, [ip, #24]
	ldr	r2, [sp, #164]
	str	r3, [ip, #12]
	mov	r3, #155
	str	r2, [ip, #16]
	str	r3, [ip, #28]
	ldr	r3, [sp, #920]
	ldr	ip, [sp, #684]
	ldr	r2, [sp, #160]
	str	ip, [r3, #24]
	ldr	ip, [sp, #156]
	str	r2, [r3, #16]
	str	ip, [r3, #32]
	str	r6, [r3, #40]
	ldr	r3, .L23+84
	add	r2, sl, r3
	ldr	r3, [sp, #920]
	str	r2, [r3, #0]
	ldr	ip, [sp, #928]
	ldr	r2, [sp, #152]
	ldr	r3, .L23+88
	str	r2, [ip, #16]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, [sp, #872]
	ldr	ip, [sp, #148]
	str	ip, [r3, #16]
	ldr	r3, .L23+92
	ldr	ip, [sp, #856]
	add	r2, sl, r3
	ldr	r3, [sp, #872]
	str	r2, [r3, #0]
	ldr	r2, [sp, #956]
	str	ip, [r3, #32]
	str	r2, [r2, #20]
	ldr	r3, [sp, #920]
	ldr	r2, [sp, #928]
	mov	ip, #10
	str	r2, [r3, #12]
	str	ip, [r3, #8]
	ldr	r3, [sp, #940]
	ldr	ip, [sp, #920]
	str	r3, [r2, #24]
	ldr	r3, [sp, #928]
	mov	r2, #239
	str	r2, [ip, #28]
	str	r2, [ip, #44]
	str	ip, [ip, #20]
	str	ip, [ip, #36]
	sub	r2, r2, #189
	str	ip, [r3, #12]
	mov	ip, #10
	str	ip, [r3, #8]
	str	r2, [r3, #28]
	ldr	r3, [sp, #920]
	ldr	ip, [sp, #928]
	str	lr, [r3, #4]
	sub	r2, r2, #47
	ldr	r3, [sp, #872]
	str	r2, [ip, #4]
	str	ip, [ip, #20]
	mov	ip, #11
	str	ip, [r3, #8]
	ldr	r2, [sp, #868]
	ldr	ip, [sp, #472]
	str	r2, [r3, #12]
	mov	r2, #188
	str	r2, [r3, #28]
	str	ip, [r3, #24]
	str	lr, [r3, #4]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	ldr	r3, .L23+96
	ldr	ip, [sp, #144]
	add	r2, sl, r3
	ldr	r3, [sp, #868]
	str	r2, [r3, #0]
	str	ip, [r3, #16]
	ldr	r3, .L23+100
	ldr	ip, [sp, #140]
	add	r2, sl, r3
	ldr	r3, [sp, #472]
	str	r2, [r3, #0]
	ldr	r2, [sp, #136]
	str	ip, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L23+104
	ldr	ip, [sp, #692]
	add	r2, sl, r3
	ldr	r3, [sp, #480]
	str	r2, [r3, #0]
	ldr	r3, .L23+108
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, .L23+112
	ldr	r2, [sp, #872]
	ldr	ip, [sp, #868]
	str	r3, [r2, #44]
	mov	r2, #11
	str	r2, [ip, #8]
	ldr	r3, [sp, #872]
	ldr	ip, [sp, #500]
	ldr	r2, [sp, #868]
	str	ip, [r3, #40]
	ldr	r3, [sp, #860]
	ldr	ip, [sp, #872]
	str	r3, [r2, #24]
	str	ip, [r2, #12]
	ldr	r3, [sp, #612]
	ldr	r2, [sp, #472]
	ldr	ip, [sp, #868]
	str	r3, [r2, #40]
	ldr	r3, [sp, #472]
	mov	r2, #50
	str	r2, [ip, #28]
	ldr	r2, [sp, #868]
	mov	ip, #185
	str	ip, [r3, #44]
	ldr	ip, [sp, #472]
	mov	r3, #3
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	r3, [sp, #480]
	mov	r2, #12
	str	r2, [ip, #8]
	add	r2, r2, #219
	str	r3, [ip, #12]
	str	r2, [ip, #28]
	mov	ip, #188
	sub	r2, r2, #219
	str	ip, [r3, #28]
	str	r2, [r3, #8]
	ldr	ip, [sp, #468]
	ldr	r3, [sp, #472]
	ldr	r2, [sp, #480]
	str	ip, [r3, #24]
	str	lr, [r3, #4]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	ldr	ip, [sp, #1060]
	str	r3, [r2, #12]
	mov	r3, #3
	str	r3, [r2, #4]
	ldr	r3, [sp, #868]
	str	ip, [r2, #16]
	ldr	ip, [sp, #692]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	mov	r2, #13
	str	lr, [ip, #4]
	str	r2, [ip, #8]
	ldr	r3, [sp, #700]
	ldr	r2, [sp, #676]
	str	r3, [ip, #12]
	ldr	r3, [sp, #1040]
	str	r2, [ip, #24]
	str	r3, [ip, #40]
	ldr	r3, [sp, #128]
	ldr	r2, [sp, #132]
	str	r3, [ip, #32]
	ldr	r3, .L23+116
	str	r2, [ip, #16]
	ldr	ip, [sp, #700]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, .L23+120
	ldr	r2, [sp, #124]
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #504]
	ldr	ip, [sp, #120]
	str	r2, [r3, #0]
	ldr	r2, [sp, #116]
	str	ip, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L23+124
	ldr	ip, [sp, #112]
	add	r2, sl, r3
	ldr	r3, [sp, #500]
	str	r2, [r3, #0]
	ldr	r2, [sp, #692]
	str	ip, [r3, #16]
	ldr	ip, [sp, #700]
	mov	r3, #231
	str	r3, [r2, #28]
	add	r3, r3, #15
	str	r3, [r2, #44]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	sub	r3, r3, #126
	str	r2, [ip, #12]
	mov	r2, #13
	str	r3, [ip, #28]
	str	r2, [ip, #8]
	ldr	r3, [sp, #504]
	ldr	ip, .L23+112
	str	ip, [r3, #28]
	ldr	r2, [sp, #504]
	ldr	r3, .L23+128
	ldr	ip, [sp, #852]
	str	r3, [r2, #44]
	ldr	r3, [sp, #700]
	str	ip, [r3, #24]
	str	r3, [r3, #20]
	ldr	ip, [sp, #848]
	ldr	r3, [sp, #868]
	str	ip, [r2, #40]
	str	r3, [r2, #24]
	ldr	r2, [sp, #700]
	mov	r3, #3
	ldr	ip, [sp, #504]
	str	r3, [r2, #4]
	ldr	r3, [sp, #500]
	mov	r2, #14
	str	r3, [ip, #12]
	str	r2, [ip, #8]
	str	ip, [ip, #20]
	str	r2, [r3, #8]
	str	ip, [ip, #36]
	str	lr, [ip, #4]
	str	ip, [r3, #12]
	ldr	r2, [sp, #496]
	mov	ip, #3
	str	ip, [r3, #4]
	add	ip, ip, #40
	str	ip, [r3, #28]
	str	r2, [r3, #24]
	str	r3, [r3, #20]
	ldr	r2, [sp, #760]
	ldr	r3, [sp, #804]
	ldr	ip, [sp, #760]
	str	r3, [r2, #24]
	ldr	r3, .L23+132
	str	r3, [r2, #28]
	ldr	r2, .L23+136
	str	r2, [ip, #44]
	ldr	r2, [sp, #108]
	str	r2, [ip, #16]
	ldr	r3, [sp, #104]
	str	r3, [ip, #32]
	ldr	r3, .L23+140
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, .L23+144
	ldr	ip, [sp, #756]
	ldr	r2, [sp, #100]
	str	r2, [ip, #16]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, [sp, #648]
	ldr	ip, [sp, #96]
	str	ip, [r3, #16]
	ldr	r3, .L23+148
	ldr	ip, [sp, #92]
	add	r2, sl, r3
	ldr	r3, [sp, #648]
	str	r2, [r3, #0]
	str	ip, [r3, #32]
	ldr	r2, [sp, #760]
	ldr	r3, [sp, #756]
	ldr	ip, [sp, #844]
	str	r3, [r2, #12]
	str	ip, [r2, #40]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	ldr	r2, [sp, #508]
	ldr	ip, [sp, #632]
	str	r2, [r3, #24]
	ldr	r3, [sp, #648]
	ldr	r2, [sp, #660]
	str	ip, [r3, #24]
	str	r2, [r3, #40]
	ldr	r3, [sp, #760]
	mov	ip, #15
	ldr	r2, [sp, #756]
	str	ip, [r3, #8]
	mov	r3, #50
	str	ip, [r2, #8]
	str	r3, [r2, #28]
	ldr	ip, [sp, #648]
	mov	r2, #231
	str	r2, [ip, #28]
	ldr	r3, [sp, #756]
	ldr	ip, [sp, #760]
	ldr	r2, [sp, #648]
	str	r3, [r3, #20]
	str	lr, [ip, #4]
	mov	r3, #16
	ldr	ip, [sp, #756]
	str	r3, [r2, #8]
	mov	r2, #3
	ldr	r3, [sp, #648]
	str	r2, [ip, #4]
	ldr	ip, [sp, #656]
	add	r2, r2, #236
	str	ip, [r3, #12]
	str	r2, [r3, #44]
	str	r3, [r3, #20]
	str	r3, [r3, #36]
	str	lr, [r3, #4]
	mov	r3, #128
	str	r3, [ip, #28]
	sub	r3, r3, #112
	ldr	r2, [sp, #648]
	str	r3, [ip, #8]
	ldr	r3, [sp, #88]
	str	r2, [ip, #12]
	str	r3, [ip, #16]
	ldr	r2, [sp, #840]
	ldr	r3, .L23+152
	str	r2, [ip, #24]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	ip, [sp, #1008]
	ldr	r2, [sp, #640]
	mov	r3, #239
	str	r3, [ip, #28]
	add	r3, r3, #7
	str	r2, [ip, #24]
	str	r3, [ip, #44]
	ldr	r2, [sp, #748]
	ldr	r3, .L23+156
	str	r2, [ip, #40]
	add	r2, sl, r3
	ldr	r3, .L23+160
	str	r2, [ip, #0]
	ldr	ip, .L23+164
	add	r2, sl, r3
	str	r2, [r4, ip]
	ldr	r3, [sp, #84]
	ldr	r2, [sp, #1008]
	ldr	ip, [sp, #80]
	str	r3, [r2, #16]
	ldr	r3, .L23+168
	str	ip, [r2, #32]
	add	r2, sl, r3
	ldr	r3, [sp, #828]
	ldr	ip, [sp, #1016]
	str	r2, [r3, #0]
	ldr	r2, [sp, #76]
	str	r2, [ip, #16]
	ldr	ip, [sp, #72]
	ldr	r2, [sp, #656]
	str	ip, [r3, #16]
	mov	r3, #3
	str	r2, [r2, #20]
	str	r3, [r2, #4]
	ldr	ip, [sp, #1008]
	ldr	r2, [sp, #1016]
	ldr	r3, [sp, #1056]
	str	r2, [ip, #12]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1016]
	mov	r2, #17
	str	r2, [ip, #8]
	str	r2, [r3, #8]
	ldr	r2, [sp, #1008]
	mov	ip, #43
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	ip, [r3, #28]
	str	r2, [r3, #12]
	str	lr, [r2, #4]
	sub	ip, ip, #40
	ldr	r2, [sp, #828]
	str	ip, [r3, #4]
	str	r3, [r3, #20]
	mov	r3, #18
	str	r3, [r2, #8]
	ldr	ip, [sp, #836]
	ldr	r3, [sp, #824]
	str	ip, [r2, #12]
	str	r3, [r2, #24]
	ldr	ip, [sp, #812]
	mov	r3, #231
	str	r3, [r2, #28]
	add	r3, r3, #140
	str	ip, [r2, #40]
	str	r3, [r2, #44]
	ldr	ip, [sp, #836]
	str	lr, [r2, #4]
	str	r2, [r2, #20]
	ldr	r2, [sp, #792]
	ldr	r3, [sp, #828]
	str	r2, [ip, #24]
	ldr	ip, [sp, #68]
	ldr	r2, [sp, #836]
	str	ip, [r3, #32]
	mov	r3, #18
	str	r3, [r2, #8]
	ldr	r3, [sp, #64]
	mov	ip, #155
	str	r3, [r2, #16]
	ldr	r3, .L23+172
	str	ip, [r2, #28]
	ldr	ip, [sp, #836]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, [sp, #60]
	ldr	r2, [sp, #764]
	ldr	ip, [sp, #764]
	str	r3, [r2, #16]
	ldr	r3, .L23+176
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, .L23+180
	ldr	r2, [sp, #56]
	str	r2, [ip, #32]
	add	r2, sl, r3
	ldr	ip, [sp, #740]
	ldr	r3, [sp, #772]
	str	r2, [r3, #0]
	str	ip, [r3, #16]
	ldr	r3, [sp, #836]
	ldr	r2, [sp, #828]
	ldr	ip, [sp, #764]
	str	r2, [r2, #36]
	str	r2, [r3, #12]
	ldr	r2, [sp, #668]
	str	r3, [r3, #20]
	str	r2, [ip, #40]
	mov	ip, #3
	ldr	r2, [sp, #764]
	str	ip, [r3, #4]
	ldr	r3, [sp, #772]
	ldr	ip, [sp, #1068]
	str	r3, [r2, #12]
	str	ip, [r2, #24]
	mov	r3, #153
	mov	ip, #253
	str	r3, [r2, #8]
	str	ip, [r2, #28]
	add	r3, r3, #93
	ldr	ip, [sp, #772]
	str	r3, [r2, #44]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	str	lr, [r2, #4]
	mov	r2, #153
	str	r2, [ip, #8]
	sub	r3, r3, #243
	ldr	r2, [sp, #764]
	str	r3, [ip, #4]
	ldr	r3, [sp, #744]
	str	r2, [ip, #12]
	mov	r2, #0
	str	r3, [ip, #24]
	str	r2, [ip, #28]
	ldr	r3, [sp, #736]
	str	ip, [ip, #20]
	ldr	r2, [sp, #732]
	ldr	ip, [sp, #764]
	str	ip, [r3, #24]
	str	r2, [r3, #40]
	ldr	r3, .L23+184
	ldr	ip, [sp, #52]
	add	r2, sl, r3
	ldr	r3, [sp, #736]
	str	r2, [r3, #0]
	ldr	r2, [sp, #48]
	str	ip, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L23+188
	ldr	ip, [sp, #44]
	add	r2, sl, r3
	ldr	r3, [sp, #744]
	str	r2, [r3, #0]
	str	ip, [r3, #16]
	ldr	r3, .L23+192
	ldr	ip, [sp, #40]
	add	r2, sl, r3
	ldr	r3, [sp, #904]
	str	r2, [r3, #0]
	ldr	r2, [sp, #36]
	str	ip, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L23+196
	ldr	ip, [sp, #736]
	add	r2, sl, r3
	ldr	r3, [sp, #912]
	str	ip, [ip, #20]
	str	r2, [r3, #0]
	ldr	r2, [sp, #744]
	mov	r3, #154
	str	r2, [ip, #12]
	str	r3, [ip, #8]
	mov	r2, #0
	add	r3, r3, #85
	str	r2, [ip, #28]
	str	r3, [ip, #44]
	str	ip, [ip, #36]
	ldr	ip, [sp, #744]
	add	r2, r2, #154
	str	r2, [ip, #8]
	ldr	r3, [sp, #736]
	ldr	r2, [sp, #1028]
	str	r3, [ip, #12]
	str	r2, [ip, #24]
	str	ip, [ip, #20]
	ldr	r3, [sp, #904]
	ldr	ip, [sp, #900]
	str	ip, [r3, #40]
	ldr	r2, [sp, #744]
	mov	r3, #0
	str	r3, [r2, #28]
	ldr	ip, [sp, #904]
	ldr	r3, [sp, #736]
	mov	r2, #246
	str	lr, [r3, #4]
	str	r2, [ip, #44]
	ldr	r3, [sp, #744]
	sub	r2, r2, #91
	str	r2, [ip, #8]
	mov	ip, #3
	ldr	r2, [sp, #904]
	str	ip, [r3, #4]
	ldr	r3, [sp, #912]
	ldr	ip, [sp, #1076]
	str	r3, [r2, #12]
	ldr	r3, .L23
	str	ip, [r2, #24]
	ldr	ip, [sp, #912]
	str	lr, [r2, #4]
	str	r3, [r2, #28]
	str	r2, [r2, #20]
	str	r2, [r2, #36]
	sub	r3, r3, #127
	mov	r2, #3
	stmib	ip, {r2, r3}	@ phole stm
	ldr	r2, [sp, #1032]
	ldr	r3, .L23+200
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #1028]
	ldr	ip, [sp, #32]
	str	r2, [r3, #0]
	ldr	r2, [sp, #28]
	str	lr, [r3, #4]
	str	ip, [r3, #16]
	str	r2, [r3, #32]
	ldr	r3, .L23+204
	mov	ip, #3
	add	r2, sl, r3
	ldr	r3, [sp, #1036]
	str	r2, [r3, #0]
	ldr	r2, [sp, #24]
	str	ip, [r3, #4]
	str	r2, [r3, #16]
	ldr	r3, .L23+208
	ldr	ip, [sp, #768]
	add	r2, sl, r3
	ldr	r3, [sp, #1064]
	str	r2, [r3, #0]
	str	ip, [r3, #16]
	ldr	r2, [sp, #912]
	ldr	r3, [sp, #904]
	ldr	ip, [sp, #1036]
	str	r3, [r2, #12]
	str	ip, [r2, #24]
	str	r2, [r2, #20]
	ldr	r2, [sp, #1028]
	ldr	ip, [sp, #912]
	str	r3, [r2, #24]
	ldr	r3, [sp, #1024]
	str	r3, [r2, #40]
	mov	r2, #0
	str	r2, [ip, #28]
	ldr	r3, [sp, #1028]
	ldr	r2, [sp, #1036]
	mov	ip, #239
	str	r2, [r3, #12]
	str	ip, [r3, #44]
	ldr	ip, [sp, #1028]
	ldr	r3, [sp, #736]
	str	ip, [ip, #20]
	str	r3, [r2, #24]
	str	ip, [ip, #36]
	ldr	r3, [sp, #772]
	str	ip, [r2, #12]
	ldr	r2, [sp, #1064]
	str	r3, [r2, #24]
	mov	r2, #156
	mov	r3, #0
	str	r3, [ip, #28]
	str	r2, [ip, #8]
	ldr	ip, [sp, #1036]
	str	r3, [ip, #28]
	str	r2, [ip, #8]
	ldr	r2, [sp, #1064]
	add	r3, r3, #253
	str	r3, [r2, #28]
	ldr	r3, [sp, #1068]
	str	ip, [ip, #20]
	str	r3, [r2, #12]
	mov	ip, #4
	ldr	r3, .L23+212
	str	ip, [r2, #4]
	ldr	ip, .L23+216
	str	r2, [r2, #20]
	add	r2, sl, r3
	str	r2, [r4, ip]
	ldr	r3, [sp, #1064]
	ldr	r2, [sp, #1068]
	add	ip, ip, #48
	str	r3, [r2, #12]
	ldr	r3, .L23+220
	add	r2, sl, r3
	ldr	r3, .L23+224
	str	r2, [r4, ip]
	add	r2, sl, r3
	ldr	r3, .L23+228
	ldr	ip, [sp, #1072]
	str	r2, [r4, r3]
	ldr	r2, [sp, #912]
	ldr	r3, .L23+232
	str	r2, [ip, #24]
	add	r2, sl, r3
	ldr	r3, [sp, #784]
	str	r2, [r3, #0]
	ldr	r2, [sp, #908]
	ldr	r3, .L23+236
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #788]
	str	r2, [r3, #0]
	ldr	r2, .L23
	ldr	r3, .L23+240
	str	r2, [ip, #28]
	add	r2, sl, r3
	ldr	r3, [sp, #624]
	ldr	ip, [sp, #784]
	str	r2, [r3, #0]
	ldr	r2, [sp, #20]
	ldr	r3, .L23+244
	str	r2, [ip, #16]
	ldr	r2, .L23+248
	str	r3, [ip, #28]
	ldr	ip, [sp, #628]
	add	r3, sl, r2
	str	r3, [ip, #0]
	ldr	r2, [sp, #624]
	ldr	r3, [sp, #16]
	str	r3, [r2, #16]
	ldr	r3, .L23+252
	ldr	ip, [sp, #484]
	str	r3, [r2, #28]
	ldr	r2, .L23+256
	add	r3, sl, r2
	str	r3, [ip, #0]
	ldr	r2, [sp, #1072]
	ldr	r3, [sp, #1076]
	str	r2, [r2, #20]
	str	r3, [r2, #12]
	ldr	ip, [sp, #784]
	str	r2, [r3, #12]
	ldr	r2, [sp, #780]
	ldr	r3, [sp, #1068]
	str	r2, [ip, #24]
	mov	ip, #5
	str	ip, [r3, #4]
	ldr	r2, [sp, #784]
	ldr	r3, [sp, #788]
	ldr	ip, [sp, #1072]
	str	r3, [r2, #12]
	mov	r2, #4
	str	r2, [ip, #4]
	ldr	r3, [sp, #784]
	ldr	ip, [sp, #788]
	str	r3, [r3, #20]
	ldr	r2, [sp, #624]
	b	.L24
.L25:
	.align	2
.L23:
	.word	282
	.word	.LC83(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC88(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	371
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	4464
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.word	4512
	.word	.LC95(GOTOFF)
	.word	4560
	.word	.LC96(GOTOFF)
	.word	.LC97(GOTOFF)
	.word	309
	.word	.LC98(GOTOFF)
	.word	.LC99(GOTOFF)
	.word	.LC100(GOTOFF)
	.word	.LC101(GOTOFF)
	.word	.LC102(GOTOFF)
	.word	.LC103(GOTOFF)
	.word	.LC104(GOTOFF)
	.word	495
	.word	.LC105(GOTOFF)
	.word	.LC106(GOTOFF)
	.word	.LC107(GOTOFF)
	.word	333
	.word	433
	.word	326
	.word	.LC108(GOTOFF)
	.word	.LC109(GOTOFF)
	.word	.LC110(GOTOFF)
	.word	.LC111(GOTOFF)
	.word	.LC112(GOTOFF)
	.word	.LC113(GOTOFF)
	.word	5424
	.word	.LC114(GOTOFF)
	.word	.LC115(GOTOFF)
	.word	.LC116(GOTOFF)
	.word	.LC117(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC119(GOTOFF)
	.word	.LC120(GOTOFF)
	.word	.LC121(GOTOFF)
	.word	.LC122(GOTOFF)
	.word	.LC123(GOTOFF)
	.word	.LC124(GOTOFF)
	.word	.LC125(GOTOFF)
	.word	6000
	.word	.LC126(GOTOFF)
	.word	.LC127(GOTOFF)
	.word	6096
	.word	.LC128(GOTOFF)
	.word	.LC129(GOTOFF)
	.word	.LC130(GOTOFF)
	.word	514
	.word	.LC131(GOTOFF)
	.word	325
	.word	.LC132(GOTOFF)
	.word	.LC133(GOTOFF)
	.word	.LC136(GOTOFF)
	.word	.LC137(GOTOFF)
	.word	.LC140(GOTOFF)
	.word	.LC141(GOTOFF)
	.word	.LC142(GOTOFF)
	.word	.LC143(GOTOFF)
.L24:
	str	r3, [ip, #12]
	ldr	r3, [sp, #604]
	ldr	ip, [sp, #1076]
	str	r3, [r2, #24]
	mov	r2, #5
	str	r2, [ip, #4]
	ldr	r3, [sp, #624]
	ldr	ip, [sp, #628]
	ldr	r2, [sp, #784]
	str	ip, [r3, #12]
	ldr	ip, [sp, #624]
	mov	r3, #4
	str	r3, [r2, #4]
	str	ip, [ip, #20]
	ldr	r2, [sp, #628]
	ldr	r3, [sp, #788]
	str	ip, [r2, #12]
	mov	ip, #5
	ldr	r2, [sp, #624]
	str	ip, [r3, #4]
	mov	r3, #4
	str	r3, [r2, #4]
	ldr	r2, [sp, #628]
	str	ip, [r2, #4]
	ldr	ip, [sp, #484]
	str	r3, [ip, #4]
	ldr	r3, .L23+260
	str	r4, [ip, #24]
	add	r2, sl, r3
	ldr	r3, [sp, #488]
	str	r2, [r3, #0]
	ldr	r2, [sp, #12]
	ldr	r3, .L23+264
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #704]
	str	r2, [r3, #0]
	mov	r3, #504
	ldr	r2, .L23+268
	str	r3, [ip, #28]
	ldr	ip, [sp, #708]
	add	r3, sl, r2
	str	r3, [ip, #0]
	ldr	r2, [sp, #704]
	ldr	r3, [sp, #8]
	ldr	ip, [sp, #712]
	str	r3, [r2, #16]
	ldr	r3, .L23+272
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r2, [sp, #704]
	mov	r3, #43
	str	r3, [r2, #28]
	ldr	r2, [sp, #4]
	ldr	r3, .L23+276
	str	r2, [ip, #16]
	add	r2, sl, r3
	ldr	r3, [sp, #716]
	ldr	ip, [sp, #720]
	str	r2, [r3, #0]
	ldr	r2, [sp, #0]
	ldr	r3, .L23+280
	str	r2, [ip, #16]
	add	r2, sl, r3
	str	r2, [ip, #0]
	ldr	r3, [sp, #484]
	ldr	ip, [sp, #488]
	str	r3, [r3, #20]
	str	ip, [r3, #12]
	ldr	r2, [sp, #704]
	str	r3, [ip, #12]
	ldr	ip, [sp, #708]
	ldr	r3, [sp, #572]
	str	ip, [r2, #12]
	str	r3, [r2, #24]
	str	r2, [r2, #20]
	ldr	r3, [sp, #532]
	str	r2, [ip, #12]
	ldr	r2, [sp, #712]
	ldr	ip, [sp, #488]
	str	r3, [r2, #24]
	mov	r2, #5
	str	r2, [ip, #4]
	ldr	r3, [sp, #712]
	ldr	ip, [sp, #716]
	ldr	r2, [sp, #704]
	str	ip, [r3, #12]
	mov	r3, #4
	str	r3, [r2, #4]
	ldr	ip, [sp, #712]
	ldr	r2, [sp, #716]
	ldr	r3, [sp, #708]
	str	ip, [ip, #20]
	str	ip, [r2, #12]
	ldr	r2, [sp, #712]
	mov	ip, #5
	str	ip, [r3, #4]
	mov	r3, #50
	sub	ip, ip, #1
	str	r3, [r2, #28]
	str	ip, [r2, #4]
	ldr	r3, [sp, #724]
	ldr	r2, [sp, #720]
	str	r3, [r2, #12]
	ldr	ip, [sp, #716]
	ldr	r3, [sp, #720]
	mov	r2, #5
	str	r2, [ip, #4]
	mov	ip, #4
	ldr	r2, [sp, #548]
	str	ip, [r3, #4]
	ldr	ip, [sp, #724]
	str	r2, [r3, #24]
	mov	r2, #50
	str	r3, [r3, #20]
	str	r2, [r3, #28]
	str	r3, [ip, #12]
	ldr	r3, .L23+284
	add	r2, sl, r3
	mov	r3, #5
	stmia	ip, {r2, r3}	@ phole stm
	add	sp, sp, #56
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.size	init_trackb, .-init_trackb
	.ident	"GCC: (GNU) 4.0.2"
