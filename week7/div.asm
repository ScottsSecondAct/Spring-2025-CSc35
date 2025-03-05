.intel_syntax noprefix
.data
val1: .quad 4

.text
.global Main
Main:
    mov rax, 100
    xor rdx, rdx     # clear RDX for a clean 64-bit dividend
    mov rbx, 5

    div rbx          # divides 100 by 5 → RAX=20, RDX=0

    # div with memory operand
    mov rax, 22
    xor rdx, rdx
    div qword ptr [val1] # 22 / 4 → RAX=5, RDX=2

    call EndProgram
