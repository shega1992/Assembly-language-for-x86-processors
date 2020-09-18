;Prime_Numbers.asm - exercise 5 from chapter 7

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
LIMIT = 100
MyIntegerList WORD LIMIT + 1 DUP(?)


.code
main PROC
	mov edi, 0
	mov ecx, LIMIT + 1
	call Fill_MyIntegerList
	call Sieve_of_Eratosthenes
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Fill_MyIntegerList
;
; fills the array with numbers
; Receives: edi = array's index
;			ecx = counter
; Returns:  array with numbers between 0 and 1000
;------------------------------------------------------
Fill_MyIntegerList PROC
	push edi
	push ecx
	mov eax, 0
L1:
	mov MyIntegerList[edi], ax
	inc eax
	add edi, TYPE MyIntegerList
	loop L1

	pop ecx
	pop edi
	ret
Fill_MyIntegerList ENDP

;------------------------------------------------------
; Sieve_of_Eratosthenes
;
; generates all prime numbers between 2 and 1000
; Receives: ecx = counter			
; Returns:  nothing
;------------------------------------------------------
Sieve_of_Eratosthenes PROC
	mov eax,2
	.WHILE eax < ecx
		.IF MyIntegerList[eax * TYPE  MyIntegerList] != 0
			push eax
			movzx eax, MyIntegerList[eax * TYPE  MyIntegerList]
			call WriteDec
			call Crlf
			pop eax
			mov ebx, eax
			shl ebx, 1
			.WHILE ebx < ecx
				mov MyIntegerList[ebx * TYPE  MyIntegerList], 0
				add ebx, eax
			.ENDW
		.ENDIF
		inc eax
	.ENDW
	ret
Sieve_of_Eratosthenes ENDP
END main