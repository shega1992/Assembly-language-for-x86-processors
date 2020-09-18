;Display_ASCII_Decimal.asm - exercise 1 from chapter 7

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
DECIMAL_OFFSET = 5
.data
decimal_one BYTE "100123456789765"
decimal_two BYTE "10012345678976"
decimal_three BYTE "100123456789"

.code
main PROC
	mov edx, OFFSET decimal_one
	mov ecx, LENGTHOF decimal_one
	mov ebx, DECIMAL_OFFSET
	call WriteScaled

	mov ecx, LENGTHOF decimal_two
	call WriteScaled

	mov ecx, LENGTHOF decimal_three
	call WriteScaled
	
	INVOKE ExitProcess, 0
main ENDP


;------------------------------------------------------
; WriteScaled
;
; outputs a decimal ASCII number with an implied decimal
; point
; Receives: edx = number’s offset
;			ecx = number length
;			ebx = decimal offset
; Returns:  nothing
;------------------------------------------------------
WriteScaled PROC
	sub ecx, ebx
	;outputs an integer part
L1:
	mov al, [edx]
	call WriteChar
	inc edx
	loop L1
	;outputs a decimal point
	mov al, '.'
	call WriteChar

	add ecx, ebx
	;outputs a fractional part
L2:
	mov al, [edx]
	call WriteChar
	inc edx
	loop L2

	call Crlf
	ret
WriteScaled ENDP
END main
