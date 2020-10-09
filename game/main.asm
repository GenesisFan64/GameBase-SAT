; ====================================================================
; ------------------------------------------------
; Equs
; ------------------------------------------------

; VDP2_VRAM	equ	$20000000|$05E00000
; VDP2_CRAM	equ	$20000000|$05F00000
; VDP2_REG	equ	$20000000|$05F80000

CONTROLLER	equ 	$60FFC00+$13

; ------------------------------------------------
; IP
; ------------------------------------------------

		phase $06004000
		
; ----------------------------

     		mov.l	#0,r1
     		mov.l	#VDP2_VRAM+$6000,r2
     		mov.l	#$800,r3
.cleanup:
     		mov.w	r1,@r2
     		add 	#2,r2
     		dt	r3
     		bf	.cleanup

; ----------------------------
;
; ----------------------------

	; NBG1|NBG0 settings
	; %00ttssss | %0tttssss
		mov	#VDP2_REG,r0				; gbr: VDP2 register base
		ldc	r0,gbr
      		mov	#(%00010000<<8)|00010000,r0		; MapB | MapA - Cell bpp type
    		mov.w	r0,@($28,gbr)
    		
      		mov	#(%01000000<<8)|10000000,r0		; NBG0 pattern settings
    		mov.w	r0,@($30,gbr)	
    		
		mov	#(($40000)>>5)+(($40000)>>13),r0	; MapB | MapA - tilemap address
    		mov.w	r0,@($40,gbr)
		mov	#(($40000)>>5)+(($40000)>>13),r0	; MapD | MapC - tilemap address
     		mov.w	r0,@($42,gbr)  		

; ----------------------------

    		;ART
   		mov.l	#art_test,r1
    		mov.l	#VDP2_VRAM,r2
    		mov.l	#(art_test_e-art_test)/4,r3
.artload:
    		mov.l	@r1+,r0
    		mov.l	r0,@r2
    		add 	#4,r2
    		dt	r3
    		bf	.artload
   		
   		mov	#map_test,r1
   		mov	#VDP2_VRAM+$40000,r2
		mov	#(512/8),r4
   		mov	#(256/8),r3
		mov	#SAT_LoadMap,r0
		jsr	@r0
		nop
   		mov	#map_test,r1
   		mov	#VDP2_VRAM+$41000,r2
		mov	#(512/8),r4
   		mov	#(256/8),r3
		mov	#SAT_LoadMap,r0
		jsr	@r0
		nop
		
		;PAL
   		mov.l	#pal_test,r1
   		mov.w	@r1,r0
   		mov	#VDP2_VRAM+$8000,r2
   		mov.w	r0,@r2
    		mov.l	#VDP2_CRAM,r2
    		mov.l	#256,r3
.palload:
    		mov.w	@r1+,r0
    		mov.w	r0,@r2
    		add 	#2,r2
    		dt	r3
    		bf	.palload

; ----------------------------

    		mov	#0,r1
    		mov 	#0,r2
       		mov	#VDP2_REG+$70,r3		;Horizontal
       		mov	#VDP2_REG+$74,r4		;Vertical
       		mov	#VDP2_REG+$22,r5
       		mov	#0,r6
.Loop:
  		bsr	VSync
    		nop

  		mov	r1,r0
      		mov	r0,@r3
  		mov	r2,r0
      		mov	r0,@r4
      		mov	r6,r0
      		or	#1,r0
      		mov.w	r0,@r5
      		mov	#$100,r0
      		add	r0,r6
      		
      		mov	#$0000010,r0
    		add 	r0,r1
      		mov	#$0000010,r0
    		add 	r0,r2
    		
 		bra	.Loop
   		nop
		align 4
		ltorg
   		
; ----------------------------
; VSync, hopefully...
; ----------------------------

VSync:
		mov	#VDP2_REG+4,r14
		mov.w	@r14,r0
		tst	#%1000,r0
		bt	VSync
		rts
   		nop
		align 4
		ltorg

; ====================================================================
; ------------------------------------------------
; Routines
; ------------------------------------------------

SAT_LoadMap:
   		mov	r3,r7
.mapyload:
		mov	r4,r6
   		mov	r2,r5
.mapxload:
   		mov.w	@r1+,r0
   		mov.w	r0,@r5
   		add 	#2,r5
   		dt	r6
   		bf	.mapxload
   		mov	#128,r0
   		add	r0,r2
   		dt	r7
   		bf	.mapyload
   		rts
   		nop
   		align 4
   		ltorg

; ----------------------------
; Data
; ----------------------------

pal_test:
		binclude "game/data/in256_pal.bin"
		align 4
art_test:	binclude "game/data/in256_art.bin"
art_test_e:
		align 4
map_test:
		binclude "game/data/in256_map.bin"
		align 4

		dephase
		ltorg
		;inform 0,"IP Size: %h",(IP_End-IP_Start)
