;DifferentInputs_Procedure.asm - exercise 5 from chapter 8

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
DifferentInputs PROTO,
	Param1: DWORD,
	Param2: DWORD,
	Param3: DWORD

include Irvine32.inc

.data
Values DWORD 3 DUP(?)
Parameters BYTE "Parameters: ", 0
ReturnValue BYTE "Return value: ", 0

.code
main PROC
	call Randomize
	mov ecx, 5
L1:
	mov edx, OFFSET Parameters
	call WriteString
	call GenerateValues
	call Crlf
	INVOKE DifferentInputs, [Values], [Values + TYPE Values], [Values + TYPE Values * 2]
	mov edx, OFFSET ReturnValue
	call WriteString
	call WriteDec
	call Crlf
	loop L1
	INVOKE ExitProcess, 0	
main ENDP

;------------------------------------------------------
; GenerateValues
;
; generates three random values for parameters	
; Returns:  three random values in array
;------------------------------------------------------
GenerateValues PROC USES esi ecx
	mov esi, OFFSET Values
	mov ecx, 3
L1:
	mov eax, 5
	call RandomRange
	call WriteDec
	mov [esi], eax
	mov al, ' '
	call WriteChar
	add esi, TYPE Values
	loop L1
	ret
GenerateValues ENDP

;------------------------------------------------------
; DifferentInputs
;
; returns EAX = 1 if the values of its three input
; parameters are all different; otherwise, return 
; with EAX = 0	
; Returns: eax = True(1) or False(0)
;------------------------------------------------------
DifferentInputs PROC,
	Param1: DWORD,
	Param2: DWORD,
	Param3: DWORD
	mov eax, 0
	; comparison
	mov ebx, Param2
	cmp ebx, Param1
	je quit
	cmp ebx, Param3
	je quit
	mov ebx, Param1
	cmp ebx, Param3
	je quit
	inc eax
quit:
	ret
DifferentInputs ENDP
END main