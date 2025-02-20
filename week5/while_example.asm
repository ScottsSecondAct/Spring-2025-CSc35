# number = int(input("Enter a positive number: "))
# while number > 0:
#   print(f"The number is: )
#   number -= 1
# print("Done")
#
.intel_syntax noprefix

.data
PromptForIntegerString:
    .ascii "Enter an integer > 0: \0"

NewLine:
    .ascii "\n\0"

TheNumberIsString:
  .ascii "The number is: \0"

DoneString:
    .ascii "Done\n\0"

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

While:
    cmp     rax, 0
    jle     EndWhile

    lea     rdx, TheNumberIsString
    call    PrintString
    mov     rdx, rax
    call    PrintInteger
    lea     rdx, NewLine
    call    PrintString

    dec     rax
    jmp     While

EndWhile:
    lea     rdx, DoneString
    call    PrintString

    call    EndProgram
