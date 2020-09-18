;Expression_Evaluation.asm - exercise 4 from chapter 12

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
ValA REAL4 2.0
ValB REAL4 3.0
ValC REAL4 2.0
ValD REAL4 5.5
ValE REAL4 10.0

.code
main PROC
	fld ValA
	fadd ValB
	fdiv ValC
	fld ValD
	fsub ValA
	fadd ValE
	fmul
	call WriteFloat
	INVOKE ExitProcess, 0
main ENDP
END main