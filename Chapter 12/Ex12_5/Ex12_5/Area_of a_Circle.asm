;Area_of a_Circle.asm - exercise 5 from chapter 12

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
PromptMsg BYTE "Please enter the radius of a circle: ", 0

.code
main PROC
	mov edx, OFFSET PromptMsg
	call WriteString
	call ReadFloat
	fmul ST(0),ST(0)
	fldpi
	fmul
	call WriteFloat
	INVOKE ExitProcess,0
main ENDP
END main