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

.globl _reset
.thumb_func
_reset:
    mov r0, 0x2
    ldr r1, = _stext
    ldr r2, [r1]
    str r0, [r2]

    ldr r0, = 0x48000400
    /* Reuse the number stored in r2, as it has 
    * the right bits set for PB3 */ 
    str r2, [r0, #0x00]
loop:
    mov r2, 0xffff
delay:
    subs r2, 1
    bne delay
    eor r3, #0x8
    str r3, [r0, #0x14]
    b loop

