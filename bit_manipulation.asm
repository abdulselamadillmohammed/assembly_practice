.data
	newLine: .asciiz "\n"

.text 
	main:
	li $a1, 11
	jal showNumber
	
	li $a1, 11
	jal clearBitZero
	
	move $a1, $v0
	jal showNumber
	
	li $v0, 10
	syscall
	
# Expects number in $a1
showNumber:
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 1
	move $a0, $a1
	syscall
	
	jr $ra

clearBitZero:
	# Mask is $s0
	addi, $sp, $sp, -4 
	sw $s0, 0($sp)
	
	# Make the mask.
	li $s0, -1
	sll $s0, $s0, 1 # 1111...110
	and $v0, $a1, $s0
	
	lw   $s0, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra 
	
	
	
	