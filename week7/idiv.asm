.intel_syntax noprefix
.data
val1: .quad -3

.text
.global Main
Main:
    # Example 1: negative RAX
    mov rax, -24
    cqo                 # sign-extend RAX into RDX:RAX
    mov rbx, 6

    idiv rbx            # -24 / 6 → RAX=-4, RDX=0

    # Example 2: memory operand (negative divisor)
    mov rax, 25
    cqo                 # sign-extend 25 into RDX:RAX
    idiv qword ptr [val1]  # 25 / -3 → RAX=-8, remainder RDX=1

    mov  rax, 60   #60 = sys_exit
    mov  rdi, 0    #No error
    syscall
