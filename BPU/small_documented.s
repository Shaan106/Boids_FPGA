addi    $29, $29, 2047  # allocate stack space
jal     main  # go to start of program
main:
        addi    $29, $29, -32   # allocate stack space for this functino
        sw      $23, 28($29)    # store old frame point (never used)
        add     $23,  $29, $0   # set new frame point
        sw      $0, 8($23)      # set boid_index = 0
        j       L2              # jump to loop
        add $0,  $0, $0         # no-op

L3:
        lw      $2, 8($23)      # load boid_index in temp reg
        add $0,  $0, $0         # no-op
        sll     $2, $2, 5       # x = boid_index * 32
        sw      $2, 12($23)     # store x onto stack
        lw      $2, 8($23)      # load boid_index in temp reg
        add $0,  $0, $0         # no-op
        sll     $2, $2, 5       # y = boid_index * 32
        sw      $2, 16($23)     # store y onto stack
        lw      $2, 8($23)      # load boid_index in temp reg
        add $0,  $0, $0         # no-op
        sw      $2, 20($23)     # store boid_index onto stack
        lw      $26, 12($23)    # BPU interface - x
        lw      $28, 16($23)    # BPU interface - y
        lw      $27, 20($23)    # BPU interface - boid_index
        # print
        add $0, $0, $0          # no-op
        add $0, $0, $0          # no-op
        addi    $27, $0, -1     # turn off write enable
        lw      $2, 8($23)      # load boid_index in temp reg
        add $0,  $0, $0         # no-op
        addi    $2, $2, 1       # boid_index++
        sw      $2, 8($23)      # store boid_index onto its stack spot
L2:
        lw      $2, 8($23)      # load boid_index in temp reg
        add $0,  $0, $0         # no-op

        addi    $20, $0, 4      # set $20 to 4
        blt     $2, $20, slt_set_one_0  # if boid_index < 4, set $2 to 1
        addi    $2, $0, 0       # else, set $2 to 0
        j       slt_end_0
        slt_set_one_0:
        addi    $2, $0, 1       # set $2 to 1
        slt_end_0:              # end of slt
        bne     $2, $0, L3      # if $2 != 0, jump to $L3 (loop) when boid_index < 4
        add $0,  $0, $0         # no-op

        add     $2,  $0, $0     # set $2 to 0
        add     $29,  $23, $0   # reset stack point to
        lw      $23, 28($29)    # reset old frame point
        addi    $29, $29, 32    # deallocate stack space
        j       main            # jump back to start main
