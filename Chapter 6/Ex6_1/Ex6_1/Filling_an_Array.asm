;Filling_an_Array.asm - exercise 1 from chapter 6

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
N = 10
J = 25
K = 50
array_of_doublewords DWORD N DUP(?)

.code
main PROC
	mov edi, OFFSET array_of_doublewords
	mov edx, N
	mov ebx, J
	mov eax, K
	mov ecx, 2
L1:
	call Filling_an_Array 
	add ebx, 50
	add eax, 50
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
	add edi, TYPE array_of_doublewords
	pop eax
	loop L1

	pop ecx
	pop edx
	pop edi
	ret
Filling_an_Array ENDP
END main