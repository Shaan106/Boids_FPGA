addi    $29, $29, 2047
jal     main
main:
        addi    $29, $29, -32
        sw      $23, 28($29)
        add     $23,  $29, $0
        sw      $0, 8($23)
        j       $L2
        add $0,  $0, $0

$L3:
        lw      $2, 8($23)
        add $0,  $0, $0
        sll     $2, $2, 5
        sw      $2, 12($23)
        lw      $2, 8($23)
        add $0,  $0, $0
        sll     $2, $2, 5
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

        add     $2,  $0, $0
        add     $29,  $23, $0
        lw      $23, 28($29)
        addi    $29, $29, 32
        j       main
        add $0,  $0, $0
