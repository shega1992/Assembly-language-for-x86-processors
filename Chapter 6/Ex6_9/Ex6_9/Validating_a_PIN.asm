;Validating_a_PIN.asm - exercise 9 from chapter 6

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
Input BYTE 6 DUP(?)
LowerBound BYTE "52413",0
UpperBound BYTE "95846",0
PromptMsg BYTE "Please enter your PIN: ", 0
byteCount DWORD ?
Valid BYTE "-Valid", 0
Invalid BYTE "-Invalid", 0

.code
main PROC
	mov ecx, 4
L1:
	mov edx, OFFSET PromptMsg
	call WriteString
	call Get_String
	call Validate_PIN
	call WriteString
	cmp eax, 0
	je Valid_PIN
	mov edx, OFFSET Invalid
	call WriteString
	jmp Next_line
Valid_PIN: 
	mov edx, OFFSET Valid
	call WriteString
Next_line:
	call Crlf
	loop L1
	INVOKE ExitProcess,0
main ENDP

;-----------------------------------------------------
; Get_String
;
; gets the string from user
; Receives: nothing
; Returns: byteCount = String's length
;-----------------------------------------------------
Get_String PROC
	push ecx
	mov edx, OFFSET Input
	mov ecx, 6
	call ReadString
	mov byteCount,eax
	pop ecx
	ret
Get_String ENDP


;------------------------------------------------------
; Validate_PIN 
;
; validates the string from user
; Receives: edx = String's offset
; Returns:  eax = 0(valid) or any other number(invalid)
;------------------------------------------------------
Validate_PIN PROC
	push ecx
	push edx
	mov esi, OFFSET LowerBound
	mov edi, OFFSET UpperBound
	mov ecx, byteCount
	mov eax, 1
	mov ebx, 0
L1:
	mov bl, [edx]
	.IF(bl < [esi]) || (bl > [edi])
		jmp quit
	.ENDIF
	inc edx
	inc esi
	inc edi
	inc eax
	loop L1

	mov eax, 0
quit:
	pop edx
	pop ecx
	ret
Validate_PIN ENDP
END main