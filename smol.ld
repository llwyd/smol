MEMORY {
    ROM (rx)  : ORIGIN = 0x08000000, LENGTH = 256K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 48K
}

SECTIONS
{
    . = ORIGIN(ROM);
    .text :
    {
        *(.text*)
        *(.rodata*)
        _etext = .;
    } > ROM    
}
