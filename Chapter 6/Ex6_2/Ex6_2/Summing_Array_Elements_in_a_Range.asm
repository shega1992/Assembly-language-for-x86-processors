;Summing_Array_Elements_in_a_Range.asm - exercise 2 from chapter 6

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
N = 10
J = 0
K = 10
array_of_signed_doublewords SDWORD N DUP(?)

.code
main PROC
	call Randomize
	mov edi, OFFSET array_of_signed_doublewords
	mov edx, N
	mov ebx, J
	mov eax, K
	mov ecx, 2
L1:
	call Filling_an_Array 
	call Sum
	call WriteInt
	call Crlf
	mov eax, K
	sub ebx, 5
	sub eax, 5
	loop L1
	INVOKE ExitProcess,0
main ENDP


;---------------------------------------------------------------------------
; Filling_an_Array
;
; Fills an array of doublewords with N random integers
; Receives: edi = Offset of array
;			edx = N
;			ebx = J
;			eax = K
; Returns:  edi =  Offset of array with N random integers
;----------------------------------------------------------------------------
Filling_an_Array PROC 
	push edi
	push edx
	push ecx
	mov ecx, edx

L1:
	push eax
	sub eax, ebx
	call RandomRange
	add eax, ebx
	mov [edi], eax
	add edi, TYPE array_of_signed_doublewords
	pop eax
	loop L1

	pop ecx
	pop edx
	pop edi
	ret
Filling_an_Array ENDP

;---------------------------------------------------------------------------
; Sum
;
; adds all array elements falling within the range j...k
; Receives: edi = Offset of array
;			edx = N
;			ebx = J
;			eax = K
; Returns:  eax = sum of all array elements falling within the range j...k
;----------------------------------------------------------------------------
Sum PROC
	push edi
	push edx
	push ecx
	mov ecx, edx
	mov eax, 0
L1:
	add eax, [edi]
	add edi, TYPE array_of_signed_doublewords
	loop L1

	pop ecx
	pop edx
	pop edi
	ret
Sum ENDP
END main
