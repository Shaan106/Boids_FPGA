# Register File

## Name 
Shaan Yadav

!!! IMPORTANT DO NOT DELETE, VERY IMPORTANT FOR CODE !!!

⬜⬜⬜🏿🏿🏿⬜⬜⬜⬜⬜⬜⬜
⬜⬜🏿🏿🏿🏿🏿⬜⬜⬜⬜⬜⬜
⬜⬛⬛⬛⬛⬛⬛⬜⬜⬜⬜⬜⬜
🏿🏿🏿🏿🏿🏿🏿🏿🏿⬜⬜⬜⬜
⬜🟦🟦🟦🟦🟦🟦🏿⬜⬜⬜⬜⬜
⬜⬜⬛⬜🟨⬛⬜🟦⬜⬜⬜⬜⬜
⬜⬜⬜🟨🟨🟨🟦🟦⬜⬜⬜⬜⬜
⬜🟨🟨🟨🟨🟨🟦🟦⬜⬜🟨🟨⬜
⬜⬜🟨🟨🟨🟨🟨🟦⬜🟨🟨🟨🟨
⬜⬜⬜🟦🟦🟦🟦🟦🟦🟨🟨🟨🟨
⬜⬜🟦🟦🟦🟦🟦🟦🟨🟦🟨🟨⬜
⬜🟦🟦🟦🟦🟦🟦🟦🟨🟦🟨⬜⬜
⬜🟦⬜🟦🟦🟦🟦🟦🟦🟨⬜⬜⬜
⬜⬜⬜🟦🟦🟦🟦🟦🟨⬜⬜⬜⬜
⬜⬜🟦🟦🟦🟦🟦🟦🟦⬜⬜⬜⬜
⬜⬜🟦🟦⬜⬜⬜🟦🟦⬜⬜⬜⬜
⬜🟨🟨🟨⬜⬜⬜🟨🟨🟨⬜⬜⬜

## Design Description
### Decoder 32

takes in an input of size 5 bits and returns a one-hot encoding of size 32 bits representing the value in the 5 bit input

### dffe_ref

D-flip flop, given to us.

### regfile_tb

Regfile testbench, given to us

### regfile

This is the actual reg file. It takes in the inputs previously specified. There are 3 decoders, that convert the 5 bit control signals into 32 bit one-hot encodings. Then I hard wire the zero register that is always zero, and link up the outputs using tristates. I then created a genvar loop to create the other 31 registers (excet I also had to incorporate write enable for them).

### single_reg

I did one whole genvar, and created multiple dffs that link up to the correct output bits.


### tristate

High impedance if no enable, if enable then input. Inspired by Dr. Doofenshmirtz.

