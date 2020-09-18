;Constructing_a_Frequency_Table.asm - exercise 6 from chapter 9

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD
Get_frequencies PROTO,
	TargetStr: PTR BYTE,
	Table: PTR DWORD

.data
target BYTE "AAEBDCFBBC",0
freqTable DWORD 256 DUP(0)

.code
main PROC
	INVOKE Get_frequencies, ADDR target, ADDR freqTable
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Get_frequencies
;
; constructs a character frequency table
; Receives: pointer to a string and a pointer to 
; an array of 256 doublewords initialized to all zeros
; Returns: each entry in the array contains a count of 
; how many times the corresponding character occurred 
; in the string
;------------------------------------------------------
Get_frequencies PROC USES edi esi ecx eax ebx,
	TargetStr: PTR BYTE,
	Table: PTR DWORD
	mov edi, TargetStr
	mov esi, Table
	mov ecx, LENGTHOF target
	mov eax, 0
	mov ebx, 1
L1:
	mov al, [edi]		
	add [esi+eax],ebx	;eax = index in freqTable
	inc edi
	loop L1
	ret
Get_frequencies ENDP
END main