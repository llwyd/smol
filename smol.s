    .syntax unified

_start:
    /* This is where the stack top goes, but we dont
    * need a stack for this so going to repurpose it*/
    .word 0x4002104C
    /* Second word is always the reset vector */
    .word _reset
    .word 0x48000400
.globl _reset
.thumb_func
_reset:
    /* (ab)use the program counter to retrive 
    * addresses stored as vectors */
    ldr r6, [pc, #-0x10]
    ldr r7, [pc, #-0x0C]
    
    /* Reset value for a different RCC register
    * is 0x11303, which makes a nice delay and
    * can be used to set GPIO B*/
    ldr r0, [r6, #0x1C]
    
    /* RCC Clock Enable Port B */
    str r0, [r6]

    /* Reuse the number stored in r6
    * to set GPIOB 3 as output */
    str r6, [r7]

delay:
    subs r0, 1
    bne delay

    /* Toggle LED */
    eor r3, r6
    str r3, [r7, #0x14]
    b _reset

