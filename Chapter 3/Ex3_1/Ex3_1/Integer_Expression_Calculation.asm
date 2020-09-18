; Integer_Expression_Calculation.asm - exercise 1 from chapter 3

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	mov eax, 6
	mov ebx, 5
	add eax, ebx

	mov ecx, 4
	mov edx, 3
	add ecx, edx

	sub eax, ecx

	INVOKE ExitProcess, 0
main ENDP
END main

