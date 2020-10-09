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
		binclude "system/ip.bin"
; 		phase $60002E80
; ; ===================================================================
; ; ----------------------------------------------------------------
; 		mov	.point,r0
; 		jsr	@r0
; 		nop
; 		bra	*
; 		align 4
; ; ------------------------------------------------
; .point:		dc.l $06004000
; ; ----------------------------------------------------------------	
; ; ===================================================================
; 		dephase
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
		iso_file "0INIT.BIN",SAT_Main,SAT_Main_e	; First file ignored
		iso_file "0INIT.BIN",SAT_Main,SAT_Main_e
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
