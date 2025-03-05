.intel_syntax noprefix
.data
val1: .quad 10
val2: .quad 20

NewLine: .ascii "\n\0"

.text
.global Main
Main:
    lea rdx, NewLine
    call PrintString

    # add r/m64, imm32
    add qword ptr [val1], 5         # [val1] = 10 + 5
    mov rdx, [val1]
    call PrintInteger
    lea rdx, NewLine
    call PrintString

    # add r/m64, r64
    mov rax, 10
    add qword ptr [val1], rax       # [val1] = 15 + 10 = 25
    mov rdx, [val1]
    call PrintInteger
    lea rdx, NewLine
    call PrintString

    # add r64, r/m64
    mov rax, [val2]                 # rax = 20
    add rax, [val1]                 # rax = 20 + 25 = 45
    mov rdx, rax
    call PrintInteger
    lea rdx, NewLine
    call PrintString

    # add r64, imm32
    add rax, 15                     # rax = 45 + 15 = 60
    mov rdx, rax
    call PrintInteger
    lea rdx, NewLine
    call PrintString

    # add r64, r64
    mov rbx, 3
    add rax, rbx                    # rax = 60 + 3 = 63
    mov rdx, rax
    call PrintInteger
    lea rdx, NewLine
    call PrintString

    call EndProgram
