;Exchanging_Integers.asm - exercise 6 from chapter 8

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

Swap PROTO, ptrArray: PTR DWORD, szArray: DWORD

.data
Array DWORD 10000h,20000h, 30000h, 40000h, 50000h, 60000h, 70000h, 80000h


.code
main PROC
	; Display the array before the exchange:
	mov esi,OFFSET Array
	mov ecx, LENGTHOF Array
	mov ebx,TYPE Array
	call DumpMem ; dump the array values
	INVOKE Swap, ADDR Array, LENGTHOF Array / 2
	; Display the array after the exchange:
	call DumpMem
	exit
main ENDP

;--------------------------------------------------------
Swap PROC USES eax esi ecx,
ptrArray:PTR DWORD, 
szArray : DWORD 
;
; Exchanges each consecutive pair of integers in the array 
; Returns: nothing
;--------------------------------------------------------
	mov ecx, szArray
L1:
	mov eax,[esi] 
	xchg eax,[esi + TYPE ptrArray] 
	mov [esi],eax
	add esi, TYPE ptrArray * 2
	loop L1
	ret 
Swap ENDP
END main