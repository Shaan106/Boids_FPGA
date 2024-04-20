
nop
nop
nop
nop
nop
nop

# $r28, $gp = CPU_x_loc
# $r26, $k0 = CPU_y_loc
# $r27, $k1 = which boid/write enable.

addi    $r27, $zero, -1 # we = off
loop:
    addi    $t0, $t0, 1 # x = x + 1 
    addi    $t1, $t1, 1 # y = y + 1

    add     $r28, $t0, $zero # copy x for read to BPU
    add     $r26, $t1, $zero # copy y for read to BPU

    addi    $r27, $zero, 1 # we = boid 1

    nop # time to read
    nop

    addi    $r27, $zero, -1 # we = off

    j   loop
