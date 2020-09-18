;Probabilities_and_Colors.asm - exercise 7 from chapter 6

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
MyString BYTE "Different colors", 0
Range DWORD 10
RandomInt DWORD ?
StartColor =  black + (black * 16)
DefaultColor = lightGray + (black * 16)

.code
main PROC
	call Randomize
	mov ecx, 20
L1:
	mov eax, Range
	call Generator
	call Select_Color
	add eax, StartColor
	call SetTextColor
	mov edx, OFFSET MyString
	call WriteString
	call Crlf
	loop L1

	mov eax,DefaultColor
	call SetTextColor
	call WaitMsg 
	call Clrscr

	INVOKE ExitProcess, 0
main ENDP

;---------------------------------------------------------------------------
; Generator
;
; generates random integer falling within the range 0...10
; Receives: eax = range
; Returns:  RandomInt = random integer
;----------------------------------------------------------------------------
Generator PROC
	push eax
	call RandomRange
	mov RandomInt, eax
	pop eax
	ret
Generator ENDP

;---------------------------------------------------------------------------
; Select_Color
;
; chooses the foreground color 
; Receives: RandomInt = random integer
; Returns: eax = foreground color 
;----------------------------------------------------------------------------
Select_Color PROC
	.IF RandomInt <= 2
		mov eax, 15
	.ELSEIF  RandomInt == 3
		mov eax, 1
	.ELSE
		mov eax, 2
	.ENDIF
	ret
Select_Color ENDP
END main