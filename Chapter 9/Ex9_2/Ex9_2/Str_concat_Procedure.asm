;Str_concat_Procedure.asm - exercise 2 from chapter 9

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Str_concat PROTO,
	Target: PTR BYTE,
	Source: PTR BYTE

include Irvine32.inc

.data
targetStr BYTE "ABCDE",10 DUP(0)
sourceStr BYTE "FGH",0

.code
main PROC
	INVOKE Str_concat, ADDR targetStr, ADDR sourceStr
	mov edx, OFFSET targetStr
	call WriteString
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Str_concat
;
;  concatenates a source string to the end of a 
;  target string
; Receives: source and target string addresses
; Returns:  concatenated string
;------------------------------------------------------
Str_concat PROC USES esi edi eax ecx,
	Target: PTR BYTE,
	Source: PTR BYTE
	mov esi, Source
	mov edi, Target
	mov eax, 0
L1:
	mov al, [edi]
	cmp al, 0
	je L2
	inc edi
	jmp L1
L2:
	cld
	mov ecx, LENGTHOF sourceStr
	rep movsb
	ret
Str_concat ENDP
END main