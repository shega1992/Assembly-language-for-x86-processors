;Str_nextWord_Procedure.asm - exercise 5 from chapter 9

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Str_nextWord PROTO,
	TargetStr: PTR BYTE,
	DelimiterChar: BYTE

include Irvine32.inc

.data
target BYTE "Johnson,Calvin",0

.code
main PROC
	INVOKE Str_nextWord, ADDR target, ','
	cmp eax, 0
	je notFound
	call WriteHex
notFound:
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Str_nextWord
;
; scans a string for the first occurrence of a certain
; delimiter character and replaces the delimiter with 
; a null byte
; Receives: pointer to the string and the 
; delimiter character
; Returns: eax = offset of the next character beyond 
; the delimiter
;------------------------------------------------------
Str_nextWord PROC USES edi ebx,
	TargetStr: PTR BYTE,
	DelimiterChar: BYTE
	mov edi, TargetStr
	mov ebx, 0
	mov eax, 0
L1:
	mov bl, [edi]
	cmp bl, 0
	je quit
	inc edi
	cmp bl, DelimiterChar
	je SetPosition
	jmp L1
SetPosition:
	mov ebx, 0
	mov [edi - 1], bl
	mov eax, edi
quit:
	ret
Str_nextWord ENDP
END main