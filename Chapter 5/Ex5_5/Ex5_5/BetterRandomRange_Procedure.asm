;BetterRandomRange_Procedure.asm - exercise 5 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
PromptLowerBound BYTE "Please enter the lower bound: ", 0
PromptUpperBound BYTE "Please enter the upper bound: ", 0

.code
main PROC
	mov ecx, 50
	mov edx, OFFSET PromptLowerBound
	call WriteString
	call ReadInt
	mov ebx, eax

	mov edx, OFFSET PromptUpperBound
	call WriteString
	call ReadInt
L1:
	call BetterRandomRange
	loop L1

	INVOKE ExitProcess, 0
main ENDP

;----------------------------------------------------------------
; BetterRandomRange
;
; Generates and prints a pseudorandom integer between 0 and N - 1
; Receives: ebx = lower bound
;			eax = upper bound
; Returns: no return value
;-----------------------------------------------------------------
BetterRandomRange PROC
	push eax

	sub eax, ebx
	call RandomRange
	add eax, ebx
	call WriteInt
	call Crlf

	pop eax
	ret
BetterRandomRange ENDP
END main