;Packed_Decimal_Conversion.asm - exercise 3 from chapter 7

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
MyIntegerList DWORD 12345678, 23456781, 34567812, 10000003, 10102240
Divisor DWORD 10
MyString BYTE 8 DUP(?), 0

.code
main PROC
	mov esi, 0
	mov edi, OFFSET MyString
	mov ecx, 5
L1:
	call PackedToAsc
	mov edx, edi
	call WriteString
	call Crlf
	add esi, TYPE MyIntegerList
	loop L1
	INVOKE ExitProcess, 0
main ENDP


;------------------------------------------------------
; PackedToAsc
;
; converts a 4-byte packed decimal integer to a string
; of ASCII decimal digits
; Receives: edi = String's offset
;			esi = index in MyIntegerList
; Returns:  edi = string of ASCII decimal digits
;------------------------------------------------------
PackedToAsc PROC
	
	push edi
	add edi, SIZEOF MyString - 2
	mov eax, MyIntegerList[esi]
L1:
	mov edx, 0
	div Divisor
	or dl, 30h
	mov [edi], dl
	dec edi
	cmp eax, 0
	jne L1

	pop edi
	ret
PackedToAsc ENDP
END main