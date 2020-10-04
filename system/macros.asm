; ===========================================================================
; ----------------------------------------------------------------
; MACROS
; ----------------------------------------------------------------

; --------------------------------------------------------
; AS Main settings
; --------------------------------------------------------

		!org 0				; Start at 0
		cpu SH7600			; should be SH7095 but ASL doesn't have it, this is close enough
		padding	off			; Dont pad dc.b
		listing purecode		; Want listing file, but only the final code in expanded macros
		supmode on 			; Supervisor mode
		dottedstructs off		; If needed
		page 0
