;Floating-Point_Comparison.asm - exercise 1 from chapter 12

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
X REAL4 1.2
Y REAL4 3.0
ifMsg BYTE "X is lower", 0
elseMsg BYTE "X is not lower", 0

.code
main PROC
	fld Y
	fld X
	fcomi ST(0),ST(1)
	jnb ELSE_LABEL
	mov edx, OFFSET ifMsg
	jmp PRINT_RESULT
ELSE_LABEL:
	mov edx, OFFSET elseMsg
PRINT_RESULT:
	call WriteString
	INVOKE ExitProcess,0
main ENDP
END main