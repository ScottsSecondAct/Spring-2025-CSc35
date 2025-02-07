.intel_syntax noprefix

.bss
	num1:	.space 8 # Allocate 8 bytes for an integer.
	num2:	.space 8 # Allocate 8 bytes for an integer.

.data
Prompt1:
	.ascii "Enter the first number: \0" # Note that there is no "\n".  This is so that the prompt and number will be on the same line in the console.

Prompt2:
	.ascii "Enter the second number: \0" # Note that there is no "\n".  This is so that the prompt and number will be on the same line in the console.

Greater_Response:
	.ascii "The first number is greater.\n\0"

Less_Response:
	.ascii "The first number is less.\n\0"

Equal_Response:
	.ascii "Both numbers are equal.\n\0"

.text
.global Main # Program entry point.

Main:
  # Prompt for the first number and store it in num1.
	lea rdx, Prompt1
	call PrintString
	call ScanInteger # Returns the integer in the rdx register.
	mov [num1], rdx

  # Prompt for the second number and store it in num2.
	lea rdx, Prompt2
	call PrintString
	call ScanInteger # Returns the integer in the rdx register.
	mov [num2], rdx

	mov rax, [num1] # Move num1 into rax.  This is arbitrary and any general purpose register could have been used.
	mov rbx, [num2] # Move num2 into rbx.  This is arbitrary and any general purpose register could have been used.

	cmp rax, rbx # Compare rax and rbx.

	jl first_lesser	# If rax < rbx, then jump to the first_lesser label.
	jg first_greater 	# If rax > rbx, then jump to the first_greater label.

  # rax is not greater than or less than rbx, so they must be equal.
	lea rdx, Equal_Response
	call PrintString
	jmp exit # Jump over first_greater and first_lesser.

first_greater:
	lea rdx, Greater_Response
	call PrintString
	jmp exit # Jump ove first_lesser.

first_lesser:
	lea rdx, Less_Response
	call PrintString
	jmp exit # This is not necessary since the next statement is at the exit label.

exit:
	call EndProgram
