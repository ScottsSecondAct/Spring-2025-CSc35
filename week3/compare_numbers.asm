.intel_syntax noprefix

.bss
	num1:	.space 8
	num2:	.space 8

.data
Prompt1:
	.ascii "Enter first number: \0"

Prompt2:
	.ascii "Enter second number: \0"

Greater_Response:
	.ascii "First number is greater\n\0"

Less_Response:
	.ascii "First number is less\n\0"

Equal_Response:
	.ascii "Both numbers are equal\n\0"

.text
.global Main

Main:
	lea rdx, Prompt1
	call PrintString
	call ScanInteger
	mov [num1], rdx

	lea rdx, Prompt2
	call PrintString
	call ScanInteger
	mov [num2], rdx

	mov rax, [num1]
	mov rbx, [num2]

	cmp rax, rbx

	jl first_lesser	
	jg first_greater

	lea rdx, Equal_Response
	call PrintString
	jmp exit

first_greater:
	lea rdx, Greater_Response
	call PrintString
	jmp exit

first_lesser:
	lea rdx, Less_Response
	call PrintString
	jmp exit

exit:
	call EndProgram
