.intel_syntax noprefix
.data
val1: .quad -4

.text
.global Main
Main:
    # 1) One-operand form
    mov rax, 5
    imul qword ptr [val1]   # RDX:RAX = 5 * (-4) = -20 (sign-extended)

    # 2) Two-operand form: imul reg64, r/m64
    #    result goes into the first reg64 operand
    mov rbx, [val1]         # rbx = -4
    imul rbx, rbx           # rbx = rbx * rbx = 16

    # 3) Three-operand form: imul reg64, r64, imm32
    #    reg64 = r64 * imm32
    mov rcx, 10
    imul rcx, rcx, -3       # rcx = 10 * (-3) = -30

    mov  rax, 60   #60 = sys_exit
    mov  rdi, 0    #No error
    syscall
