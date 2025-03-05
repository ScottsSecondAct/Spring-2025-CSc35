.intel_syntax noprefix
.data
val1: .quad 6

.text
.global Main
Main:
    # Zero-extend RAX before the multiply if needed
    mov rax, 10
    mov rbx, 3

    mul rbx              # RDX:RAX = RAX * RBX = 10 * 3 = 30
                         # result => RAX=30, RDX=0

    # mul with memory operand
    mul qword ptr [val1] # RAX=30 * 6 = 180, RDX=0

    call EndProgram
