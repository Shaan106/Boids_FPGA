nop
nop
nop
nop
nop
nop
setup:
    add     $t0, $sp, $zero
    addi    $t1, $0, 4
initialize_loop:
    sw      $r0, 0($t0)  # x = 0
    sw      $r0, 4($t0)  # y = 0
    addi    $t0, $t0, 8  # Move to the next struct
    addi    $t1, $t1, -1  # Decrement the loop counter
    bne     $t1, $r0, initialize_loop  # If the loop counter is not zero, loop again
start_loop:
    addi    $t1, $r0, 4
    addi    $t4, $r0, 4
increment_loop:
    lw      $t2, 0($t0)  # Load x
    lw      $t3, 4($t0)  # Load y
    addi    $t2, $t2, 1  # Increment x
    addi    $t3, $t3, 1  # Increment y
    sw      $r28, 0($t0)  # Store x
    sw      $r29, 4($t0)  # Store y
    sub     $r27, $t4, $t1
    addi    $t0, $t0, 8  # Move to the next struct
    addi    $t1, $t1, -1  # Decrement the loop counter
    bne     $t1, $r0, start_loop  # If the loop counter is not zero, loop again
