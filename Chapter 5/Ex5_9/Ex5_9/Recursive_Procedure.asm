;Recursive_Procedure.asm - exercise 9 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
Message BYTE "Number of recursive calls: ", 0


.code
main PROC
	mov ecx, 5
	mov eax, 0
	call Recursive_Procedure
	mov edx, OFFSET Message
	call WriteString
	call WriteDec
	INVOKE ExitProcess, 0
main ENDP

;---------------------------------------------------------------------------
; Recursive_Procedure
;
; Calls itself a fixed number of times
; Receives: ecx = Counter for loop
;			eax = Counter for the number of times the procedure calls itself
; Returns:  eax = The number of times the procedure calls itself
;----------------------------------------------------------------------------
Recursive_Procedure PROC
	loop L1
	jmp ExitLabel
L1:
	inc eax
	call Recursive_Procedure
ExitLabel:
	ret
Recursive_Procedure ENDP
END main