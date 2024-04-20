
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

addi    $r28, $zero, 0 # x_loc = 0

addi    $sp, $sp, 4096 # initialise $sp to the end of memory

# initialising 4 boids

# =============== boid 0 ===============
addi    $t1, $zero, 10 # x_loc of boid 0
addi    $t2, $zero, 10 # y_loc of boid 0
# making space in memory for boid 0
addi    $sp, $sp, -8
sw      $t1, 0($sp) # storing in memory x_loc of boid 0
sw      $t2, 4($sp) # storing in memory y_loc of boid 0

# =============== boid 1 ===============
addi    $t1, $zero, 20 # x_loc of boid 1
addi    $t2, $zero, 20 # y_loc of boid 1
# making space in memory for boid 1
addi    $sp, $sp, -8
sw      $t1, 0($sp) # storing in memory x_loc of boid 1
sw      $t2, 4($sp) # storing in memory y_loc of boid 1

# =============== boid 2 ===============
addi    $t1, $zero, 30 # x_loc of boid 2
addi    $t2, $zero, 30 # y_loc of boid 2
# making space in memory for boid 2
addi    $sp, $sp, -8
sw      $t1, 0($sp) # storing in memory x_loc of boid 2
sw      $t2, 4($sp) # storing in memory y_loc of boid 2

# =============== boid 3 ===============
addi    $t1, $zero, 40 # x_loc of boid 3
addi    $t2, $zero, 40 # y_loc of boid 3
# making space in memory for boid 3
addi    $sp, $sp, -8
sw      $t1, 0($sp) # storing in memory x_loc of boid 3
sw      $t2, 4($sp) # storing in memory y_loc of boid 3


# s0 has how many boids we have
addi    $s0, $zero, 4

loop:
    # set stack pointer to the end of memory again
    addi    $sp, $sp, 32

    addi    $r28, $r28, 1 # x_loc = x_loc + 1

    # =============== boid 0 ===============

    addi   $sp, $sp, -8 # going to memory of boid 0
    
    lw      $t1, 0($sp) # read x_loc of boid 0
    lw      $t2, 4($sp) # read y_loc of boid 0
    
    addi    $t1, $t1, 1 # x_loc = x_loc + 1
    addi    $t2, $t2, 1 # y_loc = y_loc + 1

    # store back in memory
    sw      $t1, 0($sp) # storing in memory x_loc of boid 0
    sw      $t2, 4($sp) # storing in memory y_loc of boid 0

    # copy for BPU
    # add     $r28, $t1, $r0 # copy x_loc for read to BPU
    add     $r26, $t2, $r0 # copy y_loc for read to BPU

    # write enable
    addi    $r27, $r0, 0 # we = boid 0

    nop # time to read
    nop

    # write disable
    addi    $r27, $r0, -1 # we = off

    # =============== boid 1 ===============

    addi   $sp, $sp, -8 # going to memory of boid 1

    lw      $t1, 0($sp) # read x_loc of boid 1
    lw      $t2, 4($sp) # read y_loc of boid 1

    addi    $t1, $t1, 1 # x_loc = x_loc + 2
    addi    $t2, $t2, 1 # y_loc = y_loc + 2

    # store back in memory
    sw      $t1, 0($sp) # storing in memory x_loc of boid 1
    sw      $t2, 4($sp) # storing in memory y_loc of boid 1

    # copy for BPU
    # add     $r28, $t1, $r0 # copy x_loc for read to BPU
    add     $r26, $t2, $r0 # copy y_loc for read to BPU

    # write enable
    addi    $r27, $r0, 0 # we = boid 1
    
    nop # time to read
    nop

    # write disable
    addi    $r27, $r0, -1 # we = off

    # =============== boid 2 ===============

    addi   $sp, $sp, -8 # going to memory of boid 2

    lw      $t1, 0($sp) # read x_loc of boid 2
    lw      $t2, 4($sp) # read y_loc of boid 2

    addi    $t1, $t1, 1 # x_loc = x_loc + 3
    addi    $t2, $t2, 1 # y_loc = y_loc + 3

    # store back in memory
    sw      $t1, 0($sp) # storing in memory x_loc of boid 2
    sw      $t2, 4($sp) # storing in memory y_loc of boid 2

    # copy for BPU
    # add     $r28, $t1, $r0 # copy x_loc for read to BPU
    add     $r26, $t2, $r0 # copy y_loc for read to BPU

    # write enable
    addi    $r27, $r0, 0 # we = boid 2

    nop # time to read
    nop

    # write disable
    addi    $r27, $r0, -1 # we = off

    # =============== boid 3 ===============

    addi   $sp, $sp, -8 # going to memory of boid 3

    lw      $t1, 0($sp) # read x_loc of boid 3
    lw      $t2, 4($sp) # read y_loc of boid 3

    addi    $t1, $t1, 1 # x_loc = x_loc + 4
    addi    $t2, $t2, 1 # y_loc = y_loc + 4

    # store back in memory
    sw      $t1, 0($sp) # storing in memory x_loc of boid 3
    sw      $t2, 4($sp) # storing in memory y_loc of boid 3

    # copy for BPU
    # add     $r28, $t1, $zero # copy x_loc for read to BPU
    add     $r26, $t2, $zero # copy y_loc for read to BPU

    # write enable
    addi    $r27, $r0, 0 # we = boid 3

    nop # time to read
    nop

    # write disable
    addi    $r27, $r0, -1 # we = off

    # =============== end of boids ===============

    # decrement number of boids
    addi    $s0, $s0, -1 # do something with this later
    
    j       loop

