all:
	nasm -f bin ./src/boot/boot.asm -o ./bin/boot.bin
#	dd if=./message.txt >> ./boot.bin
	dd if=/dev/zero bs=512 count=1 >> ./boot.bin

qemu:
	qemu-system-x86_64 -serial stdio -nographic -monitor none -hda ./boot.bin

debug: all
	setsid qemu-system-x86_64 -s -hda ./boot.bin &
	gdb -ex "target remote localhost:1234"

clean:
	rm ./bin/boot.bin
