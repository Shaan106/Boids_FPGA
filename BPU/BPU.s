init_boids:

distance:

log2:
    # $a0 contains the integer x (must be positive or infite loop)
    # $v0 will contain the result
    # Initialize result to 0
    li $v0, -1
    loop:
        # Right shift x by 1 bit (equivalent to x /= 2)
        sra $a0, $a0, 1
        # increment count
        addi $v0, $v0, 1
        # check if done
        bne  $a0, $r0, loop
    end:
        # Return result
        jr $ra
abs:  #TODO: FIXM
    # a0 contains signed integer x
    # v0 is the absolute value of the integer
    slt $t0, $a0, $zero

keep_withing_bounds:
    # a0 contains the address of Boid
    # v0 contains dx, v1 contains dy

    # Initialize Velocity structure to {0, 0}
    sw $zero, 0($sp)
    sw $zero, 4($sp)

    # Load Boid's x and y into $t0 and $t1
    lw $t0, 0($a0)
    lw $t1, 4($a0)

    check_left_bound:
        # Check if x < LEFT_BOUND
        li $t2, LEFT_BOUND
        slt $t3, $t0, $t2
        beqz $t3, check_right_bound
        li $t4, EDGE_PUSH
        sw $t4, 0($sp)
        j end_x_check

    check_right_bound:
        # Check if x > RIGHT_BOUND
        li $t2, RIGHT_BOUND
        slt $t3, $t2, $t0
        beqz $t3, end_x_check
        li $t4, -EDGE_PUSH
        sw $t4, 0($sp)

    end_x_check:
    check_top_bound:
        # Check if y < TOP_BOUND
        li $t2, TOP_BOUND
        slt $t3, $t1, $t2
        beqz $t3, check_bottom_bound
        li $t4, EDGE_PUSH
        sw $t4, 4($sp)
        j end_y_check
    check_bottom_bound:
        # Check if y > BOTTOM_BOUND
        li $t2, BOTTOM_BOUND
        slt $t3, $t2, $t1
        beqz $t3, end_y_check
        li $t4, -EDGE_PUSH
        sw $t4, 4($sp)
    end_y_check:
    # Return address of Velocity structure
    move $v0, $sp
    jr $ra
fly_towards_center: # TODO: change to dx and dy
    # Assuming $a0 contains the address of the Boid structure and $a1 contains the address of the neighbors array
    # $v0 will contain the address of the Velocity structure

    # Allocate space for Velocity structure on stack
    addiu $sp, $sp, -8

    # Initialize centerX and centerY to 0
    move $t0, $zero
    move $t1, $zero

    # Initialize loop counter i to 0
    move $t2, $zero

    loop:
        # If i >= NUM_NEIGHBORS, end the loop
        li $t3, NUM_NEIGHBORS
        slt $t4, $t3, $t2
        bnez $t4, end_loop

        # Load neighbors[i] into $t5
        sll $t6, $t2, 2
        addu $t6, $a1, $t6
        lw $t5, 0($t6)

        # Add neighbors[i]->x >> NEIGHBOR_SHIFT to centerX
        lw $t7, 0($t5)
        sra $t7, $t7, NEIGHBOR_SHIFT
        addu $t0, $t0, $t7

        # Add neighbors[i]->y >> NEIGHBOR_SHIFT to centerY
        lw $t7, 4($t5)
        sra $t7, $t7, NEIGHBOR_SHIFT
        addu $t1, $t1, $t7

        # Increment i and continue the loop
        addiu $t2, $t2, 1
        j loop

    end_loop:
        # Calculate a.dx and a.dy
        lw $t3, 0($a0)
        sub $t3, $t0, $t3
        sra $t3, $t3, COHESION_FACTOR
        sw $t3, 0($sp)

        lw $t3, 4($a0)
        sub $t3, $t1, $t3
        sra $t3, $t3, COHESION_FACTOR
        sw $t3, 4($sp)

        # Return address of Velocity structure
        move $v0, $sp
    jr $ra
avoid_others:
    # Assuming $a0 contains the address of the Boid structure and $a1 contains the address of the neighbors array
    # $v0 will contain the address of the Velocity structure
    # Allocate space for Velocity structure on stack
    addiu $sp, $sp, -8

    # Initialize repelX and repelY to 0
    move $t0, $zero
    move $t1, $zero

    # Initialize loop counter i to 0
    move $t2, $zero

    loop:
        # If i >= NUM_NEIGHBORS, end the loop
        li $t3, NUM_NEIGHBORS
        slt $t4, $t3, $t2
        bnez $t4, end_loop

        # Load neighbors[i] into $t5
        sll $t6, $t2, 2
        addu $t6, $a1, $t6
        lw $t5, 0($t6)

        # Call distance function and compare result with PERCEPTION_RADIUS
        move $a2, $t5
        jal distance
        li $t7, PERCEPTION_RADIUS
        slt $t8, $v0, $t7

        # If distance < PERCEPTION_RADIUS, calculate repulsion
        beqz $t8, skip_repulsion
        lw $t9, 0($a0)
        lw $t10, 0($t5)
        sub $t9, $t9, $t10
        addu $t0, $t0, $t9

        lw $t9, 4($a0)
        lw $t10, 4($t5)
        sub $t9, $t9, $t10
        addu $t1, $t1, $t9

    skip_repulsion:
        # Increment i and continue the loop
        addiu $t2, $t2, 1
        j loop

    end_loop:
        # Calculate a.dx and a.dy
        sra $t3, $t0, SEPARATION_FACTOR
        sw $t3, 0($sp)

        sra $t3, $t1, SEPARATION_FACTOR
        sw $t3, 4($sp)

        # Return address of Velocity structure
        move $v0, $sp
        jr $ra
match_velocity:

limit_speed:

update_boids:

