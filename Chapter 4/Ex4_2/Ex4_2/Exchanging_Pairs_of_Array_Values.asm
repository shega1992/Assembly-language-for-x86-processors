;Exchanging_Pairs_of_Array_Values.asm - exercise 2 from chapter 4

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
MyList BYTE 10h, 20h, 30h, 40h, 50h, 60h

.code
main PROC
	mov esi, 0
	mov ecx, LENGTHOF MyList / 2
L1:
	mov al, MyList[esi]
	xchg al, MyList[esi + TYPE MyList]
	mov MyList[esi], al
	add esi, 2
	loop L1
	INVOKE ExitProcess, 0
main ENDP
END main