
nop
nop
nop
nop
nop
nop

addi    $r27, $0, -1 # we = off

# addi    $sp, $0, 4096 # sp to max mem location

addi    $t4, $0, 1048576
addi    $t5, $0, 1048576

loop:

    add     $r28, $t4, $0 # copy x3 for read to BPU
    add     $r26, $t5, $0 # copy y3 for read to BPU

    addi    $r27, $0, 3 # we = boid 3

    nop # time to read
    nop

    addi    $r27, $0, -1 # we = off

    addi    $t2, $t2, 1 # x2 = x2 + 1 
    addi    $t3, $t3, 1 # y2 = y2 + 1

    add     $r28, $t2, $0 # copy x2 for read to BPU
    add     $r26, $t3, $0 # copy y2 for read to BPU

    addi    $r27, $0, 2 # we = boid 2

    nop # time to read
    nop

    addi    $r27, $0, -1 # we = off

    nop
    addi    $t0, $t0, -1 # x1 = x1 + 1 
    addi    $t1, $t1, -1 # y1 = y1 + 1
    nop

    add     $r28, $t0, $0 # copy x1 for read to BPU
    add     $r26, $t1, $0 # copy y1 for read to BPU

    addi    $r27, $0, 1 # we = boid 1

    nop # time to read
    nop

    addi    $r27, $0, -1 # we = off

    nop
    nop
    j   loop
