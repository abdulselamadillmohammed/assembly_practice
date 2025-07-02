.data
    newLine: .asciiz "\n"
    
.text
    main:
        addi $s0, $zero, 10
        
        jal increaseMyRegister
        
        # Print a new line
        li $v0, 4
        la $a0, newLine
        syscall
        
        jal printTheValue
        
    # This line is going to signal end of program
    li $v0, 10
    syscall
    
    increaseMyRegister:
    	addi $sp, $sp, -8
    	sw   $s0, 0($sp)
    	sw   $ra, 4($sp) #allocate another word for return address
    	
    	addi $s0, $s0, 30
    
        # Print new value in function
        jal printTheValue
        
        lw   $s0,   0($sp)
        lw   $ra,   4($sp)
        addi $sp, $sp, 4
        
        jr $ra
        
    printTheValue:     
        li $v0, 1
        move $a0, $s0
        syscall
        
        jr $ra