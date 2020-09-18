;Set_Rounding_Modes.asm - exercise 3 from chapter 12

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

include Irvine32.inc

mRound MACRO mode:REQ
	IF mode EQ 0
		fstcw ctrlWord
		or ctrlWord,000000000000b
		fldcw ctrlWord
		fld TestValue
		fist IntVal
		mov edx, OFFSET RE_Msg
		call WriteString
		mov eax, IntVal
		call WriteDec
		call Crlf
	ELSEIF mode EQ 1
		fstcw ctrlWord
		or ctrlWord,010000000000b
		fldcw ctrlWord
		fld TestValue
		fist IntVal
		mov edx, OFFSET RD_Msg
		call WriteString
		mov eax, IntVal
		call WriteDec
		call Crlf
	ELSEIF mode EQ 2
		fstcw ctrlWord
		or ctrlWord,100000000000b
		fldcw ctrlWord
		fld TestValue
		fist IntVal
		mov edx, OFFSET RU_Msg
		call WriteString
		mov eax, IntVal
		call WriteDec
		call Crlf
	ELSE
		fstcw ctrlWord
		or ctrlWord,110000000000b
		fldcw ctrlWord
		fld TestValue
		fist IntVal
		mov edx, OFFSET RZ_Msg
		call WriteString
		mov eax, IntVal
		call WriteDec
		call Crlf
	ENDIF
	;; back to default rounding mode
	fstcw ctrlWord
	and ctrlWord,1111001111111111b
	fldcw ctrlWord
ENDM

.data
TestValue REAL4 3.6
IntVal DWORD ?
ctrlWord WORD ?
RE_Msg BYTE "Round to nearest even = ", 0
RD_Msg BYTE "Round down toward = ", 0
RU_Msg BYTE "Round up toward = ", 0
RZ_Msg BYTE "Round toward zero = ", 0
RE = 0
RD = 1
RU = 2
RZ = 3

.code
main PROC
	mRound RE
	mRound RD
	mRound RU
	mRound RZ
	INVOKE ExitProcess, 0
main ENDP
END main