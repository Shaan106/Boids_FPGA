addi    $29, $29, 2047
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -4
addi    $29, $29, -4
jal     main


initBoids:
        addi    $29, $29, -24
        sw      $23, 20($29)
        add     $23,  $29, $0
        sw      $0, 8($23)
        j       $L2
        add $0,  $0, $0

$L3:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 2031
        add     $2, $3, $2
        sw      $0, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 2015
        add     $2, $3, $2
        sw      $0, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 1999
        add     $2, $3, $2

        addi    $3, $0, 41943040
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 1983
        add     $2, $3, $2

        addi    $3, $0, 41943040
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

updateBoids:
        addi    $29, $29, -32
        sw      $23, 28($29)
        add     $23,  $29, $0
        sw      $0, 8($23)
        j       $L5
        add $0,  $0, $0

$L6:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 2031
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        addi    $3, $2, 1

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 2031
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 2015
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        addi    $3, $2, 1

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 2015
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 2031
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 22
        sw      $2, 12($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 2015
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 22
        sw      $2, 16($23)
        lw      $2, 8($23)
        add $0,  $0, $0
        sw      $2, 20($23)
        lw      $26, 12($23)   # BPU interface
        lw      $28, 16($23)   # BPU interface
        lw      $27, 20($23)   # BPU interface
        # print
        add $0, $0, $0
        add $0, $0, $0
        addi    $27, $0, -1
        lw      $2, 8($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 8($23)
$L5:
        lw      $2, 8($23)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_1
        addi    $2, $0, 0
        j       slt_end_1
        slt_set_one_1:
        addi    $2, $0, 1
        slt_end_1:
        bne     $2, $0, $L6
        add $0,  $0, $0

        add $0,  $0, $0
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $23, 28($29)
        addi    $29, $29, 32
        jr      $31
        add $0,  $0, $0

main:
        addi    $29, $29, -40
        sw      $31, 36($29)
        sw      $23, 32($29)
        add     $23,  $29, $0
        jal     initBoids
        add $0,  $0, $0


        addi    $2, $0, 1
        sw      $2, 24($23)
        j       $L8
        add $0,  $0, $0

$L9:
        jal     updateBoids
        add $0,  $0, $0

$L8:
        lw      $2, 24($23)
        add $0,  $0, $0
        bne     $2, $0, $L9
        add $0,  $0, $0

        add     $2,  $0, $0
        add     $29,  $23, $0
        lw      $31, 36($29)
        lw      $23, 32($29)
        addi    $29, $29, 40
        jr      $31
        add $0,  $0, $0
