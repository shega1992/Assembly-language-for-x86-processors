;Sieve_of_Eratosthenes.asm - exercise 7 from chapter 9

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Fill_Array PROTO,
	ArrayPtr:PTR DWORD,
	ArraySize: DWORD
Sieve_of_Eratosthenes PROTO,
	ArrayPtr:PTR DWORD,
	ArraySize: DWORD

include Irvine32.inc

.data
Array DWORD 65000 DUP(?)

.code
main PROC
	INVOKE Fill_Array, ADDR Array, LENGTHOF Array
	INVOKE Sieve_of_Eratosthenes, ADDR Array, LENGTHOF Array
	INVOKE ExitProcess,0
main ENDP

;------------------------------------------------------
; Fill_Array
;
; fills the array by numbers
; Receives: pointer to array and array's size		
; Returns:  nothing
;------------------------------------------------------
Fill_Array PROC USES edi ecx eax,
	ArrayPtr:PTR DWORD,
	ArraySize: DWORD
	mov edi, ArrayPtr
	mov ecx, ArraySize
	mov eax, 0
L1:
	mov [edi], eax
	inc eax
	add edi, TYPE Array
	loop L1
	ret
Fill_Array ENDP

;------------------------------------------------------
; Sieve_of_Eratosthenes
;
; generates all prime numbers between 2 and 65000
; Receives: pointer to array and array's size		
; Returns:  nothing
;------------------------------------------------------
Sieve_of_Eratosthenes PROC,
	ArrayPtr:PTR DWORD,
	ArraySize: DWORD
	mov edi, ArrayPtr
	mov ecx, 2							
	mov ebx, 0
	.WHILE ecx < ArraySize
		.IF [edi + TYPE ArrayPtr * ecx] != ebx
			mov eax, [edi + TYPE ArrayPtr * ecx]
			call WriteDec
			mov al, ' '
			call WriteChar
			mov edx, 0
			mov eax, ecx
			mul ecx
			.WHILE eax < ArraySize
				mov [edi + TYPE ArrayPtr * eax], ebx
				add eax, ecx
			.ENDW
		.ENDIF
		inc ecx
	.ENDW
	ret
Sieve_of_Eratosthenes ENDP
END main