;Shifting_the_Elements_in_an_Array.asm - exercise 8 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
MyList DWORD 10, 20, 30, 40

.code
main PROC
	mov edi, 0
	mov ecx, LENGTHOF MyList 
	mov ebx, MyList[SIZEOF MyList - TYPE MyList]
L1:
	mov eax, MyList[edi]
	mov MyList[edi], ebx
	mov ebx, eax
	add edi, TYPE MyList
	loop L1
	INVOKE ExitProcess, 0
main ENDP
END main