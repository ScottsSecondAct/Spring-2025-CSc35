all:
	as if_example.asm -gdwarf-2 -o if_example.o --64
	ld if_example.o csc35.o -o if_example.elf
	objcopy -O binary if_example.elf if_example.binary