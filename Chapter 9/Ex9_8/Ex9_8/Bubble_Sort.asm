;Bubble_Sort.asm - exercise 8 from chapter 9

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
BubbleSort PROTO,
	ArrayPtr: PTR DWORD,
	ArraySize: DWORD
DisplayArray PROTO,
	ArrayPtr: PTR DWORD,
	ArraySize: DWORD

include Irvine32.inc

.data
Array DWORD 9,8,1,2,4,3

.code
main PROC
	INVOKE BubbleSort, ADDR Array, LENGTHOF Array
	INVOKE DisplayArray, ADDR Array, LENGTHOF Array
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; BubbleSort
;
; sorts the array in ascending order
; Receives: pointer to array and array's size		
; Returns:  nothing
;------------------------------------------------------
BubbleSort PROC USES edi ebx eax,
	ArrayPtr: PTR DWORD,
	ArraySize: DWORD
	mov ecx, ArraySize
	dec ecx
L1:
	mov edi, ArrayPtr
	mov ebx, 0          ; Use the register's value to exit the sort before its normal completion
	push ecx
L2:
	mov eax, [edi]
	cmp eax, [edi + TYPE Array]
	jb NEXT_ITER
	xchg eax, [edi + TYPE Array]
	mov [edi], eax
	mov ebx, 1
NEXT_ITER:
	add edi, TYPE Array
	loop L2
	pop ecx
	cmp ebx, 0
	je quit
	loop L1
quit:
	ret
BubbleSort ENDP

;------------------------------------------------------
; DisplayArray
;
; Prints the array
; Receives: pointer to array and array's size		
; Returns:  nothing
;------------------------------------------------------
DisplayArray PROC USES edi ecx,
	ArrayPtr: PTR DWORD,
	ArraySize: DWORD
	mov edi, ArrayPtr
	mov ecx, ArraySize
L1:
	mov eax, [edi]
	call WriteDec
	mov al, ' '
	call WriteChar
	add edi, TYPE Array
	loop L1
	ret
DisplayArray ENDP
END main