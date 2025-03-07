.intel_syntax noprefix

.data
IntroductoryMessageLineString1:
    .ascii "Welcome to Secret Number!\n\0"

IntroductoryMessageLineString2:
    .ascii "Try to guess the number between between 1 and 100.\n\0"

IntroductoryMessageLineString3:
    .ascii "You will get 10 guesses.\n\n\0"

GuessNumberString:
    .ascii "Guess a number between 1 and 100: \0"

WinnerString:
    .ascii "You Win!\n\0"

NumberIsLowerString:
    .ascii "Nice guess, but the number is lower.\n\0"

NumberIsHigherString:
    .ascii "Nice guess, but the number is higher\n\0"

OutOfGuesses1String:
    .ascii "Sorry, but you are out of guesses. The correct number was \0"

NewLineString:
    .ascii ".\n\0"

OutOfGuesses2String:
    .ascii "Test your skills again.\n\0"

NumberOfGuessesRemaining1String:
    .ascii "You have \0"

NumberofGuessesRemaining2String:
    .ascii " guesses remaining.\n\n\0"

.text
.global Main
Main:
    # Display and introductory message
    lea     rdx, IntroductoryMessageLineString1
    call    PrintString
    lea     rdx, IntroductoryMessageLineString2
    call    PrintString
    lea     rdx, IntroductoryMessageLineString3
    call    PrintString 

    # create a random number between 0 and 99
    mov     rdx, 100
    call    GetRandom
    # We want a number between 1 and 100.  With rdx = 100, get random returns a 
    # number between 0 and 99.  Add one to the value returned in the rdx insures 
    # that it will be between 1 and 100.
    add     rdx, 1 
    # store the number in another register because we know
    # that the rdx register is used for PrintString
    mov     rax, rdx

    mov     rbx, 10 # rbx will keep track of the number of guesses remaining.

    # rax => number to guess
    # rbx => number of guesses remaining
While:
    cmp     rbx, 0
    jle     EndWhile

    # Prompt user to guess
    lea     rdx, GuessNumberString
    call    PrintString

    # Read integer
    call    ScanInteger

    cmp     rax, rdx
    jl      NumberIsLower
    jg      NumberIsHigher

    # The player guessed the correct number
    lea     rdx, WinnerString
    call    PrintString
    jmp     End

NumberIsLower:
    lea     rdx, NumberIsLowerString
    call    PrintString
    jmp     DecrementGuessesRemaining

NumberIsHigher:
    lea     rdx, NumberIsHigherString
    call    PrintString

DecrementGuessesRemaining:
    dec     rbx
    lea     rdx, NumberOfGuessesRemaining1String
    call    PrintString
    mov     rdx, rbx
    call    PrintInteger
    lea     rdx, NumberofGuessesRemaining2String
    call    PrintString
    jmp     While

EndWhile:
    lea     rdx, OutOfGuesses1String
    call    PrintString
    mov     rdx, rax
    call    PrintInteger
    lea     rdx, NewLineString
    call    PrintString
    lea     rdx, OutOfGuesses2String
    call    PrintString

End:
    call    EndProgram
