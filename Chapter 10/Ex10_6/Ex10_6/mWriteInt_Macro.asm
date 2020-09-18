;mWriteInt_Macro.asm - exercise 6 from chapter 10

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

mWriteInt MACRO Value:REQ
	mov eax, Value
	call WriteInt
ENDM

.data
Value SDWORD 15

.code
main PROC
	mWriteInt Value
	INVOKE ExitProcess, 0
main ENDP
END main