;Str_find_Procedure.asm - exercise 4 from chapter 9

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Str_find PROTO,
	SourceStr: PTR BYTE,
	TargetStr: PTR BYTE

include Irvine32.inc

.data
target BYTE "123ABC342432",0
source BYTE "ABC",0
pos DWORD ?

.code
main PROC
	INVOKE Str_find, ADDR source, ADDR target
	cmp eax, 0
	jl notFound
	call WriteDec
	mov pos,eax ; store the position value
notFound:
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Str_find
;
; searches for the first matching occurrence of a 
; source string inside a target string and returns 
; the matching position.
; Receives: pointer to the source string and a pointer 
; to the target string
; Returns: eax = matching position in the target string
;------------------------------------------------------
Str_find PROC USES esi edi ebx,
	SourceStr: PTR BYTE,
	TargetStr: PTR BYTE
	mov esi, SourceStr
	mov edi, TargetStr
	mov ebx, 0
	mov eax, -1
L1:
	mov bl, [edi]
	cmp bl, 0                  ;checking for end of the target string
	je quit
	cmp bl, [esi]
	jne Mismatch
	inc edi
	inc esi
	mov bl, [esi]
	cmp bl, 0				 ;checking for end of the source string
	je  SetPosition
	jmp L1
Mismatch:
	inc edi
	mov esi, SourceStr
	jmp L1
SetPosition:
	INVOKE Str_length, ADDR source
	sub edi, eax
	sub edi,TargetStr
	mov eax,edi
quit:	
	ret
Str_find ENDP
END main
