# if number >= 10: 
#    if number < 100:
#       print("number >= 10 and number < 100")
#    else:
#       print ("number >= 10 and number >= 100")
# else:
#    if number < 5:
#       print("number < 10 and number < 5")
#    else:
#       print("number < 10 and number >= 5")
#
.intel_syntax noprefix

.data
PromptForInteger:
    .ascii "Enter a positive integer number: \0"

GreaterThanOrEqualTo10AndLessThan100String:
    .ascii "number >= 10 and number < 100.\n\0"

GreaterThanOrEqualTo10AndGreaterThanOrEqualTo100String:
    .ascii "number >= 10 and number >= 100.\n\0"

LessThan10AndLessThan5String:
    .ascii "number < 10 and number < 5\n\0"

LessThan10AndGreaterThanOrEqualTo5String:
    .ascii "number < 10 and number >= 5\n\0"

.text
.global Main
Main:
    # Prompt user
    lea     rdx, PromptForInteger
    call    PrintString

    # Read integer
    call    ScanInteger
    # If ScanInteger returns value in RDX, move it to RAX
    mov     rax, rdx 

    # Compare with 10
    cmp     rax, 10
    jl      LessThan10

    # Here: number >= 10
    cmp     rax, 100
    jge     GreaterThanOrEqualTo100

    # number >= 10 and number < 100
    lea     rdx, GreaterThanOrEqualTo10AndLessThan100String
    call    PrintString
    jmp     End

GreaterThanOrEqualTo100:
    # number >= 10 and number >= 100
    lea     rdx, GreaterThanOrEqualTo10AndGreaterThanOrEqualTo100String
    call    PrintString
    jmp     End

LessThan10:
    # number < 10
    cmp     rax, 5
    jge     LessThan10AndGreaterThanOrEqualTo5

    # number < 10 and number < 5
    lea     rdx, LessThan10AndLessThan5String
    call    PrintString
    jmp     End

LessThan10AndGreaterThanOrEqualTo5:
    # number < 10 and number >= 5
    lea     rdx, LessThan10AndGreaterThanOrEqualTo5String
    call    PrintString

End:
    call    EndProgram
