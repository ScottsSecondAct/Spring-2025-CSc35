.intel_syntax noprefix
.data
val1: .quad 50
val2: .quad 8

.text
.global Main
Main:
    # sub r/m64, imm32
    sub qword ptr [val1], 5         # [val1] = 50 - 5 = 45

    # sub r/m64, r64
    mov rax, 10
    sub qword ptr [val1], rax       # [val1] = 45 - 10 = 35

    # sub r64, r/m64
    mov rax, 100
    sub rax, [val2]                 # rax = 100 - 8 = 92

    # sub r64, imm32
    sub rax, 12                     # rax = 92 - 12 = 80

    # sub r64, r64
    mov rbx, 5
    sub rax, rbx                    # rax = 80 - 5 = 75

    mov  rax, 60   #60 = sys_exit
    mov  rdi, 0    #No error
    syscall

