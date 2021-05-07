    .text
    .syntax unified
    .cpu cortex-m4
    .thumb
    .globl _start

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
    mov r8, pc
    ldr r6, [r8, #-0x10]
    ldr r7, [r8, #-0x08]
    
    /* magic number used as delay
    * and to turn on the RCC clock*/
    mov r0, #0xffff
    
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

