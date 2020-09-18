;Improved_Str_copy_Procedure.asm - exercise 1 from chapter 9

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Str_copyN PROTO,
	source:PTR BYTE, 
	target:PTR BYTE, 
	N: DWORD

include Irvine32.inc

.data
SourceString BYTE "This is the test string", 0
LIMIT = 10
TargetString BYTE LIMIT DUP(?)

.code
main PROC
	INVOKE Str_copyN, ADDR SourceString, ADDR TargetString, 7
	mov edx, OFFSET TargetString
	call WriteString
	INVOKE ExitProcess, 0
main ENDP

;-----------------------------------------------------------
Str_copyN PROC USES eax esi edi,
	source:PTR BYTE, ; source string
	target:PTR BYTE, ; target string
	N: DWORD    ; maximum number of characters to be copied
;
; Copies N characters from source string to target.
;------------------------------------------------------------
	.IF N > LIMIT - 1
		mov ecx, LIMIT - 1
	.ELSE
		mov ecx, N
	.ENDIF
	mov esi,source
	mov edi,target
	cld ; direction = forward
	rep movsb ; copy the string
	mov ebx, 0
	mov [edi],ebx
quit:
	ret
Str_copyN ENDP
END main