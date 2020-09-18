;mMove32_Macro.asm - exercise 3 from chapter 10

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

mMove32 MACRO source:REQ, dest:REQ
	mov eax, source
	mov dest, eax
ENDM

.data
source DWORD 5
dest   DWORD ?

.code
main PROC
	mMove32 source,dest
	INVOKE ExitProcess,0
main ENDP
END main