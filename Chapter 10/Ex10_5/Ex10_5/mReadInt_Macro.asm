;mReadInt_Macro.asm - exercise 5 from chapter 10

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

mReadInt MACRO Dest:REQ
	mov edx, OFFSET PromptMsg
	call WriteString
	call ReadInt
	mov Dest, eax
ENDM

.data
Dest SDWORD ?
PromptMsg BYTE "Please enter your number: ", 0

.code
main PROC
	mReadInt Dest
	INVOKE ExitProcess, 0
main ENDP
END main