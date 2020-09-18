;mReadkey_Macro.asm - exercise 1 from chapter 10

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

mReadkey MACRO ascii, scan
	call ReadChar
	mov ascii,al
	mov scan, ah
ENDM

.data
ascii BYTE ?
scan BYTE ?

.code
main PROC
	mReadkey ascii, scan
	INVOKE ExitProcess, 0
main ENDP
END main