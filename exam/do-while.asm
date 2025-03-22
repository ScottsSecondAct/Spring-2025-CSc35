.intel_syntax noprefix
.text
.global Main
Main:
    mov     rax, 5
loop:
    dec     rax
    cmp     rax, 0
    jg      loop
end:
    call    EndProgram
