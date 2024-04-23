$LFB0 = .
abs:
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        lw      $2,8($fp)
        nop
        bgez    $2,$L2
        nop

        lw      $2,8($fp)
        nop
        subu    $2,$0,$2
        b       $L3
        nop

$L2:
        lw      $2,8($fp)
$L3:
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

$LFB1 = .
log_2:
        addiu   $sp,$sp,-24
        sw      $fp,20($sp)
        move    $fp,$sp
        sw      $4,24($fp)
        sw      $0,8($fp)
        b       $L5
        nop

$L6:
        lw      $2,8($fp)
        nop
        addiu   $2,$2,1
        sw      $2,8($fp)
$L5:
        lw      $2,24($fp)
        nop
        sra     $2,$2,1
        sw      $2,24($fp)
        lw      $2,24($fp)
        nop
        bne     $2,$0,$L6
        nop

        lw      $2,8($fp)
        move    $sp,$fp
        lw      $fp,20($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop

xPos:
        .space  1024
yPos:
        .space  1024
xVel:
        .space  1024
yVel:
        .space  1024
active_x:
        .space  4
active_y:
        .space  4
$LFB2 = .
initBoids:
        addiu   $sp,$sp,-24
        sw      $fp,20($sp)
        move    $fp,$sp
$LBB2 = .
        sw      $0,8($fp)
        b       $L9
        nop

$L10:
        lw      $3,8($fp)
        li      $2,67108864       # 0x4000000
        addu    $3,$3,$2
        lui     $2,%hi(xPos)
        lw      $4,8($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$4,$2
        sw      $3,0($2)
        lw      $2,8($fp)
        nop
        sll     $3,$2,3
        li      $2,67108864       # 0x4000000
        addu    $3,$3,$2
        lui     $2,%hi(yPos)
        lw      $4,8($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$4,$2
        sw      $3,0($2)
        lui     $2,%hi(xVel)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xVel)
        addu    $2,$3,$2
        li      $3,20971520       # 0x1400000
        sw      $3,0($2)
        lui     $2,%hi(yVel)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yVel)
        addu    $2,$3,$2
        li      $3,20971520       # 0x1400000
        sw      $3,0($2)
        lw      $2,8($fp)
        nop
        addiu   $2,$2,1
        sw      $2,8($fp)
$L9:
        lw      $2,8($fp)
        nop
        slt     $2,$2,256
        bne     $2,$0,$L10
        nop

$LBE2 = .
        nop
        nop
        move    $sp,$fp
        lw      $fp,20($sp)
        addiu   $sp,$sp,24
        jr      $31
        nop

$LFB3 = .
keepWithinBounds:
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        lui     $2,%hi(xPos)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        li      $2,67108864       # 0x4000000
        slt     $2,$3,$2
        beq     $2,$0,$L12
        nop

        lui     $2,%hi(active_x)
        lw      $3,%lo(active_x)($2)
        li      $2,2097152              # 0x200000
        addu    $3,$3,$2
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        b       $L13
        nop

$L12:
        lui     $2,%hi(xPos)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        li      $2,1006632960                 # 0x3c000000
        ori     $2,$2,0x1
        slt     $2,$3,$2
        bne     $2,$0,$L13
        nop

        lui     $2,%hi(active_x)
        lw      $3,%lo(active_x)($2)
        li      $2,-2097152       # 0xffffffffffe00000
        addu    $3,$3,$2
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
$L13:
        lui     $2,%hi(yPos)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        li      $2,67108864       # 0x4000000
        slt     $2,$3,$2
        beq     $2,$0,$L14
        nop

        lui     $2,%hi(active_y)
        lw      $3,%lo(active_y)($2)
        li      $2,2097152              # 0x200000
        addu    $3,$3,$2
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        b       $L16
        nop

$L14:
        lui     $2,%hi(yPos)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        li      $2,939524096                        # 0x38000000
        ori     $2,$2,0x1
        slt     $2,$3,$2
        bne     $2,$0,$L16
        nop

        lui     $2,%hi(active_y)
        lw      $3,%lo(active_y)($2)
        li      $2,-2097152       # 0xffffffffffe00000
        addu    $3,$3,$2
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
$L16:
        nop
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

$LFB4 = .
distance:
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        sw      $5,12($fp)
        lui     $2,%hi(xPos)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(xPos)
        lw      $4,12($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$4,$2
        lw      $2,0($2)
        nop
        subu    $2,$3,$2
        bgez    $2,$L18
        nop

        subu    $2,$0,$2
$L18:
        move    $5,$2
        lui     $2,%hi(yPos)
        lw      $3,8($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(yPos)
        lw      $4,12($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$4,$2
        lw      $2,0($2)
        nop
        subu    $2,$3,$2
        bgez    $2,$L19
        nop

        subu    $2,$0,$2
$L19:
        addu    $2,$5,$2
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

$LFB5 = .
fly_towards_center:
        addiu   $sp,$sp,-32
        sw      $fp,28($sp)
        move    $fp,$sp
        sw      $4,32($fp)
        sw      $5,36($fp)
        sw      $0,8($fp)
        sw      $0,12($fp)
$LBB3 = .
        sw      $0,16($fp)
        b       $L22
        nop

$L23:
$LBB4 = .
        lw      $2,16($fp)
        nop
        sll     $2,$2,2
        lw      $3,36($fp)
        nop
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sw      $2,20($fp)
        lui     $2,%hi(xPos)
        lw      $3,20($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sra     $2,$2,2
        lw      $3,8($fp)
        nop
        addu    $2,$3,$2
        sw      $2,8($fp)
        lui     $2,%hi(yPos)
        lw      $3,20($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sra     $2,$2,2
        lw      $3,12($fp)
        nop
        addu    $2,$3,$2
        sw      $2,12($fp)
$LBE4 = .
        lw      $2,16($fp)
        nop
        addiu   $2,$2,1
        sw      $2,16($fp)
$L22:
        lw      $2,16($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L23
        nop

$LBE3 = .
        lui     $2,%hi(xPos)
        lw      $3,32($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        lw      $3,8($fp)
        nop
        subu    $2,$3,$2
        sra     $3,$2,6
        lui     $2,%hi(active_x)
        lw      $2,%lo(active_x)($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        lui     $2,%hi(yPos)
        lw      $3,32($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        lw      $3,12($fp)
        nop
        subu    $2,$3,$2
        sra     $3,$2,6
        lui     $2,%hi(active_y)
        lw      $2,%lo(active_y)($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        nop
        move    $sp,$fp
        lw      $fp,28($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop

$LFB6 = .
avoid_others:
        addiu   $sp,$sp,-48
        sw      $31,44($sp)
        sw      $fp,40($sp)
        move    $fp,$sp
        sw      $4,48($fp)
        sw      $5,52($fp)
        sw      $0,24($fp)
        sw      $0,28($fp)
$LBB5 = .
        sw      $0,32($fp)
        b       $L25
        nop

$L27:
$LBB6 = .
        lw      $2,32($fp)
        nop
        sll     $2,$2,2
        lw      $3,52($fp)
        nop
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sw      $2,36($fp)
        lw      $5,36($fp)
        lw      $4,48($fp)
        jal     distance
        nop

        move    $3,$2
        li      $2,20971520       # 0x1400000
        slt     $2,$3,$2
        beq     $2,$0,$L26
        nop

        lui     $2,%hi(xPos)
        lw      $3,48($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(xPos)
        lw      $4,36($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$4,$2
        lw      $2,0($2)
        nop
        subu    $2,$3,$2
        lw      $3,24($fp)
        nop
        addu    $2,$3,$2
        sw      $2,24($fp)
        lui     $2,%hi(yPos)
        lw      $3,48($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(yPos)
        lw      $4,36($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$4,$2
        lw      $2,0($2)
        nop
        subu    $2,$3,$2
        lw      $3,28($fp)
        nop
        addu    $2,$3,$2
        sw      $2,28($fp)
$L26:
$LBE6 = .
        lw      $2,32($fp)
        nop
        addiu   $2,$2,1
        sw      $2,32($fp)
$L25:
        lw      $2,32($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L27
        nop

$LBE5 = .
        lw      $2,24($fp)
        nop
        sra     $3,$2,4
        lui     $2,%hi(active_x)
        lw      $2,%lo(active_x)($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        lw      $2,28($fp)
        nop
        sra     $3,$2,4
        lui     $2,%hi(active_y)
        lw      $2,%lo(active_y)($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        nop
        move    $sp,$fp
        lw      $31,44($sp)
        lw      $fp,40($sp)
        addiu   $sp,$sp,48
        jr      $31
        nop

$LFB7 = .
match_velocity:
        addiu   $sp,$sp,-32
        sw      $fp,28($sp)
        move    $fp,$sp
        sw      $4,32($fp)
        sw      $5,36($fp)
        sw      $0,8($fp)
        sw      $0,12($fp)
$LBB7 = .
        sw      $0,16($fp)
        b       $L29
        nop

$L30:
$LBB8 = .
        lw      $2,16($fp)
        nop
        sll     $2,$2,2
        lw      $3,36($fp)
        nop
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sw      $2,20($fp)
        lui     $2,%hi(xVel)
        lw      $3,20($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xVel)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sra     $2,$2,2
        lw      $3,8($fp)
        nop
        addu    $2,$3,$2
        sw      $2,8($fp)
        lui     $2,%hi(yVel)
        lw      $3,20($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yVel)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sra     $2,$2,2
        lw      $3,12($fp)
        nop
        addu    $2,$3,$2
        sw      $2,12($fp)
$LBE8 = .
        lw      $2,16($fp)
        nop
        addiu   $2,$2,1
        sw      $2,16($fp)
$L29:
        lw      $2,16($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L30
        nop

$LBE7 = .
        lw      $2,8($fp)
        nop
        sra     $3,$2,2
        lui     $2,%hi(active_x)
        lw      $2,%lo(active_x)($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        lw      $2,12($fp)
        nop
        sra     $3,$2,2
        lui     $2,%hi(active_y)
        lw      $2,%lo(active_y)($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        nop
        move    $sp,$fp
        lw      $fp,28($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop

mouse_x:
        .space  4
mouse_y:
        .space  4
$LFB8 = .
scary:
        addiu   $sp,$sp,-48
        sw      $fp,44($sp)
        move    $fp,$sp
        sw      $4,48($fp)
        sw      $0,8($fp)
        sw      $0,12($fp)
        lui     $2,%hi(mouse_x)
        li      $3,1                        # 0x1
        sw      $3,%lo(mouse_x)($2)
        lui     $2,%hi(mouse_y)
        li      $3,1                        # 0x1
        sw      $3,%lo(mouse_y)($2)
        lui     $2,%hi(mouse_x)
        lw      $2,%lo(mouse_x)($2)
        nop
        sll     $2,$2,21
        sw      $2,16($fp)
        lui     $2,%hi(mouse_y)
        lw      $2,%lo(mouse_y)($2)
        nop
        sll     $2,$2,21
        sw      $2,20($fp)
        lui     $2,%hi(xPos)
        lw      $3,48($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lw      $2,16($fp)
        nop
        subu    $2,$3,$2
        bgez    $2,$L32
        nop

        subu    $2,$0,$2
$L32:
        sw      $2,24($fp)
        lui     $2,%hi(yPos)
        lw      $3,48($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lw      $2,20($fp)
        nop
        subu    $2,$3,$2
        bgez    $2,$L33
        nop

        subu    $2,$0,$2
$L33:
        sw      $2,28($fp)
        lw      $3,24($fp)
        lw      $2,28($fp)
        nop
        addu    $2,$3,$2
        sw      $2,32($fp)
        lw      $3,32($fp)
        li      $2,167772160                        # 0xa000000
        slt     $2,$3,$2
        beq     $2,$0,$L34
        nop

        lw      $2,24($fp)
        nop
        sw      $2,8($fp)
        lw      $2,28($fp)
        nop
        sw      $2,12($fp)
        lui     $2,%hi(xPos)
        lw      $3,48($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        lw      $3,16($fp)
        nop
        slt     $2,$3,$2
        beq     $2,$0,$L35
        nop

        lw      $2,8($fp)
        nop
        subu    $2,$0,$2
        sw      $2,8($fp)
$L35:
        lui     $2,%hi(yPos)
        lw      $3,48($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        lw      $3,20($fp)
        nop
        slt     $2,$3,$2
        beq     $2,$0,$L34
        nop

        lw      $2,12($fp)
        nop
        subu    $2,$0,$2
        sw      $2,12($fp)
$L34:
        lui     $2,%hi(active_x)
        lw      $3,%lo(active_x)($2)
        lw      $2,8($fp)
        nop
        sll     $2,$2,2
        subu    $3,$3,$2
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        lui     $2,%hi(active_y)
        lw      $3,%lo(active_y)($2)
        lw      $2,12($fp)
        nop
        sll     $2,$2,2
        subu    $3,$3,$2
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        nop
        move    $sp,$fp
        lw      $fp,44($sp)
        addiu   $sp,$sp,48
        jr      $31
        nop

$LFB9 = .
limit_speed:
        addiu   $sp,$sp,-48
        sw      $31,44($sp)
        sw      $fp,40($sp)
        move    $fp,$sp
        lui     $2,%hi(active_x)
        lw      $2,%lo(active_x)($2)
        nop
        bgez    $2,$L37
        nop

        subu    $2,$0,$2
$L37:
        move    $3,$2
        lui     $2,%hi(active_y)
        lw      $2,%lo(active_y)($2)
        nop
        bgez    $2,$L38
        nop

        subu    $2,$0,$2
$L38:
        addu    $2,$3,$2
        sw      $2,28($fp)
        lw      $4,28($fp)
        jal     log_2
        nop

        sw      $2,32($fp)
        lw      $2,32($fp)
        nop
        addiu   $2,$2,-23
        sw      $2,36($fp)
        lw      $2,36($fp)
        nop
        bltz    $2,$L43
        nop

$LBB9 = .
        sw      $0,24($fp)
        b       $L41
        nop

$L42:
        lui     $2,%hi(active_x)
        lw      $2,%lo(active_x)($2)
        nop
        sra     $3,$2,1
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        lui     $2,%hi(active_y)
        lw      $2,%lo(active_y)($2)
        nop
        sra     $3,$2,1
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
$L41:
        lw      $3,24($fp)
        lw      $2,36($fp)
        nop
        slt     $2,$3,$2
        bne     $2,$0,$L42
        nop

        b       $L36
        nop

$L43:
$LBE9 = .
        nop
$L36:
        move    $sp,$fp
        lw      $31,44($sp)
        lw      $fp,40($sp)
        addiu   $sp,$sp,48
        jr      $31
        nop

$LFB10 = .
updateBoids:
        addiu   $sp,$sp,-96
        sw      $31,92($sp)
        sw      $fp,88($sp)
        sw      $16,84($sp)
        move    $fp,$sp
        sw      $0,24($fp)
$LBB10 = .
        sw      $0,28($fp)
        b       $L45
        nop

$L55:
$LBB11 = .
$LBB12 = .
        sw      $0,32($fp)
        b       $L46
        nop

$L47:
        lw      $2,32($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        li      $3,-1                 # 0xffffffffffffffff
        sw      $3,40($2)
        lw      $2,32($fp)
        nop
        addiu   $2,$2,1
        sw      $2,32($fp)
$L46:
        lw      $2,32($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L47
        nop

$LBE12 = .
$LBB13 = .
        sw      $0,36($fp)
        b       $L48
        nop

$L54:
$LBB14 = .
        lw      $2,36($fp)
        nop
        sw      $2,40($fp)
$LBB15 = .
        sw      $0,44($fp)
        b       $L49
        nop

$L53:
        lw      $2,44($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $3,40($2)
        li      $2,-1                 # 0xffffffffffffffff
        bne     $3,$2,$L50
        nop

        lw      $2,44($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $3,40($fp)
        nop
        sw      $3,40($2)
        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
        b       $L51
        nop

$L50:
        lw      $5,40($fp)
        lw      $4,28($fp)
        jal     distance
        nop

        move    $16,$2
        lw      $2,44($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $2,40($2)
        nop
        move    $5,$2
        lw      $4,28($fp)
        jal     distance
        nop

        slt     $2,$16,$2
        beq     $2,$0,$L52
        nop

$LBB16 = .
        lw      $2,44($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $2,40($2)
        nop
        sw      $2,60($fp)
        lw      $2,44($fp)
        nop
        sll     $2,$2,2
        addiu   $3,$fp,24
        addu    $2,$3,$2
        lw      $3,40($fp)
        nop
        sw      $3,40($2)
        lw      $2,60($fp)
        nop
        sw      $2,40($fp)
$L52:
$LBE16 = .
        lw      $2,44($fp)
        nop
        addiu   $2,$2,1
        sw      $2,44($fp)
$L49:
        lw      $2,44($fp)
        nop
        slt     $2,$2,4
        bne     $2,$0,$L53
        nop

$L51:
$LBE15 = .
$LBE14 = .
        lw      $2,36($fp)
        nop
        addiu   $2,$2,1
        sw      $2,36($fp)
$L48:
        lw      $2,36($fp)
        nop
        slt     $2,$2,256
        bne     $2,$0,$L54
        nop

$LBE13 = .
        lui     $2,%hi(xVel)
        lw      $3,28($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xVel)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(active_x)
        sw      $3,%lo(active_x)($2)
        lui     $2,%hi(yVel)
        lw      $3,28($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yVel)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(active_y)
        sw      $3,%lo(active_y)($2)
        addiu   $2,$fp,64
        move    $5,$2
        lw      $4,28($fp)
        jal     fly_towards_center
        nop

        addiu   $2,$fp,64
        move    $5,$2
        lw      $4,28($fp)
        jal     avoid_others
        nop

        addiu   $2,$fp,64
        move    $5,$2
        lw      $4,28($fp)
        jal     match_velocity
        nop

        lw      $4,28($fp)
        jal     scary
        nop

        jal     limit_speed
        nop

        lw      $4,28($fp)
        jal     keepWithinBounds
        nop

        lui     $2,%hi(active_x)
        lw      $3,%lo(active_x)($2)
        lui     $2,%hi(xVel)
        lw      $4,28($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xVel)
        addu    $2,$4,$2
        sw      $3,0($2)
        lui     $2,%hi(active_y)
        lw      $3,%lo(active_y)($2)
        lui     $2,%hi(yVel)
        lw      $4,28($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yVel)
        addu    $2,$4,$2
        sw      $3,0($2)
        lui     $2,%hi(xPos)
        lw      $3,28($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(xVel)
        lw      $4,28($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xVel)
        addu    $2,$4,$2
        lw      $2,0($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(xPos)
        lw      $4,28($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$4,$2
        sw      $3,0($2)
        lui     $2,%hi(yPos)
        lw      $3,28($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $3,0($2)
        lui     $2,%hi(yVel)
        lw      $4,28($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yVel)
        addu    $2,$4,$2
        lw      $2,0($2)
        nop
        addu    $3,$3,$2
        lui     $2,%hi(yPos)
        lw      $4,28($fp)
        nop
        sll     $4,$4,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$4,$2
        sw      $3,0($2)
        lui     $2,%hi(xPos)
        lw      $3,28($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(xPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sra     $2,$2,21
        sw      $2,48($fp)
        lui     $2,%hi(yPos)
        lw      $3,28($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(yPos)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sra     $2,$2,21
        sw      $2,52($fp)
        lw      $2,28($fp)
        nop
        sw      $2,56($fp)
$LBE11 = .
        lw      $2,28($fp)
        nop
        addiu   $2,$2,1
        sw      $2,28($fp)
$L45:
        lw      $2,28($fp)
        nop
        slt     $2,$2,256
        bne     $2,$0,$L55
        nop

$LBE10 = .
        nop
        nop
        move    $sp,$fp
        lw      $31,92($sp)
        lw      $fp,88($sp)
        lw      $16,84($sp)
        addiu   $sp,$sp,96
        jr      $31
        nop

$LFB11 = .
main:
        addiu   $sp,$sp,-40
        sw      $31,36($sp)
        sw      $fp,32($sp)
        move    $fp,$sp
        jal     initBoids
        nop

        li      $2,1                        # 0x1
        sw      $2,24($fp)
        b       $L57
        nop

$L58:
        jal     updateBoids
        nop

$L57:
        lw      $2,24($fp)
        nop
        bne     $2,$0,$L58
        nop

        move    $2,$0
        move    $sp,$fp
        lw      $31,36($sp)
        lw      $fp,32($sp)
        addiu   $sp,$sp,40
        jr      $31
        nop