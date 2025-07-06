.data
    message: .asciiz "It was true. \n"
    message: .asciiz "It was false. \n"
    number1: .float 10.4
    number2: .float 4.6
    
.text
    main: 
        lwc1 $f0, number1
        lwc1 $f2, number2
        
        c.eq.s $f0, $f2 # sets co processor 1
        
        bc1t exit # if co-processor 1  is set to true
        
        li $v0, 4
        la a0, message2
        syscall
    
    # System call to end the program
    li $v0, 10
    syscall
    
    exit:
        li $v0, 4
        la $a0, message
        syscall