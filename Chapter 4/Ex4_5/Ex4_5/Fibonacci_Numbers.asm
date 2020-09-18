;Fibonacci_Numbers.asm - exercise 5 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
FibonacciList BYTE 1, 1, 5 DUP(?)

.code
main PROC
	mov edi, 0
	mov ecx, LENGTHOF FibonacciList - 2
	mov eax, 0
	mov ebx, 0
	mov edx, 0
	mov al, FibonacciList[edi]         ; previous element (the first element)
	mov bl, FibonacciList[edi + 1]     ; current element (the second element)
	add edi, 2                         ; index of the next free position for element
L1:
	mov dl, bl                        ; dl is the temporary storage
	add bl, al
	mov al, dl
	mov FibonacciList[edi], bl
	inc edi
	loop L1
	INVOKE ExitProcess, 0
main ENDP
END main