
nop
nop
nop
nop
nop
nop

# $r28, $gp = CPU_x_loc
# $r26, $k0 = CPU_y_loc
# $r27, $k1 = which boid/write enable.

addi    $r27, $r0, -1 # we = off
loop:
    addi    $r1, $r1, 1 # x = x + 1 
    addi    $r2, $r2, 1 # y = y + 1

    add     $r28, $r1, $r0 # copy x for read to BPU
    add     $r26, $r2, $r0 # copy y for read to BPU

    addi    $r27, $r0, 1 # we = boid 1

    nop # time to read
    nop

    addi    $r27, $r0, -1 # we = off

    j   loop
