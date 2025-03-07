.intel_syntax noprefix
.text
.global Main
Main:
    mov     rax, 5 if_example.asm -f elf
    cmp     rax, 0
    jl      label_1
    jmp     end
label_1:
end:
    call    EndProgram
