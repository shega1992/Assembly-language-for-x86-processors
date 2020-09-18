;Counting_Matching_Elements.asm - exercise 8 from chapter 8

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
CountMatches PROTO,
	ptrArrX: PTR SDWORD,
	ptrArrY: PTR SDWORD,
	szArr: DWORD

include Irvine32.inc

.data
ArrayX SDWORD 1, 0, 3, 4, 8
ArrayY SDWORD 1, 2, 3, 4, 7
ArrayX2 SDWORD 0, 0, 7, 9, 8, 5
ArrayY2 SDWORD 1, 2, 3, 4, 7, 9

.code
main PROC
	INVOKE CountMatches, ADDR ArrayX, ADDR ArrayY, LENGTHOF ArrayX
	call WriteDec
	call Crlf
	INVOKE CountMatches, ADDR ArrayX2, ADDR ArrayY2, LENGTHOF ArrayX2
	call WriteDec
	call Crlf
	INVOKE ExitProcess,0
main ENDP

;------------------------------------------------------
; CountMatches
;
; returns a count of the number of matching array 
; elements in EAX
; Returns: eax = count of the number of matching array
;------------------------------------------------------
CountMatches PROC USES esi edi ecx ebx,
	ptrArrX: PTR SDWORD,
	ptrArrY: PTR SDWORD,
	szArr: DWORD
	mov esi, ptrArrX
	mov edi, ptrArrY
	mov ecx, szArr
	mov eax, 0
L1:
	mov ebx, [esi]
	cmp ebx, [edi]
	jne NEXT_ITER
	inc eax
NEXT_ITER:
	add esi, TYPE ptrArrX
	add edi, TYPE ptrArrY
	loop L1
	ret
CountMatches ENDP
END main