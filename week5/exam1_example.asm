# Problem: Implement the following pseudocode in x86_64 assembly code
#
# rcx = 5  
#
# while rcx > 0:
#    rcx = rcx - 1
#    PrintInteger(rcx)
#
# Find the error in the implmentation
# 1. What will be the output of the pseudocode?  
# 2. What will be the output of the assembly code?  
# 3. What did I do wrong?
# 4. How can I fix it?
#
.intel_syntax noprefix

.data
Newline:
  .ascii "\n\0"

.text
.global Main
Main:
  mov rcx, 5

while_loop:
  cmp rcx, 0
  je end_loop

  mov rdx, rcx
  call PrintInteger
  lea rdx, Newline
  call PrintString

  dec rcx

  jmp while_loop

end_loop:
  call EndProgram
