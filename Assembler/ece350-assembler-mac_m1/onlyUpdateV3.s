
nop
nop
nop
nop
nop
nop

addi    $r27, $0, -1 # we = off

addi    $sp, $0, 4096 # sp to max mem location

initialise_mem:

    # ================ boid 0 ================
    addi $t0, $0, 0 # x_loc
    addi $t1, $0, 0 # y_loc

    addi $sp, $sp, -8 # space for 2 32 bit ints in memory

    sw   $t0, 0($sp) # store x_loc in mem
    sw   $t1, 4($sp) # store y_loc in mem

    # ================ boid 1 ================
    addi $t0, $0, 0 # x_loc
    addi $t1, $0, 0 # y_loc

    addi $sp, $sp, -8 # space for 2 32 bit ints in memory

    sw   $t0, 0($sp) # store x_loc in mem
    sw   $t1, 4($sp) # store y_loc in mem


loop_over_all_boids: 

    # note may need to bit shift before sending data to fpga

    addi $sp, $0, 4096 # resetting stack pointer

    # ================ boid 0 ================

    addi $sp, $sp, -8 # going to mem location for boid 0

    lw $t0, 0($sp) # loading x_loc
    lw $t1, 4($sp) # loading y_loc

    addi $t0, $t0, 1 # updating x_loc
    addi $t1, $t1, 1 # updating y_loc

    add  $r28, $t0, $0 # copy x for read to BPU
    add  $r26, $t1, $0 # copy y for read to BPU

    addi $r27, $0, 0 # we for boid 0 <----- important to change

    nop # time to read in vals
    nop

    addi    $r27, $0, -1 # we = off

    sw $t0, 0($sp) # storing x_loc
    sw $t1, 4($sp) # storing y_loc

    # ================ boid 1 ================

    addi $sp, $sp, -8 # going to mem location for boid 0

    lw $t0, 0($sp) # loading x_loc
    lw $t1, 4($sp) # loading y_loc

    addi $t0, $t0, -1 # updating x_loc
    addi $t1, $t1, -1 # updating y_loc

    add  $r28, $t0, $0 # copy x for read to BPU
    add  $r26, $t1, $0 # copy y for read to BPU

    addi $r27, $0, 1 # we for boid 1 <----- important to change

    nop # time to read in vals
    nop

    addi    $r27, $0, -1 # we = off

    sw $t0, 0($sp) # storing x_loc
    sw $t1, 4($sp) # storing y_loc

    j   loop_over_all_boids

