.data
    message: .asciiz "The number is less than the other."
    
 .text
    main:
    addi $t0, $zero, 1
    addi $t1, $zero, 200
    
    slt $s0, $t0, $t1
    # Is 1 < 200?
    # (yes(True) = 1, no = 0(False))
    
    bne $s0, $zero, printMessage
    
    # Tell the system this is the end of the program
    li $v0, 10
    syscall
    
    printMessage:
        li $v0, 4
        la $a0, message
        syscall
        