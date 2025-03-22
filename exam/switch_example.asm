.intel_syntax noprefix
.text
.global Main
Main:
    mov     rdx, 2
    cmp     rdx, 1
    je      label_1
    cmp     rdx, 2
    je      label_2
    jmp     label_3
label_1:
    jmp     End
lable_2:
    jmp     End
label_3:
End:
    call    EndProgram
