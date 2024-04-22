addi    $29, $29, 4096
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -16
addi    $29, $29, -4
addi    $29, $29, -4
addi    $27, $0, 0
jal     main
abs:
        addi    $29, $29, -8
        sw      $23, 4($29)
        add     $23,  $29, $0
        sw      $4, 8($23)
        lw      $2, 8($23)
        add $0,  $0, $0

        blt     $2, $0, bgez_after_0
        j       $L2
        bgez_after_0:
        add $0,  $0, $0

        lw      $2, 8($23)
        add $0,  $0, $0
        sub     $2, $0, $2
        j       $L3
        add $0,  $0, $0

$L2:
        lw      $2, 8($23)
$L3:
        add     $29,  $23, $0
        lw      $23, 4($29)
        addi    $29, $29, 8
        jr      $31
        add $0,  $0, $0

log_2:
        addi    $29, $29, -24
        sw      $23, 20($29)
        add     $23,  $29, $0
        sw      $4, 24($23)
        sw      $0, 8($23)
        j       $L5
        add $0,  $0, $0

$L6:
        lw      $2, 8($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 8($23)
$L5:
        lw      $2, 24($23)
        add $0,  $0, $0
        sra     $2, $2, 1
        sw      $2, 24($23)
        lw      $2, 24($23)
        add $0,  $0, $0
        bne     $2, $0, $L6
        add $0,  $0, $0

        lw      $2, 8($23)
        add     $29,  $23, $0
        lw      $23, 20($29)
        addi    $29, $29, 24
        jr      $31
        add $0,  $0, $0

initBoids:
        addi    $29, $29, -24
        sw      $23, 20($29)
        add     $23,  $29, $0
        sw      $0, 8($23)
        j       $L9
        add $0,  $0, $0

$L10:
        lw      $3, 8($23)

        addi    $2, $0, 0

        addi    $20, $0, 4096

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

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
        sll     $3, $2, 3

        addi    $2, $0, 0

        addi    $20, $0, 4096

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 8($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4064
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4048
        add     $2, $3, $2

        addi    $3, $0, 0

        addi    $20, $0, 640

        sll     $20, $20, 16

        add     $3, $3, $20
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4032
        add     $2, $3, $2

        addi    $3, $0, 0

        addi    $20, $0, 640

        sll     $20, $20, 16

        add     $3, $3, $20
        sw      $3, 0($2)
        lw      $2, 8($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 8($23)
$L9:
        lw      $2, 8($23)
        add $0,  $0, $0

        addi    $20, $0, 4
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
        add     $29,  $23, $0
        lw      $23, 20($29)
        addi    $29, $29, 24
        jr      $31
        add $0,  $0, $0

keepWithinBounds:
        addi    $29, $29, -8
        sw      $23, 4($29)
        add     $23,  $29, $0
        sw      $4, 8($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 4096

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
        lw      $3, 4028($2)

        addi    $2, $0, 0

        addi    $20, $0, 64

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)
        j       $L13
        add $0,  $0, $0

$L12:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 12288

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
        lw      $3, 4028($2)

        addi    $2, $0, 0

        addi    $20, $0, -64

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)
$L13:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 4096

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
        lw      $3, 4024($2)

        addi    $2, $0, 0

        addi    $20, $0, 64

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
        j       $L16
        add $0,  $0, $0

$L14:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $20, $0, 12288

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
        lw      $3, 4024($2)

        addi    $2, $0, 0

        addi    $20, $0, -64

        sll     $20, $20, 16

        add     $2, $2, $20
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
$L16:
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $23, 4($29)
        addi    $29, $29, 8
        jr      $31
        add $0,  $0, $0

distance:
        addi    $29, $29, -8
        sw      $23, 4($29)
        add     $23,  $29, $0
        sw      $4, 8($23)
        sw      $5, 12($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 12($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4080
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
        lw      $3, 8($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 12($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4064
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
        add     $29,  $23, $0
        lw      $23, 4($29)
        addi    $29, $29, 8
        jr      $31
        add $0,  $0, $0

fly_towards_center:
        addi    $29, $29, -32
        sw      $23, 28($29)
        add     $23,  $29, $0
        sw      $4, 32($23)
        sw      $5, 36($23)
        sw      $0, 8($23)
        sw      $0, 12($23)
        sw      $0, 16($23)
        j       $L22
        add $0,  $0, $0

$L23:
        lw      $2, 16($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        lw      $3, 36($23)
        add $0,  $0, $0
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 20($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 8($23)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 8($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 12($23)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 12($23)
        lw      $2, 16($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 16($23)
$L22:
        lw      $2, 16($23)
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
        lw      $3, 32($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $2, 0($2)
        lw      $3, 8($23)
        add $0,  $0, $0
        sub     $2, $3, $2
        sra     $3, $2, 6

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4028($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 32($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $2, 0($2)
        lw      $3, 12($23)
        add $0,  $0, $0
        sub     $2, $3, $2
        sra     $3, $2, 6

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4024($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $23, 28($29)
        addi    $29, $29, 32
        jr      $31
        add $0,  $0, $0

avoid_others:
        addi    $29, $29, -48
        sw      $31, 44($29)
        sw      $23, 40($29)
        add     $23,  $29, $0
        sw      $4, 48($23)
        sw      $5, 52($23)
        sw      $0, 24($23)
        sw      $0, 28($23)
        sw      $0, 32($23)
        j       $L25
        add $0,  $0, $0

$L27:
        lw      $2, 32($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        lw      $3, 52($23)
        add $0,  $0, $0
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 36($23)
        lw      $5, 36($23)
        lw      $4, 48($23)
        jal     distance
        add $0,  $0, $0

        add     $3,  $2, $0

        addi    $2, $0, 0

        addi    $20, $0, 640

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
        lw      $3, 48($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 36($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4080
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $2, $3, $2
        lw      $3, 24($23)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 24($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 48($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 36($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4064
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $2, $3, $2
        lw      $3, 28($23)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 28($23)
$L26:
        lw      $2, 32($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 32($23)
$L25:
        lw      $2, 32($23)
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

        lw      $2, 24($23)
        add $0,  $0, $0
        sra     $3, $2, 4

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4028($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)
        lw      $2, 28($23)
        add $0,  $0, $0
        sra     $3, $2, 4

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4024($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $31, 44($29)
        lw      $23, 40($29)
        addi    $29, $29, 48
        jr      $31
        add $0,  $0, $0

match_velocity:
        addi    $29, $29, -32
        sw      $23, 28($29)
        add     $23,  $29, $0
        sw      $4, 32($23)
        sw      $5, 36($23)
        sw      $0, 8($23)
        sw      $0, 12($23)
        sw      $0, 16($23)
        j       $L29
        add $0,  $0, $0

$L30:
        lw      $2, 16($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        lw      $3, 36($23)
        add $0,  $0, $0
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 20($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4048
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 8($23)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 8($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 20($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4032
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 2
        lw      $3, 12($23)
        add $0,  $0, $0
        add     $2, $3, $2
        sw      $2, 12($23)
        lw      $2, 16($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 16($23)
$L29:
        lw      $2, 16($23)
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

        lw      $2, 8($23)
        add $0,  $0, $0
        sra     $3, $2, 2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4028($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)
        lw      $2, 12($23)
        add $0,  $0, $0
        sra     $3, $2, 2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4024($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $23, 28($29)
        addi    $29, $29, 32
        jr      $31
        add $0,  $0, $0

limit_speed:
        addi    $29, $29, -48
        sw      $31, 44($29)
        sw      $23, 40($29)
        add     $23,  $29, $0

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4028($2)
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
        lw      $2, 4024($2)
        add $0,  $0, $0

        blt     $2, $0, bgez_after_7
        j       $L33
        bgez_after_7:
        add $0,  $0, $0

        sub     $2, $0, $2
$L33:
        add     $2, $3, $2
        sw      $2, 28($23)
        lw      $4, 28($23)
        jal     log_2
        add $0,  $0, $0

        sw      $2, 32($23)
        lw      $2, 32($23)
        add $0,  $0, $0
        addi    $2, $2, -23
        sw      $2, 36($23)
        lw      $2, 36($23)
        add $0,  $0, $0
        blt     $2, $0, $L38
        add $0,  $0, $0

        sw      $0, 24($23)
        j       $L36
        add $0,  $0, $0

$L37:

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4028($2)
        add $0,  $0, $0
        sra     $3, $2, 1

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $2, 4024($2)
        add $0,  $0, $0
        sra     $3, $2, 1

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
        lw      $2, 24($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 24($23)
$L36:
        lw      $3, 24($23)
        lw      $2, 36($23)
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
        add     $29,  $23, $0
        lw      $31, 44($29)
        lw      $23, 40($29)
        addi    $29, $29, 48
        jr      $31
        add $0,  $0, $0

updateBoids:
        addi    $29, $29, -112
        sw      $31, 108($29)
        sw      $23, 104($29)
        sw      $16, 100($29)
        add     $23,  $29, $0
        sw      $0, 24($23)
        sw      $0, 28($23)
        j       $L40
        add $0,  $0, $0

$L52:
        sw      $0, 32($23)
        j       $L41
        add $0,  $0, $0

$L42:
        lw      $2, 32($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2

        addi    $3, $0, 65535

        addi    $20, $0, -1

        sll     $20, $20, 16

        add     $3, $3, $20
        sw      $3, 52($2)
        lw      $2, 32($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 32($23)
$L41:
        lw      $2, 32($23)
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

        sw      $0, 36($23)
        j       $L43
        add $0,  $0, $0

$L49:
        lw      $2, 36($23)
        add $0,  $0, $0
        sw      $2, 40($23)
        sw      $0, 44($23)
        j       $L44
        add $0,  $0, $0

$L48:
        lw      $2, 44($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2
        lw      $3, 52($2)

        addi    $2, $0, 65535

        addi    $20, $0, -1

        sll     $20, $20, 16

        add     $2, $2, $20
        bne     $3, $2, $L45
        add $0,  $0, $0

        lw      $2, 44($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2
        lw      $3, 40($23)
        add $0,  $0, $0
        sw      $3, 52($2)
        lw      $2, 24($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 24($23)
        j       $L46
        add $0,  $0, $0

$L45:
        lw      $5, 40($23)
        lw      $4, 28($23)
        jal     distance
        add $0,  $0, $0

        add     $16,  $2, $0
        lw      $2, 44($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2
        lw      $2, 52($2)
        add $0,  $0, $0
        add     $5,  $2, $0
        lw      $4, 28($23)
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

        lw      $2, 44($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2
        lw      $2, 52($2)
        add $0,  $0, $0
        sw      $2, 72($23)
        lw      $2, 44($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2
        lw      $3, 40($23)
        add $0,  $0, $0
        sw      $3, 52($2)
        lw      $2, 72($23)
        add $0,  $0, $0
        sw      $2, 40($23)
$L47:
        lw      $2, 44($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 44($23)
$L44:
        lw      $2, 44($23)
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
        lw      $2, 36($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 36($23)
$L43:
        lw      $2, 36($23)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_22
        addi    $2, $0, 0
        j       slt_end_22
        slt_set_one_22:
        addi    $2, $0, 1
        slt_end_22:
        bne     $2, $0, $L49
        add $0,  $0, $0

        sw      $0, 48($23)
        j       $L50
        add $0,  $0, $0

$L51:
        lw      $2, 48($23)
        add $0,  $0, $0
        sll     $2, $2, 2
        addi    $3, $23, 24
        add     $2, $3, $2
        lw      $2, 52($2)
        add $0,  $0, $0
        sw      $2, 64($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 64($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sw      $2, 68($23)
        lw      $2, 48($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 48($23)
$L50:
        lw      $2, 48($23)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_23
        addi    $2, $0, 0
        j       slt_end_23
        slt_set_one_23:
        addi    $2, $0, 1
        slt_end_23:
        bne     $2, $0, $L51
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4048
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4028($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4032
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        sw      $3, 4024($2)
        addi    $2, $23, 76
        add     $5,  $2, $0
        lw      $4, 28($23)
        jal     fly_towards_center
        add $0,  $0, $0

        addi    $2, $23, 76
        add     $5,  $2, $0
        lw      $4, 28($23)
        jal     avoid_others
        add $0,  $0, $0

        addi    $2, $23, 76
        add     $5,  $2, $0
        lw      $4, 28($23)
        jal     match_velocity
        add $0,  $0, $0

        jal     limit_speed
        add $0,  $0, $0

        lw      $4, 28($23)
        jal     keepWithinBounds
        add $0,  $0, $0


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 4028($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4048
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 4024($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4032
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4048
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4080
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4032
        add     $2, $4, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        add     $3, $3, $2

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $4, 28($23)
        add $0,  $0, $0
        sll     $4, $4, 2
        addi    $2, $2, 4064
        add     $2, $4, $2
        sw      $3, 0($2)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4080
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 22
        sw      $2, 52($23)

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $3, 28($23)
        add $0,  $0, $0
        sll     $3, $3, 2
        addi    $2, $2, 4064
        add     $2, $3, $2
        lw      $2, 0($2)
        add $0,  $0, $0
        sra     $2, $2, 22
        sw      $2, 56($23)
        lw      $2, 28($23)
        add $0,  $0, $0
        sw      $2, 60($23)
        lw      $26, 52($23)   # BPU interface
        lw      $28, 56($23)   # BPU interface
        lw      $27, 60($23)   # BPU interface
        # print
        add $0, $0, $0
        add $0, $0, $0
        addi    $27, $0, -1
        lw      $2, 28($23)
        add $0,  $0, $0
        addi    $2, $2, 1
        sw      $2, 28($23)
$L40:
        lw      $2, 28($23)
        add $0,  $0, $0

        addi    $20, $0, 4
        blt     $2, $20, slt_set_one_24
        addi    $2, $0, 0
        j       slt_end_24
        slt_set_one_24:
        addi    $2, $0, 1
        slt_end_24:
        bne     $2, $0, $L52
        add $0,  $0, $0

        add $0,  $0, $0
        add $0,  $0, $0
        add     $29,  $23, $0
        lw      $31, 108($29)
        lw      $23, 104($29)
        lw      $16, 100($29)
        addi    $29, $29, 112
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

        addi    $20, $0, 0

        sll     $20, $20, 16

        add     $2, $2, $20
        sw      $2, 24($23)
        j       $L54
        add $0,  $0, $0

$L55:
        jal     updateBoids
        add $0,  $0, $0

$L54:
        lw      $2, 24($23)
        add $0,  $0, $0
        bne     $2, $0, $L55
        add $0,  $0, $0

        add     $2,  $0, $0
        add     $29,  $23, $0
        lw      $31, 36($29)
        lw      $23, 32($29)
        addi    $29, $29, 40
        jr      $31
        add $0,  $0, $0
