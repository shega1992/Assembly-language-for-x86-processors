;Reverse_an_Array.asm - exercise 6 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
MyList BYTE 1h, 2h, 3h, 4h, 5h, 6h, 7h

.code
main PROC
	mov esi, 0
	mov edi, SIZEOF MyList - 1
	mov ecx, LENGTHOF MyList / 2
	mov eax, 0
L1:
	mov al, MyList[esi]
	xchg al, MyList[edi]
	mov MyList[esi], al
	add esi, TYPE MyList
	sub edi, TYPE MyList
	loop L1
	INVOKE ExitProcess, 0
main ENDP
END main