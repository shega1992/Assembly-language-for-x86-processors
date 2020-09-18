; AddVariables.asm - exercise 6 from chapter 3 


ExitProcess PROTO

.data
firstval QWORD 20002000h
secondval QWORD 11111111h
thirdval QWORD 22222222h
sum QWORD 0

.code
main PROC
	mov rax,firstval
    add rax,secondval
    add rax,thirdval
    mov sum,rax

    Call ExitProcess
main ENDP
END
