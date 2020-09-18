;Greatest_Common_Divisor.asm - exercise 7 from chapter 8

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
Pairs_of_integers DWORD 5,20, 24,18, 11,7, 432,226, 26,13

.code
main PROC
	mov esi, OFFSET Pairs_of_integers
	mov ecx, LENGTHOF Pairs_of_integers / 2
L1:
	mov eax, [esi]
	mov ebx, [esi + TYPE Pairs_of_integers]
	call GCD
	call WriteDec
	call Crlf
	add esi, TYPE Pairs_of_integers * 2
	loop L1
	INVOKE ExitProcess,0
main ENDP

;------------------------------------------------------
; GCD
;
; finds greatest common divisor
; Receives: eax = x
;			ebx = y
; Returns:  eax =  greatest common divisor
;------------------------------------------------------
GCD PROC
	mov edx, 0
	cmp ebx, 0
	je quit
	div ebx
	mov eax, ebx      ; x = y
	mov ebx, edx	  ; y = r(remainder)
	call GCD
quit:	
	ret
GCD ENDP
END main