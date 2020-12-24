; ===========================================================================
; ----------------------------------------------------------------
; SEGA SATURN HARDWARE MAP
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

; --------------------------------------------------------
; VDP2 Registers
; --------------------------------------------------------

tvmd		equ	$00	; TV Mode: (%d000000b<<8)|llvv0hhh
				;   d - Display OFF/ON
				;   b - Display Backdrop color OFF/ON
				;  ll - Interlace modes: None/INVALID/Single/Double
				;  vv - Vertical resolution:   224/240/256(PAL)/INVALID
				; hhh - Horizontal resolution: 320/352/640/704, bit 2 is for HD screen-only)

exten		equ	$02	; External signal enable: (%000000ls<<8)|000000dx
				; l - External latch OFF/ON
				; s - EXSYNC OFF/ON
				; d - Display area select OFF/ON (x must be set to 1)
				; x - External screen data input OFF/ON

tvstat		equ	$04	; Screen status [READ ONLY]: (%000000ls<<8)|0000vhop
				; l - Latch flag
				; s - Sync flag
				; v - Inside VBLANK
				; h - Inside HBLANK
				; o - Current scanline field EVEN/ODD
				; p - PAL Mode bit
					
vrsize		equ	$06	; VRAM Size: (%s0000000<<8)|0000vvvv
				;    s - 4M/8M mode
				; vvvv - VDP2 chip version (0000 default)

hcnt		equ	$08	; H Counter
				;      Normal: 00000087 6543210-
				;      Hi-Res: 00000098 76543210
				; Excl.Normal: 000000-8 76543210
				; Excl.Hi-Res: 000000-9 87654321

vcnt		equ	$0A	; V Counter
				; Single density: 00000087 6543210-
				; Double density: 00000087 6543210o (o - ODD/EVEN)
				;   Excl.Monitor: 00000098 76543210
					
ramctl		equ	$0E	; RAM control register: (%e0mm00ba<<8)|rrrrrrrr
				;        e - Coefficient table enable OFF/ON
				;       mm - Color RAM mode (must set to %01 if using coeff table)
				;       ba - VRAM partition bits for banks B and A (1bank/2banks)
				; rrrrrrrr - Rotation data bank bits for RBG0
				; 

cyca0l		equ	$10	; VRAM Cycle registers
cyca0u		equ	$12	;
cyca1l		equ	$14	;
cyca1u		equ	$16	;
cyca2l		equ	$18	;
cyca2u		equ	$1A	;
cyca3l		equ	$1C	;
cyca3u		equ	$1E	;

bgon		equ	$20	; Background enable and transparency enable bits:
				; (%000abcde<<8)|00fghijk
				;  abcde - Transparent pixel function RBG1|NBG3|NBG2|NBG1|NBG0
				; fghijk - Background enable bit RBG1|RBG0|NBG3|NBG2|NBG1|NBG0

mzctl		equ	$22	; Mosaic control: (%xxxxyyyy<<8)|000eeeee
				;    x - X pixels
				;    y - Y pixels
				; eeee - Mosaic enable bits: RBG0|NBG3|NBG2|NBG1|NBG0(RBG1)

sfsel		equ	$24	; Special function mode select: %000eeeee
				; eeeee - Enable mode for RBG0|NBG3|NBG2|NBG1|NBG0

sfcode		equ	$26	; Special function code
				; (%bbbbbbb<<8)|aaaaaaaa
				; b - for Special Function Code B
				; a - for Special Function Code A
		
; Character control register
;
; chctla: (%00aabbcd<<8)|0aaabbcd (NBG1|NBG0/RBG1)
; chctlb: (%0aaa0bcd<<8)|00ad00ad (RBG0|NBG3+NBG2)
; (a)aa - Character color mode: 16/256/2048/32,786/16,770,000/all rest invalid
;  (b)b - Bitmap screen dot-size: 512x256/512x512/1024x256/1024x512
;     c - Use bitmap mode OFF/ON
;     d - Cell size 8x8/16x16
chctla		equ	$28
chctlb		equ	$2A

; Bitmap palette number register
; 
; bmpna: (%00ab0ccc<<8)|00ab0ccc (NBG1|NBG0)
; bmpnb:               %00ab0ccc (RBG0)
;   a - Special priority bit
;   b - Special color calculation bit
; ccc - highest 3 bits of palette number
bmpna		equ	$2C
bmpnb		equ	$2E

; Pattern name control register
; 
; (%ab0000cd<<8)|eeefffff
;     a - Set pattern name size as 2word or 1word
;     b - Character suppliment mode No/Yes: Disables flipping and adds 2 more bits to character number
;     c - Special priority bit if using 1word mode
;     d - Special calculation bit if using 1word mode
;   eee - Extra 3 bits for the Palette number
; fffff - Extra 5 bits for the Character number
pncn0		equ	$30		; NBG0(RBG1)
pncn1		equ	$32		; NBG1
pncn2		equ	$34		; NBG2
pncn3		equ	$36		; NBG3
pncr		equ	$38		; RBG0

plsz		equ	$3A		; Plane size (all backgrounds) and screen-over bits for RBG0/RGB1

; Map offset register
;
; (%0aaa0aaa<<8)|0aaa0aaa
; (%00000000<<8)|0aaa0aaa
; aaa - add $20000 to current MAP (aaa*$20000)

mpofn		equ	$3C		; NBG3|NBG2|NBG1|NBG0
mpofr		equ	$3E		; Rotation parameter B / Rotation parameter A

; Tilemap address for each MAP in backgrounds
; If 1word mode: (($xxxxx)>>5)|(($xxxxx)>>13)
; If 2word mode: (($xxxxx)>>6)|(($xxxxx)>>14)
;
; Normal background uses 4 maps
; Rotating background uses 32 maps
mpabn0		equ	$40		; NBG0 MapB|MapA
mpcdn0		equ	$42		; NBG0 MapD|MapC
mpabn1		equ	$44		; NBG1 MapB|MapA
mpcdn1		equ	$46		; NBG1 MapD|MapC
mpabn2		equ	$48		; NBG2 MapB|MapA
mpcdn2		equ	$4A		; NBG2 MapD|MapC
mpabn3		equ	$4C		; NBG3 MapB|MapA
mpcdn3		equ	$4E		; NBG3 MapD|MapC

mpabra		equ	$50		; RBG0 MapB|MapA
mpcdra		equ	$52		; RBG0 MapD|MapC
mpefra		equ	$54		; RBG0 MapF|MapE
mpghra		equ	$56		; RBG0 MapH|MapG
mpijra		equ	$58		; RBG0 MapJ|MapI
mpklra		equ	$5A		; RBG0 MapL|MapK
mpmnra		equ	$5C		; RBG0 MapN|MapM
mpopra		equ	$5E		; RBG0 MapP|MapO
mpabrb		equ	$60		; RBG1 MapB|MapA
mpcdrb		equ	$62		; RBG1 MapD|MapC
mpefrb		equ	$64		; RBG1 MapF|MapE
mpghrb		equ	$66		; RBG1 MapH|MapG
mpijrb		equ	$68		; RBG1 MapJ|MapI
mpklrb		equ	$6A		; RBG1 MapL|MapK
mpmnrb		equ	$6C		; RBG1 MapN|MapM
mpoprb		equ	$6E		; RBG1 MapP|MapO

ovpnra		equ	$B8
ovpnrb		equ	$BA
