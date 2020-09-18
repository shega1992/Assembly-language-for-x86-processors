;mMult32_Macro.asm - exercise 4 from chapter 10

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

mMult32 MACRO Multiplicand:REQ, Multiplier:REQ
	mov edx, 0
	mov eax, Multiplicand
	mov ebx, Multiplier
	mul ebx
	mov Product, eax
ENDM

.data
Multiplicand DWORD 5
Multiplier DWORD 7
Product DWORD ?

.code
main PROC
	mMult32 Multiplicand, Multiplier
	INVOKE ExitProcess, 0
main ENDP
END main