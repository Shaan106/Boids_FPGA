addi    $29, $29, 4096
addi    $29, $29, -4
addi    $29, $29, -4
addi    $29, $29, -4
addi    $29, $29, -4
addi    $29, $29, -256
addi    $29, $29, -256
addi    $29, $29, -256
addi    $29, $29, -256
jal     main
abs:
        blt     $4, $0, $L4
        add     $2,  $4, $0

        jr      $31
        add $0,  $0, $0

$L4:
        jr      $31
        sub     $2, $0, $4

log_2:
        sra     $4, $4, 1

        bne     $4, $0, beq_after_0
        j       $L13
        beq_after_0:
        add     $2,  $0, $0

$L9:
        sra     $4, $4, 1
        bne     $4, $0, $L9
        addi    $2, $2, 1

$L13:
        jr      $31
        add $0,  $0, $0

initBoids:

        addi    $7, $0, 0

        addi    $28, $0, 1024

        sll     $28, $28, 16

        add     $7, $7, $28

        addi    $6, $0, 0
        sll     $6, $6, 16

        addi    $5, $0, 0
        sll     $5, $5, 16

        addi    $4, $0, 0
        sll     $4, $4, 16

        addi    $3, $0, 0
        sll     $3, $3, 16
        addi    $6, $6, 3056
        addi    $5, $5, 3312
        addi    $4, $4, 3568
        addi    $3, $3, 3824

        addi    $2, $0, 0

        addi    $28, $0, 1024

        sll     $28, $28, 16

        add     $2, $2, $28

        addi    $8, $0, 0

        addi    $28, $0, 320

        sll     $28, $28, 16

        add     $8, $8, $28
        addi    $9, $7, 64
$L15:
        sw      $2, 0($6)
        addi    $2, $2, 1
        sw      $7, 0($5)
        sw      $8, 0($4)
        sw      $8, 0($3)
        addi    $6, $6, 4
        addi    $7, $7, 8
        addi    $5, $5, 4
        addi    $4, $4, 4
        bne     $2, $9, $L15
        addi    $3, $3, 4

        jr      $31
        add $0,  $0, $0

keepWithinBounds:

        addi    $2, $0, 0
        sll     $2, $2, 16
        sll     $4, $4, 2
        addi    $2, $2, 3056
        add     $2, $2, $4
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $28, $0, 1024

        sll     $28, $28, 16

        add     $2, $2, $28

        add    $28, $0, $2
        blt     $3, $28, slt_set_one_21
        addi    $2, $0, 0
        j       slt_end_21
        slt_set_one_21:
        addi    $2, $0, 1
        slt_end_21:

        bne     $2, $0, beq_after_1
        j       $L18
        beq_after_1:

        addi    $2, $0, 0

        addi    $28, $0, 15360

        sll     $28, $28, 16

        add     $2, $2, $28


        addi    $3, $0, 0
        sll     $3, $3, 16
        lw      $2, 4080($3)

        addi    $5, $0, 0

        addi    $28, $0, 32

        sll     $28, $28, 16

        add     $5, $5, $28
        add     $2, $2, $5
        sw      $2, 4080($3)

        addi    $2, $0, 0
        sll     $2, $2, 16
$L24:
        addi    $2, $2, 3312
        add     $2, $2, $4
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $28, $0, 1024

        sll     $28, $28, 16

        add     $2, $2, $28

        add    $28, $0, $2
        blt     $3, $28, slt_set_one_22
        addi    $2, $0, 0
        j       slt_end_22
        slt_set_one_22:
        addi    $2, $0, 1
        slt_end_22:

        bne     $2, $0, beq_after_2
        j       $L23
        beq_after_2:

        addi    $2, $0, 0

        addi    $28, $0, 14336

        sll     $28, $28, 16

        add     $2, $2, $28

$L22:

        addi    $3, $0, 0
        sll     $3, $3, 16
        lw      $2, 4084($3)

        addi    $4, $0, 0

        addi    $28, $0, 32

        sll     $28, $28, 16

        add     $4, $4, $28
        add     $2, $2, $4
        jr      $31
        sw      $2, 4084($3)

