;Copy_a_String_in_Reverse_Order.asm - exercise 7 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')

.code
main PROC
	mov esi, OFFSET source + (SIZEOF source - 2) 
	mov edi, OFFSET target
	mov ecx, LENGTHOF source - 1
	mov eax, 0
L1:
	mov al, [esi]
	mov [edi], al
	dec esi
	inc edi
	loop L1
	mov al, 0
	mov [edi], al
	INVOKE ExitProcess, 0
main ENDP
END main