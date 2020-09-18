;Message_Encryption.asm - exercise 8 from chapter 6

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

include Irvine32.inc

BUFMAX = 128

.data
KEY BYTE "ABXmv#7",0
sPrompt BYTE "Enter the plain text:",0
sEncrypt BYTE "Cipher text: ",0
sDecrypt BYTE "Decrypted: ",0
buffer BYTE BUFMAX+1 DUP(0)
bufSize DWORD ?

.code
main PROC
	call InputTheString			 ;input the plain text
	call TranslateBuffer         ;encrypt the buffer
	mov edx,OFFSET sEncrypt      ;display encrypted message
	call DisplayMessage
	call TranslateBuffer         ;decrypt the buffer
	mov edx,OFFSET sDecrypt		 ;display decrypted message
	call DisplayMessage
	INVOKE ExitProcess, 0
main ENDP

;-----------------------------------------------------
; InputTheString
;
; Prompts user for a plaintext string. Saves the string
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
InputTheString PROC
	pushad ; save 32-bit registers
	mov edx,OFFSET sPrompt ; display a prompt
	call WriteString
	mov ecx,BUFMAX ; maximum character count
	mov edx,OFFSET buffer ; point to the buffer
	call ReadString ; input the string
	mov bufSize,eax ; save the length
	call Crlf
	popad
	ret
InputTheString ENDP

;-----------------------------------------------------
; DisplayMessage
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the message
; Returns: nothing
;-----------------------------------------------------
DisplayMessage PROC
	pushad
	call WriteString
	mov edx,OFFSET buffer ; display the buffer
	call WriteString
	call Crlf
	call Crlf
	popad
	ret
DisplayMessage ENDP

;-----------------------------------------------------
; TranslateBuffer
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
TranslateBuffer PROC
	pushad
	mov ecx,bufSize                  ;loop counter
	mov esi, 0                       ;index 0 in buffer
	mov edi, 0                       ;index 0 in KEY
L1:
	mov dl, buffer[esi]
	xor dl,KEY[edi]                
	mov buffer[esi], dl
	inc esi                        ;point to next byte
	inc edi
	cmp edi, LENGTHOF KEY-1
	jbe CONTINUE
	mov edi, 0
CONTINUE: loop L1
	popad
	ret
TranslateBuffer ENDP
END main