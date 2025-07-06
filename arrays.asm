.data
    myArray: .space 12
    myMessage: .asciiz ", "

.text
    addi $s0, $zero, 4
    addi $s1, $zero, 10
    addi $s2, $zero, 12
    
    # Index = $t0
    addi $t0, $zero, 0
    
    sw $s0, myArray($t0)
        addi $t0, $t0, 4
    sw $s1, myArray($t0)
        addi $t0, $t0, 4
    sw $s2, myArray($t0)
    
    lw $t6, myArray($zero)
    
    lw $t7, myArray + 4
    lw $t8, myArray + 8
    
    li $v0, 1
    addi $a0, $t6, 0
    syscall
    
    la $a0, myMessage 
    li $v0, 4
    syscall
    
    li $v0, 1
    move $a0, $t7
    syscall
    
    la $a0, myMessage 
    li $v0, 4
    syscall
    
    li $v0, 1
    move $a0, $t8
    syscall