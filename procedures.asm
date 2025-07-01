# Making procedures in assembly 

.data
    message: .asciiz "Hello world. \n"
.text
    main:
        jal displayMessage
        
    	add $s0, $zero, 5
    	
    	# Print number 5 to the screen 
    	li $v0, 1
    	add $a0, $zero, $s0
    	syscall
    
    # Tell the system that the program is done.
    li $v0, 10
    syscall
    
    displayMessage:
        li $v0, 4
        la $a0, message
        syscall
	
	jr $ra