; ===========================================================================
; ----------------------------------------------------------------
; Memory map
; ----------------------------------------------------------------

; 0x00000000 	0x000FFFFF 	Boot ROM 	Repets every 512 kb
; 0x00100000 	0x0017FFFF 	SMPC registers 	 
; 0x00180000 	0x001FFFFF 	Backup RAM 	 
; 0x00200000 	0x002FFFFF 	Work RAM Low 	 
; 0x00300000 	0x003FFFFF 	Random data 	Random on every read (mostly 0x00)
; 0x00400000 	0x007FFFFF 	Zero 	Always returns 0x0000
; 0x00800000 	0x00FFFFFF 	Unknown 	Always returns 0x00000001000200030004000500060007
; 0x01000000 	0x017FFFFF 	Master Init (MINIT) 	Data written goes to Master SH-2 Free Running Timer. Section is Write Only.
; 0x01800000 	0x01FFFFFF 	Slave Init (SINIT) 	Data written goes to Slave SH-2 Free Running Timer. Section is Write Only.
; 0x02000000 	0x03FFFFFF 	CS0 	Cartridge 0
; 0x04000000 	0x04FFFFFF 	CS1 	Cartridge 1
; 0x05000000 	0x057FFFFF 	Dummy 	 
; 0x05800000 	0x058FFFFF 	CD-ROM registers (CS2) 	Repeats every 64 Bytes
; 0x05900000 	0x059FFFFF 	Unknown 	It will lockup the saturn when read
; 0x05A00000 	0x05AFFFFF 	68000 Audio Work RAM 	Stores audio data that will be played
; 0x05B00000 	0x05BFFFFF 	SCSP registers 	 
; 0x05C00000 	0x05C7FFFF 	VDP1 VRAM 	Video RAM for the 3D VDP1
; 0x05C80000 	0x05CFFFFF 	VDP1 Framebuffer 	Current Image Buffer for the VDP1 to render to
; 0x05D00000 	0x05D7FFFF 	VDP1 Registers 	VDP1 variables that change the functionality of how the VDP1 operates
; 0x05D80000 	0x05DFFFFF 	Lockup when read 	 
; 0x05E00000 	0x05EFFFFF 	VDP2 VRAM 	Video Display Processor 2 (Background) Video RAM - Repeats every 512 kb
; 0x05F00000 	0x05F7FFFF 	VDP2 CRAM 	VDP2 Color RAM - Basically the background Palette - Repeats every 4kb
; 0x05F80000 	0x05FBFFFF 	VDP2 registers 	VDP2 variables that change the functionality of how the VDP2 operates - Repeats every 512 bytes
; 0x05FC0000 	0x05FDFFFF 	Unknown 	Always returns 0x000E0000
; 0x05FE0000 	0x05FEFFFF 	SCU registers 	Repeats every 256 bytes
; 0x05FF0000 	0x05FFFFFF 	Unknown registers 	Repeats every 256 bytes
; 0x06000000 	0x07FFFFFF 	Work RAM High 	 


VDP2_VRAM	equ	$25E00000
VDP2_CRAM	equ	$25F00000
VDP2_REG	equ	$25F80000


mosaic		equ	$22		; %xxxxyyyy 000r321
chhctla		equ	$28		; Character control registers	
chhctlb		equ	$2A
