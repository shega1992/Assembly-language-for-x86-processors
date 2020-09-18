;Str_remove_Procedure.asm - exercise 3 from chapter 9

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Str_remove PROTO,
	TargetStr: PTR BYTE,
	RemovedChar: DWORD

include Irvine32.inc

.data
target BYTE "abcxxxxdefghijklmop",0

.code
main PROC
	INVOKE Str_remove, ADDR [target+3], 4
	mov edx, OFFSET target
	call WriteString
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Str_remove
;
; removes n characters from a string
; Receives: address of the target string and number of
; characters to be removed
; Returns:  target string
;------------------------------------------------------
Str_remove PROC USES edi ecx eax esi,
	TargetStr: PTR BYTE,
	RemovedChar: DWORD
	mov edi, TargetStr
	mov ecx, RemovedChar
	mov eax, 0
L1:
	mov [edi], al
	inc edi
	loop L1
	mov esi,edi
L2:
	mov al, [esi]
	inc esi
	inc ecx
	cmp al, 0
	jne L2
	cld
	mov esi,edi
	mov edi, TargetStr
	rep movsb
	ret
Str_remove ENDP
END main