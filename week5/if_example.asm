# number = int(input("Enter a positive integer number: "))
# if number >= 0:
#    print(f"The number was: {number}")
# else:
#    print(f"{number} is not a positive number")
#
#
.intel_syntax noprefix

.data
PromptForIntegerString:
    .ascii "Enter a positive integer number: \0"

PositiveNumberString:
    .ascii "The number was: \0"

Newline:
    .ascii "\n\0"

NegativeNumberString:
    .ascii " is not a positive number.\n\0"

.text
.global Main
Main:
    # Prompt user
    lea     rdx, PromptForIntegerString
    call    PrintString

    # Read integer
    call    ScanInteger
    # If ScanInteger returns value in RDX, move it to RAX
    mov     rax, rdx 

    # Compare with 0
    cmp     rax, 0
    jl      LessThan0

    # number >= 0
    lea     rdx, PositiveNumberString
    call    PrintString
    mov     rdx, rax
    call    PrintInteger
    lea     rdx, Newline
    call    PrintString
    jmp     End
    
LessThan0:
    mov     rdx, rax
    call    PrintInteger
    lea     rdx, NegativeNumberString
    call    PrintString

End:
    call    EndProgram
