all:
	yasm if_example.asm -f elf -g dwarf2 -o if_example.o
	ld -melf_i386 if_example.o csc35.o -o if_exampl.elf
	objcopy -O binary if_example.elf if_example.binary