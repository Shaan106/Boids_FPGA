xPos:
        .space  16
yPos:
        .space  16
xVel:
        .space  16
yVel:
        .space  16
active_x:
        .space  4
active_y:
        .space  4
$LFB0 = .
updateBoids:
        addiu   $sp,$sp,-24
        sw      $fp,20($sp)
        move    $fp,$sp
$LBB2 = .
        sw      $0,8($fp)
        b       $L2
        nop

$L3:
        lw      $2,8($fp)
        nop
        sll     $3,$2,2
        lui     $2,%hi(xPos)
        lw      $4,8($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$4,$2
        sw      $3,0($2)
        lw      $2,8($fp)
        nop
        sll     $3,$2,2
        lui     $2,%hi(yPos)
        lw      $4,8($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$4,$2
        sw      $3,0($2)
        lw      $2,8($fp)
        nop
        addiu   $2,$2,1
        sw      $2,8($fp)
$L2:
        lw      $2,8($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L3
        nop

$LBE2 = .
        nop
        nop
        move    $sp,$fp
        lw      $fp,20($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop

$LFB1 = .
main:
        addiu   $sp,$sp,-56
        sw      $31,52($sp)
        sw      $fp,48($sp)
        move    $fp,$sp
        li      $2,1                        # 0x1
        sw      $2,28($fp)
        b       $L5
        nop

$L8:
        jal     updateBoids
        nop

$LBB3 = .
        sw      $0,24($fp)
        b       $L6
        nop

$L7:
$LBB4 = .
        lui     $2,%hi(xPos)
        lw      $3,24($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sw      $2,32($fp)
        lui     $2,%hi(yPos)
        lw      $3,24($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sw      $2,36($fp)
        lw      $2,24($fp)
        nop
        sw      $2,40($fp)
$LBE4 = .
        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
$L6:
        lw      $2,24($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L7
        nop

$L5:
$LBE3 = .
        lw      $2,28($fp)
        nop
        bne     $2,$0,$L8
        nop

        nop
        nop
        move    $sp,$fp
        lw      $31,52($sp)
        lw      $fp,48($sp)
        addiu   $sp,$sp,56
        jr      $31
        nop