$L18:
        addi    $2, $2, 1

        add    $28, $0, $2
        blt     $3, $28, slt_set_one_23
        addi    $3, $0, 0
        j       slt_end_23
        slt_set_one_23:
        addi    $3, $0, 1
        slt_end_23:
        bne     $3, $0, $L24

        addi    $2, $0, 0
        sll     $2, $2, 16


        addi    $3, $0, 0
        sll     $3, $3, 16
        lw      $2, 4080($3)

        addi    $5, $0, 0

        addi    $28, $0, -32

        sll     $28, $28, 16

        add     $5, $5, $28
        add     $2, $2, $5
        sw      $2, 4080($3)

        addi    $2, $0, 0
        sll     $2, $2, 16
        addi    $2, $2, 3312
        add     $2, $2, $4
        lw      $3, 0($2)

        addi    $2, $0, 0

        addi    $28, $0, 1024

        sll     $28, $28, 16

        add     $2, $2, $28

        add    $28, $0, $2
        blt     $3, $28, slt_set_one_24
        addi    $2, $0, 0
        j       slt_end_24
        slt_set_one_24:
        addi    $2, $0, 1
        slt_end_24:
        bne     $2, $0, $L22

        addi    $2, $0, 0

        addi    $28, $0, 14336

        sll     $28, $28, 16

        add     $2, $2, $28

$L23:
        addi    $2, $2, 1

        add    $28, $0, $2
        blt     $3, $28, slt_set_one_25
        addi    $3, $0, 0
        j       slt_end_25
        slt_set_one_25:
        addi    $3, $0, 1
        slt_end_25:
        bne     $3, $0, $L25

        addi    $3, $0, 0
        sll     $3, $3, 16

        lw      $2, 4084($3)

        addi    $4, $0, 0

        addi    $28, $0, -32

        sll     $28, $28, 16

        add     $4, $4, $28
        add     $2, $2, $4
        sw      $2, 4084($3)
$L25:
        jr      $31
        add $0,  $0, $0

distance:

        addi    $2, $0, 0
        sll     $2, $2, 16
        addi    $2, $2, 3056
        sll     $4, $4, 2
        sll     $5, $5, 2
        add     $3, $2, $4
        add     $2, $2, $5
        lw      $6, 0($3)
        lw      $2, 0($2)
        add $0,  $0, $0
        sub     $6, $6, $2

        blt     $6, $0, bgez_after_3
        j       $L29
        bgez_after_3:

        addi    $3, $0, 0
        sll     $3, $3, 16

        sub     $6, $0, $6
$L29:
        addi    $3, $3, 3312
        add     $4, $3, $4
        add     $3, $3, $5
        lw      $2, 0($4)
        lw      $3, 0($3)
        add $0,  $0, $0
        sub     $2, $2, $3

        blt     $2, $0, bgez_after_4
        j       $L28
        bgez_after_4:
        add $0,  $0, $0

        sub     $2, $0, $2
$L28:
        jr      $31
        add     $2, $6, $2

fly_towards_center:

        addi    $9, $0, 0
        sll     $9, $9, 16

        addi    $8, $0, 0
        sll     $8, $8, 16
        addi    $10, $5, 16
        add     $3,  $0, $0
        add     $6,  $0, $0
        addi    $9, $9, 3056
        addi    $8, $8, 3312
$L31:
        lw      $2, 0($5)
        addi    $5, $5, 4
        sll     $2, $2, 2
        add     $7, $9, $2
        add     $2, $8, $2
        lw      $7, 0($7)
        lw      $2, 0($2)
        sra     $7, $7, 2
        sra     $2, $2, 2
        add     $6, $6, $7
        bne     $10, $5, $L31
        add     $3, $3, $2

        sll     $4, $4, 2
        add     $9, $9, $4
        add     $8, $8, $4
        lw      $9, 0($9)
        lw      $8, 0($8)

        addi    $4, $0, 0
        sll     $4, $4, 16

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $7, 4080($4)
        lw      $5, 4084($2)
        sub     $6, $6, $9
        sub     $3, $3, $8
        sra     $6, $6, 6
        sra     $3, $3, 6
        add     $6, $6, $7
        add     $3, $3, $5
        sw      $6, 4080($4)
        jr      $31
        sw      $3, 4084($2)

avoid_others:

        addi    $10, $0, 0
        sll     $10, $10, 16

        addi    $9, $0, 0
        sll     $9, $9, 16
        sll     $4, $4, 2
        addi    $10, $10, 3056
        addi    $9, $9, 3312
        add     $2, $10, $4
        add     $4, $9, $4
        lw      $14, 0($2)
        lw      $13, 0($4)
        addi    $12, $5, 16
        add     $6,  $0, $0
        add     $7,  $0, $0

        addi    $11, $0, 0

        addi    $28, $0, 320

        sll     $28, $28, 16

        add     $11, $11, $28
