; ====================================================================
; GennySaturn
;
; (C) GF64
; ====================================================================
 		
; ====================================================================
; ------------------------------------------------
; Header
; ------------------------------------------------

		include "system/macros.asm"
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
 		
; ====================================================================
; ------------------------------------------------
; This file loader
; ------------------------------------------------

IP_Start:
 		binclude "system/ip_old.bin"
;  		include "system/ip.asm"
IP_End:

; ====================================================================
; ------------------------------------------------
; ISO Filesystem
; ------------------------------------------------

		align $8000
		binclude "fs_temp.bin",$8000,$4000
 		include "game/main.asm"
		
; ====================================================================
; ------------------------------------------------
; Padding
; ------------------------------------------------

		align $8000
