;Sum function

.586
.model flat, C
Sum PROTO,
	Arr1Ptr: PTR DWORD,
	Arr2Ptr: PTR DWORD,
	Arr3Ptr: PTR DWORD,
	ArrSz: DWORD

.code
;--------------------------------------------------------
Sum PROC USES edi esi ebx ecx eax,
	Arr1Ptr: PTR DWORD,
	Arr2Ptr: PTR DWORD,
	Arr3Ptr: PTR DWORD,
	ArrSz: DWORD
; adds the second and third arrays to the values in 
; the first array.
; Receives: the offsets of three arrays and their sizes
; Returns: the first array has all new values
;--------------------------------------------------------

	mov edi, Arr1Ptr
	mov esi, Arr2Ptr
	mov ebx, Arr3Ptr
	mov ecx, ArrSz
L1:
	mov eax, [esi]
	add [edi], eax
	mov eax, [ebx]
	add [edi], eax
	add edi, 4
	add esi, 4
	add ebx, 4
	loop L1
	ret
Sum ENDP
END