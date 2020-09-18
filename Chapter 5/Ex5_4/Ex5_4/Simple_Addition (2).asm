;Simple_Addition (2).asm - exercise 4 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
PromptForTheFirstNumber BYTE "Please enter the first number: ", 0
PromptForTheSecondNumber BYTE "Please enter the second number: ", 0
Sum BYTE "Sum = ", 0
FirstVal SDWORD ?

.code
main PROC
	mov ecx, 3
L1:
	call Clrscr

	; get the first number
	mov dh,12
	mov dl,39
	call Gotoxy
	mov edx, OFFSET PromptForTheFirstNumber
	call WriteString
	call ReadInt
	mov FirstVal, eax

	; get the second number and sum
	mov dh,13
	mov dl, 39
	call Gotoxy
	mov edx, OFFSET PromptForTheSecondNumber
	call WriteString
	call ReadInt
	add eax, FirstVal

	; print sum
	mov dh,14
	mov dl, 39
	call Gotoxy
	mov edx, OFFSET Sum
	call WriteString
	call WriteInt

	mov dh,15
	mov dl, 39
	call Gotoxy
	call WaitMsg
	loop L1
	INVOKE ExitProcess, 0
main ENDP
END main