smol.bin: smol.elf
	arm-none-eabi-objcopy -Obinary smol.elf smol.bin
	hexdump -C smol.bin
smol.elf: smol.o smol.ld
	arm-none-eabi-ld -Map smol.map -Tsmol.ld -o smol.elf smol.o -print-memory-usage -nostdlib
	arm-none-eabi-objdump -t smol.elf
smol.o: smol.s
	arm-none-eabi-as -g -mcpu=cortex-m4 -mthumb  smol.s -o smol.o
clean:
	rm smol.elf smol.bin smol.map smol.o
debug:
	openocd -f /usr/share/openocd/scripts/interface/stlink-v2-1.cfg -f /usr/share/openocd/scripts/target/stm32l4x.cfg
gdb:
	arm-none-eabi-gdb -ex "target remote localhost:3333" smol.elf
ezflash:
	st-flash write smol.bin 0x08000000
