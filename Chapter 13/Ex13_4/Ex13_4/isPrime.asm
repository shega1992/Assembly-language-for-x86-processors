;isPrime function

.586
.model flat, C
isPrime PROTO,
	Value: DWORD,
	ArrayPtr: PTR DWORD

.code
;----------------------------------------------------------
isPrime PROC USES edi ebx,
	Value: DWORD,
	ArrayPtr: PTR DWORD

; returns a value of 1 if the 32-bit integer passed in the
; EAX register is prime, and 0 if EAX is nonprime
; Receives: user's value, pointer to array and array's size
; Returns: eax = 1(prime) or 0(nonprime)
;----------------------------------------------------------

	mov edi, ArrayPtr
	mov eax, Value
	mov ebx, [edi + eax * 4]
	cmp ebx, 0
	je NONPRIME
	mov eax, ebx
	jmp quit
NONPRIME:
	mov eax, ebx
quit:
	ret
isPrime ENDP
END