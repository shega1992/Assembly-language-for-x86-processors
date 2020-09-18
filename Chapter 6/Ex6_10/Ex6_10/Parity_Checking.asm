;Parity_Checking.asm - exercise 10 from chapter 6

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

.data
Test1 BYTE 03h, 05h, 09h, 00Ah, 00Ch, 00Fh, 3Fh, 5Fh, 9Fh, 0AFh
Test2 BYTE  03h, 05h, 09h, 0Ah, 0Ch, 0Eh, 3Fh, 5Fh, 9Fh, 0AFh

.code
main PROC
	mov ecx, 2
	mov edi, OFFSET Test1
	mov ebx, LENGTHOF Test1
L1:
	call Parity_Checking
	call WriteDec
	call Crlf
	add edi, SIZEOF Test1
	loop L1
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Parity_Checking
;
; checks the byte for parity
; Receives: edi = array's offset
;			ebx = length of the array
; Returns:  eax = 0(False) or 1(True)
;------------------------------------------------------
Parity_Checking PROC 
	push ebx
	push ecx
	push edi
	mov ecx, ebx
	mov eax, 0
L1:
	mov bl, [edi]
	xor bl, 0
	lahf
	and ah, 00000100b
	cmp ah, 0
	je quit
	inc edi
	loop L1
	mov eax, 1
quit:
	pop edi
	pop ecx
	pop ebx
	ret
Parity_Checking ENDP
END main