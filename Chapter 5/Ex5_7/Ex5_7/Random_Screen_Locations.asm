;Random_Screen_Locations.asm - exercise 7 from chapter 5
;Console Window needs to be configured for Gotoxy procedure

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
MyChar BYTE 'A'

.code
main PROC
	call Randomize
	mov eax, 0
	mov edx, 0
	mov ecx, 100
L1:
	call GetMaxXY

	; generate random row
	call RandomRange
	mov dh, al ; row for Gotoxy procedure

	; generate random columns
	mov al, dl
	call RandomRange
	mov dl, al; columns for Gotoxy procedure

	call Gotoxy

	mov al, [MyChar]
	call WriteChar
	mov eax, 100
	call Delay
 
	loop L1

	call Clrscr
	INVOKE ExitProcess, 0
main ENDP
END main