$L37:
        lw      $2, 0($5)
        addi    $5, $5, 4
        sll     $2, $2, 2
        add     $3, $9, $2
        lw      $3, 0($3)
        add     $2, $10, $2
        lw      $4, 0($2)
        sub     $3, $13, $3
        sub     $4, $14, $4

        blt     $3, $0, bgez_after_5
        j       $L35
        bgez_after_5:
        add     $2,  $3, $0

        sub     $2, $0, $3
$L35:

        blt     $4, $0, bgez_after_6
        j       $L36
        bgez_after_6:
        add     $8,  $4, $0

        sub     $8, $0, $4
$L36:
        add     $2, $2, $8

        add    $28, $0, $11
        blt     $2, $28, slt_set_one_26
        addi    $2, $0, 0
        j       slt_end_26
        slt_set_one_26:
        addi    $2, $0, 1
        slt_end_26:

        bne     $2, $0, beq_after_7
        j       $L34
        beq_after_7:
        add $0,  $0, $0

        add     $7, $7, $4
        add     $6, $6, $3
$L34:
        bne     $12, $5, $L37

        addi    $3, $0, 0
        sll     $3, $3, 16


        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $5, 4080($3)
        lw      $4, 4084($2)
        sra     $7, $7, 4
        sra     $6, $6, 4
        add     $7, $7, $5
        add     $6, $6, $4
        sw      $7, 4080($3)
        jr      $31
        sw      $6, 4084($2)

match_velocity:

        addi    $8, $0, 0
        sll     $8, $8, 16

        addi    $7, $0, 0
        sll     $7, $7, 16
        addi    $9, $5, 16
        add     $4,  $0, $0
        add     $6,  $0, $0
        addi    $8, $8, 3568
        addi    $7, $7, 3824
$L40:
        lw      $2, 0($5)
        addi    $5, $5, 4
        sll     $2, $2, 2
        add     $3, $8, $2
        add     $2, $7, $2
        lw      $3, 0($3)
        lw      $2, 0($2)
        sra     $3, $3, 2
        sra     $2, $2, 2
        add     $6, $6, $3
        bne     $9, $5, $L40
        add     $4, $4, $2


        addi    $3, $0, 0
        sll     $3, $3, 16

        addi    $2, $0, 0
        sll     $2, $2, 16
        lw      $7, 4080($3)
        lw      $5, 4084($2)
        sra     $6, $6, 2
        sra     $4, $4, 2
        add     $6, $6, $7
        add     $4, $4, $5
        sw      $6, 4080($3)
        jr      $31
        sw      $4, 4084($2)

scary:

        addi    $2, $0, 0
        sll     $2, $2, 16
        sll     $4, $4, 2
        addi    $2, $2, 3056
        add     $2, $2, $4
        lw      $7, 0($2)

        addi    $5, $0, 0
        sll     $5, $5, 16

        addi    $2, $0, 1

        addi    $28, $0, 0

        sll     $28, $28, 16

        add     $2, $2, $28

        addi    $3, $0, 0

        addi    $28, $0, -32

        sll     $28, $28, 16

        add     $3, $3, $28
        sw      $2, 4088($5)
        add     $3, $7, $3

        addi    $5, $0, 0
        sll     $5, $5, 16

        blt     $3, $0, bgez_after_8
        j       $L43
        bgez_after_8:
        sw      $2, 4092($5)

        sub     $3, $0, $3
$L43:

        addi    $2, $0, 0
        sll     $2, $2, 16
        addi    $2, $2, 3312
        add     $2, $2, $4
        lw      $6, 0($2)

        addi    $2, $0, 0

        addi    $28, $0, -32

        sll     $28, $28, 16

        add     $2, $2, $28
        add     $2, $6, $2

        blt     $2, $0, bgez_after_9
        j       $L44
        bgez_after_9:
        add     $5,  $3, $0

        sub     $2, $0, $2
$L44:
        add     $4, $3, $2

        addi    $8, $0, 0

        addi    $28, $0, 2560

        sll     $28, $28, 16

        add     $8, $8, $28

        add    $28, $0, $8
        blt     $4, $28, slt_set_one_27
        addi    $4, $0, 0
        j       slt_end_27
        slt_set_one_27:
        addi    $4, $0, 1
        slt_end_27:

        bne     $4, $0, beq_after_10
        j       $L48
        beq_after_10:

        addi    $4, $0, 0

        addi    $28, $0, 32

        sll     $28, $28, 16

        add     $4, $4, $28

        addi    $4, $4, 1

        add    $28, $0, $4
        blt     $7, $28, slt_set_one_28
        addi    $7, $0, 0
        j       slt_end_28
        slt_set_one_28:
        addi    $7, $0, 1
        slt_end_28:
        bne     $7, $0, $L46
        add $0,  $0, $0

        sub     $5, $0, $3
