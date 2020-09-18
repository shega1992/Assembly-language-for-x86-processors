;Color_Matrix.asm - exercise 8 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
MyChar BYTE '$'
Color DWORD black + (black * 16)
DefaultColor = lightGray + (black * 16)

.code
main PROC
	mov ecx, 16
L1:
	push ecx
	mov ecx, 16
L2:
	mov eax, Color
	call SetTextColor
	mov al, [MyChar]
	call WriteChar
	mov al, ' '
	call WriteChar
	add [Color], 1
	loop L2

	pop ecx
	call Crlf
	loop L1

	mov eax,DefaultColor
	call SetTextColor
	call WaitMsg 
	call Clrscr
	INVOKE ExitProcess, 0
main ENDP
END main