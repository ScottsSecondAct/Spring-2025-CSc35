
.intel_syntax noprefix

.data
Greeting:
	.ascii "Welcome to Hogwarts\n\0"

Acceptance:
	.ascii "Congratulations. Scott you have been accepted.\n\0"

Quote:
	.ascii "There he goes again.\n\0"

Advice:
	.ascii "Look both ways before crossing.\n\0" 

.text
.global Main

Main:
	lea rdx, Greeting
	call PrintString

	lea rdx, Acceptance
	call PrintString

	lea rdx, Quote
	call PrintString

	lea rdx, Advice
	call PrintString


	call EndProgram