$L46:

        addi    $3, $0, 0

        addi    $28, $0, 32

        sll     $28, $28, 16

        add     $3, $3, $28
        addi    $3, $3, 1

        add    $28, $0, $3
        blt     $6, $28, slt_set_one_29
        addi    $6, $0, 0
        j       slt_end_29
        slt_set_one_29:
        addi    $6, $0, 1
        slt_end_29:

        bne     $6, $0, beq_after_11
        j       $L47
        beq_after_11:
        sll     $5, $5, 2

$L49:

        addi    $7, $0, 0
        sll     $7, $7, 16

        addi    $6, $0, 0
        sll     $6, $6, 16
        lw      $4, 4080($7)
        lw      $3, 4084($6)
        sll     $2, $2, 2
        sub     $4, $4, $5
        sub     $2, $3, $2
        sw      $4, 4080($7)
        jr      $31
        sw      $2, 4084($6)

$L48:

        addi    $7, $0, 0
        sll     $7, $7, 16

        addi    $6, $0, 0
        sll     $6, $6, 16
        lw      $4, 4080($7)
        lw      $3, 4084($6)
        add     $5,  $0, $0
        add     $2,  $0, $0
        sub     $4, $4, $5
        sub     $2, $3, $2
        sw      $4, 4080($7)
        jr      $31
        sw      $2, 4084($6)

$L47:
        j       $L49
        sub     $2, $0, $2

limit_speed:

        addi    $8, $0, 0
        sll     $8, $8, 16
        lw      $6, 4080($8)

        addi    $7, $0, 0
        sll     $7, $7, 16
        lw      $5, 4084($7)

        blt     $6, $0, bgez_after_12
        j       $L51
        bgez_after_12:
        add     $2,  $6, $0

        sub     $2, $0, $6
$L51:

        blt     $5, $0, bgez_after_13
        j       $L52
        bgez_after_13:
        add     $3,  $5, $0

        sub     $3, $0, $5
$L52:
        add     $2, $2, $3
        sra     $2, $2, 1

        bne     $2, $0, beq_after_14
        j       $L61
        beq_after_14:
        add     $3,  $0, $0

$L54:
        sra     $2, $2, 1
        add     $4,  $3, $0
        bne     $2, $0, $L54
        addi    $3, $3, 1


        addi    $28, $0, 23
        blt     $4, $28, slt_set_one_30
        addi    $3, $0, 0
        j       slt_end_30
        slt_set_one_30:
        addi    $3, $0, 1
        slt_end_30:
        bne     $3, $0, $L61
        addi    $4, $4, -22

$L55:
        addi    $2, $2, 1
        sra     $6, $6, 1
        bne     $2, $4, $L55
        sra     $5, $5, 1

        sw      $6, 4080($8)
        sw      $5, 4084($7)
$L61:
        jr      $31
        add $0,  $0, $0

updateBoids:
        addi    $29, $29, -88

        addi    $25, $0, 0
        sll     $25, $25, 16

        addi    $15, $0, 0
        sll     $15, $15, 16
        addi    $25, $25, 3056
        sw      $23, 76($29)
        sw      $22, 72($29)
        addi    $15, $15, 3312

        addi    $23, $0, 0
        sll     $23, $23, 16

        addi    $22, $0, 0
        sll     $22, $22, 16
        sw      $30, 80($29)
        sw      $21, 68($29)
        sw      $20, 64($29)
        sw      $19, 60($29)
        sw      $18, 56($29)
        sw      $17, 52($29)
        sw      $31, 84($29)
        sw      $16, 48($29)
        addi    $23, $23, 3568
        addi    $22, $22, 3824
        add     $19,  $25, $0
        add     $18,  $15, $0
        add     $24,  $0, $0

        addi    $8, $0, 0
        sll     $8, $8, 16

        addi    $30, $0, 0
        sll     $30, $30, 16

        addi    $17, $0, 65535

        addi    $28, $0, -1

        sll     $28, $28, 16

        add     $17, $17, $28

        addi    $20, $0, 4

        addi    $28, $0, 0

        sll     $28, $28, 16

        add     $20, $20, $28

        addi    $21, $0, 64

        addi    $28, $0, 0

        sll     $28, $28, 16

        add     $21, $21, $28
