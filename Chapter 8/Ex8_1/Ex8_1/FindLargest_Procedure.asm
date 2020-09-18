;FindLargest_Procedure.asm - exercise 1 from chapter 8

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
FindLargest PROTO,
		ptrArray: PTR SDWORD,
		szArray:DWORD

include Irvine32.inc

.data
Array1 SDWORD -5,-4,-3,-2,-1, 0
Array2 SDWORD 1,-2, 5, 5, 7
Array3 SDWORD 15, 17, 3

.code
main PROC
	INVOKE FindLargest, ADDR Array1, LENGTHOF Array1
	call WriteInt
	call Crlf
	INVOKE FindLargest, ADDR Array2, LENGTHOF Array2
	call WriteInt
	call Crlf
	INVOKE FindLargest, ADDR Array3, LENGTHOF Array3
	call WriteInt
	call Crlf
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; FindLargest
;
; returns the value of the largest array member in EAX
; Returns:  eax =  value of the largest array member
;------------------------------------------------------
FindLargest PROC USES ecx esi,
	ptrArray: PTR SDWORD,
	szArray:DWORD
	mov ecx, szArray
	dec ecx
	mov esi, ptrArray
	mov eax, [esi]
	add esi, TYPE ptrArray
L1:
	cmp eax, [esi]
	jge NEXT_ITER
	mov eax, [esi]
 NEXT_ITER:
	add esi, TYPE ptrArray
	loop L1

	ret
FindLargest ENDP
END main