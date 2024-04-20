
nop
nop
nop
nop
nop
nop

addi    $r27, $0, -1 # we = off

# addi    $sp, $0, 4096 # sp to max mem location

addi    $t2, $0, 33554432 # x2 = x2 + 1 because of where x loc is taken from
addi    $t3, $t3, 1 # y2 = y2 + 1

loop:
    addi    $t0, $t0, 1 # x1 = x1 + 1 
    addi    $t1, $t1, 1 # y1 = y1 + 1

    addi    $t2, $t2, 1 # x2 = x2 + 1 
    addi    $t3, $t3, 1 # y2 = y2 + 1

    add     $r28, $t0, $0 # copy x1 for read to BPU
    add     $r26, $t1, $0 # copy y1 for read to BPU

    addi    $r27, $0, 1 # we = boid 1

    nop # time to read
    nop

    addi    $r27, $0, -1 # we = off

    nop
    nop

    add     $r28, $t2, $0 # copy x2 for read to BPU
    add     $r26, $t3, $0 # copy y2 for read to BPU

    addi    $r27, $0, 2 # we = boid 2

    nop # time to read
    nop

    addi    $r27, $0, -1 # we = off

    j   loop
