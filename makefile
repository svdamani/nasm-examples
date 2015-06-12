# Assembler & Linker
ASM = nasm -felf
LNK = ld -m elf_i386

FILES := $(basename $(notdir $(wildcard src/*.s)))

vpath %.s ./src/

define asm-cc
    $(ASM) $< -o $@.o
    $(LNK) $@.o lib/io.o -o $@
    $(RM) $@.o
endef

all: $(FILES)

%: %.s
	@$(asm-cc)

clean:
	@$(RM) $(FILES)