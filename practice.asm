.data
    prompt: .asciiz "Please input your number 'X': "
    space:  .asciiz ", "
.text
.globl main
main:

    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5      # syscall to read an integer
    syscall
    move $t0, $v0  # store input into $t0

    #Print X + 1
    add $t0, $t0, 1
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, space
    syscall
    
    
    #Print X + 2
    add $t0, $t0, 1
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, space
    syscall
    
    
    #Print X + 3
    add $t0, $t0, 1
    li $v0, 1
    move $a0, $t0
    syscall
    
    

    #End of program
    li $v0, 10
    syscall
    
