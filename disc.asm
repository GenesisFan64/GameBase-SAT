; ===========================================================================
; SATURN GAMEBASE
; by GF64, 2020
; ===========================================================================
 		
; ===========================================================================
; ------------------------------------------------
; Header
; ------------------------------------------------

		include "system/macros.asm"
		include "system/map.asm"
 		dc.b "SEGA SEGASATURN "			; Hardware Identifier
 		dc.b "SEGA HOMEBREW   "			; Maker ID
 		dc.b "T-99901G  "			; Serial
 		dc.b "V0.001"				; Version
 		dc.b "20190405"				; Release date
 		dc.b "CD-1/1  "				; Number of discs
 		dc.b "JUET            "			; Regions
 		dc.b "JM              "			; Compatible Peripheral
 		dc.b "TITLE GOES HERE "			; Title
 		align $E0
 		dc.l $1800;(IP_End-IP_Start)		; IP Size
 		dc.l 0					; Master stack (default: $6001FFF)
 		dc.l 0					; Slave stack (default: $6000FFF)
 		dc.l 0
 		dc.l $06004000
 		align $100
 		binclude "system/security.bin"
 		
; ===========================================================================
; ------------------------------------------------
; This file loader
; ------------------------------------------------

IP_Start:
		phase $06002E80
		binclude "system/ip.bin"		; Default IP (Clears everything)
		ds.l 27					; Reserve 27 longs for IP, used by some routines

; ===================================================================
; ----------------------------------------------------------------
; All purpose subroutines
; ----------------------------------------------------------------

; ------------------------------------------------
; Load map data
; ------------------------------------------------

SAT_LoadMap:
   		mov	r3,r7
.mapyload:
		mov	r4,r6
   		mov	r2,r5
.mapxload:
   		mov.w	@r1+,r0
   		mov	r0,@r5
   		add 	#4,r5
   		dt	r6
   		bf	.mapxload
   		mov	#128*2,r0
   		add	r0,r2
   		dt	r7
   		bf	.mapyload
   		rts
   		nop
   		align 4
   		ltorg

; ===================================================================
		dephase
IP_End:

; ===========================================================================
; ----------------------------------------------------------------
; ISO File listing
; ----------------------------------------------------------------

		align $8000
		binclude "system/fshead.bin"
IsoFsSector:	iso_setfs 0,IsoFileList,IsoFileList_e		; Two copies of this
		iso_setfs 1,IsoFileList,IsoFileList_e
IsoFileList:
		iso_file "MAIN.BIN",SAT_Main,SAT_Main_e	; First file ignored
		iso_file "MAIN.BIN",SAT_Main,SAT_Main_e
		align $800
IsoFileList_e:

; ====================================================================
; ----------------------------------------------------------------
; ISO files
; ----------------------------------------------------------------

SAT_Main:
		include	"game/main.asm"
SAT_Main_e:	
		align $800
		
; ====================================================================
; ------------------------------------------------
; Padding
; ------------------------------------------------

		rompad $80000
