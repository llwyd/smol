MEMORY {
    ROM (rx)  : ORIGIN = 0x08000000, LENGTH = 256K
}

SECTIONS
{
    . = ORIGIN(ROM);
    .text :
    {
        *(.text*)
    } > ROM    
}