$L63:
        sw      $17, 24($29)
        sw      $17, 28($29)
        sw      $17, 32($29)
        sw      $17, 36($29)
        add     $16,  $0, $0
$L74:
        addi    $7, $29, 24
$L79:
        add     $11,  $16, $0
        add     $10,  $0, $0
$L71:
        lw      $9, 0($7)
        add $0,  $0, $0

        bne     $9, $17, beq_after_15
        j       $L77
        beq_after_15:
        sll     $4, $9, 2

        add     $3, $25, $4
        lw      $5, 0($3)
        lw      $2, 0($19)
        lw      $3, 0($18)
        sub     $5, $2, $5

        blt     $5, $0, bgez_after_16
        j       $L67
        bgez_after_16:
        add $0,  $0, $0

        sub     $5, $0, $5
$L67:
        add     $4, $15, $4
        lw      $4, 0($4)
        add $0,  $0, $0
        sub     $4, $3, $4

        blt     $4, $0, bgez_after_17
        j       $L78
        bgez_after_17:
        sll     $6, $11, 2

        sub     $4, $0, $4
$L78:
        add     $12, $25, $6
        lw      $12, 0($12)
        add $0,  $0, $0
        sub     $2, $2, $12

        blt     $2, $0, bgez_after_18
        j       $L69
        bgez_after_18:
        add     $5, $5, $4

        sub     $2, $0, $2
$L69:
        add     $6, $15, $6
        lw      $4, 0($6)
        add $0,  $0, $0
        sub     $3, $3, $4

        blt     $3, $0, bgez_after_19
        j       $L70
        bgez_after_19:
        add $0,  $0, $0

        sub     $3, $0, $3
$L70:
        add     $2, $2, $3

        add    $28, $0, $5
        blt     $2, $28, slt_set_one_31
        addi    $5, $0, 0
        j       slt_end_31
        slt_set_one_31:
        addi    $5, $0, 1
        slt_end_31:

        bne     $5, $0, beq_after_20
        j       $L66
        beq_after_20:
        add $0,  $0, $0

        sw      $11, 0($7)
        add     $11,  $9, $0
$L66:
        addi    $10, $10, 1
        bne     $10, $20, $L71
        addi    $7, $7, 4

        addi    $16, $16, 1
        bne     $16, $21, $L79
        addi    $7, $29, 24

$L72:
        lw      $3, 0($23)
        lw      $2, 0($22)
        add     $4,  $24, $0
        addi    $5, $29, 24
        sw      $3, 4080($8)
        sw      $2, 4084($30)
        jal     fly_towards_center
        sw      $8, 40($29)

        add     $4,  $24, $0
        jal     avoid_others
        addi    $5, $29, 24

        addi    $5, $29, 24
        jal     match_velocity
        add     $4,  $24, $0

        jal     scary
        add     $4,  $24, $0

        jal     limit_speed
        add $0,  $0, $0

        jal     keepWithinBounds
        add     $4,  $24, $0

        lw      $8, 40($29)
        lw      $3, 0($19)
        lw      $2, 0($18)
        lw      $5, 4080($8)
        lw      $4, 4084($30)
        add     $3, $3, $5
        add     $2, $2, $4
        addi    $24, $24, 1
        sw      $5, 0($23)
        sw      $4, 0($22)
        sw      $3, 0($19)
        sw      $2, 0($18)
        addi    $23, $23, 4
        addi    $22, $22, 4
        addi    $19, $19, 4
        bne     $24, $16, $L63
        addi    $18, $18, 4

        lw      $31, 84($29)
        lw      $30, 80($29)
        lw      $23, 76($29)
        lw      $22, 72($29)
        lw      $21, 68($29)
        lw      $20, 64($29)
        lw      $19, 60($29)
        lw      $18, 56($29)
        lw      $17, 52($29)
        lw      $16, 48($29)
        jr      $31
        addi    $29, $29, 88

$L77:
        sll     $10, $10, 2
        addi    $2, $29, 24
        add     $10, $2, $10
        addi    $16, $16, 1
        bne     $16, $21, $L74
        sw      $11, 0($10)
        # print
        j       $L72
        add $0,  $0, $0

main:
        addi    $29, $29, -32
        sw      $31, 28($29)
        jal     initBoids
        add $0,  $0, $0

$L81:
        jal     updateBoids
        add $0,  $0, $0

        j       $L81
        add $0,  $0, $0

