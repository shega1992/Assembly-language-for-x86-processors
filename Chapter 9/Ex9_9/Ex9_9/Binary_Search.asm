;Binary_Search.asm - exercise 9 from chapter 9

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
Binary_Search PROTO,
	ArrayPtr: PTR DWORD,
	SearchVal: DWORD,
	ArraySize: DWORD

include Irvine32.inc

.data
Array DWORD 0,1,2,3,4,5,6,7,8,9
intVal DWORD ?
PromptMsg BYTE "Please enter your value for searching: ", 0
Msg BYTE "Array's index: ", 0

.code
main PROC
	mov edx, OFFSET PromptMsg
	call WriteString
	call ReadDec
	mov intVal, eax
	INVOKE Binary_Search, ADDR Array, intVal , LENGTHOF Array
	mov edx, OFFSET Msg
	call WriteString
	call WriteInt
	INVOKE ExitProcess, 0
main ENDP

;-------------------------------------------------------
; Binary_Search
;
; searches for a number in the array
; Receives: pointer to array, value for searching and 
; array's size		
; Returns:  eax = array's index(success) or -1(failure)
;-------------------------------------------------------
Binary_Search PROC USES edi ebx edx ecx,
	ArrayPtr: PTR DWORD,
	SearchVal: DWORD,
	ArraySize: DWORD
	mov edi, ArrayPtr
	mov eax, SearchVal
	mov ebx, 0                          ; ebx = first
	mov edx, ArraySize
	dec edx				                ; edx = last
L1:
	cmp ebx, edx
	ja NOT_FOUND
	mov ecx, 0
	add ecx, ebx
	add ecx, edx
	shr ecx, 1				             ; ecx = mid
	cmp [edi + ecx * TYPE Array], eax    ; if( Array[mid] < searchVal)
	jae ELSE_IF
	mov ebx,ecx
	inc ebx
	jmp L1
 ELSE_IF:
	cmp [edi + ecx * TYPE Array], eax     ;else if( Array[mid] > searchVal)
	jbe ELSE_
	mov edx,ecx
	dec edx
	jmp L1
ELSE_:
	mov eax, ecx						  ;Array[mid] == searchVal
	jmp quit
NOT_FOUND:
	mov eax, -1
quit:
	ret
Binary_Search ENDP
END main