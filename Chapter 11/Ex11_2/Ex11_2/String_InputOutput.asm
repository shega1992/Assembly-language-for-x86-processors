;String_InputOutput.asm - exercise 2 from chapter 11

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include SmallWin.inc

PersonInfo STRUCT
	FirstName BYTE 20 DUP(?),0,0
	LastName BYTE 20 DUP(?),0,0
	Age BYTE 4 DUP(?),0,0
	PhoneNumber BYTE 7 DUP(?),0,0
PersonInfo ENDS


.data
Person PersonInfo <>
PromptMsgFirstName BYTE "Please enter your first name:", 0
PromptMsgLastName BYTE "Please enter the last name:", 0
PromptMsgAge BYTE "Please enter your age:", 0
PromptMsgPhoneNumber BYTE "Please enter your phone number:", 0
PrintFirstName BYTE "FirstName:", 0
PrintLastName BYTE "LastName:", 0
PrintAge BYTE "Age:", 0
PrintPhoneNumber BYTE "Phone number:", 0
stdInHandle HANDLE ?
stdOutHandle HANDLE ?
bytesRead DWORD ?
bytesWrite DWORD ?

.code
main PROC
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov stdOutHandle, eax
	INVOKE GetStdHandle, STD_INPUT_HANDLE
	mov stdInHandle,eax
	; get first name
	INVOKE WriteConsole, stdOutHandle, ADDR PromptMsgFirstName, LENGTHOF PromptMsgFirstName, ADDR bytesWrite, 0
	INVOKE ReadConsole, stdInHandle, ADDR Person.FirstName, 20, ADDR bytesRead, 0
	; get last name
	INVOKE WriteConsole, stdOutHandle, ADDR PromptMsgLastName, LENGTHOF PromptMsgLastName, ADDR bytesWrite, 0
	INVOKE ReadConsole, stdInHandle, ADDR Person.LastName, 20, ADDR bytesRead, 0
	; get age
	INVOKE WriteConsole, stdOutHandle, ADDR PromptMsgAge, LENGTHOF PromptMsgAge, ADDR bytesWrite, 0
	INVOKE ReadConsole, stdInHandle, ADDR Person.Age, 4, ADDR bytesRead, 0
	; get phone number
	INVOKE WriteConsole, stdOutHandle, ADDR PromptMsgPhoneNumber, LENGTHOF PromptMsgPhoneNumber, ADDR bytesWrite, 0
	INVOKE ReadConsole, stdInHandle, ADDR Person.PhoneNumber, 7, ADDR bytesRead, 0
	INVOKE ExitProcess, 0
main ENDP
END main