.intel_syntax noprefix
.text
.global Main
Main:
    mov     rax, 5
Loop:
    cmp     rax, 0
    jle     End
    dec     rax
    jmp     Loop
End:
    call    EndProgram
