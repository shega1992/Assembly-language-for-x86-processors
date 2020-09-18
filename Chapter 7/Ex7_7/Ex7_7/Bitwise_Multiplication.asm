;Bitwise_Multiplication.asm - exercise 7 from chapter 7

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
PromptMsgMultiplicand BYTE "Please enter your multiplicand: ", 0
PromptMsgMultiplier BYTE "Please enter your multiplier: ", 0
Result DWORD 0

.code
main PROC
	mov edx, OFFSET PromptMsgMultiplicand
	call WriteString
	call ReadDec
	mov ebx, eax
	mov edx, OFFSET PromptMsgMultiplier
	call WriteString
	call ReadDec
	.IF (ebx == 0) || (eax == 0)
		mov eax, 0
		call WriteDec
	.ELSE
		call BitwiseMultiply
		call WriteDec
	.ENDIF
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; BitwiseMultiply
;
; multiplies any unsigned 32-bit integer by EAX, using 
; only shifting and addition
; Receives: ebx = multiplicand
;			eax = multiplier
; Returns:  eax =  product
;------------------------------------------------------
BitwiseMultiply PROC
	mov edx, ebx
	mov ecx, -1
Shift_the_multiplier:
	shr eax, 1
	inc ecx
	jnc Shift_the_multiplier
	mov ebx,edx
	shl ebx, cl
	add Result, ebx
	cmp eax, 0
	jne Shift_the_multiplier
	mov eax, Result
	ret
BitwiseMultiply ENDP
END main