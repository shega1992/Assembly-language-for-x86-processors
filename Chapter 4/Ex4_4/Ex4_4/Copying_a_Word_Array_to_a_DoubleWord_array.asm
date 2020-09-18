;Copying_a_Word_Array_to_a_DoubleWord_array.asm - exercise 4 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
WordArray WORD 1020h, 2030h, 3040h, 4050h
DoubleWordArray DWORD LENGTHOF WordArray DUP(?)

.code
main PROC
	mov esi, 0
	mov edi, 0
	mov ecx, LENGTHOF WordArray
L1:
	movsx eax, WordArray[esi]
	mov DoubleWordArray[edi], eax
	add esi, TYPE WordArray
	add edi, TYPE DoubleWordArray
	loop L1
	INVOKE ExitProcess, 0
main ENDP
END main