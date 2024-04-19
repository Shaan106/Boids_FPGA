
nop
nop
nop
nop
nop
nop
setup:
    addi    $r27, $r0, -1 # we = off
    addi    $r9, $r0, 1 #r9 just stores 1
    addi    $r10, $r0, 16
    add     $r1, $r10, $r0 # r10 is $sp, so now r1 is sp
    addi    $r2, $r0, 4 # r2 has 4, "how many boids"
initialize_loop:
    sw      $r0, 0($r1)  # x = 0
    sw      $r0, 4($r1)  # y = 0
    addi    $r1, $r1, 8  # Move to the next struct
    addi    $r2, $r2, -1  # Decrement the loop counter
    bne     $r2, $r0, initialize_loop  # If the loop counter is not zero, loop again
start_loop:
    addi    $r2, $r0, 4 # resetting, so starting at 4 boids
    addi    $r5, $r0, 4 # r5 = 4
    add     $r1, $r10, $r0 # restting our struct pointer
increment_loop:
    lw      $r3, 0($r1)  # Load x
    lw      $r4, 4($r1)  # Load y
    addi    $r7, $r7, 99  # Increment x
    addi    $r4, $r4, 1  # Increment y
    sw      $r3, 0($r1)  # store updated x
    sw      $r4, 4($r1)  # store updated y
    add     $r28, $r7, $r0 # copy x for read to BPU
    add     $r29, $r4, $r0 # copy y for read to BPU
    addi    $r27, $r2, -1    # setting "which" boid are we reading, 0 indexed therefore -1
    nop                     # let boid location be read
    nop
    nop
    nop
    nop
    nop
    addi    $r27, $r0, -1   # by setting r27 to -1 I am setting we off (hardware implementation)
    addi    $r1, $r1, 8  # Move to the next struct
    addi    $r2, $r2, -1  # Decrement the loop counter boid index = boid index - 1
    bne     $r2, $r0, increment_loop  # if boid index != 0, run through increment_loop again
    blt     $r2, $r1, start_loop # if boid index < 1 then start_loop again
