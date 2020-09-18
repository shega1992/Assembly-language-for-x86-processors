;Quadratic_Formula.asm - exercise 6 from chapter 12

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
ValueA SDWORD ?
ValueB SDWORD ?
ValueC SDWORD ?
Discriminant SDWORD ?
PromptMsgA BYTE "Please enter coefficients 'a': ", 0
PromptMsgB BYTE "Please enter coefficients 'b': ", 0
PromptMsgC BYTE "Please enter coefficients 'c': ", 0
QuadraticEquationMsg BYTE "Quadratic equation: ", 0
NoRootsMsg BYTE "No roots ", 0
OneRootMsg BYTE "x = ", 0
TwoRootsMsg1 BYTE "x1 = ", 0
TwoRootsMsg2 BYTE "x2 = ", 0

.code
main PROC
	call Get_coefficients
	call Calculate_and_display
	INVOKE ExitProcess, 0
main ENDP

;-------------------------------------------------------
; Get_coefficients
;
; Prompts the user for coefficients a, b, and c and
; prints user's quadratic equation
; Receives: nothing	
; Returns:  nothing
;-------------------------------------------------------
Get_coefficients PROC
	mov edx, OFFSET PromptMsgA
	call WriteString
	call ReadInt
	mov ValueA, eax
	mov edx, OFFSET PromptMsgB
	call WriteString
	call ReadInt
	mov ValueB, eax
	mov edx, OFFSET PromptMsgC
	call WriteString
	call ReadInt
	mov ValueC, eax
	; print Quadratic equation
	mov edx, OFFSET QuadraticEquationMsg
	call WriteString
	mov eax, ValueA
	call WriteInt
	mov al, 'x'
	call WriteChar
	mov al, '^'
	call WriteChar
	mov eax, 2
	call WriteDec
	mov eax, ValueB
	call WriteInt
	mov al, 'x'
	call WriteChar
	mov eax, ValueC
	call WriteInt
	mov al, '='
	call WriteChar
	mov eax, 0
	call WriteDec
	call Crlf
	ret
Get_coefficients ENDP


;-------------------------------------------------------
; Calculate_and_display
;
; Calculate and display the real roots of the polynomial 
; using the quadratic formula
; Receives: nothing	
; Returns:  nothing
;-------------------------------------------------------
Calculate_and_display PROC
	; D = b^2 - 4ac
	mov edx, 0
	mov eax, ValueB
	imul ValueB
	mov ebx, eax ; ebx = b^2
	mov eax, ValueA
	imul ValueC  
	shl eax, 2	 ; eax = 4ac
	sub ebx, eax
	mov Discriminant,ebx
	cmp ebx, 0
	jl NO_ROOTS
	je ONE_ROOT
	jg TWO_ROOTS
NO_ROOTS:
	mov edx, OFFSET NoRootsMsg
	call WriteString
	jmp quit
ONE_ROOT:
	; x = -b / 2a
	mov eax, ValueA
	shl eax, 1
	mov  ValueA, eax ; ValueA = 2a
	fild ValueB
	fchs
	fild ValueA
	fdiv
	mov edx, OFFSET OneRootMsg
	call WriteString
	call WriteFloat
	jmp quit
TWO_ROOTS:
	mov eax, ValueA
	shl eax, 1
	mov ValueA, eax ; ValueA = 2a
	; square(D)
	mov eax, Discriminant
	mov ebx, 1
	mov ecx, 0      ; ecx = counter
L1:
	sub eax, ebx
	add ebx, 2
	inc ecx
	cmp eax, 0
	jne L1
	mov Discriminant, ecx   ; Discriminant = square(D)
	; x1 = -b + square(D) / 2a
	fild ValueB
	fchs
	fild Discriminant
	fadd
	fild ValueA
	fdiv
	mov edx, OFFSET TwoRootsMsg1
	call WriteString
	call WriteFloat
	call Crlf
	; x2 = -b - square(D) / 2a
	fild ValueB
	fchs
	fild Discriminant
	fsub
	fild ValueA
	fdiv
	mov edx, OFFSET TwoRootsMsg2
	call WriteString
	call WriteFloat
	call Crlf
quit:
	ret
Calculate_and_display ENDP
END main