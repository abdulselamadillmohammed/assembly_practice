.data

.text
.globl main
main: 


    # Place values into registers
    addi $t8, $zero, 10 # A = 10
    addi $t9, $zero, 12 # B = 12
    addi $t1, $zero, 1  # CONST 1 for comparison
    # Auto call the function
    gcd_calc:
        beq $t8, $t9, gcd_found # If they are equal then end
        
        # checker => $s0
        slt $s0, $t8, $t9
        
        # Look over functionality
        beq $s0, $t1, change_b
        
        # Same as comment above
        beq $s0, $zero, change_a
        
        j gcd_calc

    # End of function
    # li $v0, 10
    # syscall
    
    gcd_found:
        # Print the value in $s0
        add $s0, $zero, $t8
        li $v0, 1
        move $a0, $s0
        syscall
        
        # End file
        li $v0, 10
        syscall
    
    change_a: 
        # a = a - b 
        sub $t8, $t8, $t9 
        j gcd_calc 
    change_b:
        # b = b - a 
        sub $t9, $t9, $t8  
        j gcd_calc 
        