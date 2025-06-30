# Compute the following result: r = a^2 + 2b + 10
.text # Tells the assember that the file contains instructions and not data

# .data - Stores initialized global variables 
# .bss  - Reserves space for uninitialized variables 
# .rodata - Stores read-only data like strings ???

.globl main
main: addi $t0, $zero, 7 # set a=7 for testing
      addi $t1, $zero, 9 # set b = 9 for testing 
      
# $t0 will be 'a',   $t1 will be 'b', $t5 will be r 
# $t6 will be temp
      addi $t6, $zero, 10 # add 10 to r
      add $t6, $t6, $t1 # r + b (10 + 6)
      add $t6, $t6, $t1 # r + b (16 + 6) => 22
      
      mult $t0, $t0 # a^2
      mflo $t4 # the lower 32 bits are stored in t4
      
      add $t4, $t4, $t6 # a^2 + 10 + 2b
      
      addi $v0, $zero, 10 # end program
      syscall 