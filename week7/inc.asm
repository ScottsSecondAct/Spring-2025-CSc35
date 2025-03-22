.intel_syntax noprefix
.data
val1: .quad 0

.text
.global Main
Main:
    # inc r/m64
    inc qword ptr [val1]    # [val1] = 1

    # inc r64
    mov rax, 10
    inc rax                 # rax = 11

    mov  rax, 60   #60 = sys_exit
    mov  rdi, 0    #No error
    syscall
