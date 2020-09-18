;Fibonacci_Generator.asm - exercise 10 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
COUNTER = 47
FibonacciList DWORD COUNTER DUP(?)

.code
main PROC
	mov edi, OFFSET FibonacciList
	mov ecx, COUNTER
	call Fibonacci_Generator
	INVOKE ExitProcess, 0
main ENDP

;-------------------------------------------------------------------------
; Fibonacci_Generator
;
; Produces N values in the Fibonacci number series and stores them in an
; array of doubleword.
; Receives: edi = Array's offset
;			ecx = Counter(N) 
; Returns:  No return value 
;-------------------------------------------------------------------------
Fibonacci_Generator PROC
	mov eax, 1                  ; previous element (the first element)
	mov ebx, 1					; current element (the second element)
	mov [edi], eax
	add edi, TYPE FibonacciList
	dec ecx
	mov [edi], ebx
	add edi, TYPE FibonacciList
	dec ecx
L1:
	mov edx, ebx
	add ebx, eax
	mov eax, edx
	mov [edi], ebx
	add edi, TYPE FibonacciList
	loop L1
	ret
Fibonacci_Generator ENDP
END main