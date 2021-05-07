# smol

An attempt to make the smallest blinky program on an STM32 L4 microcontroller.

## Rules

1. Must be a single .bin file that can be flashed onto the board
2. The blinking LED must be externally observable

   This is because otherwise you could just have an infinite loop XOR'ing the LED which _technically_ is a blink but not really

   ```c
        while(1)
        {
            /* Technically a blink, but come on*/
            *LED ^= 0x1;
        }
    ```

3. Anything else goes.

