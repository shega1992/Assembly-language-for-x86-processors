; CountFunc function

.586
.model flat, C
CountFunc PROTO,
	ArrayPtr: PTR SDWORD,
	ArraySz: DWORD

.code
;--------------------------------------------------------
CountFunc PROC USES edi ecx edx ebx,
	ArrayPtr: PTR SDWORD,
	ArraySz: DWORD
; returns a count of the longest increasing sequence of 
; integer values
; Receives: the offset of an array and the array’s size
; Returns: eax = count of the longest increasing sequence 
; of integer values
;--------------------------------------------------------

	mov edi, ArrayPtr
	mov ecx, ArraySz
	dec ecx
	mov edx, 1		; edx = temporary storage      
	mov eax, 1
L1:
	mov ebx, [edi]
	cmp ebx, [edi + 4]
	jge NEW_SEQUENCE
	inc edx
	jmp NEXT_ITER
NEW_SEQUENCE:
	cmp eax, edx
	jge NEXT_ITER
	mov eax, edx
	mov edx, 1
NEXT_ITER:
	add edi, 4
	loop L1

	cmp eax, edx
	jge quit
	mov eax, edx
quit:
	ret
CountFunc ENDP
END
