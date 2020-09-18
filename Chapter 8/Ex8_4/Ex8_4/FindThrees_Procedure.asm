;FindThrees_Procedure.asm - exercise 4 from chapter 8

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
FindThrees PROTO,
	ptrArray: PTR DWORD,
	szArray: DWORD

include Irvine32.inc

.data
Array1 DWORD 1, 0, 3, 3, 3, 5, 8
Array2 DWORD 3, 3, 5, 9, 1

.code
main PROC
	INVOKE FindThrees, ADDR Array1, LENGTHOF Array1
	call WriteDec
	call Crlf
	INVOKE FindThrees, ADDR Array2, LENGTHOF Array2
	call WriteDec
	call Crlf
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; FindThrees
;
; returns 1 if an array has three consecutive values of
; 3 somewhere in the array. Otherwise, return 0.
; Returns:  eax =  True(1) or False(0)
;------------------------------------------------------
FindThrees PROC USES esi ecx ebx,
	ptrArray: PTR DWORD,
	szArray: DWORD
	mov esi, ptrArray
	mov ecx, szArray
	sub ecx, 2
	mov eax, 0
L1:
	mov ebx, [esi]
	cmp ebx, 3
	jne NEXT_ITER
	cmp ebx, [esi + TYPE ptrArray]
	jne NEXT_ITER
	mov ebx, [esi + TYPE ptrArray] 
	cmp ebx, [esi + TYPE ptrArray * 2]
	jne NEXT_ITER
	inc eax
	jmp quit	
NEXT_ITER:
	add esi, TYPE ptrArray
	loop L1
quit:
	ret
FindThrees ENDP
END main