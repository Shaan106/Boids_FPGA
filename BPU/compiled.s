$LFB0 = .
main:
        addiu   $sp,$sp,-32
        sw      $fp,28($sp)
        move    $fp,$sp
$LBB2 = .
        sw      $0,8($fp)
        b       $L2
        nop

$L3:
$LBB3 = .
        lw      $2,8($fp)
        nop
        sll     $2,$2,5
        sw      $2,12($fp)
        lw      $2,8($fp)
        nop
        sll     $2,$2,5
        sw      $2,16($fp)
        lw      $2,8($fp)
        nop
        sw      $2,20($fp)
$LBE3 = .
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
        move    $2,$0
        move    $sp,$fp
        lw      $fp,28($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop