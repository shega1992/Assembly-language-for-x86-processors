;Test_Score_Evaluation.asm - exercise 3 from chapter 6

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.code
main PROC
	call Randomize
	mov ecx, 10
	mov eax, 100
L1:
	push eax
	call RandomRange
	call CalcGrade
	call WriteChar
	mov al, ' '
	call WriteChar
	pop eax
	loop L1
	INVOKE ExitProcess, 0
main ENDP

;---------------------------------------------------------------------------
; CalcGrade 
;
; receives an integer value between 0 and 100, and returns a single capital 
; letter in the AL register
; Receives: eax = random integer value between 0 and 100			
; Returns:  al = single capital letter 
;----------------------------------------------------------------------------
CalcGrade PROC
	.IF eax >= 90
		mov al, 'A'
	.ELSEIF eax >= 80
		mov al, 'B'
	.ELSEIF eax >= 70
		mov al, 'C'
	.ELSEIF eax >= 60
		mov al, 'D'
	.ELSE
		mov al, 'F'
	.ENDIF
	ret
CalcGrade ENDP
END main