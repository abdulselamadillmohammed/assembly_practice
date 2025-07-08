.data
    mdArray:   .word 2, 5, 8
               .word 3, 7, 10
               .word 1, 4, 11
    size:      .word 3

.text 
    main:
        la $a0, mdArray
        lw $a1, size
        jal sumDiagonal 
        move $a0, $v0
        li   $v0, 1
        syscall
        
        li $v0, 10
        syscall
        
sumDiagonal: 
        li $v0, 0         # sum = 0 
        li $t0, 0         # index i
        li $t3, 4         # word size in bytes
        
sumLoop:
        mul $t1, $t0, $a1   # t1 = i * size (row index * num cols)
        add $t1, $t1, $t0   # t1 = t1 + i (col index i) => i*size + i
        mul $t1, $t1, $t3   # t1 *= 4
        add $t1, $t1, $a0   # address = base + offset
        
        lw $t2, ($t1)       # load mdArray[i][i]
        add $v0, $v0, $t2   # sum += mdArray[i][i]
        
        addi $t0, $t0, 1
        blt  $t0, $a1, sumLoop
        
        jr $ra
