
nop
nop
nop
nop
nop
nop

addi    $r27, $0, -1 # we = off

addi    $sp, $0, 4096 # sp to max mem location

initialise_mem:

    addi $s0, $0, 0 # counter for current boid
    addi $s1, $0, 3 # max number of boids - 1

    initialise_mem_loop:
        # ================ boid n ================
        addi $t0, $0, 0 # x_loc
        addi $t1, $0, 0 # y_loc

        addi $sp, $sp, -8 # space for 2 32 bit ints in memory

        sw   $t0, 0($sp) # store x_loc in mem
        sw   $t1, 4($sp) # store y_loc in mem

        addi $s0, $s0, 1 # n = n + 1

        blt $s0, $s1, initialise_mem_loop # if n < 3 then add another boid to mem

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

    # ================ boid 2 ================

    addi $sp, $sp, -8 # going to mem location for boid 0

    lw $t0, 0($sp) # loading x_loc
    lw $t1, 4($sp) # loading y_loc

    addi $t0, $t0, -1 # updating x_loc
    addi $t1, $t1, 1 # updating y_loc

    add  $r28, $t0, $0 # copy x for read to BPU
    add  $r26, $t1, $0 # copy y for read to BPU

    addi $r27, $0, 2 # we for boid 1 <----- important to change

    nop # time to read in vals
    nop

    addi    $r27, $0, -1 # we = off

    sw $t0, 0($sp) # storing x_loc
    sw $t1, 4($sp) # storing y_loc

    # ================ boid 3 ================

    addi $sp, $sp, -8 # going to mem location for boid 0

    lw $t0, 0($sp) # loading x_loc
    lw $t1, 4($sp) # loading y_loc

    addi $t0, $t0, 2 # updating x_loc
    addi $t1, $t1, 1 # updating y_loc

    add  $r28, $t0, $0 # copy x for read to BPU
    add  $r26, $t1, $0 # copy y for read to BPU

    addi $r27, $0, 3 # we for boid 1 <----- important to change

    nop # time to read in vals
    nop

    addi    $r27, $0, -1 # we = off

    sw $t0, 0($sp) # storing x_loc
    sw $t1, 4($sp) # storing y_loc

    delay_loop_init:
        addi $t0, $0, 0 # set counter = 0
        addi $t1, $0, 50000000 # set threshold = 50 million, therefore update every 1 sec

    delay_loop:
        nop # nop
        addi $t0, $t0, 1  # Increment the counter by 1
        bne $t0, $t1, delay_loop # Continue looping until the counter reaches 500

    j   loop_over_all_boids


