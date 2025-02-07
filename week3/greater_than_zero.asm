.intel_syntax noprefix

.data
Prompt:
	.ascii "Enter a number: \0"

EqualToResponse:
	.ascii "The input is equal to zero\n\0"

GreaterThanResponse:
	.ascii "The input is greater than zero\n\0"

LessThanResponse:
	.ascii "The input is less than zero\n\0"

.text
.global Main

Main:
	lea rdx, Prompt
	call PrintString
	call ScanInteger
	cmp rdx, 0

	je EqualTo

	jg GreaterThan

	lea rdx, LessThanResponse
	call PrintString
	jmp exit

EqualTo:
	lea rdx, EqualToResponse
	call PrintString
	jmp exit

GreaterThan:
	lea rdx, GreaterThanResponse
	call PrintString

exit:
	call EndProgram
