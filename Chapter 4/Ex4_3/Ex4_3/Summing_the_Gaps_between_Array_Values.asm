;Summing_the_Gaps_between_Array_Values.asm - exercise 3 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
MyList DWORD 0,2,5,9,10
Sum DWORD ?

.code
main PROC
	mov edi, 0
	mov ecx, LENGTHOF MyList - 1
	mov eax, 0
L1:
	mov ebx, MyList[edi + TYPE MyList]
	sub ebx, MyList[edi]
	add eax, ebx
	add edi, TYPE MyList
	loop L1
	mov Sum, eax
	INVOKE ExitProcess, 0
main ENDP
END main