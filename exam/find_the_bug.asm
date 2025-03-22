.intel_syntax noprefix
.global Main

Main:
    mov  rax, 0 

do_while:
    mov  rdx, rax
    call PrintInteger

    inc  rax
    cmp  rax, 10
    jle  do_while

    # Exit
    call EndProgram
