.intel_syntax noprefix
.data
val1: .quad 5

.text
.global Main
Main:
    # dec r/m64
    dec qword ptr [val1]    # [val1] = 4

    # dec r64
    mov rax, 10
    dec rax                 # rax = 9

    mov  rax, 60   #60 = sys_exit
    mov  rdi, 0    #No error
    syscall
