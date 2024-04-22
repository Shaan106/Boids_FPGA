nop
nop

addi    $3, $0, 7928
addi    $4, $0, 3992
sw      $3, 0($4)
addi    $3, $0, 0
addi    $4, $0, 0

addi    $29, $29, 4096
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -4
addi    $29, $29, -4

addi    $27, $0, -1

jal     main
updateBoids:
        addi    $29, $29, -24
        sw      $23, 20($29)
        add     $23,  $29, $0
        sw      $0, 8($23)
        j       $L2
        add $0,  $0, $0

$L3:
        lw      $2, 8($23)
        add $0,  $0, $0
        sll     $3, $2, 2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4080
        add     $2, $4, $2
        sw      $3, 0($2)
        lw      $2, 8($23)
        add $0,  $0, $0
        sll     $3, $2, 2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4064
        add     $2, $4, $2
        sw      $3, 0($2)
        lw      $2, 8($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 8($23)
$L2:
        lw      $2, 8($23)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_0
        addi    $2, $0, 0
        j       slt_end_0
        slt_set_one_0:
        addi    $2, $0, 1
        slt_end_0:
        bne     $2, $0, $L3
        add $0,  $0, $0

        add $0,  $0, $0
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $23, 20($29)
        addi    $29, $29, 24
        jr      $31
        add $0,  $0, $0

main:
        addi    $29, $29, -56
        sw      $31, 52($29)
        sw      $23, 48($29)
        add     $23,  $29, $0

        addi    $2, $0, 1
        sw      $2, 28($23)
        j       $L5
        add $0,  $0, $0

$L8:
        jal     updateBoids
        add $0,  $0, $0

        sw      $0, 24($23)
        j       $L6
        add $0,  $0, $0

$L7:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 24($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 32($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 24($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $2, 0($2) # writes  4, 8, 12
        add $0,  $0, $0
        sw      $2, 36($23)
        lw      $2, 24($23)  # FIXME: writes 0. # $23 is 3968 # therefore goes to loc = 3968 + 24 = 3992
        add $0,  $0, $0
        sw      $2, 40($23)

        lw      $26, 32($23)   # BPU interface
        lw      $28, 36($23)   # BPU interface
        lw      $27, 40($23)   # BPU interface
        # print
        add $0, $0, $0
        add $0, $0, $0
        addi    $27, $0, -1

        lw      $2, 24($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 24($23)
$L6:
        lw      $2, 24($23)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_1
        addi    $2, $0, 0
        j       slt_end_1
        slt_set_one_1:
        addi    $2, $0, 1
        slt_end_1:
        bne     $2, $0, $L7
        add $0,  $0, $0

$L5:
        lw      $2, 28($23)
        add $0,  $0, $0
        bne     $2, $0, $L8
        add $0,  $0, $0

        add $0,  $0, $0
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $31, 52($29)
        lw      $23, 48($29)
        addi    $29, $29, 56
        jr      $31
        add $0,  $0, $0
