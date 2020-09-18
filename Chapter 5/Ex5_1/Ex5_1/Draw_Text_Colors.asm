;Draw_Text_Colors.asm - exercise 1 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
MyString BYTE "Four different colors", 0
MyColors = blue + (lightGray * 16)
DefaultColor = lightGray + (black * 16)

.code
main PROC
	mov ecx, 4
	mov eax, MyColors
L1:
	call SetTextColor
	mov edx, OFFSET MyString
	call WriteString
	call Crlf
	inc eax
	loop L1
	call WaitMsg ; "Press any key..."
	mov eax,DefaultColor
	call SetTextColor
	call Clrscr
	INVOKE ExitProcess, 0
main ENDP
END main