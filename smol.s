    .text
    .syntax unified
    .cpu cortex-m4
    .thumb
    .globl _start

_start:
    .word 0x20001000
    .word _reset

.globl _reset
.thumb_func
_reset:
    
loop:
    b loop

