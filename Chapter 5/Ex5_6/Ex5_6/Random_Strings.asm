;Random_Strings.asm - exercise 6 from chapter 5

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
My_Random_String BYTE 10 DUP(?)

.code
main PROC
	call Randomize
	mov eax, 10
	mov edx, OFFSET My_Random_String
	mov ecx, 20
L1:
	call Random_Strings
	call WriteString
	call Crlf
	loop L1
	INVOKE ExitProcess, 0
main ENDP

;-------------------------------------------------------------------------
; Random_Strings
;
; Generates a random string of length L, containing all capital letters.
; Receives: edx = String's offset
;			eax = String's length
;			ecx = Counter from main procedure
; Returns:  edx = Offset of random string, containing all capital letters. 
;-------------------------------------------------------------------------
Random_Strings PROC USES ecx eax edx
	mov ecx, eax
L1:
	mov eax, 26
	call RandomRange
	add eax, 65
	mov [edx], al
	inc edx
	loop L1
	ret
Random_Strings ENDP
END main