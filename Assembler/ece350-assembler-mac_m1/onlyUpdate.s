
nop
nop
nop
nop
nop
nop

addi    $r27, $0, -1 # we = off
loop:
    addi    $t0, $t0, 1 # x = x + 1 
    addi    $t1, $t1, 1 # y = y + 1

    add     $r28, $t0, $0 # copy x for read to BPU
    add     $r26, $t1, $0 # copy y for read to BPU

    addi    $r27, $0, 1 # we = boid 1

    nop # time to read
    nop

    addi    $r27, $0, -1 # we = off

    j   loop
