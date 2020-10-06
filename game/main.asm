; ====================================================================
; ------------------------------------------------
; Equs
; ------------------------------------------------

VDP2_RAM	equ	$20000000|$05E00000
VDP2_CRAM	equ	$20000000|$05F00000
VDP2_Regs	equ	$20000000|$05F80000
LWRAM		equ	$20000000|$200000

CONTROLLER	equ 	$60FFC00+$13

; ------------------------------------------------
; IP
; ------------------------------------------------

		phase $06004000
		
; ----------------------------

     		mov.l	#0,r1
     		mov.l	#VDP2_RAM+$6000,r2
     		mov.l	#$800,r3
.cleanup:
     		mov.w	r1,@r2
     		add 	#2,r2
     		dt	r3
     		bf	.cleanup

; ----------------------------

;       		mov	#%1000000100000000,r1
;      		mov	#VDP2_Regs,r2
;     		mov.w	r1,@r2
;       		mov	#%1000000000000000,r1
;      		mov	#VDP2_Regs+$6,r2
;     		mov.w	r1,@r2
;        		mov	#%1000000000000000,r1
;       		mov	#VDP2_Regs+$E,r2
;      		mov.w	r1,@r2
;      		mov	#%0001,r1			;LAYER DISPLAY
;      		mov	#VDP2_Regs+$20,r2
;     		mov.w	r1,@r2
;      		mov	#%0000000000010001,r1
;      		mov	#VDP2_Regs+$28,r2
;     		mov.w	r1,@r2
;      		mov	#-1,r1
;     		mov	#VDP2_Regs+$110,r2
;    		mov.w	r1,@r2
   		
; ----------------------------

		;PAL
   		mov.l	#pal_test,r1
   		mov.w	@r1,r0
   		mov	#VDP2_RAM+$8000,r2
   		mov.w	r0,@r2
    		mov.l	#VDP2_CRAM,r2
    		mov.l	#$10,r3
.palload:
    		mov.w	@r1+,r0
    		mov.w	r0,@r2
    		add 	#2,r2
    		dt	r3
    		bf	.palload
    		
    		;ART
   		mov.l	#art_test,r1
    		mov.l	#VDP2_RAM,r2
    		mov.l	@r1+,r3
.artload:
    		mov.l	@r1+,r0
    		mov.l	r0,@r2
    		add 	#4,r2
    		dt	r3
    		bf	.artload
   		
   		;MAP
   		mov	#0,r0
   		mov	#map_test,r1
   		mov	#VDP2_RAM+$6000,r5
   		mov	#(224/8),r3
.mapyload:
		mov	#(320/8),r4
   		mov	r5,r2
.mapxload:
   		mov.w	@r1+,r0
   		mov.w	r0,@r2
   		add 	#2,r2
   		dt	r4
   		bf	.mapxload
   		mov	#128,r0
   		add	r0,r5
   		dt	r3
   		bf	.mapyload
   		
; ----------------------------

    		mov	#0,r1
    		mov 	#0,r2
       		mov	#VDP2_Regs+$70,r3		;Horizontal
       		mov	#VDP2_Regs+$74,r4		;Vertical
       		
.Loop:
  		bsr	VSync
    		nop

;   		mov	r1,r0
;   		shlr8	r0
;   		exts	r0,r0
;       		mov.w	r0,@r3
;   		mov	r2,r0
;   		shlr8	r0
;   		exts	r0,r0
;       		mov.w	r0,@r4
;       		mov	#$0000002,r0
;     		add 	r0,r1
;       		mov	#$0000001,r0
;     		add 	r0,r2
    		
 		bra	.Loop
   		nop
		align 4
		ltorg
   		
; ----------------------------
; VSync, hopefully...
; ----------------------------

VSync:
		mov	#VDP2_Regs+4,r14
		mov.w	@r14,r0
		tst	#%1000,r0
		bt	VSync
		rts
   		nop
		align 4
		ltorg
		
; ----------------------------
; Data
; ----------------------------

pal_test:
		binclude "game/data/pal.bin"
		align 4
art_test:	dc.l .end-art_test
		binclude "game/data/art.bin"
.end:
		align 4
map_test:
		binclude "game/data/map.bin"
		align 4

		dephase
		ltorg
		;inform 0,"IP Size: %h",(IP_End-IP_Start)
