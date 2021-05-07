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
    /* Value to turn on the peripheral clock,
    * also used as a delay */
    mov r0, 0xffff
    ldr r1, = _stext
    ldr r2, [r1]
    str r0, [r2]

    /* Base address for GPIO config */
    ldr r4, = 0x48000400
    /* Reuse the number stored in r2, as it has 
    * the right bits set for PB3 */ 
    str r2, [r4, #0x00]
delay:
    subs r0, 1
    bne delay
    eor r3, #0x8
    str r3, [r4, #0x14]
    b _reset

