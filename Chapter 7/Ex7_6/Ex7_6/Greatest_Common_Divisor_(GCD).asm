;Greatest_Common_Divisor_(GCD).asm - exercise 6 from chapter 7

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
FirstPair SDWORD 40, 100
SecondPair SDWORD -24, 30
ThirdPair SDWORD 50, -30

.code
main PROC
	mov edi, OFFSET FirstPair
	mov ecx, 3
L1:
	mov eax, [edi]						; eax = x
	mov ebx, [edi + TYPE FirstPair]		; ebx = y
	call GCD
	call WriteDec
	call Crlf
	add edi, TYPE FirstPair * 2
	loop L1
	INVOKE ExitProcess,0
main ENDP

;------------------------------------------------------
; GCD
;
; finds greatest common divisor
; Receives: eax = first value(x)
;			ebx = second value(y)
; Returns:  eax =  greatest common divisor
;------------------------------------------------------
GCD PROC
	cmp eax, 0
	jg NextValue
	neg eax
NextValue:
	cmp ebx, 0
	jg L1
	neg ebx
L1:
	.REPEAT
		mov edx, 0
		div ebx
		mov eax, ebx
		mov ebx, edx
	.UNTIL ebx <= 0
	
	ret
GCD ENDP
END main