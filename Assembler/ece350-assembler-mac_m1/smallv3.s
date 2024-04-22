nop
nop
nop
nop
nop
nop
addi    $sp, $sp, 4096          # allocate stack space
addi    $r27, 0, -1
jal     main  # go to start of program
main:
        addi    $sp, $sp, -32   # allocate stack space for this functino
        sw      $t2, 28($sp)    # store old frame point (never used)
        add     $t2,  $sp, $0   # set new frame point
        sw      $0, 8($t2)      # set boid_index = 0
        j       L2              # jump to loop
        nop

L3:
        lw      $t0, 8($t2)      # load boid_index in temp reg
        nop
        sll     $t0, $t0, 5       # x = boid_index * 32
        sw      $t0, 12($t2)     # store x onto stack
        lw      $t0, 8($t2)      # load boid_index in temp reg
        nop
        sll     $t0, $t0, 5       # y = boid_index * 32
        sw      $t0, 16($t2)     # store y onto stack
        lw      $t0, 8($t2)      # load boid_index in temp reg
        nop
        sw      $t0, 20($t2)     # store boid_index onto stack
        lw      $r26, 12($t2)    # BPU interface - x
        lw      $r28, 16($t2)    # BPU interface - y
        lw      $r27, 20($t2)    # BPU interface - boid_index
        # print
        nop
        nop

        addi    $r27, $0, -1     # turn off write enable
        lw      $t0, 8($t2)      # load boid_index in temp reg
        nop
        addi    $t0, $t0, 1       # boid_index++
        sw      $t0, 8($t2)      # store boid_index onto its stack spot
L2:
        lw      $t0, 8($t2)      # load boid_index in temp reg
        nop

        addi    $t1, $0, 4      # set $t1 to 4
        blt     $t0, $t1, slt_set_one_0  # if boid_index < 4, set $t0 to 1
        addi    $t0, $0, 0       # else, set $t0 to 0
        j       slt_end_0
        slt_set_one_0:
        addi    $t0, $0, 1       # set $t0 to 1
        slt_end_0:              # end of slt

        blt     $t0, $0, L3    
        
        nop

        add     $t0,  $0, $0     # set $t0 to 0
        add     $sp,  $t2, $0   # reset stack point to
        lw      $t2, 28($sp)    # reset old frame point
        addi    $sp, $sp, 32    # deallocate stack space
        j       main            # jump back to start main
