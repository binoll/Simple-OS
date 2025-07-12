QEMU := qemu-system-x86_64
NASMFLAGS := -fbin
BUILD_DIR := build/
ASM_TARGET := boot/mbr.asm
BIN_TARGET := $(BUILD_DIR)boot.bin

all: build run

run: $(BIN_TARGET)
	$(QEMU) -drive format=raw,file=$<

build: $(ASM_TARGET)
	mkdir $(BUILD_DIR)
	nasm $(NASMFLAGS) $< -o $(BIN_TARGET)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean