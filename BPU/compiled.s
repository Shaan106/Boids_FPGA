$LVL0 = .
$LFB0 = .
abs:
        bltz    $4,$L4
        move    $2,$4

        jr      $31
        nop

$L4:
        jr      $31
        subu    $2,$0,$4

$LVL1 = .
$LFB1 = .
log_2:
        sra     $4,$4,1
$LVL2 = .
        beq     $4,$0,$L13
        move    $2,$0

$LVL3 = .
$L9:
        sra     $4,$4,1
$LVL4 = .
        bne     $4,$0,$L9
        addiu   $2,$2,1

$L13:
        jr      $31
        nop

$LFB2 = .
initBoids:
$LBB5 = .
$LVL5 = .
$LBE5 = .
        li      $7,67108864       # 0x4000000
        lui     $6,%hi(xPos)
        lui     $5,%hi(yPos)
        lui     $4,%hi(xVel)
        lui     $3,%hi(yVel)
        addiu   $6,$6,%lo(xPos)
        addiu   $5,$5,%lo(yPos)
        addiu   $4,$4,%lo(xVel)
        addiu   $3,$3,%lo(yVel)
        li      $2,67108864       # 0x4000000
$LBB6 = .
        li      $8,20971520       # 0x1400000
        addiu   $9,$7,64
$LVL6 = .
$L15:
        sw      $2,0($6)
        addiu   $2,$2,1
$LVL7 = .
        sw      $7,0($5)
        sw      $8,0($4)
        sw      $8,0($3)
$LVL8 = .
        addiu   $6,$6,4
        addiu   $7,$7,8
        addiu   $5,$5,4
        addiu   $4,$4,4
        bne     $2,$9,$L15
        addiu   $3,$3,4

$LBE6 = .
        jr      $31
        nop

$LVL9 = .
$LFB3 = .
keepWithinBounds:
        lui     $2,%hi(xPos)
        sll     $4,$4,2
$LVL10 = .
        addiu   $2,$2,%lo(xPos)
        addu    $2,$2,$4
        lw      $3,0($2)
        li      $2,67108864       # 0x4000000
        slt     $2,$3,$2
        beq     $2,$0,$L18
        li      $2,1006632960                 # 0x3c000000

        lui     $3,%hi(active_x)
        lw      $2,%lo(active_x)($3)
        li      $5,2097152              # 0x200000
        addu    $2,$2,$5
        sw      $2,%lo(active_x)($3)
        lui     $2,%hi(yPos)
$L24:
        addiu   $2,$2,%lo(yPos)
        addu    $2,$2,$4
        lw      $3,0($2)
        li      $2,67108864       # 0x4000000
        slt     $2,$3,$2
        beq     $2,$0,$L23
        li      $2,939524096                        # 0x38000000

$L22:
        lui     $3,%hi(active_y)
        lw      $2,%lo(active_y)($3)
        li      $4,2097152              # 0x200000
        addu    $2,$2,$4
        jr      $31
        sw      $2,%lo(active_y)($3)

$L18:
        addiu   $2,$2,1
        slt     $3,$3,$2
        bne     $3,$0,$L24
        lui     $2,%hi(yPos)

        lui     $3,%hi(active_x)
        lw      $2,%lo(active_x)($3)
        li      $5,-2097152       # 0xffffffffffe00000
        addu    $2,$2,$5
        sw      $2,%lo(active_x)($3)
        lui     $2,%hi(yPos)
        addiu   $2,$2,%lo(yPos)
        addu    $2,$2,$4
        lw      $3,0($2)
        li      $2,67108864       # 0x4000000
        slt     $2,$3,$2
        bne     $2,$0,$L22
        li      $2,939524096                        # 0x38000000

$L23:
        addiu   $2,$2,1
        slt     $3,$3,$2
        bne     $3,$0,$L25
        lui     $3,%hi(active_y)

$LBB9 = .
$LBI9 = .
$LVL11 = .
$LBB10 = .
        lw      $2,%lo(active_y)($3)
        li      $4,-2097152       # 0xffffffffffe00000
        addu    $2,$2,$4
        sw      $2,%lo(active_y)($3)
$LVL12 = .
$L25:
$LBE10 = .
$LBE9 = .
        jr      $31
        nop

$LVL13 = .
$LFB4 = .
distance:
        lui     $2,%hi(xPos)
        addiu   $2,$2,%lo(xPos)
        sll     $4,$4,2
$LVL14 = .
        sll     $5,$5,2
$LVL15 = .
        addu    $3,$2,$4
        addu    $2,$2,$5
        lw      $6,0($3)
        lw      $2,0($2)
        nop
        subu    $6,$6,$2
        bgez    $6,$L29
        lui     $3,%hi(yPos)

        subu    $6,$0,$6
$L29:
        addiu   $3,$3,%lo(yPos)
        addu    $4,$3,$4
        addu    $3,$3,$5
        lw      $2,0($4)
        lw      $3,0($3)
        nop
        subu    $2,$2,$3
        bgez    $2,$L28
        nop

        subu    $2,$0,$2
$L28:
        jr      $31
        addu    $2,$6,$2

$LVL16 = .
$LFB5 = .
fly_towards_center:
$LBB11 = .
        lui     $9,%hi(xPos)
        lui     $8,%hi(yPos)
        addiu   $10,$5,16
$LBE11 = .
        move    $3,$0
        move    $6,$0
        addiu   $9,$9,%lo(xPos)
        addiu   $8,$8,%lo(yPos)
$LVL17 = .
$L31:
$LBB14 = .
$LBB12 = .
        lw      $2,0($5)
$LVL18 = .
$LBE12 = .
        addiu   $5,$5,4
$LBB13 = .
        sll     $2,$2,2
$LVL19 = .
        addu    $7,$9,$2
        addu    $2,$8,$2
        lw      $7,0($7)
        lw      $2,0($2)
        sra     $7,$7,2
        sra     $2,$2,2
        addu    $6,$6,$7
$LVL20 = .
$LBE13 = .
        bne     $10,$5,$L31
        addu    $3,$3,$2

$LBE14 = .
        sll     $4,$4,2
$LVL21 = .
        addu    $9,$9,$4
        addu    $8,$8,$4
        lw      $9,0($9)
        lw      $8,0($8)
        lui     $4,%hi(active_x)
        lui     $2,%hi(active_y)
        lw      $7,%lo(active_x)($4)
        lw      $5,%lo(active_y)($2)
$LVL22 = .
        subu    $6,$6,$9
$LVL23 = .
        subu    $3,$3,$8
$LVL24 = .
        sra     $6,$6,6
        sra     $3,$3,6
        addu    $6,$6,$7
        addu    $3,$3,$5
        sw      $6,%lo(active_x)($4)
        jr      $31
        sw      $3,%lo(active_y)($2)

$LVL25 = .
$LFB6 = .
avoid_others:
$LBB19 = .
$LBB20 = .
$LBB21 = .
$LBB22 = .
        lui     $10,%hi(xPos)
        lui     $9,%hi(yPos)
        sll     $4,$4,2
$LVL26 = .
        addiu   $10,$10,%lo(xPos)
        addiu   $9,$9,%lo(yPos)
        addu    $2,$10,$4
        addu    $4,$9,$4
        lw      $14,0($2)
        lw      $13,0($4)
        addiu   $12,$5,16
$LBE22 = .
$LBE21 = .
$LBE20 = .
$LBE19 = .
        move    $6,$0
        move    $7,$0
$LBB29 = .
$LBB27 = .
        li      $11,20971520                        # 0x1400000
$LVL27 = .
$L37:
        lw      $2,0($5)
$LVL28 = .
$LBB25 = .
$LBI21 = .
$LBB23 = .
$LBE23 = .
$LBE25 = .
$LBE27 = .
        addiu   $5,$5,4
$LBB28 = .
$LBB26 = .
$LBB24 = .
        sll     $2,$2,2
$LVL29 = .
        addu    $3,$9,$2
        lw      $3,0($3)
        addu    $2,$10,$2
        lw      $4,0($2)
        subu    $3,$13,$3
$LVL30 = .
        subu    $4,$14,$4
        bgez    $3,$L35
        move    $2,$3

        subu    $2,$0,$3
$L35:
        bgez    $4,$L36
        move    $8,$4

        subu    $8,$0,$4
$L36:
        addu    $2,$2,$8
$LBE24 = .
$LBE26 = .
        slt     $2,$2,$11
        beq     $2,$0,$L34
        nop

        addu    $7,$7,$4
$LVL31 = .
        addu    $6,$6,$3
$LVL32 = .
$L34:
$LBE28 = .
        bne     $12,$5,$L37
        lui     $3,%hi(active_x)

$LBE29 = .
        lui     $2,%hi(active_y)
        lw      $5,%lo(active_x)($3)
$LVL33 = .
        lw      $4,%lo(active_y)($2)
        sra     $7,$7,4
$LVL34 = .
        sra     $6,$6,4
$LVL35 = .
        addu    $7,$7,$5
        addu    $6,$6,$4
        sw      $7,%lo(active_x)($3)
        jr      $31
        sw      $6,%lo(active_y)($2)

$LVL36 = .
$LFB7 = .
match_velocity:
$LBB30 = .
        lui     $8,%hi(xVel)
        lui     $7,%hi(yVel)
        addiu   $9,$5,16
$LBE30 = .
        move    $4,$0
$LVL37 = .
        move    $6,$0
        addiu   $8,$8,%lo(xVel)
        addiu   $7,$7,%lo(yVel)
$LVL38 = .
$L40:
$LBB33 = .
$LBB31 = .
        lw      $2,0($5)
$LVL39 = .
$LBE31 = .
        addiu   $5,$5,4
$LBB32 = .
        sll     $2,$2,2
$LVL40 = .
        addu    $3,$8,$2
        addu    $2,$7,$2
        lw      $3,0($3)
        lw      $2,0($2)
        sra     $3,$3,2
        sra     $2,$2,2
        addu    $6,$6,$3
$LVL41 = .
$LBE32 = .
        bne     $9,$5,$L40
        addu    $4,$4,$2

$LBE33 = .
        lui     $3,%hi(active_x)
        lui     $2,%hi(active_y)
        lw      $7,%lo(active_x)($3)
        lw      $5,%lo(active_y)($2)
$LVL42 = .
        sra     $6,$6,2
$LVL43 = .
        sra     $4,$4,2
$LVL44 = .
        addu    $6,$6,$7
        addu    $4,$4,$5
        sw      $6,%lo(active_x)($3)
        jr      $31
        sw      $4,%lo(active_y)($2)

$LVL45 = .
$LFB8 = .
scary:
        lui     $2,%hi(xPos)
        sll     $4,$4,2
$LVL46 = .
        addiu   $2,$2,%lo(xPos)
        addu    $2,$2,$4
        lw      $7,0($2)
        lui     $5,%hi(mouse_x)
        li      $2,1                        # 0x1
        li      $3,-2097152       # 0xffffffffffe00000
        sw      $2,%lo(mouse_x)($5)
        addu    $3,$7,$3
        lui     $5,%hi(mouse_y)
$LVL47 = .
        bgez    $3,$L43
        sw      $2,%lo(mouse_y)($5)

        subu    $3,$0,$3
$L43:
        lui     $2,%hi(yPos)
        addiu   $2,$2,%lo(yPos)
        addu    $2,$2,$4
        lw      $6,0($2)
        li      $2,-2097152       # 0xffffffffffe00000
        addu    $2,$6,$2
$LVL48 = .
        bgez    $2,$L44
        move    $5,$3

        subu    $2,$0,$2
$L44:
$LVL49 = .
        addu    $4,$3,$2
        li      $8,167772160                        # 0xa000000
        slt     $4,$4,$8
        beq     $4,$0,$L48
        li      $4,2097152              # 0x200000

$LVL50 = .
        addiu   $4,$4,1
        slt     $7,$7,$4
        bne     $7,$0,$L46
        nop

        subu    $5,$0,$3
$LVL51 = .
$L46:
        li      $3,2097152              # 0x200000
        addiu   $3,$3,1
        slt     $6,$6,$3
$LVL52 = .
        beq     $6,$0,$L47
        sll     $5,$5,2

$LVL53 = .
$L49:
        lui     $7,%hi(active_x)
        lui     $6,%hi(active_y)
        lw      $4,%lo(active_x)($7)
        lw      $3,%lo(active_y)($6)
        sll     $2,$2,2
$LVL54 = .
        subu    $4,$4,$5
        subu    $2,$3,$2
        sw      $4,%lo(active_x)($7)
        jr      $31
        sw      $2,%lo(active_y)($6)

$LVL55 = .
$L48:
        lui     $7,%hi(active_x)
        lui     $6,%hi(active_y)
        lw      $4,%lo(active_x)($7)
        lw      $3,%lo(active_y)($6)
        move    $5,$0
$LVL56 = .
        move    $2,$0
        subu    $4,$4,$5
        subu    $2,$3,$2
        sw      $4,%lo(active_x)($7)
        jr      $31
        sw      $2,%lo(active_y)($6)

$LVL57 = .
$L47:
        b       $L49
        subu    $2,$0,$2

$LFB9 = .
limit_speed:
        lui     $8,%hi(active_x)
        lw      $6,%lo(active_x)($8)
        lui     $7,%hi(active_y)
        lw      $5,%lo(active_y)($7)
$LVL58 = .
$LBB34 = .
$LBI34 = .
$LBB35 = .
$LBE35 = .
$LBE34 = .
        bgez    $6,$L51
        move    $2,$6

        subu    $2,$0,$6
$L51:
        bgez    $5,$L52
        move    $3,$5

$LVL59 = .
        subu    $3,$0,$5
$LVL60 = .
$L52:
        addu    $2,$2,$3
$LBB37 = .
$LBB36 = .
        sra     $2,$2,1
$LVL61 = .
        beq     $2,$0,$L61
        move    $3,$0

$LVL62 = .
$L54:
        sra     $2,$2,1
$LVL63 = .
        move    $4,$3
$LVL64 = .
        bne     $2,$0,$L54
        addiu   $3,$3,1

$LVL65 = .
$LBE36 = .
$LBE37 = .
        slt     $3,$4,23
$LVL66 = .
        bne     $3,$0,$L61
        addiu   $4,$4,-22

$LVL67 = .
$L55:
$LBB38 = .
        addiu   $2,$2,1
$LVL68 = .
        sra     $6,$6,1
$LVL69 = .
        bne     $2,$4,$L55
        sra     $5,$5,1

        sw      $6,%lo(active_x)($8)
$LVL70 = .
        sw      $5,%lo(active_y)($7)
$LVL71 = .
$L61:
$LBE38 = .
        jr      $31
        nop

$LFB10 = .
updateBoids:
$LVL72 = .
$LBB50 = .
$LBE50 = .
        addiu   $sp,$sp,-88
        lui     $25,%hi(xPos)
        lui     $15,%hi(yPos)
        addiu   $25,$25,%lo(xPos)
        sw      $23,76($sp)
        sw      $22,72($sp)
        addiu   $15,$15,%lo(yPos)
        lui     $23,%hi(xVel)
        lui     $22,%hi(yVel)
        sw      $fp,80($sp)
        sw      $21,68($sp)
        sw      $20,64($sp)
        sw      $19,60($sp)
        sw      $18,56($sp)
        sw      $17,52($sp)
        sw      $31,84($sp)
        sw      $16,48($sp)
        addiu   $23,$23,%lo(xVel)
        addiu   $22,$22,%lo(yVel)
        move    $19,$25
        move    $18,$15
$LBB80 = .
        move    $24,$0
        lui     $8,%hi(active_x)
        lui     $fp,%hi(active_y)
$LBB51 = .
$LBB52 = .
        li      $17,-1                  # 0xffffffffffffffff
$LBE52 = .
$LBB53 = .
$LBB54 = .
$LBB55 = .
        li      $20,4                 # 0x4
$LBE55 = .
$LBE54 = .
        li      $21,64                  # 0x40
$LVL73 = .
$L63:
$LBE53 = .
$LBB74 = .
        sw      $17,24($sp)
$LVL74 = .
        sw      $17,28($sp)
$LVL75 = .
        sw      $17,32($sp)
$LVL76 = .
        sw      $17,36($sp)
$LVL77 = .
$LBE74 = .
$LBB75 = .
        move    $16,$0
$LVL78 = .
$L74:
$LBB71 = .
$LBB67 = .
        addiu   $7,$sp,24
$L79:
$LBE67 = .
        move    $11,$16
$LBB68 = .
        move    $10,$0
$LVL79 = .
$L71:
        lw      $9,0($7)
        nop
        beq     $9,$17,$L77
        sll     $4,$9,2

$LVL80 = .
$LBB56 = .
$LBI56 = .
$LBB57 = .
$LBE57 = .
$LBE56 = .
$LBB60 = .
$LBB61 = .
        addu    $3,$25,$4
        lw      $5,0($3)
$LBE61 = .
$LBE60 = .
$LBB63 = .
$LBB58 = .
        lw      $2,0($19)
        lw      $3,0($18)
$LVL81 = .
$LBE58 = .
$LBE63 = .
$LBB64 = .
$LBI60 = .
$LBB62 = .
        subu    $5,$2,$5
        bgez    $5,$L67
        nop

        subu    $5,$0,$5
$L67:
        addu    $4,$15,$4
        lw      $4,0($4)
        nop
        subu    $4,$3,$4
        bgez    $4,$L78
        sll     $6,$11,2

        subu    $4,$0,$4
$L78:
$LBE62 = .
$LBE64 = .
$LBB65 = .
$LBB59 = .
        addu    $12,$25,$6
        lw      $12,0($12)
        nop
        subu    $2,$2,$12
        bgez    $2,$L69
        addu    $5,$5,$4

        subu    $2,$0,$2
$L69:
        addu    $6,$15,$6
        lw      $4,0($6)
        nop
        subu    $3,$3,$4
        bgez    $3,$L70
        nop

        subu    $3,$0,$3
$L70:
        addu    $2,$2,$3
$LBE59 = .
$LBE65 = .
        slt     $5,$2,$5
        beq     $5,$0,$L66
        nop

$LBB66 = .
$LVL82 = .
        sw      $11,0($7)
$LVL83 = .
        move    $11,$9
$LVL84 = .
$L66:
$LBE66 = .
        addiu   $10,$10,1
$LVL85 = .
        bne     $10,$20,$L71
        addiu   $7,$7,4

$LBE68 = .
$LBE71 = .
        addiu   $16,$16,1
$LVL86 = .
        bne     $16,$21,$L79
        addiu   $7,$sp,24

$LVL87 = .
$L72:
$LBE75 = .
        lw      $3,0($23)
        lw      $2,0($22)
        move    $4,$24
        addiu   $5,$sp,24
        sw      $3,%lo(active_x)($8)
        sw      $2,%lo(active_y)($fp)
        jal     fly_towards_center
$LVL88 = .
        sw      $8,40($sp)

        move    $4,$24
        jal     avoid_others
$LVL89 = .
        addiu   $5,$sp,24

$LVL90 = .
        addiu   $5,$sp,24
        jal     match_velocity
$LVL91 = .
        move    $4,$24

        jal     scary
$LVL92 = .
        move    $4,$24

        jal     limit_speed
        nop

$LVL93 = .
        jal     keepWithinBounds
$LVL94 = .
        move    $4,$24

        lw      $8,40($sp)
        lw      $3,0($19)
        lw      $2,0($18)
        lw      $5,%lo(active_x)($8)
        lw      $4,%lo(active_y)($fp)
        addu    $3,$3,$5
        addu    $2,$2,$4
$LBE51 = .
        addiu   $24,$24,1
$LVL95 = .
$LBB77 = .
        sw      $5,0($23)
        sw      $4,0($22)
        sw      $3,0($19)
        sw      $2,0($18)
$LBE77 = .
        addiu   $23,$23,4
        addiu   $22,$22,4
        addiu   $19,$19,4
$LBB78 = .
$LVL96 = .
$LBE78 = .
        bne     $24,$16,$L63
        addiu   $18,$18,4

$LBE80 = .
        lw      $31,84($sp)
        lw      $fp,80($sp)
        lw      $23,76($sp)
        lw      $22,72($sp)
        lw      $21,68($sp)
        lw      $20,64($sp)
        lw      $19,60($sp)
        lw      $18,56($sp)
        lw      $17,52($sp)
        lw      $16,48($sp)
$LVL97 = .
        jr      $31
        addiu   $sp,$sp,88

$LVL98 = .
$L77:
$LBB81 = .
$LBB79 = .
$LBB76 = .
$LBB72 = .
$LBB69 = .
        sll     $10,$10,2
$LVL99 = .
        addiu   $2,$sp,24
        addu    $10,$2,$10
$LBE69 = .
$LBE72 = .
        addiu   $16,$16,1
$LVL100 = .
$LBB73 = .
$LBB70 = .
$LBE70 = .
$LBE73 = .
        bne     $16,$21,$L74
        sw      $11,0($10)

        b       $L72
        nop

$LBE76 = .
$LBE79 = .
$LBE81 = .
$LFB11 = .
main:
        addiu   $sp,$sp,-32
        sw      $31,28($sp)
        jal     initBoids
        nop

$LVL101 = .
$LVL102 = .
$L81:
        jal     updateBoids
        nop

$LVL103 = .
        b       $L81
        nop

mouse_y:
        .space  4
mouse_x:
        .space  4
active_y:
        .space  4
active_x:
        .space  4
yVel:
        .space  256
xVel:
        .space  256
yPos:
        .space  256
xPos:
        .space  256