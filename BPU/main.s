addi    $29, $29, 8192
addi    $29, $29, -512
addi    $29, $29, -512
addi    $29, $29, -512
addi    $29, $29, -512
addi    $29, $29, -4
addi    $29, $29, -4
jal     main
abs:
        addi    $29, $29, -8
        sw      $22, 4($29)
        add     $22,  $29, $0
        sw      $4, 8($22)
        lw      $2, 8($22)
        add $0,  $0, $0

        blt     $2, $0, bgez_after_0
        j       $L2
        bgez_after_0:
        add $0,  $0, $0

        lw      $2, 8($22)
        add $0,  $0, $0
        sub     $2, $0, $2
        j       $L3
        add $0,  $0, $0

$L2:
        lw      $2, 8($22)
$L3:
        add     $29,  $22, $0
        lw      $22, 4($29)
        addi    $29, $29, 8
        jr      $31
        add $0,  $0, $0

log_2:
        addi    $29, $29, -24
        sw      $22, 20($29)
        add     $22,  $29, $0
        sw      $4, 24($22)
        sw      $0, 8($22)
        j       $L5
        add $0,  $0, $0

$L6:
        lw      $2, 8($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 8($22)
$L5:
        lw      $2, 24($22)
        add $0,  $0, $0
        sra     $2, $2, 1
        sw      $2, 24($22)
        lw      $2, 24($22)
        add $0,  $0, $0
        bne     $2, $0, $L6
        add $0,  $0, $0

        lw      $2, 8($22)
        add     $29,  $22, $0
        lw      $22, 20($29)
        addi    $29, $29, 24
        jr      $31
        add $0,  $0, $0

initBoids:
        addi    $29, $29, -24
        sw      $22, 20($29)
        add     $22,  $29, $0
        sw      $0, 8($22)
        j       $L9
        add $0,  $0, $0

$L10:
        lw      $3, 8($22)

        addi    $2, $0, 0

        addi    $20, $0, 512

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7680
        add     $2, $4, $2
        sw      $3, 0($2)
        lw      $2, 8($22)
        add $0,  $0, $0
        sll     $3, $2, 3

        addi    $2, $0, 0

        addi    $20, $0, 512

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7168
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 6656
        add     $2, $3, $2

        addi    $3, $0, 0

        addi    $20, $0, 160

        sll     $20, $20, 16

        add     $3, $3, $20
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 6144
        add     $2, $3, $2

        addi    $3, $0, 0

        addi    $20, $0, 160

        sll     $20, $20, 16

        add     $3, $3, $20
        sw      $3, 0($2)
        lw      $2, 8($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 8($22)
$L9:
        lw      $2, 8($22)
        add $0,  $0, $0

        addi    $20, $0, 128
        blt     $2, $20, slt_set_one_9
        addi    $2, $0, 0
        j       slt_end_9
        slt_set_one_9:
        addi    $2, $0, 1
        slt_end_9:
        bne     $2, $0, $L10
        add $0,  $0, $0

        add $0,  $0, $0
        add $0,  $0, $0
        add     $29,  $22, $0
        lw      $22, 20($29)
        addi    $29, $29, 24
        jr      $31
        add $0,  $0, $0

keepWithinBounds:
        addi    $29, $29, -8
        sw      $22, 4($29)
        add     $22,  $29, $0
        sw      $4, 8($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 512

        sll     $20, $20, 16

        add     $2, $2, $20

        add    $20, $0, $2
        blt     $3, $20, slt_set_one_10
        addi    $2, $0, 0
        j       slt_end_10
        slt_set_one_10:
        addi    $2, $0, 1
        slt_end_10:

        bne     $2, $0, beq_after_1
        j       $L12
        beq_after_1:
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 6140($2)

        addi    $2, $0, 0

        addi    $20, $0, 16

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)
        j       $L13
        add $0,  $0, $0

$L12:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 9728

        sll     $20, $20, 16

        add     $2, $2, $20

        addi    $20, $0, 1
        or      $2, $20, $2

        add    $20, $0, $2
        blt     $3, $20, slt_set_one_11
        addi    $2, $0, 0
        j       slt_end_11
        slt_set_one_11:
        addi    $2, $0, 1
        slt_end_11:
        bne     $2, $0, $L13
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 6140($2)

        addi    $2, $0, 0

        addi    $20, $0, -16

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)
$L13:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 512

        sll     $20, $20, 16

        add     $2, $2, $20

        add    $20, $0, $2
        blt     $3, $20, slt_set_one_12
        addi    $2, $0, 0
        j       slt_end_12
        slt_set_one_12:
        addi    $2, $0, 1
        slt_end_12:

        bne     $2, $0, beq_after_2
        j       $L14
        beq_after_2:
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 6136($2)

        addi    $2, $0, 0

        addi    $20, $0, 16

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
        j       $L16
        add $0,  $0, $0

$L14:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 7168

        sll     $20, $20, 16

        add     $2, $2, $20

        addi    $20, $0, 1
        or      $2, $20, $2

        add    $20, $0, $2
        blt     $3, $20, slt_set_one_13
        addi    $2, $0, 0
        j       slt_end_13
        slt_set_one_13:
        addi    $2, $0, 1
        slt_end_13:
        bne     $2, $0, $L16
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 6136($2)

        addi    $2, $0, 0

        addi    $20, $0, -16

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
$L16:
        add $0,  $0, $0
        add     $29,  $22, $0
        lw      $22, 4($29)
        addi    $29, $29, 8
        jr      $31
        add $0,  $0, $0

distance:
        addi    $29, $29, -8
        sw      $22, 4($29)
        add     $22,  $29, $0
        sw      $4, 8($22)
        sw      $5, 12($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 12($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7680
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $2, $3, $2

        blt     $2, $0, bgez_after_3
        j       $L18
        bgez_after_3:
        add $0,  $0, $0

        sub     $2, $0, $2
$L18:
        add     $5,  $2, $0

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 12($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7168
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $2, $3, $2

        blt     $2, $0, bgez_after_4
        j       $L19
        bgez_after_4:
        add $0,  $0, $0

        sub     $2, $0, $2
$L19:
        add     $2, $5, $2
        add     $29,  $22, $0
        lw      $22, 4($29)
        addi    $29, $29, 8
        jr      $31
        add $0,  $0, $0

fly_towards_center:
        addi    $29, $29, -32
        sw      $22, 28($29)
        add     $22,  $29, $0
        sw      $4, 32($22)
        sw      $5, 36($22)
        sw      $0, 8($22)
        sw      $0, 12($22)
        sw      $0, 16($22)
        j       $L22
        add $0,  $0, $0

$L23:
        lw      $2, 16($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        lw      $3, 36($22)
        add $0,  $0, $0
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 20($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 8($22)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 8($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 12($22)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 12($22)
        lw      $2, 16($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 16($22)
$L22:
        lw      $2, 16($22)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_14
        addi    $2, $0, 0
        j       slt_end_14
        slt_set_one_14:
        addi    $2, $0, 1
        slt_end_14:
        bne     $2, $0, $L23
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 32($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $2, 0($2)
        lw      $3, 8($22)
        add $0,  $0, $0
        sub     $2, $3, $2
        sra     $3, $2, 6

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6140($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 32($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $2, 0($2)
        lw      $3, 12($22)
        add $0,  $0, $0
        sub     $2, $3, $2
        sra     $3, $2, 6

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6136($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
        add $0,  $0, $0
        add     $29,  $22, $0
        lw      $22, 28($29)
        addi    $29, $29, 32
        jr      $31
        add $0,  $0, $0

avoid_others:
        addi    $29, $29, -48
        sw      $31, 44($29)
        sw      $22, 40($29)
        add     $22,  $29, $0
        sw      $4, 48($22)
        sw      $5, 52($22)
        sw      $0, 24($22)
        sw      $0, 28($22)
        sw      $0, 32($22)
        j       $L25
        add $0,  $0, $0

$L27:
        lw      $2, 32($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        lw      $3, 52($22)
        add $0,  $0, $0
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 36($22)
        lw      $5, 36($22)
        lw      $4, 48($22)
        jal     distance
        add $0,  $0, $0

        add     $3,  $2, $0

        addi    $2, $0, 0

        addi    $20, $0, 160

        sll     $20, $20, 16

        add     $2, $2, $20

        add    $20, $0, $2
        blt     $3, $20, slt_set_one_15
        addi    $2, $0, 0
        j       slt_end_15
        slt_set_one_15:
        addi    $2, $0, 1
        slt_end_15:

        bne     $2, $0, beq_after_5
        j       $L26
        beq_after_5:
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 48($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 36($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7680
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $2, $3, $2
        lw      $3, 24($22)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 24($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 48($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 36($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7168
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $2, $3, $2
        lw      $3, 28($22)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 28($22)
$L26:
        lw      $2, 32($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 32($22)
$L25:
        lw      $2, 32($22)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_16
        addi    $2, $0, 0
        j       slt_end_16
        slt_set_one_16:
        addi    $2, $0, 1
        slt_end_16:
        bne     $2, $0, $L27
        add $0,  $0, $0

        lw      $2, 24($22)
        add $0,  $0, $0
        sra     $3, $2, 4

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6140($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)
        lw      $2, 28($22)
        add $0,  $0, $0
        sra     $3, $2, 4

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6136($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
        add $0,  $0, $0
        add     $29,  $22, $0
        lw      $31, 44($29)
        lw      $22, 40($29)
        addi    $29, $29, 48
        jr      $31
        add $0,  $0, $0

match_velocity:
        addi    $29, $29, -32
        sw      $22, 28($29)
        add     $22,  $29, $0
        sw      $4, 32($22)
        sw      $5, 36($22)
        sw      $0, 8($22)
        sw      $0, 12($22)
        sw      $0, 16($22)
        j       $L29
        add $0,  $0, $0

$L30:
        lw      $2, 16($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        lw      $3, 36($22)
        add $0,  $0, $0
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 20($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 6656
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 8($22)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 8($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 6144
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 12($22)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 12($22)
        lw      $2, 16($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 16($22)
$L29:
        lw      $2, 16($22)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_17
        addi    $2, $0, 0
        j       slt_end_17
        slt_set_one_17:
        addi    $2, $0, 1
        slt_end_17:
        bne     $2, $0, $L30
        add $0,  $0, $0

        lw      $2, 8($22)
        add $0,  $0, $0
        sra     $3, $2, 2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6140($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)
        lw      $2, 12($22)
        add $0,  $0, $0
        sra     $3, $2, 2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6136($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
        add $0,  $0, $0
        add     $29,  $22, $0
        lw      $22, 28($29)
        addi    $29, $29, 32
        jr      $31
        add $0,  $0, $0

limit_speed:
        addi    $29, $29, -48
        sw      $31, 44($29)
        sw      $22, 40($29)
        add     $22,  $29, $0

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6140($2)
        add $0,  $0, $0

        blt     $2, $0, bgez_after_6
        j       $L32
        bgez_after_6:
        add $0,  $0, $0

        sub     $2, $0, $2
$L32:
        add     $3,  $2, $0

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6136($2)
        add $0,  $0, $0

        blt     $2, $0, bgez_after_7
        j       $L33
        bgez_after_7:
        add $0,  $0, $0

        sub     $2, $0, $2
$L33:
        add     $2, $3, $2
        sw      $2, 28($22)
        lw      $4, 28($22)
        jal     log_2
        add $0,  $0, $0

        sw      $2, 32($22)
        lw      $2, 32($22)
        add $0,  $0, $0
        addi    $2, $2, -22
        sw      $2, 36($22)
        lw      $2, 36($22)
        add $0,  $0, $0
        blt     $2, $0, $L38
        add $0,  $0, $0

        sw      $0, 24($22)
        j       $L36
        add $0,  $0, $0

$L37:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6140($2)
        add $0,  $0, $0
        sra     $3, $2, 1

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 6136($2)
        add $0,  $0, $0
        sra     $3, $2, 1

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
        lw      $2, 24($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 24($22)
$L36:
        lw      $3, 24($22)
        lw      $2, 36($22)
        add $0,  $0, $0

        add    $20, $0, $2
        blt     $3, $20, slt_set_one_18
        addi    $2, $0, 0
        j       slt_end_18
        slt_set_one_18:
        addi    $2, $0, 1
        slt_end_18:
        bne     $2, $0, $L37
        add $0,  $0, $0

        j       $L31
        add $0,  $0, $0

$L38:
        add $0,  $0, $0
$L31:
        add     $29,  $22, $0
        lw      $31, 44($29)
        lw      $22, 40($29)
        addi    $29, $29, 48
        jr      $31
        add $0,  $0, $0

updateBoids:
        addi    $29, $29, -96
        sw      $31, 92($29)
        sw      $22, 88($29)
        sw      $16, 84($29)
        add     $22,  $29, $0
        sw      $0, 24($22)
        sw      $0, 28($22)
        j       $L40
        add $0,  $0, $0

$L50:
        sw      $0, 32($22)
        j       $L41
        add $0,  $0, $0

$L42:
        lw      $2, 32($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $22, 24
        add     $2, $3, $2

        addi    $3, $0, 65535

        addi    $20, $0, -1

        sll     $20, $20, 16

        add     $3, $3, $20
        sw      $3, 40($2)
        lw      $2, 32($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 32($22)
$L41:
        lw      $2, 32($22)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_19
        addi    $2, $0, 0
        j       slt_end_19
        slt_set_one_19:
        addi    $2, $0, 1
        slt_end_19:
        bne     $2, $0, $L42
        add $0,  $0, $0

        sw      $0, 36($22)
        j       $L43
        add $0,  $0, $0

$L49:
        lw      $2, 36($22)
        add $0,  $0, $0
        sw      $2, 40($22)
        sw      $0, 44($22)
        j       $L44
        add $0,  $0, $0

$L48:
        lw      $2, 44($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $22, 24
        add     $2, $3, $2
        lw      $3, 40($2)

        addi    $2, $0, 65535

        addi    $20, $0, -1

        sll     $20, $20, 16

        add     $2, $2, $20
        bne     $3, $2, $L45
        add $0,  $0, $0

        lw      $2, 44($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $22, 24
        add     $2, $3, $2
        lw      $3, 40($22)
        add $0,  $0, $0
        sw      $3, 40($2)
        lw      $2, 24($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 24($22)
        j       $L46
        add $0,  $0, $0

$L45:
        lw      $5, 40($22)
        lw      $4, 28($22)
        jal     distance
        add $0,  $0, $0

        add     $16,  $2, $0
        lw      $2, 44($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $22, 24
        add     $2, $3, $2
        lw      $2, 40($2)
        add $0,  $0, $0
        add     $5,  $2, $0
        lw      $4, 28($22)
        jal     distance
        add $0,  $0, $0


        add    $20, $0, $2
        blt     $16, $20, slt_set_one_20
        addi    $2, $0, 0
        j       slt_end_20
        slt_set_one_20:
        addi    $2, $0, 1
        slt_end_20:

        bne     $2, $0, beq_after_8
        j       $L47
        beq_after_8:
        add $0,  $0, $0

        lw      $2, 44($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $22, 24
        add     $2, $3, $2
        lw      $2, 40($2)
        add $0,  $0, $0
        sw      $2, 60($22)
        lw      $2, 44($22)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $22, 24
        add     $2, $3, $2
        lw      $3, 40($22)
        add $0,  $0, $0
        sw      $3, 40($2)
        lw      $2, 60($22)
        add $0,  $0, $0
        sw      $2, 40($22)
$L47:
        lw      $2, 44($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 44($22)
$L44:
        lw      $2, 44($22)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_21
        addi    $2, $0, 0
        j       slt_end_21
        slt_set_one_21:
        addi    $2, $0, 1
        slt_end_21:
        bne     $2, $0, $L48
        add $0,  $0, $0

$L46:
        lw      $2, 36($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 36($22)
$L43:
        lw      $2, 36($22)
        add $0,  $0, $0

        addi    $20, $0, 128
        blt     $2, $20, slt_set_one_22
        addi    $2, $0, 0
        j       slt_end_22
        slt_set_one_22:
        addi    $2, $0, 1
        slt_end_22:
        bne     $2, $0, $L49
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 6656
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6140($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 6144
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 6136($2)
        addi    $2, $22, 64
        add     $5,  $2, $0
        lw      $4, 28($22)
        jal     fly_towards_center
        add $0,  $0, $0

        addi    $2, $22, 64
        add     $5,  $2, $0
        lw      $4, 28($22)
        jal     avoid_others
        add $0,  $0, $0

        addi    $2, $22, 64
        add     $5,  $2, $0
        lw      $4, 28($22)
        jal     match_velocity
        add $0,  $0, $0

        jal     limit_speed
        add $0,  $0, $0

        lw      $4, 28($22)
        jal     keepWithinBounds
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 6140($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 6656
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 6136($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 6144
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 6656
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7680
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 6144
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($22)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 7168
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7680
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 20
        sw      $2, 48($22)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($22)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 7168
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 20
        sw      $2, 52($22)
        lw      $2, 28($22)
        add $0,  $0, $0
        sw      $2, 56($22)
        lw      $26, 48($22)   # BPU interface
        lw      $28, 52($22)   # BPU interface
        lw      $27, 56($22)   # BPU interface
        # print
        add $0, $0, $0
        add $0, $0, $0
        addi    $27, $0, -1
        lw      $2, 28($22)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 28($22)
$L40:
        lw      $2, 28($22)
        add $0,  $0, $0

        addi    $20, $0, 128
        blt     $2, $20, slt_set_one_23
        addi    $2, $0, 0
        j       slt_end_23
        slt_set_one_23:
        addi    $2, $0, 1
        slt_end_23:
        bne     $2, $0, $L50
        add $0,  $0, $0

        add $0,  $0, $0
        add $0,  $0, $0
        add     $29,  $22, $0
        lw      $31, 92($29)
        lw      $22, 88($29)
        lw      $16, 84($29)
        addi    $29, $29, 96
        jr      $31
        add $0,  $0, $0

main:
        addi    $29, $29, -40
        sw      $31, 36($29)
        sw      $22, 32($29)
        add     $22,  $29, $0
        jal     initBoids
        add $0,  $0, $0


        addi    $2, $0, 1

        addi    $20, $0, 0

        sll     $20, $20, 16

        add     $2, $2, $20
        sw      $2, 24($22)
        j       $L52
        add $0,  $0, $0

$L53:
        addi    $25, $0, 1
        addi    $25, $0, 0
        jal     updateBoids
        add $0,  $0, $0

$L52:
        lw      $2, 24($22)
        add $0,  $0, $0
        bne     $2, $0, $L53
        add $0,  $0, $0

        add     $2,  $0, $0
        add     $29,  $22, $0
        lw      $31, 36($29)
        lw      $22, 32($29)
        addi    $29, $29, 40
        jr      $31
        add $0,  $0, $0
