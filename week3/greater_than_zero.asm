.intel_syntax noprefix

.data
Prompt:
	.ascii "Enter a number: \0" # Note that there is no "\n".  This is so that the prompt and number will be on the same line in the console.

EqualToResponse:
	.ascii "The input is equal to zero\n\0"

GreaterThanResponse:
	.ascii "The input is greater than zero\n\0"

LessThanResponse:
	.ascii "The input is less than zero\n\0"

.text
.global Main # Program Entry Point.

Main:
	lea rdx, Prompt
	call PrintString
	call ScanInteger # Returns the integer in the rdx register.
	cmp rdx, 0

	je EqualTo # If rdx is equal to zero, then jump to the EqualTo label.
	jg GreaterThan # If rdx is greater than zero, then jump to the GreaterThan label.

# rdx is not equal to or greater than zero, so it must be less than.
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
