# List all assembly source files here
ASM_FILES = add.asm sub.asm inc.asm dec.asm mul.asm imul.asm div.asm idiv.asm

# Convert .asm filenames to object filenames
OBJS = $(ASM_FILES:.asm=.o)

# Convert .asm filenames to the final executables (remove .asm entirely)
TARGETS = $(ASM_FILES:.asm=)

# Default rule (use `make` or `make build`)
build: $(TARGETS)

# Rule to build each executable from its .o and csc35.o
# $@  = target name  (e.g., add, sub, ...)
# $^  = all prerequisites (e.g., add.o csc35.o)
%: %.o csc35.o
	ld -o $@ $^

# Rule to assemble each .asm into .o
%.o: %.asm
	as -o $@ $<

# Clean up all compiled objects and executables,
# but leave csc35.o alone.
clean:
	rm -f $(OBJS) $(TARGETS)
