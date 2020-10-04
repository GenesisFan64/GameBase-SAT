; ===========================================================================
; Needs research, use ip_old.bin for now

		mov.l	#h'6000260, r7
		mov.l	#h'60002DC, r5
		mov.l	@r7, r7
		mov.l	@r5, r3
		mova	h'6002EFC, r0
		mov.l	r3, @r0
		mova	h'6002EA8, r0
		mov	r7, r1
		mov	#h'16, r2

loc_0_6002E92:				; CODE XREF: ROM:06002E98j
		mov.l	@r0+, r4
		dt	r2
		mov.l	r4, @r1
		bf/s	loc_0_6002E92
		add	#4, r1
		bra	loc_0_6002F00
		mov.l	r7, @r5
; ---------------------------------------------------------------------------
dword_0_6002EA0:.data.l	h'60002DC       ; DATA XREF: ROM:06002E82r
dword_0_6002EA4:.data.l	h'6000260       ; DATA XREF: ROM:06002E80r
; ---------------------------------------------------------------------------
		mov.w	#h'FFFFFE92, r3
		mov	#0, r0
		mov.b	r0, @r3
		mov	#h'10, r0
		mov.b	r0, @r3
		mov.l	@r15+, r0
		mov.l	#h'6002000, r15
		mov.l	r0, @-r15
		mov.l	#0, r1
		mov	#1, r0
		mov	#3, r4
		sts.l	pr, @-r15
		jsr	@r1
		mov.b	r0, @r3
		mov.l	#h'25890008, r5
		mov	#h'FFFFFFFE, r3
		mov.w	r3, @r5
		mov.w	#h'6000, r0
		mov.w	r0, @(h'10,r5)
		mov	#0, r0
		mov.w	r0, @(h'14,r5)
		mov.w	r0, @(h'18,r5)
		mov.w	r0, @(h'1C,r5)
		mov.w	#h'900, r7

loc_0_6002ED8:				; CODE XREF: ROM:06002EE0j
		mov.w	@r5, r0
		tst	#1, r0
		bf	loc_0_6002EE2
		dt	r7
		bf	loc_0_6002ED8

loc_0_6002EE2:				; CODE XREF: ROM:06002EDCj
		mov.w	@(h'10,r5), r0
		mov.w	@(h'14,r5), r0
		lds.l	@r15+, pr
		mov.w	@(h'18,r5), r0
		rts
		mov.w	@(h'1C,r5), r0
; ---------------------------------------------------------------------------
word_0_6002EEE:	.data.w	h'6000          ; DATA XREF: ROM:06002ECAr
word_0_6002EF0:	.data.w	h'900           ; DATA XREF: ROM:06002ED6r
word_0_6002EF2:	.data.w	h'FE92          ; DATA XREF: ROM:06002EA8r
dword_0_6002EF4:.data.l	h'25890008      ; DATA XREF: ROM:06002EC4r
dword_0_6002EF8:.data.l	h'6002000       ; DATA XREF: ROM:06002EB4r
dword_0_6002EFC:.data.l	0		; DATA XREF: ROM:06002EB8r
; ---------------------------------------------------------------------------

loc_0_6002F00:				; CODE XREF: ROM:06002E9Cj
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov.l	#loc_0_6003018,	r1
		jsr	@r1 ; loc_0_6003018
		mov	r15, r14
		mov.l	#h'6003300, r2
		mov.l	#h'25F80004, r1
		mov.w	@r1, r0
		mov.w	#h'DF, r3
		and	#1, r0
		tst	r0, r0
		bt	loc_0_6002F1E
		mov.w	#h'FF, r3

loc_0_6002F1E:				; CODE XREF: ROM:06002F1Aj
		mov.w	r3, @r2
		mov.l	#h'6003302, r2
		mov.w	#h'5000, r1
		add	r3, r1
		mov.w	r1, @r2
		mov.l	#h'6000300, r8
		mov.l	#loc_0_6003098,	r5
		mov.l	@r8, r1
		jsr	@r1
		mov	#h'40, r4
		mov.l	#loc_0_60030B0,	r5
		mov.l	@r8, r1
		jsr	@r1
		mov	#h'41, r4
		mov.l	#h'6000344, r1
		mov	#0, r5
		mov.l	@r1, r1
		jsr	@r1
		mov	#h'FFFFFFFC, r4
		mov.l	#loc_0_6003100,	r1
		jsr	@r1 ; loc_0_6003100
		nop
		mov.l	#word_0_60032F2, r4
		mov	#0, r1
		mov.w	r1, @r4
		mov.w	@r4, r1
		mov	#3, r2
		exts.w	r1, r1
		cmp/gt	r2, r1
		bt	loc_0_6002F88
		mov	r4, r8
		mov.l	#loc_0_60031B4,	r9

loc_0_6002F5E:				; CODE XREF: ROM:06002F86j
		mov.l	#loc_0_60030E0,	r1
		jsr	@r1 ; loc_0_60030E0
		nop
		mov.l	#loc_0_6003190,	r1
		jsr	@r1 ; loc_0_6003190
		nop
		mov.l	#loc_0_6003168,	r1
		jsr	@r1 ; loc_0_6003168
		nop
		mov.w	@r8, r4
		jsr	@r9 ; loc_0_60031B4
		exts.w	r4, r4
		mov.w	@r8, r1
		add	#1, r1
		mov.w	r1, @r8
		mov.w	@r8, r1
		mov.w	@r8, r1
		mov	#3, r2
		exts.w	r1, r1
		cmp/gt	r2, r1
		bf	loc_0_6002F5E

loc_0_6002F88:				; CODE XREF: ROM:06002F58j
		mov.l	#loc_0_600327C,	r1
		jsr	@r1 ; loc_0_600327C
		nop
		mov.l	#loc_0_6003234,	r1
		jsr	@r1 ; loc_0_6003234
		nop
		mov.l	#loc_0_60032C4,	r1
		jsr	@r1 ; loc_0_60032C4
		nop
		mov.l	#h'6000344, r1
		mov	#3, r5
		mov.l	@r1, r1
		jsr	@r1
		mov	#h'FFFFFFFF, r4
		mov.l	#h'6000300, r8
		mov	#0, r5
		mov.l	@r8, r1
		jsr	@r1
		mov	#h'40, r4
		mov	#0, r5
		mov.l	@r8, r1
		jsr	@r1
		mov	#h'41, r4
		mov.l	#h'6004000, r1
		jsr	@r1
		nop
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8
; ---------------------------------------------------------------------------
word_0_6002FC8:	.data.w	h'DF            ; DATA XREF: ROM:06002F14r
word_0_6002FCA:	.data.w	h'FF            ; DATA XREF: ROM:06002F1Cr
word_0_6002FCC:	.data.w	h'5000          ; DATA XREF: ROM:06002F22r
		.data.w	9
off_0_6002FD0:	.data.l	loc_0_6003018	; DATA XREF: ROM:06002F08r
dword_0_6002FD4:.data.l	h'6003300       ; DATA XREF: ROM:06002F0Er
dword_0_6002FD8:.data.l	h'25F80004      ; DATA XREF: ROM:06002F10r
dword_0_6002FDC:.data.l	h'6003302       ; DATA XREF: ROM:06002F20r
dword_0_6002FE0:.data.l	h'6000300       ; DATA XREF: ROM:06002F28r
					; ROM:06002FA4r
off_0_6002FE4:	.data.l	loc_0_6003098	; DATA XREF: ROM:06002F2Ar
off_0_6002FE8:	.data.l	loc_0_60030B0	; DATA XREF: ROM:06002F32r
dword_0_6002FEC:.data.l	h'6000344       ; DATA XREF: ROM:06002F3Ar
					; ROM:06002F9Ar
off_0_6002FF0:	.data.l	loc_0_6003100	; DATA XREF: ROM:06002F44r
off_0_6002FF4:	.data.l	word_0_60032F2	; DATA XREF: ROM:06002F4Ar
off_0_6002FF8:	.data.l	loc_0_60031B4	; DATA XREF: ROM:06002F5Cr
off_0_6002FFC:	.data.l	loc_0_60030E0	; DATA XREF: ROM:loc_0_6002F5Er
off_0_6003000:	.data.l	loc_0_6003190	; DATA XREF: ROM:06002F64r
off_0_6003004:	.data.l	loc_0_6003168	; DATA XREF: ROM:06002F6Ar
off_0_6003008:	.data.l	loc_0_600327C	; DATA XREF: ROM:loc_0_6002F88r
off_0_600300C:	.data.l	loc_0_6003234	; DATA XREF: ROM:06002F8Er
off_0_6003010:	.data.l	loc_0_60032C4	; DATA XREF: ROM:06002F94r
dword_0_6003014:.data.l	h'6004000       ; DATA XREF: ROM:06002FB6r
; ---------------------------------------------------------------------------

loc_0_6003018:				; CODE XREF: ROM:06002F0Ap
					; DATA XREF: ROM:06002F08o
		mov.l	r14, @-r15
		mov	r15, r14
		mov.l	@r15+, r14
		rts
		nop
; ---------------------------------------------------------------------------
		nop

loc_0_6003024:				; CODE XREF: ROM:06003110p
					; ROM:060032D0p
					; DATA XREF: ...
		mov.l	r14, @-r15
		mov	r15, r14
		mov	#0, r1
		cmp/ge	r6, r1
		bt/s	loc_0_600303A
		exts.w	r5, r5

loc_0_6003030:				; CODE XREF: ROM:06003036j
		mov.w	r5, @r4
		add	#2, r1
		cmp/ge	r6, r1
		bf/s	loc_0_6003030
		add	#2, r4

loc_0_600303A:				; CODE XREF: ROM:0600302Cj
		mov	r14, r15
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------

loc_0_6003040:				; CODE XREF: ROM:06003140p
					; DATA XREF: ROM:0600313Eo
		mov.l	r14, @-r15
		mov	#0, r2
		cmp/ge	r6, r2
		bt/s	loc_0_6003056
		mov	r15, r14

loc_0_600304A:				; CODE XREF: ROM:06003052j
		mov.w	@r5+, r1
		add	#2, r2
		cmp/ge	r6, r2
		mov.w	r1, @r4
		bf/s	loc_0_600304A
		add	#2, r4

loc_0_6003056:				; CODE XREF: ROM:06003046j
		mov	r14, r15
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------

loc_0_600305C:				; CODE XREF: ROM:0600319Ep
					; DATA XREF: ROM:0600319Co
		mov.l	r14, @-r15
		mov	r15, r14
		mov	r4, r1
		and	r6, r1
		cmp/gt	r6, r1
		bt/s	loc_0_6003074
		exts.w	r5, r5

loc_0_600306A:				; CODE XREF: ROM:06003070j
		mov.w	r5, @r4
		add	#2, r1
		cmp/gt	r6, r1
		bf/s	loc_0_600306A
		add	#2, r4

loc_0_6003074:				; CODE XREF: ROM:06003066j
		mov	r14, r15
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
		nop

loc_0_600307C:				; CODE XREF: ROM:06003176p
					; ROM:060031F4p
					; DATA XREF: ...
		mov.l	r14, @-r15
		mov	r4, r1
		and	r6, r1
		cmp/gt	r6, r1
		bt/s	loc_0_6003092
		mov	r15, r14

loc_0_6003088:				; CODE XREF: ROM:0600308Ej
		mov.l	r5, @r4
		add	#4, r1
		cmp/gt	r6, r1
		bf/s	loc_0_6003088
		add	#4, r4

loc_0_6003092:				; CODE XREF: ROM:06003084j
		mov	r14, r15
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------

loc_0_6003098:				; DATA XREF: ROM:06002F2Ao
		mov.l	r14, @-r15
		mov.l	#word_0_60032F0, r1
		mov.w	@r1, r2
		mov	r15, r14
		add	#1, r2
		mov.w	r2, @r1
		mov.w	@r1, r1
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
		nop
; ---------------------------------------------------------------------------
off_0_60030AC:	.data.l	word_0_60032F0	; DATA XREF: ROM:0600309Ar
; ---------------------------------------------------------------------------

loc_0_60030B0:				; DATA XREF: ROM:06002F32o
		mov.l	r14, @-r15
		mov	r15, r14
		mov.l	#h'25D00000, r1
		mov	#0, r3
		mov.w	r3, @r1
		add	#2, r1
		mov.w	r3, @r1
		add	#2, r1
		mov	#2, r2
		mov.w	r2, @r1
		add	#2, r1
		mov.w	r3, @r1
		add	#2, r1
		mov.w	r3, @r1
		add	#2, r1
		mov.l	#h'6003302, r2
		mov.w	@r2, r2
		mov.w	r2, @r1
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
dword_0_60030D8:.data.l	h'25D00000      ; DATA XREF: ROM:060030B4r
dword_0_60030DC:.data.l	h'6003302       ; DATA XREF: ROM:060030CEr
; ---------------------------------------------------------------------------

loc_0_60030E0:				; CODE XREF: ROM:06002F60p
					; DATA XREF: ROM:loc_0_6002F5Eo
		mov.l	r14, @-r15
		mov.l	#word_0_60032F0, r3
		mov.w	@r3, r1
		exts.w	r1, r2
		mov.w	@r3, r1
		bra	loc_0_60030F0
		mov	r15, r14
; ---------------------------------------------------------------------------

loc_0_60030EE:				; CODE XREF: ROM:060030F4j
		mov.w	@r3, r1

loc_0_60030F0:				; CODE XREF: ROM:060030EAj
		exts.w	r1, r1
		cmp/eq	r1, r2
		bt/s	loc_0_60030EE
		mov	r14, r15
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
off_0_60030FC:	.data.l	word_0_60032F0	; DATA XREF: ROM:060030E2r
; ---------------------------------------------------------------------------

loc_0_6003100:				; CODE XREF: ROM:06002F46p
					; DATA XREF: ROM:06002F44o
		mov.l	r8, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov.l	#h'6003308, r8
		mov.l	#loc_0_6003024,	r1
		mov	#h'60, r6
		mov	#0, r5
		jsr	@r1 ; loc_0_6003024
		mov	r8, r4
		mov	#9, r1
		mov.w	r1, @r8
		mov	r8, r2
		add	#h'14, r2
		mov.w	#h'13F, r1
		mov.w	r1, @r2
		mov	r8, r2
		add	#h'16, r2
		mov.l	#h'6003300, r1
		mov.l	#h'25C00000, r4
		mov	#h'60, r6
		mov.w	@r1, r1
		mov.w	r1, @r2
		mov	r8, r2
		add	#h'20, r2
		mov	#h'A, r1
		mov.w	r1, @r2
		mov	r8, r2
		add	#h'40, r2
		mov.w	#h'FFFF8000, r1
		mov.w	r1, @r2
		mov.l	#loc_0_6003040,	r1
		jsr	@r1 ; loc_0_6003040
		mov	r8, r5
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		rts
		mov.l	@r15+, r8
; ---------------------------------------------------------------------------
word_0_600314E:	.data.w	h'13F           ; DATA XREF: ROM:0600311Cr
word_0_6003150:	.data.w	h'8000          ; DATA XREF: ROM:0600313Ar
; ---------------------------------------------------------------------------
		nop
; ---------------------------------------------------------------------------
dword_0_6003154:.data.l	h'6003308       ; DATA XREF: ROM:06003108r
dword_0_6003158:.data.l	h'6003024       ; DATA XREF: ROM:0600310Ar
dword_0_600315C:.data.l	h'6003300       ; DATA XREF: ROM:06003124r
dword_0_6003160:.data.l	h'25C00000      ; DATA XREF: ROM:06003126r
off_0_6003164:	.data.l	loc_0_6003040	; DATA XREF: ROM:0600313Er
; ---------------------------------------------------------------------------

loc_0_6003168:				; CODE XREF: ROM:06002F6Cp
					; DATA XREF: ROM:06002F6Ao
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov.l	#h'1FFFC, r6
		mov.l	#dword_0_60032F4, r1
		mov.l	@r1, r4
		mov.l	#loc_0_600307C,	r1
		jsr	@r1 ; loc_0_600307C
		mov	#0, r5
		mov	r14, r15
		lds.l	@r15+, pr
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
		nop
; ---------------------------------------------------------------------------
dword_0_6003184:.data.l	h'1FFFC         ; DATA XREF: ROM:0600316Er
off_0_6003188:	.data.l	dword_0_60032F4	; DATA XREF: ROM:06003170r
dword_0_600318C:.data.l	h'600307C       ; DATA XREF: ROM:06003174r
; ---------------------------------------------------------------------------

loc_0_6003190:				; CODE XREF: ROM:06002F66p
					; DATA XREF: ROM:06002F64o
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov.w	#h'1FE, r6
		mov.l	#dword_0_60032F8, r1
		mov.l	@r1, r4
		mov.l	#loc_0_600305C,	r1
		jsr	@r1 ; loc_0_600305C
		mov	#0, r5
		mov	r14, r15
		lds.l	@r15+, pr
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
word_0_60031AA:	.data.w	h'1FE           ; DATA XREF: ROM:06003196r
off_0_60031AC:	.data.l	dword_0_60032F8	; DATA XREF: ROM:06003198r
off_0_60031B0:	.data.l	loc_0_600305C	; DATA XREF: ROM:0600319Cr
; ---------------------------------------------------------------------------

loc_0_60031B4:				; CODE XREF: ROM:06002F72p
					; DATA XREF: ROM:06002F5Co
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r4, r0
		cmp/eq	#1, r0
		bt/s	loc_0_60031E4
		mov	r15, r14
		mov	#1, r1
		cmp/gt	r1, r0
		bt/s	loc_0_60031D6
		cmp/eq	#2, r0
		tst	r0, r0
		bt	loc_0_60031DE
		mov	r14, r15
		bra	loc_0_600320E
		lds.l	@r15+, pr
; ---------------------------------------------------------------------------

loc_0_60031D6:				; CODE XREF: ROM:060031C8j
		bt/s	loc_0_6003206
		mov	#6, r1
		bra	loc_0_600320C
		mov	r14, r15
; ---------------------------------------------------------------------------

loc_0_60031DE:				; CODE XREF: ROM:060031CEj
		mov.l	#h'2010001F, r2
		bra	loc_0_6003208
		mov	#7, r1
; ---------------------------------------------------------------------------

loc_0_60031E4:				; CODE XREF: ROM:060031C0j
		mov.l	#h'25B00400, r2
		mov	#2, r1
		mov.b	r1, @r2
		mov.l	#h'25A00000, r8
		mov.w	#h'3FC, r6
		mov.w	#h'400, r9
		mov.l	#loc_0_600307C,	r1
		mov	r9, r5
		jsr	@r1 ; loc_0_600307C
		mov	r8, r4
		mov.l	#h'7FFFC, r1
		mov.l	r1, @r8
		add	r9, r8
		mov.l	#h'4E7160FC, r1
		mov.l	r1, @r8
		bra	loc_0_600320C
		mov	r14, r15
; ---------------------------------------------------------------------------

loc_0_6003206:				; CODE XREF: ROM:loc_0_60031D6j
		mov.l	#h'2010001F, r2

loc_0_6003208:				; CODE XREF: ROM:060031E0j
		mov.b	r1, @r2
		mov	r14, r15

loc_0_600320C:				; CODE XREF: ROM:060031DAj
					; ROM:06003202j
		lds.l	@r15+, pr

loc_0_600320E:				; CODE XREF: ROM:060031D2j
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8
; ---------------------------------------------------------------------------
word_0_6003216:	.data.w	h'3FC           ; DATA XREF: ROM:060031ECr
word_0_6003218:	.data.w	h'400           ; DATA XREF: ROM:060031EEr
; ---------------------------------------------------------------------------
		nop
; ---------------------------------------------------------------------------
dword_0_600321C:.data.l	h'2010001F      ; DATA XREF: ROM:loc_0_60031DEr
					; ROM:loc_0_6003206r
dword_0_6003220:.data.l	h'25B00400      ; DATA XREF: ROM:loc_0_60031E4r
dword_0_6003224:.data.l	h'25A00000      ; DATA XREF: ROM:060031EAr
dword_0_6003228:.data.l	h'600307C       ; DATA XREF: ROM:060031F0r
dword_0_600322C:.data.l	h'7FFFC         ; DATA XREF: ROM:060031F8r
dword_0_6003230:.data.l	h'4E7160FC      ; DATA XREF: ROM:060031FEr
; ---------------------------------------------------------------------------

loc_0_6003234:				; CODE XREF: ROM:06002F90p
					; DATA XREF: ROM:06002F8Eo
		mov.l	r14, @-r15
		mov	r15, r14
		mov	#0, r2
		mov	#0, r0
		mov	#0, r3
		mov	#1, r7
		mov.w	#h'FFFFFE71, r6

loc_0_6003242:				; CODE XREF: ROM:06003262j
		mov	r2, r1
		add	#-h'80, r1
		mov.l	r3, @r1
		mov	r2, r1
		add	#-h'7C, r1
		mov.l	r3, @r1
		mov	r2, r1
		add	#-h'78, r1
		mov.l	r7, @r1
		mov	r2, r1
		add	#-h'74, r1
		mov.l	@r1, r2
		mov.l	r3, @r1
		mov.b	r3, @(r0,r6)
		add	#1, r0
		cmp/gt	r7, r0
		bf/s	loc_0_6003242
		mov	#h'10, r2
		mov	#h'FFFFFFB0, r1
		mov.l	@r1, r2
		mov	r14, r15
		mov	#0, r2
		mov.l	r2, @r1
		mov	#h'FFFFFFB8, r1
		mov.l	r2, @r1
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
word_0_6003278:	.data.w	h'FE71          ; DATA XREF: ROM:06003240r
; ---------------------------------------------------------------------------
		nop

loc_0_600327C:				; CODE XREF: ROM:06002F8Ap
					; DATA XREF: ROM:loc_0_6002F88o
		mov.l	r14, @-r15
		mov	r15, r14
		mov.l	#h'25FE0080, r2
		mov	#0, r1
		mov.l	r1, @r2
		mov.w	#h'FF, r7
		mov.l	#h'25FE0084, r3
		mov.l	#h'F0000000, r2

loc_0_600328C:				; CODE XREF: ROM:06003292j
		mov.l	r2, @r3
		add	#1, r1
		cmp/gt	r7, r1
		bf	loc_0_600328C
		mov	#0, r1
		mov.w	#h'FF, r6
		mov.l	#h'25FE0088, r7
		mov.l	#h'25FE008C, r3
		mov	#0, r2

loc_0_600329E:				; CODE XREF: ROM:060032A6j
		mov.l	r1, @r7
		mov.l	r2, @r3
		add	#1, r1
		cmp/gt	r6, r1
		bf/s	loc_0_600329E
		mov	r14, r15
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
word_0_60032AE:	.data.w	h'FF            ; DATA XREF: ROM:06003286r
					; ROM:06003296r
dword_0_60032B0:.data.l	h'25FE0080      ; DATA XREF: ROM:06003280r
dword_0_60032B4:.data.l	h'25FE0084      ; DATA XREF: ROM:06003288r
dword_0_60032B8:.data.l	h'F0000000      ; DATA XREF: ROM:0600328Ar
dword_0_60032BC:.data.l	h'25FE0088      ; DATA XREF: ROM:06003298r
dword_0_60032C0:.data.l	h'25FE008C      ; DATA XREF: ROM:0600329Ar
; ---------------------------------------------------------------------------

loc_0_60032C4:				; CODE XREF: ROM:06002F96p
					; DATA XREF: ROM:06002F94o
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		mov	r15, r14
		mov.w	#h'400, r6
		mov.l	#h'25B00800, r4
		mov.l	#loc_0_6003024,	r1
		jsr	@r1 ; loc_0_6003024
		mov	#0, r5
		mov	r14, r15
		lds.l	@r15+, pr
		rts
		mov.l	@r15+, r14
; ---------------------------------------------------------------------------
word_0_60032DC:	.data.w	h'400           ; DATA XREF: ROM:060032CAr
; ---------------------------------------------------------------------------
		nop
; ---------------------------------------------------------------------------
dword_0_60032E0:.data.l	h'25B00800      ; DATA XREF: ROM:060032CCr
off_0_60032E4:	.data.l	loc_0_6003024	; DATA XREF: ROM:060032CEr
		.data.l	0
		.data.l	0
word_0_60032F0:	.data.w	0		; DATA XREF: ROM:0600309Ao
					; ROM:060030E2o
word_0_60032F2:	.data.w	0		; DATA XREF: ROM:06002F4Ao
dword_0_60032F4:.data.l	h'25E08004      ; DATA XREF: ROM:06003170o
dword_0_60032F8:.data.l	h'25F00020      ; DATA XREF: ROM:06003198o

		.end ;
