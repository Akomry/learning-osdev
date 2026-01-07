# Cross-compiler
CROSS = i686-elf-
AS    = $(CROSS)as
CC    = $(CROSS)gcc

# Fichiers
BOOT_SRC   = boot.s
KERNEL_SRC = kernel.c
LINKER     = linker.ld

# Objets
BOOT_OBJ   = dist/boot.o
KERNEL_OBJ = dist/kernel.o

# Sortie finale
BIN = dist/myos.bin
IMG = myos.iso

# Flags
CFLAGS  = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T $(LINKER) -ffreestanding -O2 -nostdlib
LIBS    = -lgcc

# Règle par défaut
all: $(IMG)

$(IMG): $(BIN)
	mkdir -p isodir/boot/grub
	cp $(BIN) isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir

# Assembleur
$(BOOT_OBJ): $(BOOT_SRC)
	mkdir -p dist
	$(AS) $< -o $@

# Compilation C
$(KERNEL_OBJ): $(KERNEL_SRC)
	$(CC) -c $< -o $@ $(CFLAGS)

# Link
$(BIN): $(BOOT_OBJ) $(KERNEL_OBJ)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

# Nettoyage
clean:
	rm -rf dist/*.o isodir/* myos.iso

re: clean all

