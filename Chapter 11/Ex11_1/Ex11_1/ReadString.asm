;ReadString.asm - exercise 1 from chapter 11

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD
ReadString PROTO,
	StringPtr: PTR BYTE,
	MaxNumOfChar: DWORD

include SmallWin.inc

.data
BufSize = 40
TestString BYTE BufSize DUP(?), 0, 0
stdInHandle HANDLE ?
bytesRead DWORD ?

.code
main PROC
	INVOKE ReadString, ADDR TestString, BufSize
	INVOKE ExitProcess,0
main ENDP

;--------------------------------------------------------
; ReadString 
;
; inputs a string from the console and insert a null byte 
; at the end of the string
; Receives: pointer to a string and an integer, 
; indicating the maximum number of characters 
; to be entered	
; Returns:  eax = count of the number of characters 
; actually entered
;--------------------------------------------------------
ReadString PROC USES edi ebx,
	StringPtr: PTR BYTE,
	MaxNumOfChar: DWORD
	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov stdInHandle,eax
	INVOKE ReadConsole, stdInHandle, StringPtr, 
	MaxNumOfChar, ADDR bytesRead, 0
	mov eax, bytesRead
	cmp eax, MaxNumOfChar
	je quit
	;replace the byte containing 0Dh with a null byte
	mov edi, StringPtr
	mov ebx, 0Dh
	mov eax, 0 
L1:
	cmp [edi], bl
	je Insert_a_null_byte
	inc edi
	inc eax
	jmp L1
Insert_a_null_byte:
	mov ebx, 0
	mov [edi], bl
quit:
	ret
ReadString ENDP
END main