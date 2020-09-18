;Letter_Matrix.asm - exercise 10 from chapter 9

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Generator PROTO,
	MatrixBase: PTR BYTE,
	MatrixIndex: DWORD
DisplayMatrix PROTO,
	MatrixBase: PTR BYTE,
	MatrixIndex: DWORD

include Irvine32.inc

.data
ROWS = 4
COLS = 4
RANGE = 26
Matrix BYTE ROWS * COLS DUP(?)
Number_of_remaining_calls DWORD ?

.code
main PROC
	call Randomize
	mov ecx,5
L1:
	mov Number_of_remaining_calls, ecx
	INVOKE Generator, ADDR Matrix, 0
	INVOKE DisplayMatrix, ADDR Matrix, 0
	mov ecx, Number_of_remaining_calls
	call Crlf
	loop L1
	INVOKE ExitProcess, 0
main ENDP

;------------------------------------------------------
; Generator
;
; Fills the matrix by randomly chosen capital letters
; Receives: pointer to matrix's base and matrix's index	
; Returns:  nothing
;------------------------------------------------------
Generator PROC USES ebx esi eax,
	MatrixBase: PTR BYTE,
	MatrixIndex: DWORD
	mov ebx, MatrixBase
	mov ecx, ROWS
L1:
	mov esi, MatrixIndex
	push ecx
	mov ecx, COLS
L2:
	mov eax,RANGE
	call RandomRange
	add eax,65
	mov [ebx + esi], al
	inc esi
	loop L2
	pop ecx
	add ebx, ROWS
	loop L1
	ret
Generator ENDP

;------------------------------------------------------
; DisplayMatrix
;
; Prints the matrix
; Receives: pointer to matrix's base and matrix's index	
; Returns:  nothing
;------------------------------------------------------
DisplayMatrix PROC USES ebx esi eax,
	MatrixBase: PTR BYTE,
	MatrixIndex: DWORD
	mov ebx, MatrixBase
	mov ecx, ROWS
L1:
	mov esi, MatrixIndex
	push ecx
	mov ecx, COLS
L2:
	mov al, [ebx + esi]
	call WriteChar
	mov al, ' '
	call WriteChar
	inc esi
	loop L2
	pop ecx
	add ebx, ROWS
	call Crlf
	loop L1
	ret
DisplayMatrix ENDP
END main
