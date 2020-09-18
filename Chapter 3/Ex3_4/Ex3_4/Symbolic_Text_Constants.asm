; Symbolic_Text_Constants.asm - exercise 4 from chapter 3

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

name1 EQU <"first...", 0>
name2 EQU <"second...", 0>

.data
test1 BYTE name1
test2 BYTE name2

.code
	main PROC

	INVOKE ExitProcess,0
main ENDP
END main
